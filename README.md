# Poker Ledger

A player-owned record of your money, your decisions and your state of mind, for online club cash games (built around ClubGG). Ledger first, discipline device second, coach third.

**Live:** https://pokerledger.pages.dev/ · English and Hebrew

## What it does

- **Play.** Before you sit down you set tonight's plan on one screen: stake, stop-loss, time limit, rebuys, and one focus from your reviews. Lowering a limit counts now; raising one counts from tomorrow 06:00. During play the app asks nothing. A rebuy that reaches 80% of your limit, or goes past it, gets a 15-second pause whose big button is "Stop here and end". At the end you type what you left with, confirm your club balance, and rate how well you played (not how it went).
- **Balance check.** Your agent's deposits happen outside the app, so the end screen compares ClubGG's club balance to what we expect and asks what any difference was: chips from the agent, rakeback, an unlogged rebuy, a withdrawal, or a miscount.
- **I already played.** Log a finished session in about 10 seconds. It's marked "no plan" and doesn't count against your streak, so honest logging is never punished.
- **Weekly streak with forgiveness.** You pick a goal ("keep my plan every session" or "set a plan every session"). Two freezes to start, one earned back every two good weeks. A broken plan is logged neutrally with one small next step.
- **Review.** Hands come from replay screenshots (read by Claude) or a 20-second "from memory" log. You grade the decision as Good, Mistake or Not sure before you see the result, tag what it was about (technical or mental), then reveal it, including your equity against his shown hand when the money went in before the river. Weekly insights show your top leak (which becomes next session's focus), the share of mental mistakes, play ratings in long vs short sessions, and your own notes from the moment. Win rate stays hidden until 10,000 hands, then appears with an honest range.
- **Money.** Club balance across clubs, the truth so far (tables + rakeback), what went through your agent, a weekly statement you can copy to send your agent, deposit, withdrawal and rakeback logging (deposits get the same pause during or right after a losing session, or over your weekly cap), full history with the rebuy chain, CSV export and a backup file.
- **Study tools.** Equity calculator and opening ranges.

## Privacy

Your record is yours: per-user rows, export and delete any time. Opponent names are replaced with a short code the moment a hand is read, so no opponent database is ever built. Screenshots are deleted once read. Nothing connects to ClubGG, a club or an agent.

## Architecture

```
src/app.html          one source file, two runtimes
  ├─ web mode         pokerledger.pages.dev. Works with no account (IndexedDB on the phone);
  │                   an email link adds a private Supabase account for backup and sync.
  └─ claude mode      claude.ai artifact. Syncs through the owner's Supabase connector and reads
                      screenshots with the artifact `sample` capability (on the owner's Claude plan).
build.py              wraps src/app.html into index.html for the website
supabase/migrations   004 is the current model: entries (one JSON row per record) + shots + sync()
docs/pilot-metrics.sql  north-star, discipline, learning and retention queries for the pilot
```

**Local-first sync.** Every record (profile, club, session, deposit, hand) lives on the device and is pushed through one `sync(items, since)` RPC: last write wins per record, deletes are tombstones, and the reply carries everything that changed elsewhere. That one mechanism gives offline use, no-account start, backup, restore and multi-device sync. Screenshots waiting to be read sit in their own `shots` table so sync never moves images.

## Develop

Edit `src/app.html`, run `python3 build.py`, commit both. Cloudflare Pages deploys `main` automatically.

## Plan

See [docs/product-plan.md](docs/product-plan.md) and the research in [docs/research](docs/research).
