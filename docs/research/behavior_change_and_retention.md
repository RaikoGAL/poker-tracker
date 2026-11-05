# Behavior-change product design, retention loops and precommitment evidence for a poker discipline app

Research date: 2026-11-05. Scope: product mechanics a PM can lift into a mobile-first poker discipline app (stop-loss, no chasing, no impulsive deposits, skill improvement). The app is NOT an operator, so operator-side tools (deposit limits enforced at the cashier, self-exclusion registers) are examined as evidence about *which commitment designs humans keep*, then translated into app-side mechanics.

Overall reading of the evidence, in one paragraph: the retention mechanics with the best evidence are streak-type daily commitments *made forgiving* (Duolingo: two freezes, earn-back, user-chosen goals), a first-week focus, and user-chosen commitment copy. On precommitment, the gambling literature is consistent that (a) voluntary limits are used by a small minority (roughly 3-5% in the best operator RCTs), (b) when used, they do reduce spending, most strongly for the most intense players, and (c) pop-up information messages and "reality checks" on their own do not reliably change behaviour in field trials, whereas *friction at the moment of action* (a wait plus a one-tap "don't do it" exit) does. For poker specifically, time limits moved spending more than money limits in the one large operator dataset. Data-capture burden is a real churn driver, but fully passive capture can under-perform light manual entry on behaviour change, so the target is "one tap + later review", not zero-touch.

---

## Key Question 1: Retention mechanics with evidence (streaks, check-ins, reviews, progress, social, nudges) and published retention norms

### Takeaway
Duolingo's 600+ streak experiments give the richest public evidence: forgiving streaks (2 freezes, free earn-back), a one-sentence explanation of the mechanic, user-chosen goals and "commit" copy all produced measurable retention wins, while harder pre-selected goals and lowering the bar per lesson did not. Category retention norms are poor (health & fitness roughly 20% D1 and 3-4% D30; finance roughly 30% D1 and 12% D30), so a poker-discipline app should benchmark itself against finance apps, not games.

### Cited Findings
**Duolingo streaks (Jackson Shuttleworth, Group PM Retention, Lenny's Podcast, Dec 2024)**
- Duolingo has run 600+ streak experiments in four years; roughly half were shut down. Over 9 million users have a year-plus streak. — [Lenny's Newsletter episode page](https://lennysnewsletter.com/p/behind-the-product-duolingo-streaks); [Recall summary of transcript](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team)
- Allowing two streak freezes instead of one significantly increased DAU retention and return rates; three performed no better than two. Too much flexibility let users take longer breaks and eventually lose the streak. Giving *new* users two freezes at the start of a streak was one of the biggest wins because it reduced early losses. — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team)
- "Earn back" (regain a lost streak by completing a set number of lessons in a window) was a retention winner and did not cheapen the streak. — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team)
- Going from a 1-day to a 2-day streak produces a large retention jump; retention dips slightly until day 7, flattens, then rises with longer streaks. Users are considered to have "locked in" the habit at ~7 days; established long streaks get less flexibility. — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team)
- An eight-word explanation of the mechanic ("Start a day to extend your streak, but miss a day and it resets") drove ~10,000 incremental DAUs. Changing the goal-screen button from "Continue" to "Commit to my goal" was a significant retention win (size not disclosed). — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team); [Lenny's Newsletter](https://lennysnewsletter.com/p/behind-the-product-duolingo-streaks)
- Streak goals: a 30-day goal was framed with "users are seven times more likely to finish a course with a 30-day streak". Pre-selecting a harder goal did *not* improve retention; letting users choose their own goal worked better; a separate opt-out button was a "huge win"; offering an easier goal to opt-outs was a good win. 14- and 50-day goals appealed to different users, with engagement effects strongest around day 14. — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team)
- Backfires: requiring only one exercise per lesson did not raise DAU and mainly captured the least-engaged users; tying streaks to XP confused users and was simplified to "one lesson per day". Streaks were initially paused over fears they distracted from lessons. — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team); [Lenny's Newsletter](https://lennysnewsletter.com/p/behind-the-product-duolingo-streaks)
- "Perfect Streak" (gold streak for not using freezes, no tangible reward) was added to counteract freeze flexibility. — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team)
- Notifications: two core daily streak notifications, a practice reminder 23.5 h after the last practice and a 10 pm "streak saver" if the streak hasn't been extended; the late-night one is described as highly impactful and well received. — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team)
- Shuttleworth's framing: streaks amplify a good product but cannot replace one; the first week is the most fragile period. — [Lenny's Newsletter](https://lennysnewsletter.com/p/behind-the-product-duolingo-streaks)

**Other consumer behaviour-change apps (Kristen Berman, Irrational Labs; undated Substack teaser)**
- Duolingo letting users start a lesson *before* signing up raised DAU by 20% (unsourced claim on the page). Peloton uses *weekly* streaks because consistency is easier to maintain than daily; Headspace's "Today" tab splits a large goal into small daily actions; Strava, Peloton and MyFitnessPal count any improvement rather than only big wins; Strava notifies when friends complete activities (social pressure). — [Kristen Berman, Product lessons from 6 top consumer apps](https://kristenberman.substack.com/p/product-lessons-from-6-top-consumer)

**Retention norms**
- Health & fitness apps: ~20% D1, ~2.8-4% D30. Fintech/banking: ~30% D1, ~11.6% D30. Overall apps: ~6% D30 (Adjust). Sources for the category figures are not named in the article; article dated 10 Nov 2025 and provides no D7 numbers. — [Plotline, Retention rates for mobile apps by industry](https://www.plotline.so/blog/retention-rates-mobile-apps-by-industry)

**Accountability as a retention/adherence lever**
- In a 6-month self-monitoring pilot (n=54), adding phone-based interventionist calls increased consistent dietary-logging weeks from 7.6 to 14.0 (P=.006), attributed to "supportive accountability". — [Carpenter, Eastman & Ross 2022, JMIR Formative Research](https://formative.jmir.org/2022/2/e33603)

### Inferences
- For a poker player who plays maybe 3-5 sessions a week, a *daily* streak is the wrong unit; a Peloton-style weekly streak ("logged every session this week" or "respected stop-loss every session this week") maps better to real behaviour and avoids forced check-ins on non-play days.
- Duolingo's finding that the first 7 days matter most, and that new users should get two "freezes" up front, translates into: give new users two free "missed-log forgiveness" tokens and make the first-week goal trivially small (log 3 sessions), chosen by the user from 2-3 options, with an explicit opt-out.
- The "Commit to my goal" copy and user-chosen goal results are consistent with the precommitment literature (Question 3-4): self-authored commitments outperform imposed ones.
- Benchmarks suggest a target of ≥30% D1 and ≥12% D30 (finance-app level) is ambitious but reasonable for a money-discipline tool with a clear use case per session.

### Gaps
- No public, dated D1/D7/D30 numbers from Whoop, YNAB, Noom, Headspace, MyFitnessPal or Strava were found in this pass; the Plotline numbers are unattributed aggregates. Mixpanel/Amplitude/Adjust 2024-2026 category reports were not fetched directly.
- Duolingo did not publish the numeric lift of streak freeze or "Commit to my goal"; only direction ("significant") is available.
- No evidence found on "weekly review" features specifically (e.g., Strava/Whoop weekly summaries) beyond anecdote; the search returned vendor case studies only.

---

## Key Question 2: Data-entry friction, logging effort and churn; patterns that reduce it

### Takeaway
Manual logging decays fast (dietary logging adherence fell from ~70% in week 1 to ~22% by 6 months; median time to disengagement 10 weeks), while passively captured data stays consistent far longer; but two cited studies found *fully* passive capture produced weaker habit formation and weaker outcomes than light manual entry, so the design target is minimal-tap entry with later review, not zero-touch.

### Cited Findings
- Carpenter, Eastman & Ross (2022, n=54, 6 months): adherence defined as 7/7 days per week. Mean consistent weeks out of 25: physical activity (passive pedometer) 17.4; weight 11.1; dietary intake (manual) 10.8. Share consistent week 1 → end: dietary ~70% → 22%; weight ~57% → <24%; physical activity 85% → over half. Median time to disengagement: physical activity 19.5 weeks, dietary intake 10 weeks, weight 4 weeks. Re-engagement after disengaging: weight 65%, physical activity 60%, dietary intake 39%. — [JMIR Formative Research 2022;6(2):e33603](https://formative.jmir.org/2022/2/e33603)
- Same paper cites Harvey et al. (2019) that active dietary logging "can take up to 15-20 minutes each day", and each additional consistent week of dietary logging was associated with ~0.29 kg more weight loss (P=.004), i.e., logging consistency itself predicts outcome. — [JMIR Formative Research 2022](https://formative.jmir.org/2022/2/e33603)
- Counter-evidence that burden is purely bad: the paper cites Turner-McGrievy et al. (2021), where passive dietary methods (photo apps, wearable bite counters) were linked to *lower* habit formation than manual app entry, and Silberman et al. (2020), where people who manually entered weights lost more over 12 months than those with auto-syncing smart scales. Authors suggest "some burden may be needed for behavior change". — [JMIR Formative Research 2022](https://formative.jmir.org/2022/2/e33603)
- In the Danish operator RCT, a *fortnightly activity statement* (passive summary of spend and net result pushed to bettors) produced no significant change in turnover (+4.6%, p=0.43 full sample; −11.4%, p=0.32 for high-activity players). — [Danish Competition and Consumer Authority, Dec 2023](https://kfst.dk/media/rykbo5rn/20231219-do-behaviorally-informed-pop-up-messages-curb-problematic-gambling-behavior.pdf)

### Inferences
- A poker session log should be capturable in ≤3 taps (start/stop session, buy-in, cash-out) with smart defaults from the last session (stake, site, planned stop-loss), and optional detail (hands, tilt notes) deferred to a batch "review" step the next day. The evidence that *some* active involvement improves outcomes argues for keeping a deliberate "I confirm this result" tap rather than importing everything silently.
- Expect manual-only logging to roughly halve in adherence by week 10; the weight-tracking result (re-engagement 65% after lapse) suggests aggressively designing for *return after lapse* (easy backfill, no shame screen) rather than assuming continuous use.
- Passive summaries pushed to the user (statements, dashboards) should not be expected to change behaviour on their own; they need to be tied to a decision moment (pre-session plan, in-session alert).

### Gaps
- No MyFitnessPal-specific postmortem data on logging friction vs. churn was found in this pass; the dietary-logging numbers above are from a small pilot (n=54), not a large app dataset.
- No mood-tracker-specific adherence/churn study was fetched.
- Evidence that passive capture *hurts* outcomes rests on two cited studies not read directly (Turner-McGrievy 2021; Silberman 2020).

---

## Key Question 3: Precommitment and limit-setting in gambling: uptake, effectiveness, sticky designs

### Takeaway
Across operator datasets (Kindred, win2day, Norsk Tipping, Bet365, German slots), voluntary limits are taken up by a small minority (~3-5% in Bet365 RCTs), but those who set them, especially the most intense players, spend significantly less a year later; for poker players specifically, a voluntary *time* limit reduced both duration and money spent. Mandatory/default limits with a delay on increases get broad acceptance (~80% positive at Norsk Tipping; 62% positive in Germany) but push some heavy players to other venues, and self-exclusion alone fails for a large share (68% of a Swedish clinical sample gambled during exclusion).

### Cited Findings
**Uptake**
- Bet365 x Behavioural Insights Team (2021a): of 45,000 invited customers, ~4% (~1,800) set a deposit limit. — [Auer & Griffiths commentary on Delfabbro & King, NTU IRep PDF](https://irep.ntu.ac.uk/id/eprint/45868/1/1524718_Griffiths.pdf)
- Bet365 x BIT (2021b), n=23,592 randomized: limit-setting rates were 4.4% (control), 3.6% (self-persuasion prompt), 2.9% (personal commitment prompt + SMS reminders at 3, 10, 21 days). Commitment-style on-screen prompts did not increase uptake and may have reduced it (the source text is internally inconsistent on significance). — [Auer & Griffiths commentary, NTU IRep](https://irep.ntu.ac.uk/id/eprint/45868/1/1524718_Griffiths.pdf)
- UK betting shops after the 2014 ABB code: voluntary money limits peaked in week 1 (n=10,721) and fell to 1,557 by week 15; time limits fell from 5,652 to 832; share of sessions with a spend limit dropped from 0.27% to 0.04%. — [Auer & Griffiths commentary, NTU IRep](https://irep.ntu.ac.uk/id/eprint/45868/1/1524718_Griffiths.pdf)
- Delfabbro & King (2021) review: "low uptake rates" are the main reason for skepticism about voluntary systems; the review "confirms the potential benefits of mandatory systems" while noting risks of mandatory global limits. — [International Gambling Studies 21(2):255-271 abstract](https://econpapers.repec.org/RePEc:taf:intgms:v:21:y:2021:i:2:p:255-271)

**Effectiveness when limits are set**
- Kindred, 49,560 players, 1-year follow-up (Griffiths, Auer & Hopfgartner 2020): among the most intense gamblers, those who set voluntary money limits spent significantly less a year later than those who did not; the top 10% by intensity significantly reduced spending. No age/gender differences. — [NTU IRep eprint 38900](https://irep.ntu.ac.uk/id/eprint/38900)
- win2day, 100,000-player sample, 5,000 tracked for limit setting, 3 months (Auer & Griffiths 2012/2013): casino and lottery players' spending fell most after voluntary *spending* limits; **poker players' monetary spending "significantly decreased after setting a voluntary time limit"**, and poker players showed the largest decrease in playing duration after a time limit. All win2day players must set time and cash-in limits at account opening (cap €800/week). — [Journal of Gambling Studies 29(4):647-660](https://link.springer.com/content/pdf/10.1007/s10899-012-9332-y.pdf)
- Norsk Tipping, 54,002 players (Auer, Hopfgartner & Griffiths 2018): 7,884 (14.5%) received a message that they had passed 80% of their personal monthly loss limit (Jan-Mar 2017); matched-pairs comparison showed "significant reductions in the amount of money gambled" among those who received it. Effect size not on the abstract page. — [NTU IRep eprint 35133](https://irep.ntu.ac.uk/id/eprint/35133)

**Mandatory / default limits: acceptance and leakage**
- Norsk Tipping survey, n=2,352 (Auer, Reiestad & Griffiths 2020): ~75% knew the global loss limit existed, ~66% knew how to set limits, ~80% had a positive attitude, and "very few" gambled with other operators after reaching limits. — [NTU IRep eprint 33134](https://irep.ntu.ac.uk/id/eprint/33134/)
- Germany, €1,000/month mandatory cap, n=1,000 slots players surveyed Feb 2022 + tracking data (Auer & Griffiths 2022/2023): 62.4% positive about the cap, 21% negative; 36% said a max deposit limit was personally relevant. 60.5% *said* they had hit the cap but only 7.6% actually had (tracking). Of self-reported cap-hitters, 42% kept gambling (20% regulated, 19% unlicensed online, 6% land-based). Players who disliked the cap deposited significantly more (p=0.004). Limit increases take effect only on the first day of the following month. — [Journal of Gambling Studies, Springer](https://link.springer.com/article/10.1007/s10899-022-10155-1); [NTU IRep PDF](https://irep.ntu.ac.uk/id/eprint/46917/1/1593067_Griffiths.pdf)
- 2007 International Gaming Research Unit survey of 10,865 online casino and poker players across 96 countries: ~70% rated voluntary money limits at least "quite useful", 51% said the same of time limits; most opposed *mandatory* spending limits as patronizing. — [Auer & Griffiths commentary, NTU IRep](https://irep.ntu.ac.uk/id/eprint/45868/1/1524718_Griffiths.pdf)

**Anchoring / menu design**
- Bet365 x BIT anchoring RCT (~1,800 limit-setters): daily deposit limits chosen were ~45% lower with a low-anchor dropdown and ~46% lower with free-text (no anchor) vs control. 30-day deposits: £446 control, £426 low anchor (−4.4%), £361 no anchor (−18%); none statistically significant. — [Auer & Griffiths commentary, NTU IRep](https://irep.ntu.ac.uk/id/eprint/45868/1/1524718_Griffiths.pdf)

**Self-exclusion (Spelpaus, Sweden)**
- Håkansson & Åkesson (2022), chart review of 74 treatment-seekers in Skåne, 2021: 81% had self-excluded via Spelpaus; 68% of self-excluders reported gambling during exclusion (68% of those on unlicensed sites, 22% via someone else's identity or unlicensed land-based). Authors conclude self-exclusion alone is insufficient and must be paired with treatment. — [JMIR Mental Health 2022;9(8):e37837](https://mental.jmir.org/2022/8/e37837)

### Inferences
- Because voluntary opt-in to limits runs ~3-5%, a discipline app should make the stop-loss/time-limit a *mandatory step of starting a session* (win2day-style "set it at account opening"), with the user choosing the number (self-authored, not pre-selected), rather than offering it as an optional settings page. The Bet365 result that "commitment" prompts did not raise uptake suggests persuasion copy is not the lever; defaults and placement are.
- For poker, prioritise a **session time limit** alongside the stop-loss: it is the limit type with demonstrated effect on poker spend and duration in operator data.
- Anchoring matters: do not present a dropdown of large round numbers for stop-loss; use free text or anchor low (e.g., default to 2-3 buy-ins based on the user's own bankroll data).
- Sticky-limit design features supported by the evidence: (1) set before play, not during; (2) increases take effect with a delay (Germany: next month; Beeminder: 7 days, see Q4), decreases immediate; (3) an alert at ~80% of the limit, which Norsk Tipping data shows reduces spend; (4) accept that a "hard" limit in a non-operator app can only be enforced by friction, not by blocking the cashier, so pair it with the one-sec-style dismiss/wait mechanic (Q4).
- Leakage is the central risk: 68% of excluded Swedes and 42% of German cap-hitters kept gambling elsewhere. An app that only tracks one club/site will be routed around; design for logging *all* play (manual "I played elsewhere" entry) and treat off-plan deposits as a tracked event, not a failure state that gets hidden.

### Gaps
- Effect sizes (% spend reduction) for Kindred and Norsk Tipping limit studies are not in the accessible abstracts; the PMC full text of the Auer & Griffiths "deposit limits" paper was blocked by a CAPTCHA.
- No Entain/Kindred published RG data beyond the 2020 Kindred paper, and no GambleAware/GamCare or UK Gambling Commission 2024-2026 evaluations were fetched; the GC's 2025-26 financial-risk/deposit-limit mandatory-prompt rules (UK LCCP) were not researched here.
- No data on *cooling-off period* uptake/effectiveness or on how often players raise limits after a delay.
- Spelpaus data on chosen exclusion lengths and relapse after exclusion ends were not reported in the fetched study.

---

## Key Question 4: Commitment devices and friction (StickK, Beeminder, Freedom/one sec), implementation intentions, reflection prompts

### Takeaway
The strongest field evidence is for *friction at the moment of action*: the one sec app (PNAS 2023, n=280, 6 weeks) cut target-app opens 57%, with 36% of open attempts abandoned, and a follow-up (n=500) showed the one-tap "dismiss" exit and the delay did the work while the reflective message alone did not. Implementation intentions ("if X then Y" plans) have a medium effect overall (d≈0.65 in Gollwitzer & Sheeran 2006) but are weaker for highly impulsive people and in document-only delivery, so they should be set at a calm moment (pre-session) and reinforced, not relied on mid-tilt.

### Cited Findings
**Friction / self-nudge**
- one sec (Grüning, Riedel & Lorenz-Spreen, PNAS 2023, 120(8):e2213114120): 280 participants, 6-week field experiment. Intervention on opening a self-selected target app = deliberation message + short wait + option to dismiss the opening attempt. Results: users closed the target app in 36% of attempts; attempts fell 37% over 6 weeks vs week 1; actual opens fell 57% after six weeks; participants reported less time in apps and greater satisfaction with their consumption. Follow-up online experiment (N=500): the dismiss option had the strongest effect, the time delay also reduced consumption, the deliberation message was not effective. — [PNAS abstract via BVS](https://pesquisa.bvsalud.org/ses/resource/pt/mdl-36795756); publications list on [one-sec.app](https://one-sec.app/max-planck-study)
- Pop-up "healthy habits" and reflective messages in a real operator RCT (Denmark, n=14,153) produced no significant reduction in spending; see Q5. — [DCCA Dec 2023](https://kfst.dk/media/rykbo5rn/20231219-do-behaviorally-informed-pop-up-messages-curb-problematic-gambling-behavior.pdf)

**Implementation intentions**
- Gollwitzer & Sheeran (2006) meta-analysis: d = 0.65 (95% CI 0.6-0.7) across achievement, relationship and health goals. Presseau et al. (2017): d = 0.14-0.37 for objectively measured health behaviour vs 0.19-0.77 self-report. Adriaanse et al. (2011): d = 0.51 for adding healthy foods but 0.29 for *reducing* unhealthy eating. Bélanger-Gravel et al. (2013): g = 0.31 post, 0.24 follow-up for physical activity. — all as cited in [Wang, Wang & Gai 2021, Frontiers in Psychology (MCII meta-analysis)](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2021.565202/pdf)
- MCII (mental contrasting + implementation intentions) meta-analysis: 24 studies, N=15,907, g = 0.336 (CI 0.229-0.443), shrinking to 0.242 after publication-bias correction. Experimenter-delivered interventions g = 0.465 vs document-based g = 0.277 (only significant moderator). — [Wang, Wang & Gai 2021](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2021.565202/pdf)
- Boundary conditions cited in the same review: Churchill & Jessop (2010) found implementation intentions did *not* promote goals for highly impulsive individuals; rigid plans may hinder attainment (Parks-Stamm et al. 2007), so flexible plans are recommended; Da Silva et al. (2018) found no effect on physical activity without reinforcement but small-to-medium with reinforcement; Wittleder et al. (2019) found MCII reduced drinking days for hazardous drinkers but not non-hazardous. — [Wang, Wang & Gai 2021](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2021.565202/pdf)

**Commitment-contract products**
- Beeminder mechanics (official blog, 10 Sept 2016): a "derail" = passing the deadline with the day's datapoint in the red; consequences are road reset, charge and pledge escalation ($5 → $10 → $30 → $90 → $270 → $810, optional cap), plus a legitimacy-check email. The "Akrasia Horizon" means goal changes/quitting take effect only after a delay (a week), so you cannot loosen a goal in the moment; the post gives no outcome data. — [Beeminder blog, "What happens when I derail?"](https://blog.beeminder.com/derail)
- Beeminder advises setting a pledge cap "scary enough to motivate avoiding it, but not so scary that you would quit instead". — [Beeminder blog](https://blog.beeminder.com/derail)

### Inferences
- The most defensible in-app "no chasing / no impulsive deposit" mechanic is a one-sec-style interrupt: when the user logs a rebuy past stop-loss or opens a deposit, show a short enforced wait (10-20 s) plus a large one-tap "Stop, end session" exit; the reflective text is secondary. This is also the only enforcement available to a non-operator app.
- "Write the reason before you break the rule" is best framed as a *delay + exit* device, not as persuasion; the one sec follow-up found the message itself ineffective, and the Bet365 "self-persuasion" prompt did not raise limit uptake. Keep the reason field optional and short, and log it for the next-day review (where reflection has evidence of value through accountability and plan revision).
- Implementation intentions belong in pre-session planning ("If I lose 3 buy-ins, then I close the client and go for a walk"), set when calm, and in a flexible form (the effect is weaker for rigid plans and for highly impulsive people, which describes a tilting player).
- Beeminder's akrasia horizon and Germany's next-month rule converge on a product rule: raising a stop-loss or deposit limit takes effect after a delay (24 h to 7 days); lowering is immediate.
- Monetary stakes (StickK/Beeminder) are plausible but unverified here; for a gambling-adjacent audience, adding money penalties for losing money carries obvious risk and should be treated as an experiment, not a default.

### Gaps
- No peer-reviewed effectiveness data for StickK (the PMC article found was blocked) or Beeminder was retrieved; claims about referee effects and anti-charity stakes remain unverified.
- No direct study of "write a reason before breaking the rule" was found; the inference above combines one sec and Bet365 findings.
- Freedom/Forest-type blocker apps were not researched.

---

## Key Question 5: Mood/tilt check-ins and in-session interventions (pop-ups, mandatory breaks, reality checks)

### Takeaway
The best field evidence (Danish operator RCTs, n=14,153, 2020-2022) found hourly reality checks, "healthy habits" messages and high-activity warnings did *not* significantly reduce spend, and one warning *increased* casino turnover by 8.9%; the only in-play message with positive operator evidence is a personalised "you have passed 80% of your own limit" alert (Norsk Tipping). Poker tilt research shows tilt is triggered by bad beats and losing streaks, that sensitivity to losses is the strongest predictor of tilt severity, and that experienced players reframe losses as variance, which supports a pre-session self-rating plus a loss-triggered interrupt rather than periodic pop-ups.

### Cited Findings
**In-session messages in real operators**
- Danish Competition and Consumer Authority with the Danish Gambling Authority and Spillebranchen (published Dec 2023): two randomized field experiments, casino (2020, n=11,064) and sports betting (2022, n=3,089), each with control + three pop-up arms; difference-in-differences on turnover. Change in turnover vs control, casino full sample: hourly reality check (time played + net win/loss) +4.5% (p=0.26); healthy-habits messages +0.3% (p=0.94); high-activity warning prompting a self-test **+8.9% (p=0.02)**. Casino high-activity players: reality check −9.7% (p=0.23), healthy habits −0.8%, warning −3.0% (n.s.). Betting full sample: reality check +2.1%, healthy habits +5.5%, fortnightly activity statement +4.6% (all n.s.); betting high-activity: statement −11.4% (p=0.32). No significant effects on time spent or number of bets. Authors suggest players may not notice pop-ups on busy sites and that lab results do not transfer; they recommend field-testing before rollout. — [DCCA, "Do behaviorally informed pop-up messages curb problematic gambling behavior?"](https://kfst.dk/media/rykbo5rn/20231219-do-behaviorally-informed-pop-up-messages-curb-problematic-gambling-behavior.pdf)
- Norsk Tipping: personalised feedback on passing 80% of one's *own* monthly loss limit was followed by significant reductions in money gambled (matched pairs, 7,884 recipients of 54,002). — [NTU IRep eprint 35133](https://irep.ntu.ac.uk/id/eprint/35133)

**Poker tilt**
- Palomäki (2013, Univ. of Helsinki dissertation; studies in International Gambling Studies, Journal of Gambling Studies; N=60/354/417/29, Finnish, mostly young men): tilt is typically set off by significant losses, especially bad beats, and losing streaks; losses produced dissociation (numbness, disbelief) and moral indignation ("unfair"), which was linked to chasing to "restore a fair balance", sometimes by extending sessions. Sensitivity to losses was the strongest predictor of tilt severity (B=0.598, p<.001). Inexperienced players blamed luck and reacted with anger; experienced players attributed losses to their own mistakes and treated bad luck as "merely variance"; more experience was linked to less self-rumination and better decisions, yet experience was also *positively* associated with tilt severity (B=0.22, p<.001), contrary to hypothesis. Aftermath: sleep problems, rumination, sadness, self-directed disappointment. Regulation strategies (quitting, breaks, stop-loss) were not systematically studied. — [Palomäki 2013 dissertation PDF](https://core.ac.uk/download/17340392.pdf)

### Inferences
- Generic periodic pop-ups ("you've played 60 minutes") have no field support and one significant backfire; a poker app should not build its core around them. The interventions with support are *personal-threshold* alerts (80% of your own stop-loss) and *action-moment* friction (Q4).
- Because tilt is triggered by discrete loss events (bad beats, losing streaks) rather than elapsed time, in-session triggers should key off logged losses/rebuys, not timers. A pre-session self-check ("why am I playing right now?", mood 1-5) is cheap and consistent with the implementation-intention evidence, but there is no direct evidence that the rating itself changes play; its value is as (a) the moment to set the limit and if-then plan and (b) a data point for the weekly review correlating mood with results.
- Palomäki's finding that experienced players reframe losses as variance suggests a post-session review that explicitly separates "EV/decision quality" from "result" (variance reframing) could be the skill-building loop that also reduces tilt sensitivity. Expect this to be an educational mechanic with long horizon, not a retention hook.

### Gaps
- No study of *mandatory breaks* in online poker or of pre-session mood ratings changing gambling decisions was found in this pass.
- No RCT of "why are you playing right now?" style reflective prompts; the closest evidence (Danish RCT "healthy habits" messages; one sec deliberation message) found reflective text alone ineffective.
- Effect size for the Norsk Tipping 80% alert is not in the accessible abstract.

---

## Key Question 6: Design anti-patterns (unread dashboards, guilt mechanics, metric overload, notification fatigue)

### Takeaway
The evidence base on anti-patterns is thinner and partly dated, but three points are supported: informational dashboards/statements pushed to users did not change gambling behaviour in a large RCT; Duolingo found over-flexible or over-complex mechanics (XP-linked streaks, three freezes, one-exercise lessons) either confused users or captured only the least engaged; and iOS push opt-in in financial services was 55% (2014 Kahuna data), so roughly half of users never receive push, meaning retention cannot depend on it.

### Cited Findings
- Fortnightly activity statements (a pushed summary of spend and net result) to sports bettors: +4.6% turnover, p=0.43, no significant effect. Hourly reality checks: no significant effect in either vertical. — [DCCA Dec 2023](https://kfst.dk/media/rykbo5rn/20231219-do-behaviorally-informed-pop-up-messages-curb-problematic-gambling-behavior.pdf)
- Duolingo: tying streaks to XP confused users; simplifying to one lesson/day made streaks more effective. Three freezes were no better than two and too much flexibility led to streak loss. Lowering the bar to one exercise did not raise DAU and mainly captured the least engaged. Showing XP in the UI won in testing but was not shipped because it conflicted with the simplicity philosophy. — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team); [Lenny's Newsletter](https://lennysnewsletter.com/p/behind-the-product-duolingo-streaks)
- Push opt-in rates on iOS (Kahuna data, guest post on andrewchen.com, 6 Aug 2014): ride sharing 79%, food & beverage 60%, **financial services 55%**, news & media 44%, social 39%; in some categories "over 60%" of users turn push off. A pre-permission "Notify me" screen (Cluster) achieved 100% opt-in among those who tapped it. Irrelevant or self-promotional messages are described as driving opt-outs and uninstalls (qualitative). — [Andrew Chen / Kahuna](https://andrewchen.com/why-people-are-turning-off-push/amp)
- Bet365: adding on-screen commitment/self-persuasion prompts around limit setting did not increase limit uptake (4.4% → 3.6% / 2.9%). — [Auer & Griffiths commentary, NTU IRep](https://irep.ntu.ac.uk/id/eprint/45868/1/1524718_Griffiths.pdf)
- The German cap study shows a *measurement* anti-pattern: 60.5% of players believed they had hit the limit while only 7.6% had, which the authors attribute to confusion between a personal limit and the legal cap. — [Springer, Auer & Griffiths](https://link.springer.com/article/10.1007/s10899-022-10155-1)

### Inferences
- Build the dashboard around one decision per screen (tonight's plan; this week's adherence), not around a bankroll chart with many metrics; the RCT evidence says passive statements do not move behaviour, and Duolingo's experience says each added concept dilutes the core mechanic.
- Guilt mechanics: the only direct evidence is indirect, from Duolingo (forgiveness features won; harder imposed goals did not) and from the gambling literature (players call mandatory limits patronising; self-excluders route around). Treat "you broke your stop-loss" screens as neutral logging with a next-step, never a scold.
- Ask for push permission only after the user has set a first session plan (pre-permission screen), and default to two notification types (Duolingo pattern): a pre-session reminder tied to the user's usual play time and a "you planned to stop at X" alert. Everything else should be opt-in.
- Make one limit concept visible at a time (stop-loss *or* time cap per session), since players conflate multiple limits.

### Gaps
- No 2024-2026 notification opt-out/uninstall benchmarks were retrieved; the Kahuna data is from 2014 and iOS-only.
- No published postmortem on "guilt mechanics causing churn" (e.g., Duolingo's owl notifications, Noom's weigh-in pressure) was found in this pass; the inference rests on indirect evidence.
- No study on "dashboards nobody reads" in self-improvement apps specifically; the closest is the Danish activity-statement arm.

---

## Key Question 7: Onboarding: getting the first week right

### Takeaway
Public evidence converges on: deliver value before sign-up (Duolingo: lesson before account, +20% DAU per an unsourced claim), one small user-chosen goal with an explicit opt-out, forgiveness built in from day one (two free freezes for new users), and treating day 7 as the habit threshold, after which retention rises.

### Cited Findings
- Duolingo lets users start a lesson before creating an account; the page claims this raised DAU by 20% (no source given). Headspace splits a big goal into small daily actions on its "Today" tab; Peloton uses weekly streaks. — [Kristen Berman](https://kristenberman.substack.com/p/product-lessons-from-6-top-consumer)
- Duolingo: giving new users two streak freezes at the start was among the biggest retention wins; the 1-day to 2-day streak transition produces a large retention jump; ~7 days to "lock in". A user-chosen streak goal with an opt-out button beat a pre-selected harder goal; an easier fallback goal for opt-outs was a good win. "Commit to my goal" copy outperformed "Continue". — [Recall summary](https://www.recall.it/summary/lennys-podcast/behind-the-product-duolingo-streaks-or-jackson-shuttleworth-group-pm-retention-team); [Lenny's Newsletter](https://lennysnewsletter.com/p/behind-the-product-duolingo-streaks)
- win2day requires every player to set time and money limits at account opening (cap €800/week), the context in which voluntary tightening later showed effects. — [Auer & Griffiths 2013](https://link.springer.com/content/pdf/10.1007/s10899-012-9332-y.pdf)
- Implementation intentions delivered interactively (experimenter-led) outperform document/form-based delivery (g 0.465 vs 0.277). — [Wang, Wang & Gai 2021](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2021.565202/pdf)

### Inferences
- First session flow for the poker app: before any account, let the user plan tonight's session (stake, buy-ins, stop-loss, time cap) and see it reflected back; create the account only when saving. This mirrors "lesson before sign-up" and makes the mandatory limit-setting step (win2day) feel like the product's value rather than a gate.
- First-week goal: user picks from "log 2 / 3 / 5 sessions this week" with an explicit "no goal" option; grant two "missed-log" forgiveness tokens up front; celebrate the second logged session (the 1→2 transition) and the seventh day.
- Set the first if-then plan conversationally (a guided 3-question flow), not as a blank form, given the delivery-mode moderator.

### Gaps
- The 20% DAU figure is unverified beyond a Substack teaser.
- No published first-week retention curves for behaviour-change apps other than Duolingo's qualitative description were found.
- BJ Fogg "Tiny Habits" and Nir Eyal "Hooked" were not fetched directly in this pass; nothing here is attributed to them.
