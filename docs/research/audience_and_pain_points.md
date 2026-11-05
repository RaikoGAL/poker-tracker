# Target audience and pain points: real-money cash-game players on app-based club poker (ClubGG, PokerBros, PPPoker, X-Poker, Suprema, Pokerrrr 2, Upoker)

Research date: 2026-11-05. Cash games are the primary lens; tournaments secondary. Sources are dated inline. Caveat up front: the club-app ecosystem is deliberately opaque (apps describe themselves as "play money"/"social", money settles off-platform through agents), so there is **no audited player count anywhere**. Most "size" claims below come from affiliate/agent sites or vendor blogs and should be treated as order-of-magnitude indications, not facts.

---

## Key Question 1: How big is the app-club poker population and where is it concentrated? Any numbers on ClubGG/PokerBros/PPPoker users or club counts?

### Takeaway
No reliable total exists; even industry writers call club-app volume "difficult to quantify precisely." The best available proxies are: PPPoker's own claim of "several million downloads," "thousands of clubs," users in 100+ countries (2019); ClubGG's App Store footprint; and union-level table counts (the largest ClubGG union, Massiv, ~100 clubs and 200+ peak ring tables). Geographic concentration by platform: PPPoker = Asia/CIS (plus Europe, Australia); PokerBros = North America, LatAm, Europe (Brazil heavy); ClubGG = most globally distributed, with large North American, Asian (Taiwan) and Brazilian bases, and demonstrable Israeli activity (ILS-denominated tables).

### Cited Findings
- PPPoker (2019, operator-sourced via CardPlayer): "several million downloads to date," "thousands of clubs," users in over 100 countries. No active-user figure. — [CardPlayer](https://cardplayer.com/poker-news/24502-pppoker-is-the-app-for-poker-lovers)
- A 2026 industry round-up gives concurrency figures for every regulated/grey network (PokerStars ~60K concurrent cash, GGPoker ~50K, ACR/WPN ~3.5K, CoinPoker ~800) but explicitly says club/app poker (PPPoker, PokerBros, ClubGG) volume is "difficult to quantify precisely" and gives no number. It names Brazil as a "major ClubGG user base" and Asia and Russia/CIS as "major PokerBros and ClubGG user bases." Published 2026-05-26; no methodology cited. — [WeeBet via DEV Community](https://dev.to/weebet/state-of-online-poker-2026-the-year-in-numbers-4b10)
- Regional split by platform (vendor blog, 2026-05-01): PPPoker strongest in Asian and CIS time zones with secondary peaks in Europe and Australia; PokerBros strongest in North America, Latin America and Europe; ClubGG "the most globally distributed," with large unions running 24/7 across North America, Europe and Asia. — [PokerNet blog](https://pokernetai.pages.dev/blog/pppoker-vs-pokerbros-vs-clubgg-operational-comparison/)
- Largest unions as of July/Aug 2026 (agent-affiliate site): Massiv Union (ClubGG) ~100 clubs, 200+ peak ring tables, North America evenings; Tiny Union (ClubGG) 150–180 peak tables, mainly Taiwan-based; TMT Union (ClubGG) 100+ tables, NA/international; Union 388/Yamal (PPPoker) ~40 clubs, 45–120 tables, Brazil/CIS; Paradise Union (PokerBros) 30–80 tables, USA/Canada. No player counts; table figures are inconsistent within the article. — [ThePokerAgent](https://thepokeragent.com/biggest-unions-on-poker-apps/)
- PokerBros is "particularly popular among Asian players" with "a large following in Europe and North America"; claims "thousands of players online at any given time" (promotional review, 2023-10-23). — [Ivo Manolov / write.as](https://write.as/ivo-manolov/the-pokerbros-application-reviewed)
- PokerListings (updated 2026-07-25) says many PokerBros clubs operate in the US and that the model is used in the US, UK and Australia to route around gambling law; PokerBros was removed from the Apple App Store at one point (reason unstated). — [PokerListings PokerBros review](https://www.pokerlistings.com/poker-sites/pokerbros-app-review)
- ClubGG launched August 2021 as GGPoker's club product, on Windows plus Android/iOS; it also sells a $49.99/month "Platinum" membership for live-event satellites, legal in 40+ US states under a sweepstakes model. No user counts published. — [PokerNews, 2021-12-22](https://www.pokernews.com/news/2021/12/top-stories-of-2021-clubgg-makes-a-major-splash-40440.htm)
- ClubGG Israeli App Store listing: 3.0/5 from 240 ratings (fetched 2026-11-05). — [Apple App Store IL](https://apps.apple.com/il/app/clubgg-poker/id1529839330)
- ClubGG club lobby example (VIP-Grinders, 2023) shows PLO tables denominated in both ILS and USD — 10/20 ILS, 20/40 ILS, 10/20 USD, 25/50 USD, 200/400 USD — i.e. shekel-denominated games exist on the platform. — [VIP-Grinders ClubGG review](https://www.vip-grinders.com/clubgg-review)
- Club economics imply a long tail of small clubs: PPPoker 60-member club ≈ $25/month, 100-member ≈ $45/month; PokerBros Level 1–2 clubs $20–26/month; ClubGG weekly full report ≈ $5. A "small independent club" is budgeted at $25–50/month. — [PokerNet blog](https://pokernetai.pages.dev/blog/pppoker-vs-pokerbros-vs-clubgg-operational-comparison/)

### Inferences
- The addressable population is very likely in the hundreds of thousands of monthly-active real-money players globally (several million cumulative PPPoker downloads alone; three platforms; unions running 100–200 simultaneous ring tables each at peak), but this is inference, not a sourced figure.
- The ecosystem is fragmented into thousands of small clubs; any tool must work for a player who moves between clubs/unions rather than assume one "site."
- Israel is a real but small pocket: ILS tables on ClubGG, Hebrew-locale App Store reviews, and the founder's own club (1 chip = 1 shekel, from memory). See Q7.

### Gaps
- No independent, audited count of active real-money club-app players, clubs or unions for any platform; operators do not publish them and the "play money" framing is designed to prevent this.
- No ClubGG- or PokerBros-specific download or MAU figures were found (SimilarWeb pages were paywalled/rate-limited).
- No breakdown of players by country of residence.

---

## Key Question 2: What do these players say they struggle with? (Reddit, 2+2, forums, app store reviews)

### Takeaway
In their own words, club players' recurring complaints cluster into: (1) single-point-of-failure trust in an agent you've never met ("You have to put all of your trust in one single person"); (2) collusion/bot suspicion they cannot verify ("7 or 8 seats at a table can show the exact same VPIP"); (3) "it's rigged"/variance paranoia; (4) rake that has made formerly soft games a "reg fest ... with high rake"; (5) opaque rakeback ("rake minus winnings" schemes, rakeback paid only when you lose); and (6) app/time-zone frustrations (games dead outside Americas hours, emulator glitches).

### Cited Findings
**Agent trust / money**
- CardsChat thread (Oct–Dec 2022), PokerBros Pan Am union: player's club "Team Legion just vanishes," the agent (reachable only via Facebook) goes silent for weeks; "I knew I was taking a chance since I had no idea who I was dealing with"; "You have to put all of your trust in one single person"; "Is there anything that can be done if something major happened to him?"; "I guess I will have to consider it a loss." Deposit was "just a couple of hundred." Resolved after ~5 weeks when the agent "said he must have missed my last message." — [CardsChat via casino.us](https://www.casino.us/cardschat/poker-rooms-10/pokerbros-club-chaos-need-help-512977/)
- Counter-example from 2+2 PokerBros thread (2023-07-24, user The Standard Station): "They're great on payments, you submit a form and say which payment method you want ... it gets paid out in maybe a day tops"; "Had many 5 fig payments paid out within hours." — [TwoPlusTwo PokerBros thread p.153](https://forumserver.twoplustwo.com/292/online-poker-sites/pokerbros-discussion-thread-1757085/index153.html)
- PokerListings (blacklist review, updated 2026-07-25) reports "slow or unpaid withdrawals, including complaints of four and five-figure sums," withdrawals requested through the agent to Bitcoin or e-wallet with "no fixed procedure," and calls the structure "a poker ponzi scheme." Operator ThinkLean reportedly disclaims liability for lost funds. — [PokerListings PokerBros review](https://www.pokerlistings.com/poker-sites/pokerbros-app-review)
- Same publisher on Upoker (updated 2026-07-25): "many agents slow-pay players or don't pay out at all"; players "must negotiate chip values, buy-ins, rake, fees, and withdrawals directly with agents"; complaints "involving four- and five-figure sums that were not paid"; accusations "mostly ignored because they had no formal protection." — [PokerListings Upoker review](https://www.pokerlistings.com/poker-sites/upoker)
- Rakeback red flags listed by an agent-catalog site (2026-10-16): agent "can't explain the calculation," terms change after deposit, "rakeback paid only when you lose," withdrawals blocked by play-through requirements, pressure to deposit quickly; "An agent who delays rakeback often delays withdrawals too"; "'Rake minus winnings' schemes can pay a winning player little or nothing." Players are advised to ask the agent for a weekly rake statement because "The app pays no rakeback. The club or agent does, so tracking depends on them." — [RatePokerClub](https://www.ratepokerclub.com/blog/poker-rakeback-clubs)

**Collusion / bots / rigged**
- r/poker "bots are taking over" (May 2026, 593 upvotes, 52 comments): user Wooden-Broccoli-7247 says on Club GG "7 or 8 seats at a table can show the exact same VPIP"; LoboSpaceDolphin: bots are "at least 10%" of players; Pristine_Business_92 claims bots are seated together and "feed each other their cards"; joltpoker recommends "only in clubs or unions that use bot tracking"; others (overbet12345) call bots "a very marginal problem" except on Ignition/ACR; several say complainers "are simply losing." — [r/poker via mirror](https://r.datuan.dev/r/poker/comments/1tf2iju/bots_are_taking_over/)
- 2+2 PokerBros thread (July 2023): "There should be a table shuffle so that people can't collude ... if you max late reg you end up w a table of all other max late reg"; "Is screen scraping that big of an issue even w anonymous watching feature?" — [TwoPlusTwo](https://forumserver.twoplustwo.com/292/online-poker-sites/pokerbros-discussion-thread-1757085/index153.html)
- PokerBros' own integrity team (Jan 2021, self-reported): "thousands of cheaters identified per month"; bots/AI/RTA ≈ 67% of banned accounts; colluders and chip-dumpers "detected and locked every week"; reports flow player → club/agent → integrity team (no direct player channel). — [WorldPokerDeals interview](https://worldpokerdeals.com/blog/exclusive-interview-with-the-game-integrity-bros-team)
- Trustpilot ClubGG (2.9/5, 3 reviews; 2026-04-14, 1 star): "Worst poker room ever ... Fish wins, reg little profit." — [Trustpilot](https://ca.trustpilot.com/review/www.clubgg.com)
- Israeli App Store reviews for ClubGG (3.0/5, 240 ratings): "It's fixed, probably to make things more exciting" (2025-01-02); "Guys if you're not in the time zone of the americas then don't get it" (2025-05-09); "Bad update ... diminishing the number of players from 6 to 5 in Omaha 6 cards" (2024-08-26); one review references "Proof of transferring money in the app via Bit" (Bit is an Israeli P2P payment app; unverified). — [Apple App Store IL](https://apps.apple.com/il/app/clubgg-poker/id1529839330)
- PokerTube (c. 2021): a 5-2 offsuit all-in that won a $70 PokerBros freezeout circulated on Twitter as "house cheating"; one player's rebuttal was simply that the villain "was just a weak player who got lucky." — [PokerTube](https://www.pokertube.com/article/house-cheating-allegations-aimed-at-poker-app-after-bizarre-hands-circulates-on-twitter)

**Rake / game quality / app**
- 2+2 (2023-06-13, yasuo): "is it even possible to beat the game playing over 40% VPIP? ... It used to be very beatable but now its a reg fest 90% of the time with high rake." — [TwoPlusTwo](https://forumserver.twoplustwo.com/292/online-poker-sites/pokerbros-discussion-thread-1757085/index153.html)
- 2+2 emulator complaints (June 2023): "I cant see my cards...like a graphic-problem"; "I cant join certain tables"; "So annoying when I'm watching my players and I have to keep reopening the table." — same source.
- PokerListings: rake "theoretically 3-5%" but "club owners may charge 10-12% on some games"; unions "may take up to 10%"; clubs add "uncapped" fees, "tax percentages and withdrawal fees." — [PokerListings](https://www.pokerlistings.com/poker-sites/pokerbros-app-review)
- VIP-Grinders on ClubGG: rake set by club owner 3–5%, most caps 0.1–3BB, "some tables have no cap, which the page advises avoiding"; no rakeback from the app. — [VIP-Grinders](https://www.vip-grinders.com/clubgg-review)
- An independent review (2026-02-10) lists ClubGG drawbacks as "higher table-to-table variance than centralized sites," "need to table-select rather than sit anywhere," "some clubs may have dead games," "no single standardized cashier," and flags "pressure to deposit or 'play now'" as a red flag. — [Ivo Manolov ClubGG 2026](https://write.as/ivo-manolov/clubgg-review-2026-traffic-games-rakeback-and-safety)

### Inferences
- The emotional core of the segment is *not knowing*: whether the agent will pay, whether the table is clean, whether the rake/rakeback math is honest, and (see Q3) whether they themselves are winning. A product that gives any of these a verifiable number has a hook.
- Players already compute informal fairness metrics (VPIP across seats, hands-vs-odds) by eye; they lack tooling to do it systematically.
- "Rigged" complaints are mostly recreational losers venting; "collusion/bots" complaints come more from regs. Both segments would value an independent, personal ledger of results they control.

### Gaps
- Direct Reddit access was blocked; r/pokerbros could not be read, and only one r/poker thread was retrievable via a mirror. No r/ClubGG subreddit was located (only an agent-run r/CLUBGGPOKERBESTCLUBS appeared in search).
- No Discord/Telegram community transcripts were retrievable; Telegram results were bot-vendor channels.
- App-store review retrieval was limited to the Israeli ClubGG listing; Google Play and PokerBros/PPPoker store reviews were not retrievable.

---

## Key Question 3: What do these players currently do to track results or review hands? What breaks down?

### Takeaway
There is no standard. Serious players use PokerTracker/HM/Hand2Note-style desktop tools, but these do not work natively with club apps (VIP-Grinders: "PokerTracker or Hold'em Manager are not available" for ClubGG); the workaround is an Android emulator (LDPlayer) plus a paid "Asian hand converter" and DriveHUD on desktop—i.e. not mobile, not for recreationals. Everyone else uses a spreadsheet, a notebook, a generic bankroll app (Poker Income, Poker Bankroll Tracker, Pokerbase, Poker Analytics, BINK, Left Pocket) or nothing. Bankroll apps break down on data loss, abandoned updates, missing rebuy/re-entry handling, and primitive graphs; and none of them capture hands from club apps.

### Cited Findings
- ClubGG: "PokerTracker or Hold'em Manager are not available"; desktop requires the LDPlayer emulator. — [VIP-Grinders ClubGG review (2023)](https://www.vip-grinders.com/clubgg-review)
- PokerBros grinder workaround (2+2, 2023-06-08): "Try Drivehud (Asian Hand Converter) + LD Player combo." — [TwoPlusTwo](https://forumserver.twoplustwo.com/292/online-poker-sites/pokerbros-discussion-thread-1757085/index153.html)
- PokerBros terms "reportedly allow only the PokerBros HUD as an external tool"; no description of hand-history export. — [PokerListings](https://www.pokerlistings.com/poker-sites/pokerbros-app-review)
- Conflicting claim: a bot-vendor blog (2026-05-01) says ClubGG has "integrated hand history and HUD tools, built-in analytics, session tracking" while PokerBros has "limited" advanced reporting and PPPoker needs "paid reporting or manual spreadsheets" for per-player financials. — [PokerNet blog](https://pokernetai.pages.dev/blog/pppoker-vs-pokerbros-vs-clubgg-operational-comparison/); ClubGG's own App Store copy claims only "detailed game history and statistics for games played" with no mention of HUD or export. — [Apple App Store IL](https://apps.apple.com/il/app/clubgg-poker/id1529839330). Treat the vendor claim as unverified.
- r/poker post "The one thing a winning poker player does" (2018): "Just a spreadsheet or even a notebook with day, buy-in amount, and cash-out amount." Author's grandfather "had no clue how much he was losing"; players who claim to be "break-even" have "willingly lied to [themselves]." — [r/poker via mirror](https://lr.sudovanilla.org/r/poker/comments/8ugm6w/the_one_thing_a_winning_poker_player_does)
- PokerNews' top-5 bankroll trackers (2025-06-20): Pokerbase (free + pro, staking/social), Poker Analytics (free + pro, hand histories), Poker Income (free), Poker Bankroll Tracker (free + pro, hand replayer), BINK (free + pro). None is described as integrating with any online/app client. — [PokerNews](https://www.pokernews.com/strategy/the-top-5-best-poker-bankroll-trackers-48862.htm)
- Poker Income Bankroll Tracker user reviews: "Lost 2 years of data twice now"; backup page shows "Error Loading Page"; "Does not work with new iOS, just crashes"; "hasn't been updated in over a year"; "Active cash/tournaments don't reliably show up"; no re-entry/re-buy option on completed sessions; reports show profit but not total money at risk; "Graphing is primitive"; lowest configurable NLHE stake is 1/2 (users want 1/1 and 25c/50c). Positive: "Well worth the $10"; "Must have for a serious poker player!" — [JustUseApp reviews](https://justuseapp.com/en/app/316520188/poker-income-bankroll-tracker/reviews)
- Club owners/agents themselves track rake and player P&L via paid in-app weekly reports (PPPoker ~$5/week, ClubGG ~560 diamonds ≈ $5/week) or "manual spreadsheets." — [PokerNet blog](https://pokernetai.pages.dev/blog/poker-club-agent-commission-structure-how-rakeback/)
- Rakeback is never visible to the player in-app; players are told to request a weekly rake statement from the agent. — [RatePokerClub](https://www.ratepokerclub.com/blog/poker-rakeback-clubs)
- Founder's own current practice (from memory, user-stated): hand parsing is done by pasting ClubGG replay screenshots into an AI chat because there is no export; wants configurable deposit/stop-loss/goal rules rather than hardcoded ones. — Gal's memory file (/projects/.../areas/poker.md, 2026-11-02)

### Inferences
- The single biggest tooling gap versus PokerStars/GG players is ingest: club apps give no hand-history file and no API, so the realistic data sources are (a) manual session entry, (b) screenshot/OCR of the in-app replayer, (c) emulator screen-scraping (desktop-only, ToS-grey). A mobile-first product must make manual + screenshot capture nearly frictionless.
- Rakeback is a hidden, agent-controlled number; a tool that lets a player reconstruct "rake I paid this week" from their own logs gives them negotiating leverage with the agent—a differentiated, club-specific feature.
- Existing bankroll apps were designed for live players (session timers, $1/2 minimum stakes) and miss club realities: chip-to-currency conversion, rebuys within a session, agent deposits/withdrawals as separate ledger events, and multi-club/multi-currency.

### Gaps
- No survey data on what share of club players track anything; evidence is anecdotal.
- Could not verify whether ClubGG's PC client exposes any exportable hand history today (2026); sources conflict.
- No usage numbers for Poker Analytics/Pokerbase among online-app players specifically.

---

## Key Question 4: What fraction of recreational online players lose money, and what do losers wish they had done differently?

### Takeaway
Roughly two-thirds of online cash players are net losers before rakeback, and the share of long-term winners shrinks to ~30% (pro's PokerTracker estimate) or far less once low-volume players are included. For gambling broadly, a 718K-consumer UCSD study found only ~4% of online bettors withdrew more than they deposited over 2019–2023. The "wish I had" literature centers on bankroll discipline, pre-set stop-losses, and honest record-keeping rather than strategy.

### Cited Findings
- Hendon Mob analysis of two Full Tilt databases (~3.4M hands each, 2009): roughly two-thirds of all players are net losers; among players with 100+ hands, 60% of NLHE and 64% of PLO players lose; at $2–$20 NLHE 63% lose vs 57% at $50+; only ~1% of all players reached 5,000 hands *and* were winners (hence the "99% lose" folk claim, which the author argues misreads the data). Rake is a major driver. — [The Hendon Mob, 2009-07-23](https://www.thehendonmob.com/?p=2381)
- BlackRain79 (pro, originally Sept 2019): "If I had to guess, I would put the number at around 30%" of players as long-term winners, ~10% significant winners, 5–10% who "absolutely crush"; based on filtering his own PokerTracker database (sample not described); notes micro-stakes rake-to-pot ratio hurts winners most. — [BlackRain79](https://www.blackrain79.com/2019/09/what-percentage-of-poker-players-are.html)
- UCSD Rady study (released July 2025; covered 2026-10-04): 717,724 consumers, 2019–2023; ~4% of online bettors withdrew more than they deposited; co-author Wilbur says the 4% "is by design" because platforms limit frequent winners. Not poker-specific (sports/casino/DFS pooled). — [GamblingHarm.org](https://gamblingharm.org/most-online-gamblers-lose-study/)
- Stop-loss guidance (2026-09-10): common cash stop-loss is two to four buy-ins, chosen in advance "while calm"; a limit set mid-session by a stuck player "is a negotiation, not a stop-loss"; stuck players "widen opening ranges, call more river bets, bluff into calling stations, move up in stakes, and play longer sessions"; warning sign is the thought "I just need one hand to..."; recommends time-based stop (e.g. five hours) as well; a single catastrophic session can eat "a quarter of the roll." No empirical data cited. — [DeucesCracked](https://www.deucescracked.com/blog/poker-stop-loss-session-management-guide)
- Self-deception theme: players describing themselves as "break-even" when records would show losses; relatives "had no clue how much he was losing." — [r/poker via mirror](https://lr.sudovanilla.org/r/poker/comments/8ugm6w/the_one_thing_a_winning_poker_player_does)
- Agent-side evidence that most downlines lose: agent commission is adjusted by downline net result, "commonly about -10% on cash," and agents/clubs are structurally paid from rake, i.e. the business model assumes net-losing player pools. — [PokerNet agent commission article, 2026-05-14](https://pokernetai.pages.dev/blog/poker-club-agent-commission-structure-how-rakeback/)
- The founder himself (memory, user-stated): wants to track spend/gains and set goals "so he stays profitable and avoids impulsive reloads ('let's just put another 200')." — Gal's memory file (2026-11-02)

### Inferences
- Club rake (5–7% table rake, some tables uncapped, plus union/club fees) is higher than regulated-site rake, so the losing share in club games is plausibly *higher* than the 60–66% Full Tilt figures—unless the player secures rakeback (effective rake 2.5–4% in catalog ClubGG clubs per RatePokerClub).
- "Impulsive reload" is a mobile-specific failure mode: the agent is one chat message away and chips arrive in minutes, so friction is near zero. A pre-committed deposit cap enforced *outside* the poker app is the behavioral lever.

### Gaps
- No study of win/loss distribution specific to club apps or mobile players.
- No systematic survey of "what losing players wish they'd done"; findings here are coaching/opinion content plus anecdotes.
- Quoted first-person regret posts from club players were not retrievable (Reddit blocked).

---

## Key Question 5: What do club players specifically lack compared to PokerStars/GG players (hand histories, trackers, HUDs, rakeback transparency)?

### Takeaway
Compared with a GGPoker/PokerStars player, a club player lacks: a cashier (deposits/withdrawals are negotiated person-to-person), a published and fixed rake schedule, any in-app rakeback statement, exportable hand histories, PokerTracker/HM compatibility, platform-level dispute resolution, and (on PokerBros/PPPoker) a native PC client. Compensating advantages are softer games (sometimes) and negotiable rakeback of 40–70%.

### Cited Findings
- No standardized cashier; "the app doesn't accept deposits"—players buy chips from the agent; "Clubs can only be joined through an agent." — [VIP-Grinders ClubGG](https://www.vip-grinders.com/clubgg-review); "no single standardized cashier" — [Ivo Manolov 2026](https://write.as/ivo-manolov/clubgg-review-2026-traffic-games-rakeback-and-safety)
- No PT/HM support on ClubGG; desktop via emulator only. — [VIP-Grinders](https://www.vip-grinders.com/clubgg-review)
- PokerBros has no native PC version (emulators), and terms permit only its own HUD. — [PokerListings](https://www.pokerlistings.com/poker-sites/pokerbros-app-review)
- Rake set by club owner (3–5% ClubGG, 5–7% in RatePokerClub's ClubGG catalog; PokerBros nominal 3–5% but up to 10–12% at some clubs; unions up to 10%). Caps vary 0.1–3BB; some uncapped. — [VIP-Grinders](https://www.vip-grinders.com/clubgg-review); [RatePokerClub](https://www.ratepokerclub.com/blog/poker-rakeback-clubs); [PokerListings](https://www.pokerlistings.com/poker-sites/pokerbros-app-review)
- Rakeback is agent-paid, 10–50% in PPPoker clubs typically, agents pay 20–60%, NL200+ players 55–70%; settlement weekly (Mon–Wed cycle) by crypto, Zelle or PayPal. — [PokerNet agent commission](https://pokernetai.pages.dev/blog/poker-club-agent-commission-structure-how-rakeback/); ClubGG catalog clubs 40–50% rakeback, effective rake 2.5–4%. — [RatePokerClub](https://www.ratepokerclub.com/blog/poker-rakeback-clubs)
- Rakeback transparency depends entirely on the agent; players should ask for "a statement from the agent or club records showing your weekly rake." — [RatePokerClub](https://www.ratepokerclub.com/blog/poker-rakeback-clubs)
- Dispute/cheating reports go player → club/agent → integrity team; no direct player channel. — [WorldPokerDeals GIB interview](https://worldpokerdeals.com/blog/exclusive-interview-with-the-game-integrity-bros-team)
- Agents/clubs "have no legal duty to provide support for payment problems, cheating, collusion, or hacking." — [PokerListings Upoker](https://www.pokerlistings.com/poker-sites/upoker)
- Money moves: chips valued off-platform; "real-money settlement happens off-platform through agents"; club/agent/union split of gross rake ≈ union 8–10%, club 20–30%, agent 60–70% (agent passes part back as rakeback). — [PokerNet](https://pokernetai.pages.dev/blog/poker-club-agent-commission-structure-how-rakeback/)
- ClubGG shows a positive counter-signal: 2+2 posters ask for "a list of pros/cons of pokerbros vs clubgg vs pokerrrr2," indicating players actively compare platforms on these dimensions. — [TwoPlusTwo](https://forumserver.twoplustwo.com/292/online-poker-sites/pokerbros-discussion-thread-1757085/index153.html)

### Inferences
- A club player's "true win rate" = table result − rake + rakeback, with two of the three terms invisible or agent-controlled. A personal ledger that reconstructs all three is the club-specific equivalent of PokerCraft on GG.
- Because the player cannot rely on platform support, personal records (deposit dates, amounts, agent, chip rate, screenshots) double as dispute evidence—an argument for making the tracker a "paper trail," not just a stats toy.

### Gaps
- Could not confirm whether any club app exposes a per-player rake total in-app today.
- No data on how many club players actually receive rakeback vs. play without it.

---

## Key Question 6: Evidence on mobile players' willingness to pay for tools; what they already pay for

### Takeaway
Serious players demonstrably pay $39–$279/month for GTO Wizard tiers and $49.99/month for ClubGG Platinum; club owners pay $20–50/month in platform fees plus ~$5/week for reports. Recreational mobile players pay for bankroll apps at the ~$10 one-off or small-pro-tier level and judge them harshly on reliability. No study quantifies club players' tool spend.

### Cited Findings
- GTO Wizard tiers (2026-03-31): Starter $49/mo ($39 annual), Premium $99 ($79), Elite $169 ($139), Ultra early-bird $279 ($229). No subscriber counts published. — [PokerNews](https://www.pokernews.com/news/2026/03/gto-wizard-subscription-plans-new-features-pricing-50908.htm)
- ClubGG Platinum membership $49.99/month for satellite access (sweepstakes model); 2021 winners turned $49.99 into WSOP Main Event seats ($17,500 and $470,000 cashes cited). — [PokerNews 2021](https://www.pokernews.com/news/2021/12/top-stories-of-2021-clubgg-makes-a-major-splash-40440.htm); confirmed at $49.99/mo with "$200,000+ in monthly ticket prizes." — [VIP-Grinders](https://www.vip-grinders.com/clubgg-review)
- Club-side spend: PPPoker clubs ~$25–45/month, PokerBros $20–26/month, weekly reports ~$5; "budgeting $25–50 monthly for a small independent club." — [PokerNet](https://pokernetai.pages.dev/blog/pppoker-vs-pokerbros-vs-clubgg-operational-comparison/)
- Bankroll-tracker price sensitivity: Poker Income users say "Well worth the $10," "It's worth every penny," but one calls it an "expensive app" when backup failed; four of five PokerNews-listed trackers are freemium. — [JustUseApp](https://justuseapp.com/en/app/316520188/poker-income-bankroll-tracker/reviews); [PokerNews](https://www.pokernews.com/strategy/the-top-5-best-poker-bankroll-trackers-48862.htm)
- Grinders on PokerBros pay for DriveHUD + an Asian hand converter + emulator stack (prices not stated in thread). — [TwoPlusTwo](https://forumserver.twoplustwo.com/292/online-poker-sites/pokerbros-discussion-thread-1757085/index153.html)
- Bot vendors openly market monthly "managed AI bot services" to club owners for PPPoker/PokerBros/ClubGG, implying a paying market on the dark side of the same ecosystem. — [PokerNet](https://pokernetai.pages.dev/blog/pppoker-vs-pokerbros-vs-clubgg-operational-comparison/)
- Founder's own stance (memory, user-stated): has no paid Anthropic API key; is considering an MCP-server architecture so each user plugs in their own AI subscription instead of the product paying for API calls. — Gal's memory file (2026-11-02)

### Inferences
- Willingness to pay is bimodal: aspiring semi-pros/grinders already spend $40–170/month on study tools and would pay a comparable amount for a tool that plugs the club-app data hole; recreationals anchor at free/≤$10 and churn on the first data-loss bug.
- Reliability (backup/sync) and multi-device are table stakes; the Poker Income reviews show reliability failures are the main driver of 1-star reviews even at a $10 price.

### Gaps
- No survey or market-size estimate of poker-tool spend by mobile/club players.
- No GTO Wizard, Pokerbase or Poker Analytics subscriber counts.
- No evidence on conversion rates for freemium bankroll apps.

---

## Key Question 7: Segments, stakes, session patterns, devices, money flow (synthesis), and Israel-specific notes

### Takeaway
Four segments emerge: (a) recreational loser who deposits a few hundred at a time through an agent and never tallies the total; (b) aspiring semi-pro who studies, wants stats, and is blocked by the no-export wall; (c) grinder who runs emulator + converter + HUD and worries about rake/collusion; (d) agent/club owner who pays weekly for reports and manages downline settlement. Device is overwhelmingly mobile (apps are "mobile-first"; PC only via emulator or ClubGG's Windows client). Money moves player ↔ agent in local currency or crypto, weekly settlement, chips valued off-platform. Israel: online poker is a grey area, cards are blocked for gambling, shekel tables exist on ClubGG, and the founder's club uses 1 chip = 1 ILS.

### Cited Findings
**Segments / stakes / sessions**
- Recreational: "It was just a couple of hundred, so not devastating"; joined via referral, didn't know agent. — [CardsChat](https://www.casino.us/cardschat/poker-rooms-10/pokerbros-club-chaos-need-help-512977/)
- Grinder: "I've played 95% on poker bros since I started playing there in December 2019"; uses DriveHUD/converter/LDPlayer; complains "reg fest 90% of the time with high rake"; another "watching my players" (an agent monitoring downline). — [TwoPlusTwo](https://forumserver.twoplustwo.com/292/online-poker-sites/pokerbros-discussion-thread-1757085/index153.html)
- Agent/club owner: commission 40–70% of downline rake, tiered by active players (0–5, 6–15, 16–30, 30+), adjusted ~-10% on cash by downline net result; weekly Mon–Wed settlement; fines/suspension for missed settlement. — [PokerNet](https://pokernetai.pages.dev/blog/poker-club-agent-commission-structure-how-rakeback/)
- Stakes observed: union descriptions "micro blinds up to 6/12" (Tiny Union), "micro to mid stakes" (Union 388), "mid-stakes ring games" (Paradise); ClubGG PLO lobby 10/20 ILS to 200/400 USD. — [ThePokerAgent](https://thepokeragent.com/biggest-unions-on-poker-apps/); [VIP-Grinders](https://www.vip-grinders.com/clubgg-review)
- Rakeback tiers imply stake segmentation: NL200+ players get 55–70% rakeback vs 20–60% for others. — [PokerNet](https://pokernetai.pages.dev/blog/poker-club-agent-commission-structure-how-rakeback/)
- Session/time-zone: Massiv Union peaks "North America (EST/PST evenings)"; Israeli reviewer: "if you're not in the time zone of the americas then don't get it." — [ThePokerAgent](https://thepokeragent.com/biggest-unions-on-poker-apps/); [App Store IL](https://apps.apple.com/il/app/clubgg-poker/id1529839330)
- Bad Beat Jackpots ("often above 500K chips") and rake races/leaderboards are standard retention mechanics in unions. — [ThePokerAgent](https://thepokeragent.com/biggest-unions-on-poker-apps/); [RatePokerClub](https://www.ratepokerclub.com/blog/poker-rakeback-clubs)

**Device**
- ClubGG "mobile-first," "app-first." — [Ivo Manolov 2026](https://write.as/ivo-manolov/clubgg-review-2026-traffic-games-rakeback-and-safety); ClubGG available on Windows + Android/iOS — [PokerNews 2021](https://www.pokernews.com/news/2021/12/top-stories-of-2021-clubgg-makes-a-major-splash-40440.htm); PokerBros Android/iOS only, PC via emulator — [PokerListings](https://www.pokerlistings.com/poker-sites/pokerbros-app-review)

**Money flow**
- Chips and Diamonds bought from agent, not app; withdrawals via agent to Bitcoin/e-wallet; settlement by crypto, Zelle, PayPal; chip value "valued off-platform." — [PokerListings](https://www.pokerlistings.com/poker-sites/pokerbros-app-review); [PokerNet](https://pokernetai.pages.dev/blog/poker-club-agent-commission-structure-how-rakeback/)
- Advice from forum: "Depositing 10BI at max would usually solve such problems" (keep agent exposure small). — [CardsChat](https://www.casino.us/cardschat/poker-rooms-10/pokerbros-club-chaos-need-help-512977/); "small-deposit test before scaling." — [Ivo Manolov 2026](https://write.as/ivo-manolov/clubgg-review-2026-traffic-games-rakeback-and-safety)

**Israel-specific**
- Online poker in Israel is unregulated; no local licenses; offshore play a "gray area" and players "not generally prosecuted"; the government "penalizes credit card companies that process gambling payments," so Visa/Mastercard rarely work; crypto accepted by some rooms; "Most platforms don't accept shekels (NIS)"; PokerStars has exited; GGPoker via the 7XL skin is the main regulated-ish option; 35% tax on winnings above 62,400 ILS (offshore winnings usually undeclared). The page does not mention ClubGG/PokerBros for Israelis. — [WorldPokerDeals, 2026-03-24](https://worldpokerdeals.com/blog/pokerstars-closed-israel-at-what-poker-rooms-may-israeli-players-play)
- Yet ClubGG club lobbies run ILS-denominated PLO tables (10/20 ILS, 20/40 ILS). — [VIP-Grinders](https://www.vip-grinders.com/clubgg-review)
- Israeli App Store ClubGG listing has 240 ratings (3.0/5); one review references money transfer "via Bit" (Israeli P2P app). — [App Store IL](https://apps.apple.com/il/app/clubgg-poker/id1529839330)
- Founder's own club (memory, user-stated): 1 ClubGG chip = 1 shekel; plays cash not tournaments; wants configurable deposit/stop-loss/goal rules; parses hands from ClubGG replay screenshots. — Gal's memory file (/projects/01a19dc9-b79a-77e8-b06c-69da7b9f53e8/areas/poker.md, 2026-11-02)
- Israel's Supreme Court ruled poker a game of skill (2018) and bills to legalize live tournaments have circulated, but online remains unregulated. — [Jerusalem Post](https://m.jpost.com/special-content/israeli-supreme-court-ruled-poker-a-game-of-skill-making-it-technically-legal-whats-next-576699); [PokerNews 2018](https://www.pokernews.com/news/2018/11/israel-poker-legislation-taxes-32565.htm)

### Inferences
- Because Israeli cards are blocked for gambling and shekels aren't accepted by regulated rooms, the agent/club model (settled via Bit/bank transfer in ILS, chips at 1 ILS) is a natural fit for Israeli players—likely why ILS tables exist on ClubGG. The Israeli segment is small but underserved and reachable through a handful of Hebrew-speaking agents/clubs.
- Multi-currency (ILS/USD/BRL) and chip-rate conversion must be first-class in any ledger aimed at this audience.
- Session patterns are time-zone-bound to the union's home region; an Israeli on an Americas union plays late-night sessions, which compounds fatigue/tilt risk (DeucesCracked's time-stop argument).

### Gaps
- No count of Israeli club-poker players, clubs, or agents; no Hebrew-language forum/Telegram content was retrievable.
- Gambling911's 2026 article on poker apps in the Middle East failed to load.
- Typical buy-in sizes and session lengths for club cash players were not found in any quantitative source; only union-level stake ranges and anecdotes.
