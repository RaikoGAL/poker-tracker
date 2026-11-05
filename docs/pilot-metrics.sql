-- Pilot metrics (run in the Supabase SQL editor or through the connector; never exposed to the app).
-- Every record is one row in public.entries (kind = profile | club | session | tx | hand), data in JSON.

-- 1. North star: sessions logged per active player per week, and how many had a plan set before play.
select date_trunc('week', (data->>'end')::timestamptz) as week,
       count(distinct user_id)                                   as players,
       count(*)                                                  as sessions,
       round(count(*)::numeric / nullif(count(distinct user_id),0), 1) as sessions_per_player,
       round(100.0 * count(*) filter (where data ? 'plan' and data->'plan' <> 'null'::jsonb) / count(*)) as pct_with_plan,
       round(100.0 * count(*) filter (where data->>'past' = 'true') / count(*))            as pct_logged_after
from entries
where kind = 'session' and not deleted and data->>'end' is not null
group by 1 order by 1 desc;

-- 2. Discipline: plan adherence and which line breaks most.
select date_trunc('week', (data->>'end')::timestamptz) as week,
       count(*) filter (where data->>'kept' = 'true')  as kept,
       count(*) filter (where data->>'kept' = 'false') as off_plan,
       count(*) filter (where data->'breaks' ? 'loss')   as broke_stop_loss,
       count(*) filter (where data->'breaks' ? 'time')   as broke_time,
       count(*) filter (where data->'breaks' ? 'rebuys') as broke_rebuys
from entries where kind = 'session' and not deleted and data->'plan' <> 'null'::jsonb
group by 1 order by 1 desc;

-- 3. The rebuy pause: how often a paused rebuy ended the session instead.
--    (A rebuy taken after the pause is stored with "paused": true. A stop at the pause shows as a session
--     whose note_kind = 'stopped'.)
select count(*) filter (where r->>'paused' = 'true') as rebuys_after_pause,
       (select count(*) from entries where kind='session' and not deleted and data->>'note_kind' = 'stopped') as stopped_at_pause_with_note
from entries, jsonb_array_elements(coalesce(data->'rebuys','[]'::jsonb)) r
where kind = 'session' and not deleted;

-- 4. Off-plan deposits logged (leakage we can see).
select date_trunc('week', (data->>'at')::timestamptz) as week,
       count(*) filter (where data->>'kind' = 'deposit')                         as deposits,
       count(*) filter (where data->>'kind' = 'deposit' and data->>'off' = 'true') as off_plan_deposits,
       count(*) filter (where data->>'source' = 'balance_check')                  as found_by_balance_check
from entries where kind = 'tx' and not deleted group by 1 order by 1 desc;

-- 5. Learning loop: hands captured and reviewed within 48 hours, and the mistake share.
select date_trunc('week', (data->>'at')::timestamptz) as week,
       count(*)                                                                as hands,
       count(*) filter (where data->>'source' = 'quick')                       as from_memory,
       count(*) filter (where data->'review'->>'grade' is not null)            as reviewed,
       count(*) filter (where (data->'review'->>'at')::timestamptz - (data->>'at')::timestamptz < interval '48 hours') as reviewed_48h,
       count(*) filter (where data->'review'->>'grade' = 'mistake')            as mistakes
from entries where kind = 'hand' and not deleted group by 1 order by 1 desc;

-- 6. Retention: weeks with at least one logged session, per player (week-4 / week-10 logging retention).
with w as (
  select user_id, date_trunc('week', (data->>'end')::timestamptz) as wk
  from entries where kind = 'session' and not deleted and data->>'end' is not null group by 1, 2),
f as (select user_id, min(wk) as first_wk from w group by 1)
select (extract(epoch from (w.wk - f.first_wk)) / 604800)::int as week_n, count(distinct w.user_id) as players_logging
from w join f using (user_id) group by 1 order by 1;
