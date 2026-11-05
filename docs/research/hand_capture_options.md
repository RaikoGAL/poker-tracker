# Hand capture options for club poker apps (ClubGG, PokerBros/X-Poker, PPPoker, Suprema) and the state of screenshot-to-hand-history

Research date: 2026-11-05. Scope: how a player's own hand data gets out of app-based poker clients into a review tool, and how well automatic reading of poker screenshots works today. Current team approach: user screenshots the in-app hand replay, a vision LLM parses it.

## Key Question 1: Do the apps offer native hand-history export, email, or "share hand" (text or image)?

### Takeaway
None of the five apps writes a PokerStars-style text hand history to disk, and no in-app export is tracker-readable. The only native "data" paths are PokerBros' 6-day emailed XLS-style hand export (columns + suit icons, not parseable by trackers), the X-Poker "Share Replay" web link (which Deepfold already parses into a hand history), and club-dependent email exports on ClubGG. Everything else goes through paid Windows-only "converters" that scrape the desktop client or an Android emulator during play.

### Cited Findings
- ClubGG: "Not a standard export. Some clubs let players email hand histories, but many don't," and where they exist they are not PokerStars-compatible; the app "deliberately limits hand-history export." ClubGG is mobile-first with a Windows desktop client that "doesn't save hand histories to a local folder." ClubGG hands do not use GGPoker's format and PokerCraft does not parse them. — [Deepfold, "ClubGG Hand Analysis", 22 Apr 2026](https://deepfold.co/en/blog/clubgg-hand-analysis)
- ClubGG: Deepfold states ClubGG's terms prohibit third-party HUDs and screen-scraping and that PT4/HM3/Hand2Note "either can't parse ClubGG output or risk account flags." (Secondary source; ClubGG's own ToS text was not located.) — [Deepfold](https://deepfold.co/en/blog/clubgg-hand-analysis)
- ClubGG: a paid "ClubGG Converter" (developed by KingsHands, sold via GipsyTeam) "works only on the desktop version of the Windows client"; Android emulators "currently unavailable"; outputs a format PT4/HM3/Hand2Note understand; $30/month, $75/3 mo, $129/6 mo, $210/12 mo; requires Hardware ID to buy; page says nothing about detection or bans. — [GipsyTeam shop](https://shop.gipsyteam.com/clubgg-converter)
- ClubGG: Hand2Note publishes ClubGG-specific updates ("The ClubGG update is now live, with support for the latest room update", for Hand2Note 3 and 4.1), implying their ClubGG support breaks when ClubGG updates the client. — [Hand2Note Telegram](https://t.me/s/Hand2Note?after=316)
- ClubGG: Hand2Note lists ClubGG among sites with its own HUD page; Android club apps are "supported through emulators on Windows" (LDPlayer; version must match the app). — [Hand2Note 4 supported sites](https://hand2note4-com-test-dzf5dpdueud7cqdm.westeurope-01.azurewebsites.net/Help/supported-sites)
- PokerBros (in-app): hand history opens from bottom-left of the table, lists hands with hole cards and win/loss; a "Hand Detail" tab gives more depth; hands can be emailed from Hand Detail via an orange icon; the emailed format "uses columns and suit icons" and is "not really comparable to the traditional textual hand history files." No PC/Mac client except for M1 Macs; desktop play means an Android emulator. — [Professional Rakeback PokerBros review](https://professionalrakeback.com/poker-bros-app-review)
- PokerBros (in-app): players can download hands from the last 6 days via Hand History > Records > Hand Detail, tap the XLS icon, enter an email and export; the converter vendor calls this "practically useless" because trackers don't recognize the file. — [KingsHands blog](https://kingshands.com/blog/gde-xranitsya-handhistory-prilozheniya-pokerbros/)
- PokerBros (rules): "The terms do not prohibit HUD and tracking software such as Holdem Manager and Poker Tracker... Solvers and real time assistance software are against the rules." PokerBros can detect emulator use and club owners can hide games from emulator users; an agent's whole downline can be banned for the agent's actions. — [Professional Rakeback](https://professionalrakeback.com/poker-bros-app-review)
- X-Poker: "No .txt export, no log files, no email request, and no hand history menu. Players can share a replay link from the ... menu on a finished hand ('Share Replay')." Deepfold's parser "reconstructs the hand history from the replay link" (URLs like play.xpoker.com/replay/...). Deepfold describes X-Poker as "formerly PokerBros." — [Deepfold, "Hand Converter Guide", pub 20 Jan 2026 / upd 2 May 2026](https://deepfold.co/en/blog/hand-converter-guide); the "formerly PokerBros" claim conflicts with vendor-comparison blogs that treat PokerBros and X-Poker as separate apps, e.g. [BR Softech](https://www.brsoftech.com/blog/pokerbros-vs-pppoker-vs-xpoker/) and [Creatiosoft](https://creatiosoft.com/blogs/pokerbros-vs-pppoker-vs-xpoker-a-comparative-analysis-to-determine-the-best-poker-app/) — treat as unverified.
- PPPoker: GTO Wizard's help article says PPPoker "requires paid converter that writes hands to disk"; the same for PokerBros, UPoker, WePoker, CoinPoker, Chico. — [GTO Wizard help: Where to get your hand histories](https://help.gtowizard.com/where-to-get-your-hand-histories/)
- PPPoker: Hand2Note says PPPoker "runs as an Android app through an emulator, and also has a desktop client." — [Hand2Note supported sites](https://hand2note4-com-test-dzf5dpdueud7cqdm.westeurope-01.azurewebsites.net/Help/supported-sites)
- PPPoker rules (secondary/promotional source): prohibits third-party software giving "advantages not inherent to the player's skill"; penalties from "temporary suspensions to permanent bans"; "sophisticated detection tools"; no explicit mention of HUDs, trackers, screen capture, or a post-session-review distinction. — [pokerhack.org via dev.to](https://dev.to/pokerhackorg/analyzing-penalty-policies-for-third-party-software-on-pppoker-an8)
- Cross-app converter: DriveHUD's "Asian Hand Converter" supports 13 apps: PokerBros, PPPoker, ClubGG (desktop and emulator), CoinPoker, Pokerrrr2, Suprema Poker, UPoker, X-Poker, PokerKing, Red Dragon, Bingo Poker, PokerTime, WPT Global. Windows only; apps run in LDPlayer 4/5/9, BlueStacks 4/5 or Nox; $29/mo, $69/3 mo, $129/6 mo, or included in DriveHUD 3 Ultimate+ $199.99/yr; free trial. Page says it "gets around the emulator restrictions on PokerBros and UPoker" without saying how, and does not describe the capture method. — [DriveHUD Asian Hand Converter](https://drivehud.com/asianhandconverter/)
- KingsHands says its Asian Converter "captures hands during play" and saves them to a folder on disk, and claims it "protects players from bans for using trackers and emulators" (seller's claim). — [KingsHands](https://kingshands.com/blog/gde-xranitsya-handhistory-prilozheniya-pokerbros/)
- Hand2Note: on desktop sites GGPoker "doesn't allow HUDs, but you can import its hand histories" — illustrating the post-session-only import pattern. — [Hand2Note supported sites](https://hand2note4-com-test-dzf5dpdueud7cqdm.westeurope-01.azurewebsites.net/Help/supported-sites)

### Inferences
- For a mobile-first user there is no zero-effort native data path on ClubGG or PPPoker. The two concrete native hooks worth building against are (a) the X-Poker "Share Replay" web link (a structured, shareable web page; Deepfold has shown it can be turned into a hand history) and (b) PokerBros' emailed XLS/record export (structured, but only last 6 days and needs a custom parser). Both are post-session and user-initiated, so they sit comfortably outside RTA rules.
- "Converters" are a desktop-only, Windows-only, $20-30/month category built for live HUD use; they imply running the app in an emulator, which PokerBros explicitly detects. They are the highest-ToS-risk path and poorly suited to a mobile-first review product.
- The fact that Hand2Note ships ClubGG-specific patches after each ClubGG client update indicates that any screen/memory scraping of the ClubGG client carries a recurring maintenance burden.
- Club/union-level agent data access: no source found describing an agent/union back office that exports per-player hand histories. Treat as not available.

### Gaps
- ClubGG's own Terms of Service text on third-party tools and screen capture was not located; the prohibition claim rests on Deepfold.
- No primary documentation found for ClubGG's hand replay UI, "share" buttons, or whether the replay can be shared as image/GIF/text; no YouTube walkthrough was reviewed.
- Suprema Poker's in-app hand history/share features: no primary source found (only its presence on the Asian Hand Converter list).
- PPPoker's in-app hand-history/share UI: no primary source found.
- Whether X-Poker is a rebrand of PokerBros or a separate app is unresolved (sources conflict).
- How the converters capture data (memory, network, screen) is undisclosed by vendors.

## Key Question 2: Screen recording / screenshot automation on the user's own phone, and what crosses into prohibited territory

### Takeaway
On iOS, nothing can trigger a Shortcut when a screenshot is taken; the realistic near-zero-effort flows are (1) Back Tap / Action Button runs a Shortcut that takes the screenshot and posts it to your API, or (2) the user screenshots normally and later shares via a Share Sheet (Action Extension) shortcut that accepts images. On Android, MediaProjection needs fresh user consent per session and shows a persistent status chip (Android 15+), and apps like Screenshot Tile support Tasker/MacroDroid automation; a continuous recorder is technically possible but looks like real-time tooling. The post-session "share replay screenshot" model is the safest with respect to the apps' RTA rules.

### Cited Findings
- iOS: Apple's Shortcuts guide — a shortcut must be set to the "Action Extension" type to appear in other apps' share sheets; "The input from the host app is passed into the first action of your shortcut"; it can be limited to specific content types (e.g. images). Share-sheet shortcuts are started manually. — [Apple Shortcuts User Guide](https://support.apple.com/en-kg/guide/shortcuts/apd163eb9f95/2.1/ios)
- iOS: a MacPowerUsers thread found no way to trigger a Shortcut from a screenshot event; the workaround is to reverse it — run an automation from Settings > Accessibility > Touch > Back Tap (double/triple tap) or the Action Button (iPhone 15+) that takes the screenshot and then processes it. — [MPU forum](https://talk.macpowerusers.com/t/shortcut-triggered-from-screenshot-or-saved-video/36172)
- Android MediaProjection: "Your app must request user consent before each media projection session"; the token is single-use; Android 14+ requires a foreground service of type mediaProjection; Android 14 adds single-app capture; Android 15 QPR1+ shows a prominent status-bar chip and auto-stops projection on screen lock. — [Android developers: Media projection](https://developer.android.com/media/grow/media-projection?hl=en)
- Android: Screenshot Tile (NoRoot, GPLv3) uses a mediaProjection foreground service and can also use the Accessibility Services API to capture; offers floating button, capture of a specific area, delay, save to any folder as PNG/JPG/WebP, post-capture share notification, and "supports automation through apps like Tasker and MacroDroid"; a "Google Cast" status icon can appear in the image. — [F-Droid: Screenshot Tile](https://f-droid.org/en/packages/com.github.cvzi.screenshottile)
- Android: an IFTTT applet exists to "run a Pushcut shortcut when a new Android screenshot is taken," i.e. new-screenshot events are observable on Android via third-party automation. — [IFTTT](https://ifttt.com/applets/SZsUd54u-run-a-pushcut-shortcut-when-a-new-android-screenshot-is-taken)
- Rules: PokerBros allows HUD/tracking software but bans "solvers and real time assistance software." — [Professional Rakeback](https://professionalrakeback.com/poker-bros-app-review)
- Rules: ClubGG reportedly prohibits third-party HUDs and screen-scraping. — [Deepfold](https://deepfold.co/en/blog/clubgg-hand-analysis)
- Rules: PPPoker restricts software providing "real-time assistance" and automation; post-session review is not addressed. — [dev.to / pokerhack.org](https://dev.to/pokerhackorg/analyzing-penalty-policies-for-third-party-software-on-pppoker-an8)
- Industry context: GGPoker (ClubGG's parent ecosystem) banned all third-party poker software after a security incident. — [Gambling.com](https://www.gambling.com/news/ggpoker-bans-all-third-party-poker-software-after-security-incident)

### Inferences
- Near-zero-effort capture that stays post-session: user finishes session, opens the in-app hand history/replay, and for each hand to review either (iOS) triggers a Back Tap/Action Button shortcut that screenshots and uploads, or (Android) taps a Screenshot Tile floating button configured (via Tasker/MacroDroid) to forward new screenshots to your app. Effort: roughly one tap per hand, no leaving the poker app.
- A "share to app" flow (iOS Share Sheet Action Extension / Android ACTION_SEND receiver) accepting multiple images at once is the most robust batch path and needs no special permissions.
- Continuous MediaProjection recording during play is technically feasible on Android, but (a) Android 15 shows a visible recording chip, (b) it captures opponents' play in real time and is indistinguishable from a scraping HUD from the app's perspective, and (c) ClubGG explicitly prohibits screen scraping per Deepfold. It should be avoided; capturing only the replay screen after the session is defensible under every app's "no real-time assistance" framing.
- Because MediaProjection consent is per-session and single-app capture is default, even a legitimate "record my replay scroll" feature will prompt the user each time.

### Gaps
- No app's ToS was found that defines "data mining" precisely for screenshots of your own hands; none of the sources distinguish post-session capture explicitly.
- Whether ClubGG/PokerBros set FLAG_SECURE (blocking screenshots) was not confirmed; the current workflow (users screenshot replays) implies they do not.
- No benchmark of how many hands a user can replay/screenshot per minute in each app.

## Key Question 3: Vision-LLM parsing of poker screenshots — accuracy, failure modes, techniques, cost

### Takeaway
No published benchmark exists for poker table/replay screenshots specifically. General evidence: frontier VLMs beat classical OCR on screen-type text (GPT-4o 76% char accuracy vs RapidOCR 57% on video-frame OCR), and 2026 reviews have Gemini 3.1 Pro and GPT-5.5 scoring 10/10 on structured extraction tasks; known VLM failure modes are hallucinated/"corrected" words, suit confusion on cards, and formatting drift. Cost per screenshot is cents or fractions of a cent at 2026 prices with Flash-Lite / Haiku-class models, and 50% less in batch.

### Cited Findings
- Benchmark (video-frame OCR, 1,477 frames incl. code editors, news, ads): GPT-4o CER 0.238 / accuracy 76.2%; Gemini-1.5 Pro CER 0.239 / 76.1%; Claude-3 Sonnet CER 0.323 / 67.7%; RapidOCR 57.0%; EasyOCR 49.3%. VLM failure modes: adding/substituting words (Claude turned "BASE" into "Baseline"), GPT-4o over-correcting truncated words, Gemini domain variability (~50% on finance/news), content-safety refusals on benign input. Classical OCR struggled with noise/occlusion, capitalization and spacing. — [arXiv 2502.06445](https://arxiv.org/pdf/2502.06445)
- 2026 comparison (7 May 2026 test; three extraction tasks incl. a warehouse screenshot to CSV): Gemini 3.1 Pro Preview 10/10, GPT-5.5 10/10, Gemini 3 Flash Preview 9, Claude Opus 4.7 8.5, Grok 4.20 8, Gemini 3.1 Flash Lite 7. Failure modes were formatting (code fences, field naming, unquoted CSV commas) rather than misreads; Claude Opus 4.7 failed a multi-turn image flow but passed with each image in a separate call. No percentage accuracy, no digit/small-text analysis. — [SimpleMetrics](https://simplemetrics.xyz/comparing-ai-vision-which-model-wins-in-image-recognition-and-text-extraction)
- Poker-specific anecdote: a June 2025 pipeline using OpenAI's vision model on poker-stream screenshots extracted cards, pot, positions and action but showed "suit confusion, such as identifying a King of Diamonds as a King of Hearts"; the author would not "completely trust the output yet"; validation was manual. — [Jamesin Seidel, Substack, 25 Jun 2025](https://jamesin.substack.com/p/i-built-an-ai-system-to-analyze-poker)
- Deepfold (shipping product) reads "position, stacks, bet sizes, board, and hole cards from an image" and quotes "five seconds, screenshot to answer," but publishes no accuracy figures and does not name models. — [Deepfold](https://deepfold.co/en/blog/clubgg-hand-analysis)
- Anthropic pricing (per 1M tokens, standard): Claude Haiku 5.5 $0.10 in / $0.50 out (prompts ≤100K); Claude Sonnet 5.5 $2 / $10; Claude Opus 5.5 $4 / $20; Batch API gives 50% off input and output; image size/token cost is covered on the Vision page and the token-counting endpoint. — [Claude pricing](https://platform.claude.com/docs/en/about-claude/pricing)
- Google pricing (per 1M tokens, standard): Gemini 3.5 Flash-Lite $0.30 in (text/image/video/audio) / $2.50 out; Gemini 3.8 Flash $0.75 / $3.75 through 31 Dec 2026 ($1.50 / $7.50 from 2027); Gemini 3.1 Pro Preview $2 / $12 (≤200K); Flash and Flash-Lite are free on the free tier but content is used to improve Google products; Batch/Flex tiers are cheaper. — [Gemini API pricing](https://ai.google.dev/gemini-api/docs/pricing)
- OpenAI pricing (per 1M tokens, standard): gpt-6-astra $10 / $50; gpt-6.1-sol $2 / $10; gpt-6.1-terra $1 / $5; gpt-6-luna $0.10 / $0.50; the page defers image-token math to an "Image input cost calculator." Image detail levels low/high/original/auto; up to 30,000 patches per image after resizing; "low does not always use fewer tokens than high." — [OpenAI pricing](https://developers.openai.com/api/docs/pricing); [OpenAI images & vision guide](https://developers.openai.com/api/docs/guides/images-vision)
- Roboflow hosts a live OCR arena comparing Gemini 3.1 Pro, Claude Opus 4.7, GPT-5.5 and Qwen3.5 on vision tasks (useful for spot-checking card/digit reads). — [Roboflow Vision Evals](https://playground.roboflow.com/arena/ocr)

### Inferences
- Order-of-magnitude cost: a phone screenshot is typically on the order of 1-2K image tokens on current models (vendor formulas were not retrievable in this pass, see Gaps). At Haiku 5.5 / gpt-6-luna input rates ($0.10/M) that is roughly $0.0001-0.0002 per image before output tokens; at Gemini 3.5 Flash-Lite ($0.30/M) roughly $0.0003-0.0006; at Sonnet 5.5 / gpt-6.1-sol ($2/M) roughly $0.002-0.004. Output JSON for one hand (~300-500 tokens) adds a comparable amount. Even at 30 screenshots per session, cheap-tier parsing is well under a cent per session; frontier-tier is a few cents. Batch APIs halve this but add latency.
- The documented VLM failure modes map directly onto poker risks: suit confusion (red/black and heart/diamond or club/spade glyph similarity), "helpful" normalization (T vs 10, rounding stacks), and formatting drift. The SimpleMetrics finding that failures were formatting rather than misreads argues for strict structured output (JSON schema / tool calling) plus post-validation rather than relying on the model to self-format.
- Validation that is cheap and catches most misreads: (1) pot-math reconciliation — sum of contributions per street must equal pot shown; final stacks = starting stacks ± net; (2) card-set validity — no duplicate cards across hole cards and board; exactly 3/1/1 board cards per street; (3) position/blind consistency with table size; (4) re-ask with a cropped/zoomed region when any check fails; (5) two-model or two-pass agreement on cards only. Sending each screenshot in its own call (not a long multi-image conversation) avoided the Claude Opus 4.7 multi-turn failure in the 2026 test.

### Gaps
- No published accuracy benchmark for poker table or hand-replay screenshots with any VLM; the only poker evidence is anecdotal.
- Exact image-to-token formulas for current Claude (vision page blocked from this environment), OpenAI (calculator page not fetched) and Gemini (page truncated) models were not retrieved; per-image cost above is an estimate.
- No source quantifies 10-vs-T, overlapping-bubble or stack-digit error rates.

## Key Question 4: Classical OCR + template matching for a fixed-layout app UI

### Takeaway
Template matching plus Tesseract is the proven approach of every open-source poker scraper (dickreuter/Poker, PokerVision, OpenHoldem lineage) and is near-deterministic on a fixed layout, but it requires a per-client, per-resolution "table map" and breaks on any UI change (dickreuter uses a 1% difference threshold). For a mobile product spanning five apps, each with multiple phone resolutions and periodic UI updates, the maintenance burden is the main cost; it fits best as a cheap first pass or as a card-glyph classifier that feeds/validates the LLM.

### Cited Findings
- dickreuter/Poker: card recognition by OpenCV template matching (normalized squared difference, threshold 0.01) or an optional CNN trained during table setup on augmented card templates (52 classes); numbers via Tesseract LSTM with digit/currency whitelist, regions resized to 300px, grayscale, binarized at two thresholds with fallback passes, returning -1.0 on failure; per-client layout ("table map") stored in MongoDB with corner reference image, button/card templates and per-seat search areas; screenshots cropped to ~950x600 after locating the corner template. "Template matching is strict (a 1% difference tolerance), so it may fail when a client's graphics change slightly." No accuracy figures published. — [DeepWiki: dickreuter/Poker screen operations](https://deepwiki.com/dickreuter/Poker/2.2-screen-operations-and-image-recognition)
- PokerVision (azbvision): three-stage pipeline — "Poker Eye" extracts cards, stacks, bets and UI elements; "Poker Reader" rebuilds hand histories; a game-state layer organizes seats/stacks/boards/pots by street; runs real-time or offline; "systems are built for each client's layouts and timings"; Windows, C#, optional "GPT-style" AI models; no accuracy benchmarks; license not stated. — [PokerVision](https://azbvision.github.io/PokerVision/)
- Classical OCR on screen text: RapidOCR 57% and EasyOCR 49% character accuracy vs 76% for GPT-4o on the same screen-frame benchmark; classical OCR "often produces gibberish, and it has trouble with capitalization and spacing." — [arXiv 2502.06445](https://arxiv.org/pdf/2502.06445)
- A related camera-based project (AlvaroAlonso-0/PokerHandsRecongition) uses a VGG16 CNN for physical cards, not app screenshots; no accuracy reported. — [GitHub](https://github.com/AlvaroAlonso-0/PokerHandsRecongition)
- Hand2Note's need to publish a "ClubGG update... with support for the latest room update" shows that client UI/protocol changes force vendor patches. — [Hand2Note Telegram](https://t.me/s/Hand2Note?after=316)

### Inferences
- Replay screens in club apps are fixed layouts with a small glyph vocabulary (52 cards, digits, a few action labels), which is the best case for template matching: card-glyph classification can approach deterministic accuracy per (app, resolution) pair once templates are collected. The weak points are stack/bet digits (OCR), which is exactly where VLMs are stronger.
- Hybrid architecture suggested by the evidence: detect app + layout version by a corner/logo template; classify cards by template/CNN; read numbers with a VLM or Tesseract-with-whitelist; reconcile with pot math; fall back to full VLM parse when the template stage fails (new UI version). This keeps per-image cost near zero for the common case and bounds LLM spend to exceptions.
- Maintenance burden scales with (apps x resolutions x UI versions). Collecting templates automatically from VLM-labelled screenshots (self-training) is a plausible way to keep it tractable, as dickreuter already trains its CNN from templates at setup time.

### Gaps
- No open-source project found that targets ClubGG/PokerBros/PPPoker mobile replay screens specifically; all found scrapers target desktop clients.
- No quantitative data on how often club apps change their table/replay UI.
- No published accuracy for Tesseract/PaddleOCR on poker stack digits.

## Key Question 5: Hand-history text formats to standardise on

### Takeaway
Three candidates exist: PokerStars text (de facto import format for PT4/HM3/Hand2Note/GTO Wizard), Open Hand History (OHH; JSON, one object per hand, .ohh files, small ecosystem), and PHH (TOML-based, academic, concise, strong parser in PokerKit). Store internally in a structured JSON (OHH or your own) and emit PokerStars text for interoperability; no converter from club apps to any of these formats exists in the open.

### Cited Findings
- OHH storage format: plain-text files with `.OHH` extension, ASCII filenames; each hand is a self-contained JSON object, multiple hands separated by a blank line (file as a whole is not valid JSON, enabling append); recommended one file per table session; all fields required unless stated otherwise. — [Open Hand History storage format](https://handhistory-org.gitbook.io/storage-format)
- OHH ecosystem on GitHub (topic `open-hand-history`): DrkYoda's PokerNow to OHH converter (Python, 8 stars, last updated Sep 2023) and homanp/ohh (TypeScript library for creating/managing OHH hand histories, 7 stars, last updated Nov 2024). — [GitHub topic](https://github.com/topics/open-hand-history)
- PHH format (Juho Kim, U of Toronto): TOML-based, inspired by PGN/SGF; averaged ~545 bytes/hand vs ~885 for PokerStars on 10,000 Pluribus hands; supports 11 variants; parser in PokerKit parses ~6,800 hands/s; critiques PokerStars format as verbose, site-tied, poorly documented, lacking final stacks/time control; proposes CV/ML to digitize televised hands as future work. — [arXiv 2312.11753](https://arxiv.org/pdf/2312.11753v3); [PHH docs](https://phh.readthedocs.io/)
- PokerStars text is what review tools consume: GTO Wizard accepts .txt exports from PT4, HM3, Hand2Note, DriveHUD and GGPoker PokerCraft downloads; Unibet hands can be pasted as text. — [GTO Wizard help](https://help.gtowizard.com/where-to-get-your-hand-histories/)
- Deepfold's parser is "lenient about header changes that break legacy tools" and requires "one hand per block with action lines"; it notes "some skins encrypt on-disk files." — [Deepfold hand converter guide](https://deepfold.co/en/blog/hand-converter-guide)
- Converters for club apps output "a format that PokerTracker 4, Holdem Manager 3, and Hand2Note understand" (format unspecified, likely PokerStars-like). — [GipsyTeam ClubGG converter](https://shop.gipsyteam.com/clubgg-converter)
- Live-hand entry tools (e.g. live-squeezer) emit PokerStars-format hand histories and also forum text/image exports, showing PokerStars text as the lingua franca for manually captured hands. — [vikcch/live-squeezer](https://github.com/vikcch/live-squeezer)
- A GTO Wizard feature request (7 months old at fetch) asks for CSV/JSON export of analyzed hands so users can run them through LLMs — demand for machine-readable formats on the review side. — [GTO Wizard Nolt #712](https://gto-wizard.nolt.io/712)

### Inferences
- Because screenshot-derived hands are partial (no timestamps, sometimes unknown villain cards, approximate stacks), a JSON schema with explicit nullability (OHH-style or custom) is a better canonical store than PokerStars text; generate PokerStars text on export for GTO Wizard/PT4 users.
- OHH has essentially no live tooling momentum (two small repos, last touched 2023-2024); PHH has an active Python parser (PokerKit) that could double as a validator for reconstructed hands (stack/pot consistency checks).

### Gaps
- The full OHH field specification page was not retrieved; the maintainer (believed to be PokerTracker's hh-specs effort) was not confirmed from a primary source.
- No converter from ClubGG/PokerBros/PPPoker/X-Poker/Suprema native exports (XLS email, replay link) to PokerStars/OHH was found in the open.

## Key Question 6: Batch workflows — dump 30 screenshots, auto-split into hands, dedupe and order

### Takeaway
No published tool documents a "dump screenshots, auto-split into hands" workflow; Deepfold accepts single screenshots, and the iOS Share Sheet / Android share intent already supports multi-image hand-off. Splitting/dedup/ordering therefore has to be built from screenshot metadata (EXIF/file timestamps), in-app hand IDs visible on the replay screen, and card/pot-based fingerprints.

### Cited Findings
- iOS share-sheet shortcuts receive the host app's selected content as input to the first action and can be restricted to image content types. — [Apple Shortcuts guide](https://support.apple.com/en-kg/guide/shortcuts/apd163eb9f95/2.1/ios)
- Deepfold's hand limits are "3 (free), 10 (Basic), 30 (PRO)" hands per month and "limits apply to hands, not files"; it takes paste, upload, screenshot or replay link, one hand at a time in the described flow. — [Deepfold](https://deepfold.co/en/blog/hand-converter-guide)
- PokerBros' in-app hand history lists hands sequentially with back/forward arrows and a Hand Detail tab, and the emailed export covers the last 6 days — i.e., the app itself exposes an ordered hand list that screenshots will mirror. — [Professional Rakeback](https://professionalrakeback.com/poker-bros-app-review); [KingsHands](https://kingshands.com/blog/gde-xranitsya-handhistory-prilozheniya-pokerbros/)
- Claude Opus 4.7 failed a multi-image multi-turn extraction but passed when each image was sent in a separate call, per a 2026 test. — [SimpleMetrics](https://simplemetrics.xyz/comparing-ai-vision-which-model-wins-in-image-recognition-and-text-extraction)

### Inferences
- Ordering: screenshot creation time (EXIF/Photos metadata) is monotonic within a review session; a user who scrolls the hand list from newest to oldest produces reverse order, so ordering should fall back to any hand number/ID or timestamp visible in the replay header once parsed.
- Splitting: when a hand replay spans several screenshots (preflop, flop, turn, river views), group by shared fingerprint (hero cards + blinds + seat count + table name) and merge streets; a changed hero-card set indicates a new hand.
- Dedup: perceptual hash of the image for exact repeats, plus a fingerprint on (hero cards, board, pot) after parsing for near-duplicates.
- Per-image independent calls with structured output, then a deterministic merge step, is safer than one long multi-image prompt.

### Gaps
- No empirical data on how many screenshots a typical replay needs per hand in each app, nor on where hand IDs/timestamps appear on each app's replay screen.

## Key Question 7: What is shipping in 2025-2026 for screenshot-to-hand-history

### Takeaway
Deepfold (2026) is the only found product that explicitly parses club-app screenshots and X-Poker replay links into analysable hands, at 3-30 hands/month tiers. Everything else is either camera-based physical-card odds scanning (Handsight, PokerSnap), manual hand entry (Poker Hand History App, Poker Hand History Keyboard, live-squeezer), or desktop converters for HUD users. No evidence that GTO Wizard, PokerSnowie or Octopi offer screenshot import for club apps.

### Cited Findings
- Deepfold Coaching: screenshot upload (reads position, stacks, bets, board, hole cards), plain-English hand description, pasted hand text, and X-Poker replay URLs; "five seconds, screenshot to answer"; first hand free, 3/10/30 hands per month on free/Basic/PRO; no accuracy figures or model names; posts dated Jan-May 2026. — [Deepfold ClubGG post](https://deepfold.co/en/blog/clubgg-hand-analysis); [Deepfold converter guide](https://deepfold.co/en/blog/hand-converter-guide)
- Handsight: Poker Odds Scanner (iOS): on-device recognition of physical cards from photos; explicitly "Screenshots and photos of online poker apps aren't supported"; $2.99/mo or $19.99/yr for scanning own photos; version 1.16.0 current. — [App Store](https://apps.apple.com/us/app/id6758763848)
- PokerSnap: "AI-powered card recognition + Monte Carlo odds engine" from a photo of your cards; free; launched 2026; no hand-history output. — [Product Hunt](https://www.producthunt.com/products/pokersnap/reviews)
- Poker Hand History App (iOS, Taeyang You): manual graphical hand logging plus bankroll tracking; claims "Import sessions from other apps with AI" without explaining how; free with $4.99/$49.99 premium; v1.0 Apr 2025, v2.0.2 Oct 2025. — [App Store](https://apps.apple.com/us/app/-/id6744484636)
- Poker Hand History Keyboard (iOS, $1.99): custom keyboard for typing hands at live tables; free-form text output; v1.6 dated 2024. — [App Store](https://apps.apple.com/py/app/poker-hand-history-keyboard/id6450874851?l=en-GB)
- live-squeezer: web tool for typing live/TV hands into PokerStars-format histories with replayer/forum export; no OCR. — [GitHub](https://github.com/vikcch/live-squeezer)
- GTO Wizard's hand-history help page lists no screenshot import; club apps are handled only via paid converters; unlisted sites go through Discord support. — [GTO Wizard help](https://help.gtowizard.com/where-to-get-your-hand-histories/)
- Hand2Note 4 supports club apps via Windows + LDPlayer emulator with HUD overlay (live use), not via screenshots. — [Hand2Note](https://hand2note4-com-test-dzf5dpdueud7cqdm.westeurope-01.azurewebsites.net/Help/supported-sites)

### Inferences
- The market gap the team is targeting (mobile, post-session, screenshot-first, club apps) has exactly one visible competitor (Deepfold) and it caps at 30 hands/month, suggesting its per-hand parsing is either expensive or human-reviewed; a cheaper, validated pipeline with batch upload would be a differentiator.
- Parsing the X-Poker "Share Replay" web page is a higher-fidelity, lower-cost input than screenshots and should be prioritised for that app; checking whether ClubGG/PPPoker/Suprema replays have any equivalent shareable URL is the single highest-value follow-up.

### Gaps
- No information found on PokerSnowie, Octopi, or GTO Wizard mobile offering screenshot-to-hand import.
- Deepfold's underlying models, accuracy, and dollar pricing are not published.
- "Import sessions from other apps with AI" in Poker Hand History App is unexplained.
