-- 002: generic per-key settings (replaces the fixed `rules` table) and cash/tournament on hands.
create table if not exists settings (
  key text primary key,
  value text not null,
  type text not null check (type in ('number','text','bool','select')),
  "group" text not null,
  label text not null,
  description text,
  options text[],
  sort smallint not null default 100
);
alter table settings enable row level security;

insert into settings (key,value,type,"group",label,description,options,sort) values
 ('hero_name','','text','Profile','Your ClubGG name','Your exact name at the ClubGG table. Used to find your actions in screenshots.',null,1),
 ('currency_symbol','₪','text','Profile','Currency symbol','Shown next to money amounts',null,2),
 ('chips_per_currency','1','number','Profile','Chips per 1 unit of currency','1 means 1 chip = 1 shekel',null,3),
 ('default_sb','500','number','Table defaults','Small blind','Pre-filled when starting a session',null,10),
 ('default_bb','1000','number','Table defaults','Big blind',null,null,11),
 ('default_ante','150','number','Table defaults','Ante (per player)',null,null,12),
 ('default_buyin','100000','number','Table defaults','Buy-in (chips)',null,null,13),
 ('min_buyins_for_stake','25','number','Bankroll rules','Minimum buy-ins for your stake','Buy-in = 100 big blinds. Below this, move down a stake',null,20),
 ('session_stop_loss_buyins','2','number','Bankroll rules','Session stop-loss (buy-ins)','Session is flagged when you lose this many buy-ins',null,21),
 ('max_rebuys_per_session','1','number','Bankroll rules','Max rebuys per session','Rebuy button refuses beyond this',null,22),
 ('cooldown_hours_after_stop_loss','24','number','Bankroll rules','Cooldown after a stop-loss (hours)',null,null,23),
 ('max_session_minutes','240','number','Bankroll rules','Max session length (minutes)','Warning only',null,24),
 ('deposit_period','month','select','Deposits','Deposit period','Deposits are counted per period',array['week','month'],30),
 ('deposit_cap','0','number','Deposits','Max deposit per period (chips)','0 = no cap',null,31),
 ('deposit_day','1','number','Deposits','Deposit day','Day of month (1–28) or weekday (1=Sun … 7=Sat). Deposits on other days need a written reason',null,32),
 ('goal_hands_per_week','0','number','Goals','Hands per week','0 = off',null,40),
 ('goal_sessions_per_week','0','number','Goals','Sessions per week','0 = off',null,41),
 ('goal_reviews_per_week','0','number','Goals','Hands reviewed per week','Hands where you saved a note or confidence. 0 = off',null,42),
 ('goal_profit_per_month','0','number','Goals','Profit per month (chips)','Optional. Variance makes this noisy over short samples. 0 = off',null,43),
 ('goal_max_rule_breaks_per_month','0','number','Goals','Rule overrides allowed per month','Sessions started with an override reason. The real goal is zero',null,44)
on conflict (key) do nothing;

drop table if exists rules;

alter table hands add column if not exists game_type text not null default 'cash' check (game_type in ('cash','tournament'));
