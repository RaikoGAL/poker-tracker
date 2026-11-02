# Roadmap

## Shipped
- Bankroll rules engine (buy-ins per stake, stop-loss + cooldown, rebuy cap, deposit day/cap, losing-streak flag), all configurable per user.
- Sessions with mood in/out, live clock, stop-loss line.
- Hand reader: ClubGG replay screenshots → Claude → validated hand history (in-Claude version).
- Website with accounts and per-user row-level security; installable to the phone home screen.

## Next: Poker MCP server
A remote MCP server (Supabase Edge Function) exposing the ledger as tools: `save_hand`, `start_session`, `end_session`, `log_money`, `get_stats`, `list_hands`, `review_hand`.
Any MCP client (Claude on web, desktop and phone; other assistants that speak MCP) can then read screenshots on the user's own subscription and write straight into their ledger. No API keys, no per-hand cost, works for every user, not just the owner.
Auth: per-user connector token generated in the website's settings (v1), OAuth later.

## Then: screenshot inbox
- Upload screenshots from the phone to a private storage inbox any time (no AI needed at capture).
- "Process my inbox" in Claude reads them all in one go and files each hand.
- Batch mode: many screenshots → split by hand number automatically.

## Then: leak report (~200 hands)
VPIP / PFR / 3-bet by position, c-bet frequency, showdown vs non-showdown winnings, results by mood, session length and time of day.

## Ideas
- Weekly review: a scheduled Claude task that summarises the week's sessions and flagged hands every Sunday.
- Opponent notes for regulars in the club.
- Session reminders on the phone when the stop-loss line or max session length is reached.

## Not doing
Anything that reads ClubGG's network traffic or automates the client. It breaks ClubGG's terms and gets accounts closed.
