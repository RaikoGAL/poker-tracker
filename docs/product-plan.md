# Poker Ledger — product plan

*Version 1, 5 November 2026. Built on the research report "Build Club Poker's Missing Discipline Ledger" (docs/research/). Every claim below with a number traces to a cited source there.*

## 1. Why this exists

**Purpose.** Give app-club poker players the one thing everyone else in their world has and they don't: a trustworthy, player-owned record of their money, their decisions and their state of mind — and use it to hold them to the promises they make themselves while calm, and to turn every session into one small lesson.

**The problem in one paragraph.** A player on ClubGG, PokerBros or PPPoker has no cashier, no published rake, no hand-history export, no stats and no support desk. They have an agent and a chat window. They cannot verify whether they are winning (two-thirds of online players lose; only 32% are profitable after rake), what they paid in rake (nominally 3–5%, in practice up to 10–12%, rakeback paid by the agent and invisible), or whether their last three deposits were a plan or a spiral. The agent is one message away and chips arrive in minutes, so a stop-loss set mid-session is a negotiation, not a stop-loss. Every tool that exists was built for someone else: trackers for live players, HUDs for Windows grinders with hand-history files, AI coaches for people who already own PokerTracker. **No product combines bankroll discipline with learning from your own hands, and a mobile-only club player has zero tooling.**

**What we are, in order.** A ledger first, a discipline device second, a coach third. That is the order in which value is trusted, retained and paid for. It is also the order of dependency: the ledger needs nothing from the poker apps; discipline needs only the ledger; review inherits every platform risk and must degrade gracefully.

**What we are not.** Not a HUD, not real-time assistance, not an opponent database, not a route to any club or agent. We only ever touch the player's own data, after the session.

## 2. Who it's for

**Primary: the mobile club player who wants to stop bleeding.** Plays cash on a phone, 3–5 sessions a week, deposits through an agent in local currency, has a spreadsheet or nothing, suspects they lose but doesn't know by how much. Segments inside this: the recreational loser (most of the market) and the blocked semi-pro who studies but has no data. They share one device, one data source (nothing automatic) and one failure mode (the reload).

**Secondary, later:** PokerBros and X-Poker players (cleaner capture paths exist), Brazil (poker explicitly legal, major ClubGG base).

**Not for:** emulator-stack grinders (they have DriveHUD and converters and accept the ban risk), agents and club owners (PA Tools serves them; they may be a channel, not a customer, in v1).

**Wedge market: Israel.** ILS tables on ClubGG, cards blocked for gambling so the agent model is the norm, a founder inside the community, no Hebrew tooling. Small, reachable, underserved. It is the first market, not the end market.

## 3. Jobs to be done

1. **Don't blow up.** "Stop me from putting in the fourth buy-in at 2 a.m."
2. **Know the truth.** "Am I actually winning, after rake and rakeback, across three clubs and two currencies?"
3. **Get better from each session.** "Show me what I keep doing wrong, not a number that's 90% luck."
4. **Make it free.** "I'll do three taps. I won't fill a form."

## 4. Product principles (what the evidence told us)

- **Friction, not force, and not persuasion.** We can't block a cashier. What works in field trials is a short enforced wait plus a one-tap "stop" at the moment of the rebuy or deposit (57% fewer opens in a six-week trial; the dismiss button did the work, the reflective message did nothing). Persuasion copy lowered limit uptake at Bet365. Hourly reality checks and pushed statements did nothing in 14,000-player trials; one warning increased turnover.
- **Limits are set before play, by the player, in their own numbers.** Mandatory step at session start (voluntary limits get ~4% uptake; mandatory ones ~80% approval). Free-text entry, low anchor (chosen limits ~45% lower). Alert at 80% of their own limit (the one in-session message with positive evidence). Loosening takes effect after a delay; tightening is immediate.
- **A time cap, not only a money cap.** For poker players specifically, a voluntary *time* limit cut spend and duration more than money limits did.
- **Measure process, hide results.** bb/100 is ±18 at 10,000 hands; a 5 bb/100 winner has a 44% chance of losing any 1,000-hand sample. The product shows mistake tags, late-session clustering, limit adherence, preflop stability — and win rate only inside a confidence band on a scheduled "results day".
- **Outcome-independent review.** Grade hands as mistake / cooler / unclear before seeing the result. Technical vs mental tags. One leak at a time. Tilt is beaten by self-recognition of patterns, not by experience.
- **Reliability is the product.** Tracker users pay for a ledger that doesn't lose data and punish one data-loss event with a one-star review and churn. Backup, export and sync are features, not plumbing.
- **Weekly cadence, forgiving streaks.** Two freezes from day one, earn-back, user-chosen weekly goal with opt-out, "Commit" not "Continue". Never scold a broken rule; log it neutrally with a next step.
- **Player-owned data, no opponent database.** Hash or drop opponent names on ingestion. Per-user silos. Minimal on-device storage. This is what PokerStars litigated against and what the Jurojin breach punished.
- **Capture degrades gracefully.** Replay links where they exist → post-session screenshots → a three-tap quick-log of a flagged hand. The app must be fully useful at the bottom of that ladder.

## 5. Gap analysis — what we have vs what the job needs

| Area | Today (v1 app) | Gap | Why it matters |
|---|---|---|---|
| **Ledger** | Sessions, deposits, one chip rate, net | No per-club rates/currencies; agent deposits and withdrawals aren't first-class events; no rebuy chain in the ledger view; **no rake or rakeback reconstruction**; no export/backup the player controls | Rake and rakeback are the invisible terms of a club player's result; a weekly rake statement they never had is both the truth and leverage with the agent. Backup/export is the trust test the category fails. |
| **Precommitment** | Rules on a settings page; red/green verdict; rebuy needs a reason | Limits are not set *at session start*; no time cap; no 80% alert; no wait-and-exit on rebuy/deposit; loosening is instant; reason text is the mechanism (evidence says it isn't) | The four mechanics with field evidence are all missing; the one we built (write a reason) has none. |
| **Review** | Hand list, note, confidence, mistake flag; results by position; bb/100 tile | No reason tags or tally; result shown before grading; no technical/mental split; no late-session or post-loss clustering; no preflop stability; no results-day cadence; win rate shown as if meaningful | The current screen is a dashboard of noise. The learning loop is the product's eventual willingness to pay. |
| **Capture** | Screenshots → Claude in the artifact; one hand at a time | No quick-log without screenshots; no batch; **ClubGG iOS shipped Screen Guard 21 Oct 2026 — unknown if replay screenshots still work**; no replay-link or PokerBros export parsers; opponent names stored in clear | The whole review layer rests on an input path we haven't verified on a device since Screen Guard. |
| **Onboarding / retention** | Create account → settings → log balance | First value is minutes away behind sign-up; no first-week goal; no streak; no lapse recovery | Manual logging halves by week 10 in comparable apps. Nothing in the product fights that yet. |
| **Distribution** | A link | No agent/club offer, no Hebrew, no referral loop, no pricing | The channel is human (app → union → club → agent → player). |
| **Trust / privacy** | RLS per user | No hashing of opponent names, no data-minimisation statement, no entity for store publishing | Store rules want a legal entity; the opponent-DB line must never be crossed. |

## 6. Risks and what we do about each

1. **ClubGG Screen Guard covers the replay screen.** *Checked 5 Nov 2026: screenshots of the hand replay work on Gal's phone, including a replay opened mid-session while another hand is live (shown as a mini-table top left). ClubGG has no share/export/link option for hands.* Re-check after every ClubGG release. If it ever blacks out: lead with ledger + discipline, hand capture via quick-log.
2. **Players won't log.** The founding hypothesis. *Test it before building anything else:* 10 players, four weeks, three-tap logging, measure sessions logged per session played.
3. **Agents and clubs see a rake statement as a threat.** *Test with two agents early.* If hostile, the rake feature stays player-side and quiet; distribution shifts to communities and players.
4. **NSUS attaches a GG-style policy to ClubGG.** Watch 1 December 2026. Design so the product never needs the app's permission: own data, after the session, through the OS share sheet.
5. **Israel: banking and marketing optics.** Never link to clubs or agents; no chip purchases in-app; publish from a company, 18+; payments through a mainstream processor for a software subscription.
6. **Privacy drift.** Hash opponents at ingestion from day one. Per-user export and delete.
7. **Thin economics of a ledger alone.** The category is under $1M/yr. Free ledger, paid review layer (~$13/mo), lifetime option. AI parsing costs under a cent per session — metered credits are margin.

## 7. How we'll know it's working

- **North star:** sessions logged per week per active player (a logged session = plan set before, result confirmed after).
- **Discipline:** % of sessions with a plan set; stop-loss adherence rate; off-plan deposits logged (not hidden); wait-and-exit abandonment rate.
- **Retention:** week-4 and week-10 logging retention vs the ~22%-by-week-10 prior from comparable apps; lapse-and-return rate.
- **Learning:** flagged hands reviewed per week; mistake-category tally trend over 3-week windows; late-session error share.
- **Trust:** zero data-loss incidents; export used; support tickets about numbers.
- **Business:** pilot → paid conversion; agent pilots signed; CAC per community.

## 8. Roadmap — phases with hypotheses and exit criteria

### Phase 0 — Validate before building (this week → 2 weeks)
*Hypothesis: the input path survives and players will talk to us.*
- Screen Guard check on Gal's iPhone: replay screen screenshot — works, black, or toggle? Same on Android if available. (Gal)
- Hunt for a ClubGG share-replay link or any hand-share feature. (Gal, 20 minutes in the app)
- Recruit 8–10 Israeli club players for a 4-week pilot: 2 clubs, mix of recreational and semi-pro. Five 20-minute interviews: how they track, how they deposit, what they'd pay, how they feel about a rake statement. (Gal; I write the interview guide)
- Two agent conversations: would you share this with your downline, and why not. (Gal)
- **Exit:** we know the capture ladder for ClubGG iOS/Android, and 8+ players committed to the pilot.

### Phase 1 — The session contract (weeks 2–6)
*Hypothesis: with a three-tap log and limits set at the start, ≥60% of played sessions get logged for ≥half the pilot through week 4.*
Build, in this order:
1. **Three-tap session:** Start = stake (default) → "I'll stop if I'm down ___ or after ___ hours" (free text, low anchor from their own roll) → Go. End = cash-out → confirm. Everything else deferred to the next-day review.
2. **Friction on rebuy and deposit:** 15-second wait with a large "Stop, end session" button; reason optional; 80% alert of their own limit; raising a limit applies tomorrow, lowering now.
3. **Club-native ledger:** per-club chip rate and currency; agent deposit/withdrawal as events; rebuy chain; weekly rake estimate from session data and a rakeback field — the "weekly statement"; one-tap export (CSV) and automatic backup.
4. **Weekly streak** ("kept my plan every session this week"), two freezes, earn-back, one self-chosen first-week goal.
5. **Hebrew UI** for the pilot.
6. **Remove** the bb/100 tile and the results-by-position table from Home. Replace with: plan adherence this week, sessions this week, and "results day in N hands".
- **Exit:** logging rate ≥60% for ≥half the pilot at week 4; stop-loss adherence measured; interviews say the ledger is "theirs".

### Phase 2 — The learning loop (weeks 6–12)
*Hypothesis: players will flag 2–5 hands per session and grade them next day; mistake categories move over 3 weeks.*
1. **Quick-log of a flagged hand** without screenshots: position, cards, street, "what I was unsure about" chip-tags (sizing, bluff-catch, fold vs raise, tilt), 20 seconds.
2. **Next-day review** with outcome hidden: mistake / cooler / unclear, technical vs mental, one note. Tally by category; 3-week trend; late-session and post-big-loss clustering → a **tilt profile** in plain words.
3. **Capture ladder** where Screen Guard allows: share-sheet batch upload → per-image parse with strict JSON → deterministic validation (pot math, card set, board shape) → merge. Opponent names hashed. X-Poker replay links and PokerBros email export as structured paths.
4. **Results day**: win rate with a confidence band, unlocked every 10,000 hands or monthly, whichever is later.
- **Exit:** median ≥2 flagged hands per logged session; ≥50% of flags reviewed within 48 h; parse accuracy on real ClubGG screens ≥95% on cards and ≥90% on amounts after validation.

### Phase 3 — Distribution and money (months 3–5)
- Agent/club pilot in Israel: white-label or rev-share; measure whether rake transparency is a hook or a fight.
- Pricing test: free ledger; Pro at ~$12.99/mo for review + tilt profile; lifetime ~$199.
- Company entity, 18+ store listing, PWA remains the no-review path.
- Referral: "send your table-mate the ledger".

### Phase 4 — Expand (month 5+)
- PokerBros (XLS export parser) and X-Poker (replay links) onboarding.
- Brazil (Portuguese), where poker is explicitly legal.
- MCP connector so any assistant can log and review on the player's own subscription — valuable, but it's leverage on a loop that must exist first.
- The research paper: we will have the first dataset on whether self-graded mistake rate predicts later results.

## 9. What we're deliberately not doing next

- No new AI features until Phase 1 exit. The AI parse is a Phase 2 accelerator, not the product.
- No bb/100 as a headline number, anywhere.
- No continuous screen recording, emulator, or converter path — ever.
- No club or agent links in the product.
- No MCP connector yet (moved to Phase 4).

## 10. This week

| # | Task | Owner |
|---|---|---|
| 1 | ~~Screenshot the ClubGG replay screen~~ Done: works, including mid-session. | Gal |
| 2 | ~~Look for any "share hand"/replay link in ClubGG~~ Done: none exists. Capture = screenshots only. | Gal |
| 3 | List 10 candidate pilot players and 2 agents. | Gal |
| 4 | Write the interview guide and a one-page pilot brief in Hebrew. | Claude |
| 5 | Spec the three-tap session + friction screens (wireframes, copy) for review before any code. | Claude |
| 6 | Design the ledger data model changes (per-club rates, agent events, rake fields, opponent hashing). | Claude |
