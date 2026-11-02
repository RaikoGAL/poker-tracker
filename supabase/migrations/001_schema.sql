-- Poker tracker schema (cash-game focused)

create table if not exists bankroll_tx (
  id bigserial primary key,
  ts timestamptz not null default now(),
  kind text not null check (kind in ('deposit','withdrawal','adjustment')),
  amount numeric(12,2) not null,           -- positive = money into poker roll
  note text
);

create table if not exists sessions (
  id bigserial primary key,
  started_at timestamptz not null default now(),
  ended_at timestamptz,
  club text,
  table_name text,
  sb integer not null,
  bb integer not null,
  ante integer not null default 0,
  buy_in integer not null,                  -- chips bought in total (incl. rebuys)
  rebuys integer not null default 0,
  rebuy_reason text,                        -- mandatory when rebuys > 0
  cash_out integer,
  net integer generated always as (cash_out - buy_in) stored,
  hands_played integer,
  mood_start smallint check (mood_start between 1 and 5),
  mood_end smallint check (mood_end between 1 and 5),
  stop_loss_hit boolean not null default false,
  notes text
);

create table if not exists players (
  id bigserial primary key,
  name text unique not null,
  notes text,
  first_seen timestamptz not null default now()
);

create table if not exists hands (
  id bigserial primary key,
  session_id bigint references sessions(id) on delete set null,
  clubgg_hand_id text unique,
  played_at timestamptz not null default now(),
  table_name text,
  sb integer not null,
  bb integer not null,
  ante integer not null default 0,
  num_players smallint not null,
  hero_position text not null,              -- UTG, UTG+1, HJ, CO, BTN, SB, BB (or MP)
  hero_cards text not null,                 -- e.g. 'Kc9c'
  hero_stack_start integer,
  board text,                               -- e.g. 'Th Qh Jc Tc 2c'
  went_to_showdown boolean not null default false,
  hero_result integer not null,             -- net chips for hero in this hand
  pot_final integer,
  winner text,
  raw_notes text
);

create table if not exists hand_players (
  id bigserial primary key,
  hand_id bigint not null references hands(id) on delete cascade,
  player_id bigint references players(id),
  player_name text not null,
  position text not null,
  stack_start integer,
  shown_cards text,
  is_hero boolean not null default false
);

create table if not exists actions (
  id bigserial primary key,
  hand_id bigint not null references hands(id) on delete cascade,
  seq smallint not null,
  street text not null check (street in ('preflop','flop','turn','river')),
  player_name text not null,
  position text,
  action text not null check (action in ('post_sb','post_bb','post_ante','fold','check','call','bet','raise','all_in','return')),
  amount integer,
  pot_before integer,
  is_hero boolean not null default false,
  unique (hand_id, seq)
);

create table if not exists hand_reviews (
  id bigserial primary key,
  hand_id bigint not null references hands(id) on delete cascade,
  spot_tags text[] not null default '{}',   -- e.g. {'3bet_pot','oop','flop_jam','vs_limper'}
  hero_confidence smallint check (hero_confidence between 1 and 5),
  mistake boolean,
  mistake_street text,
  review_note text,
  hero_note text,
  reviewed_at timestamptz not null default now()
);

create table if not exists rules (
  key text primary key,
  value numeric not null,
  description text
);

insert into rules (key, value, description) values
  ('min_buyins_for_stake', 25, 'Bankroll must hold at least this many buy-ins (100bb) for the stake you play'),
  ('session_stop_loss_buyins', 2, 'Stop the session after losing this many buy-ins'),
  ('cooldown_hours_after_stop_loss', 24, 'Hours to stay off the tables after a stop-loss'),
  ('max_session_minutes', 240, 'Warn when a session passes this length')
on conflict (key) do nothing;

-- useful views
create or replace view v_session_stats with (security_invoker = true) as
select
  s.*,
  round((s.net::numeric / nullif(s.bb,0)), 1) as net_bb,
  round(extract(epoch from (coalesce(s.ended_at, now()) - s.started_at))/3600, 2) as hours,
  case when s.hands_played > 0 then round((s.net::numeric / s.bb) / s.hands_played * 100, 2) end as bb_per_100
from sessions s;

create or replace view v_hero_position_stats with (security_invoker = true) as
select
  hero_position,
  count(*) as hands,
  sum(hero_result) as net_chips,
  round(avg(hero_result)) as avg_result,
  sum(case when went_to_showdown then 1 else 0 end) as showdowns,
  sum(case when hero_result > 0 then 1 else 0 end) as won
from hands
group by hero_position;

-- single-user app: RLS on, access via anon key gated by a shared app password in the UI
alter table bankroll_tx enable row level security;
alter table sessions enable row level security;
alter table players enable row level security;
alter table hands enable row level security;
alter table hand_players enable row level security;
alter table actions enable row level security;
alter table hand_reviews enable row level security;
alter table rules enable row level security;

do $$
declare t text;
begin
  foreach t in array array['bankroll_tx','sessions','players','hands','hand_players','actions','hand_reviews','rules'] loop
    execute format('drop policy if exists "auth_all" on %I', t);
    execute format('create policy "auth_all" on %I for all to authenticated using (true) with check (true)', t);
  end loop;
end $$;
