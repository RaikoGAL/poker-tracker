# Poker Ledger

A bankroll-discipline and hand-review app for online cash-game players, built around ClubGG.

**Live:** https://raikogal.github.io/poker-tracker/

- **Home** answers one question before you sit down: *can I play right now?* It checks your bankroll against the stake, your stop-loss cooldown, losing streaks and deposit rules, then starts and times the session.
- **Live session** shows how much you're in for and the chip count where your stop-loss says leave. Rebuys need a written reason and are capped.
- **Hands** stores parsed hand histories with every action, pot sizes, a review note, confidence and a mistake flag, with results by position.
- **Ledger** is one timeline of sessions and money in/out.
- **Study** has an equity calculator and baseline opening ranges. It is a between-sessions tool, not for use during a hand.

## How hands get in

ClubGG has no hand-history export. You screenshot the in-app hand replay and Claude reads it:

1. Open **Poker** inside Claude (the artifact version of this same app).
2. Hands → Add hand → pick or paste 1–3 screenshots.
3. Claude extracts every action into structured data on *your* Claude plan (no API key). The app recomputes the pot street by street and flags anything that doesn't add up before you save.

## Architecture

```
src/app.html          one source file, two runtimes
  ├─ web mode         GitHub Pages. Supabase Auth (email + password), row-level security.
  └─ claude mode      claude.ai artifact. Data through the owner's Supabase connector,
                      screenshots read with the artifact `sample` capability.
build.py              wraps src/app.html into index.html for the website
supabase/migrations   schema, settings, multi-user RLS and RPCs
```

Every table has `user_id` and a policy of *own rows only*. The app talks to four RPCs, `dashboard`, `hand_detail`, `save_hand` and `save_settings`, plus plain inserts and updates on `sessions`, `bankroll_tx` and `hand_reviews`. The publishable key in the page is safe to expose; RLS is what protects the data.

## Run your own copy

1. Create a Supabase project and run the files in `supabase/migrations` in order.
2. In Authentication → URL Configuration, set the Site URL to where you'll host the page.
3. Edit `CONFIG` at the top of the script in `src/app.html` (project URL, publishable key, site URL).
4. `python3 build.py`, then host `index.html` with the icons and manifest anywhere static.

## Develop

Edit `src/app.html`, run `python3 build.py`, commit both. No build tools or dependencies; the page loads supabase-js from jsDelivr.

## Roadmap

See [docs/roadmap.md](docs/roadmap.md).
