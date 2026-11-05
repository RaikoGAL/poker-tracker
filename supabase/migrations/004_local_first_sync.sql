-- 004: local-first storage with sync.
-- The app keeps every record on the device and syncs it here. One row per record (session, deposit,
-- hand, club, profile), stored as JSON, last write wins per record by updated_at. This makes
-- "works without an account", offline use, backup, export and multi-device sync one simple mechanism.
-- Screenshots waiting to be read live in their own table so syncing never moves images around.

create table if not exists public.entries (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  kind text not null check (kind in ('profile','club','session','tx','hand')),
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null,
  deleted boolean not null default false,
  server_at timestamptz not null default now()
);
create index if not exists entries_user_server on public.entries (user_id, server_at);
alter table public.entries enable row level security;
drop policy if exists "own_rows" on public.entries;
create policy "own_rows" on public.entries for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

create table if not exists public.shots (
  id uuid primary key,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  session_id uuid,
  taken_at timestamptz,
  created_at timestamptz not null default now(),
  img text,                       -- JPEG data URL; cleared once the hand is read
  status text not null default 'pending' check (status in ('pending','read','failed')),
  hand_id uuid
);
create index if not exists shots_user_status on public.shots (user_id, status);
alter table public.shots enable row level security;
drop policy if exists "own_rows" on public.shots;
create policy "own_rows" on public.shots for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

-- Push local changes, get back everything that changed on the server since p_since.
create or replace function public.sync(p_items jsonb, p_since timestamptz default null)
returns jsonb language plpgsql security invoker set search_path = public as $$
declare
  uid uuid := auth.uid();
  ts timestamptz := clock_timestamp();
begin
  if uid is null then raise exception 'not signed in'; end if;
  insert into entries (id, user_id, kind, data, updated_at, deleted, server_at)
  select (x->>'id')::uuid, uid, x->>'kind', coalesce(x->'data', '{}'::jsonb),
         (x->>'updated_at')::timestamptz, coalesce((x->>'deleted')::boolean, false), ts
  from jsonb_array_elements(coalesce(p_items, '[]'::jsonb)) x
  on conflict (id) do update
    set kind = excluded.kind, data = excluded.data, updated_at = excluded.updated_at,
        deleted = excluded.deleted, server_at = excluded.server_at
    where entries.user_id = uid and entries.updated_at < excluded.updated_at;
  return jsonb_build_object(
    'now', ts,
    'items', coalesce((select jsonb_agg(jsonb_build_object('id', id, 'kind', kind, 'data', data,
                         'updated_at', updated_at, 'deleted', deleted))
                       from entries where user_id = uid and (p_since is null or server_at > p_since)), '[]'::jsonb),
    'shots', coalesce((select jsonb_agg(jsonb_build_object('id', id, 'session_id', session_id, 'taken_at', taken_at,
                         'status', status, 'hand_id', hand_id))
                       from shots where user_id = uid and status = 'pending'), '[]'::jsonb));
end $$;

revoke all on function public.sync(jsonb, timestamptz) from public, anon;
grant execute on function public.sync(jsonb, timestamptz) to authenticated;
