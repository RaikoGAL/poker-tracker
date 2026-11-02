-- 003: every row belongs to a user; RLS = "you see and write only your own rows".
-- Settings rows with user_id NULL are the shared defaults; a user's own row overrides one key.

-- 1. owner column on every table
do $$
declare t text;
begin
  foreach t in array array['bankroll_tx','sessions','players','hands','hand_players','actions','hand_reviews'] loop
    execute format('alter table public.%I add column if not exists user_id uuid default auth.uid() references auth.users(id) on delete cascade', t);
    execute format('create index if not exists %I on public.%I (user_id)', t||'_user_idx', t);
  end loop;
end $$;

alter table public.hand_players add column if not exists stack_end integer;

-- 2. uniqueness becomes per user
alter table public.players drop constraint if exists players_name_key;
create unique index if not exists players_user_name on public.players (user_id, name);
alter table public.hands drop constraint if exists hands_clubgg_hand_id_key;
create unique index if not exists hands_user_clubgg on public.hands (user_id, clubgg_hand_id);

-- 3. settings: defaults (user_id null) + per-user overrides
alter table public.settings drop constraint if exists settings_pkey;
alter table public.settings add column if not exists id bigserial primary key;
alter table public.settings add column if not exists user_id uuid references auth.users(id) on delete cascade;
create unique index if not exists settings_default_key on public.settings (key) where user_id is null;
alter table public.settings drop constraint if exists settings_user_key;
alter table public.settings add constraint settings_user_key unique (user_id, key);

-- 4. RLS: own rows only
do $$
declare t text;
begin
  foreach t in array array['bankroll_tx','sessions','players','hands','hand_players','actions','hand_reviews'] loop
    execute format('drop policy if exists "auth_all" on public.%I', t);
    execute format('drop policy if exists "own_rows" on public.%I', t);
    execute format('create policy "own_rows" on public.%I for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()))', t);
  end loop;
end $$;
drop policy if exists "auth_all" on public.settings;
drop policy if exists "read_defaults_and_own" on public.settings;
drop policy if exists "write_own" on public.settings;
create policy "read_defaults_and_own" on public.settings for select to authenticated using (user_id is null or user_id = (select auth.uid()));
create policy "write_own" on public.settings for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

-- 5. views follow the caller's RLS; position stats move into dashboard()
drop view if exists public.v_hero_position_stats;
create or replace view public.v_session_stats with (security_invoker = true) as
select s.*,
  round((s.net::numeric / nullif(s.bb,0)), 1) as net_bb,
  round(extract(epoch from (coalesce(s.ended_at, now()) - s.started_at))/3600, 2) as hours,
  case when s.hands_played > 0 then round((s.net::numeric / s.bb) / s.hands_played * 100, 2) end as bb_per_100
from public.sessions s;

-- 6. RPCs. auth.uid() is the caller. p_user is only honoured when there is no signed-in
--    caller (server-side use, e.g. the Claude connector); anon cannot execute these.
create or replace function public.dashboard(p_user uuid default null)
returns json language sql stable security invoker set search_path = public as $$
  with me as (select coalesce(auth.uid(), p_user) as uid)
  select json_build_object(
    's', coalesce((select json_agg(x) from (select v.* from v_session_stats v, me where v.user_id = me.uid order by started_at desc) x), '[]'),
    't', coalesce((select json_agg(x) from (select b.* from bankroll_tx b, me where b.user_id = me.uid order by ts desc) x), '[]'),
    'h', coalesce((select json_agg(x) from (
           select h.*, coalesce((select json_agg(r) from hand_reviews r where r.hand_id = h.id), '[]') as hand_reviews
           from hands h, me where h.user_id = me.uid order by played_at desc limit 500) x), '[]'),
    'r', coalesce((select json_agg(x order by x.sort) from (
           select distinct on (st.key) st.key, st.value, st.type, st."group", st.label, st.description, st.options, st.sort
           from settings st, me where st.user_id is null or st.user_id = me.uid
           order by st.key, (st.user_id is null)) x), '[]'),
    'p', coalesce((select json_agg(x) from (
           select hero_position, count(*) as hands, sum(hero_result) as net_chips, round(avg(hero_result)) as avg_result,
                  sum(case when went_to_showdown then 1 else 0 end) as showdowns, sum(case when hero_result > 0 then 1 else 0 end) as won
           from hands h, me where h.user_id = me.uid and h.game_type = 'cash' group by hero_position) x), '[]')
  );
$$;

create or replace function public.hand_detail(p_hand bigint, p_user uuid default null)
returns json language sql stable security invoker set search_path = public as $$
  with me as (select coalesce(auth.uid(), p_user) as uid)
  select json_build_object(
    'a', coalesce((select json_agg(x) from (select a.* from actions a, me where a.hand_id = p_hand and a.user_id = me.uid order by seq) x), '[]'),
    'p', coalesce((select json_agg(x) from (select hp.* from hand_players hp, me where hp.hand_id = p_hand and hp.user_id = me.uid) x), '[]'));
$$;

create or replace function public.save_hand(p jsonb, p_user uuid default null)
returns bigint language plpgsql security invoker set search_path = public as $$
declare uid uuid := coalesce(auth.uid(), p_user); hid bigint;
begin
  if uid is null then raise exception 'Not signed in'; end if;
  insert into players (user_id, name)
    select uid, x->>'name' from jsonb_array_elements(coalesce(p->'players','[]')) x
    where coalesce(x->>'name','') <> '' on conflict (user_id, name) do nothing;
  insert into hands (user_id, clubgg_hand_id, table_name, sb, bb, ante, num_players, hero_position, hero_cards, hero_stack_start,
                     board, went_to_showdown, hero_result, pot_final, winner, raw_notes, game_type, played_at)
  values (uid, nullif(p->>'clubgg_hand_id',''), p->>'table_name', round((p->>'sb')::numeric)::int, round((p->>'bb')::numeric)::int,
          coalesce(round((p->>'ante')::numeric)::int, 0), coalesce((p->>'num_players')::int, jsonb_array_length(coalesce(p->'players','[]'))),
          p->>'hero_position', p->>'hero_cards', round((p->>'hero_stack_start')::numeric)::int, nullif(p->>'board',''),
          coalesce((p->>'went_to_showdown')::boolean, false), round((p->>'hero_result')::numeric)::int, round((p->>'pot_final')::numeric)::int,
          p->>'winner', nullif(p->>'notes',''), coalesce(p->>'game_type','cash'), coalesce((p->>'played_at')::timestamptz, now()))
  returning id into hid;
  insert into hand_players (user_id, hand_id, player_id, player_name, position, stack_end, shown_cards, is_hero)
    select uid, hid, pl.id, x->>'name', coalesce(x->>'position','?'), round((x->>'stack_end')::numeric)::int, nullif(x->>'shown_cards',''),
           coalesce((x->>'is_hero')::boolean, false)
    from jsonb_array_elements(coalesce(p->'players','[]')) x left join players pl on pl.user_id = uid and pl.name = x->>'name';
  insert into actions (user_id, hand_id, seq, street, player_name, position, action, amount, pot_before, is_hero)
    select uid, hid, (x->>'seq')::int, x->>'street', x->>'player_name', x->>'position', x->>'action',
           round((x->>'amount')::numeric)::int, round((x->>'pot_before')::numeric)::int, coalesce((x->>'is_hero')::boolean, false)
    from jsonb_array_elements(coalesce(p->'actions','[]')) x;
  insert into hand_reviews (user_id, hand_id, hero_note, hero_confidence, mistake, review_note, spot_tags)
    values (uid, hid, nullif(p#>>'{review,hero_note}',''), (p#>>'{review,hero_confidence}')::smallint, (p#>>'{review,mistake}')::boolean,
            nullif(p#>>'{review,review_note}',''), coalesce(array(select jsonb_array_elements_text(p#>'{review,spot_tags}')), '{}'));
  return hid;
end $$;

create or replace function public.save_settings(p jsonb, p_user uuid default null)
returns void language plpgsql security invoker set search_path = public as $$
declare uid uuid := coalesce(auth.uid(), p_user);
begin
  if uid is null then raise exception 'Not signed in'; end if;
  insert into settings (user_id, key, value, type, "group", label, description, options, sort)
    select uid, d.key, e.value, d.type, d."group", d.label, d.description, d.options, d.sort
    from jsonb_each_text(p) e join settings d on d.key = e.key and d.user_id is null
  on conflict (user_id, key) do update set value = excluded.value;
end $$;

revoke execute on function public.dashboard(uuid), public.hand_detail(bigint, uuid), public.save_hand(jsonb, uuid), public.save_settings(jsonb, uuid) from public, anon;
grant execute on function public.dashboard(uuid), public.hand_detail(bigint, uuid), public.save_hand(jsonb, uuid), public.save_settings(jsonb, uuid) to authenticated;
