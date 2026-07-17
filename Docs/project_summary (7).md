# *SELF Ecosystem — Project Context Summary

**Purpose of this file**: paste this at the top of a new Claude chat (plus re-attach any files mentioned below) to restore full context if a conversation runs out or hits a limit. Keep this file updated in the repo as work progresses.

---

## 1. Who this is for

Mohan (Murali Annareddy, @muraliannareddy), based in Bengaluru, India — founder and sole developer of the ***SELF ecosystem**, a philosophical self-inquiry project at **42self.xyz** synthesizing Advaita Vedanta, Jungian psychology, Stoicism, Sufi mysticism, and the Enneagram.

Ecosystem components:
- **42self.xyz** — main website (monolithic single-page HTML, GitHub Pages, dark/light theme)
- **$SELF** — Solana token (CA: `7b34fSrhKCtmA9T2WUNCuBPpKDeLwe2uNFq7BvsNpump`)
- **Mirror Room** — community space on X
- **The Ultimate Journey of Life** — paid 47-page digital workbook (Gumroad, $9.99)
- **Web Companion App** — the ongoing build covered in detail below

### Writing philosophy (apply to all *SELF copy — website, workbook, NFT, app, social)
**"Point, don't tell."** Invite investigation rather than lecture or assert claims. Core mission framing: *SELF is not a new identity to adopt — it's a reminder to investigate the one already being lived from* ("a reminder to remember yourSELF"). Avoid copy that presents SELF as containing "the answer" or as prescriptive. Frame 42 as a symbolic language, not a factual claim.

---

## 2. Workbook launch & marketing — DONE

- Gumroad listing finalized: *The Ultimate Journey of Life*, $9.99, dark/light theme PDFs, 30-day guarantee — live at `ammara01.gumroad.com/l/dyyole`
- Diagnosed low early X/Threads traction as a reach problem, not a message problem
- Instagram carousel: selected the dark/gold NotebookLM-generated deck over a generic Gamma-made one; trimmed to a tight 7-slide sequence; **removed NotebookLM watermarks** from all 7 slides (cloned local background pixels over the watermark region); wrote captions
- LinkedIn post drafted (career-framed hook, link in comments per platform algorithm behavior)
- Instagram bio, website field, and external-link title set for the launch window
- **Status: Instagram posting confirmed done by user.**

### 2a. Distribution expansion beyond Gumroad — IN PROGRESS
Gumroad's core limitation: it has no discovery layer of its own — all traffic has to be self-driven (social/blogs). Reviewed a 10-marketplace reference list (`10_Marketplaces_Where_I_Sell_My_Mini_Ebooks.docx`) and filtered to the three platforms with genuine built-in browse/search traffic that fit a philosophical self-inquiry workbook:
1. **Amazon KDP — paperback (print-on-demand)**, not Kindle ebook. 8.5"×11" is the standard workbook trim size; zero upfront printing cost; puts the product in front of Amazon's own search traffic instead of requiring self-driven traffic.
2. **Etsy** — real discovery traffic in the self-help/journal/workbook category; digital downloads are a normal, non-workaround listing type.
3. **Teachers Pay Teachers (TpT)** — guided workbooks and journaling resources do sell here, not just K-12 lesson plans; has its own search traffic.
Deprioritized from the same list: Creative Market / Adobe Stock (template/asset-first, not a fit), Facebook Marketplace and AppSumo (wrong audience), Udemy (video-course format, possible future companion product, not now).
Gumroad stays as-is as the channel for when traffic is being actively driven.

**KDP submission status (as of July 18, 2026):**
- **Kindle ebook version: rejected.** Amazon KDP declined the interactive fill-in-the-blank workbook format for Kindle ebook listing — their stated reason: this type of interactive workbook doesn't qualify for the Kindle ebook format.
- **Paperback (print-on-demand): resubmitted, currently under review.** First submission needed margin corrections; those were fixed and the corrected file was resubmitted today (July 18). Paperback is now the sole KDP path forward — no longer pursuing Kindle ebook for this title.

---

## 3. 42self.xyz website updates — DONE

- Added **"The Feedback Loop"** section: 6 recurring self-enquiry checkbox questions + a `localStorage`-backed check-in counter, placed right after the diagnostic section, followed by the Gumroad workbook CTA
- Fixed desktop/laptop width issue: content columns were hard-capped at 660/980px; added responsive breakpoints (1024px/1300px/1600px)
- **Open/unresolved**: user flagged the Ego Architecture section's alignment as "weird" on laptop. Root cause identified (inconsistent fixed-width elements: 700/560/820px blocks independently centered, creating a staircase effect) but **not yet fixed** — revisit if raised again.

### 3a. Consciousness/Awareness science aside + Master Matrix Awareness column — DONE
Built from a NotebookLM neuroscience deck ("The Shape of Thought" / IIT + EEG + anesthesia research), reviewed and fact-checked against the real underlying study before publishing:
- **"A Note for the Skeptics" aside** added directly after the existing Consciousness/Awareness section (`#consciousness`), deliberately in a different register (empirical, hedged, clearly marked as separate from the AUM/Turiya metaphysical material above it) rather than blended into it. Summarizes real, cited research: information-integration capacity in the EEG gamma band collapses under anesthesia while raw synchronized firing does not — read as a physical correlate of the site's own Consciousness/Awareness distinction, explicitly framed as "an echo of it, not proof of it."
- **Verified citation**: Lee, U., Kim, S., Noh, G.J., Choi, B.M. & Mashour, G.A. (2008). "Propofol Induction Reduces the Capacity for Neural Information Integration: Implications for the Mechanism of Consciousness and General Anesthesia." *Nature Precedings*. DOI: 10.1038/npre.2008.1244.2 — open access, CC BY 3.0, safe to cite/link directly.
- **New "Awareness" column added to the live Master Matrix** (`#master-matrix`, `#masterMatrixTable`), one entry per brainwave state (Delta→Unconscious/Deep Sleep, Theta→Subconscious/Twilight, Alpha→Relaxed Waking/Visual Rest, Mu→Stillness/Motor Ready, Beta→Active/Alert Focus, Gamma→Superconsciousness/Hyper-Focus, Lambda→Transcendence/Altered States). `colspan` fixed on all 7 expandable detail rows (15→16); no JS changes needed since column visibility toggling (`setMatrixMode()`) is class-based, not position-based.
- **Column order corrected**: Brainwave → Awareness → Stage → Alchemy → Existence Layer (was briefly Brainwave → Awareness → Alchemy → Stage, which split the meaningful triad in half). A new callout box now sits directly above the table naming this explicitly: Brainwave = the measurable state, Awareness = what it feels like from inside, Stage = the inner work that state calls for — with Alchemy/Existence Layer following as the correspondence layer, not part of the core arc.

### 3b. Recurring three-part structure — cross-reference, not yet unified
Worth having in one place: **the ecosystem's source documents independently converge on the same rough shape — something measurable/objective, something felt/noticed, something done about it — using different vocabulary every time.** Four separate instances so far:
1. `self-flow-reference.md`'s eleven-stage chain (Life → Observations → ... → Experiencer → SELF), with Time as the hinge
2. The site's own Consciousness (field) / Awareness (flashlight) split
3. The "brainstorm" doc's Event → State → Consciousness three-tier question engine
4. The Master Matrix's new Brainwave → Awareness → Stage triad (3a above)
Not consolidated into one canonical model — flagged here so a future session can lay all four side by side if there's ever a reason to unify the vocabulary, rather than each living only in its own document's memory.

### 3c. Inline glossary component — IN PROGRESS, first term done
User idea: many words across the site (Sanskrit/Kosha terms, alchemy vocabulary, clinical terms like "senescence") have no in-page explanation. Proposed and built a reusable pattern rather than a one-off fix:
- **Component**: `.gloss` / `.gloss-btn` / `.gloss-pop` — a small "+" superscript next to any hard word, click to reveal a short popover definition inline, click elsewhere to close. Matches existing dark/gold aesthetic, works inside table cells (Master Matrix) as well as prose, doesn't reflow surrounding layout. No new dependencies — plain CSS/JS, reuses the site's existing CSS variables.
- **First applied example**: "Senescence" in the Master Matrix (Layer 1, Deterioration column) — previously plain unexplained text.
- **Not yet done — candidate terms for the next pass**: the Existence Layer / Kosha column (Annamaya, Pranamaya, Manomaya, Vijnanamaya, Chitta, Ahankara, Atman), the AUM states (Jagrat, Svapna, Prajna, Turiya), the Alchemy column (Quintessence, Philosopher's Stone), and the Hermetic Principles wherever they appear by name only (Mentalism, Correspondence, Vibration, Polarity, Rhythm, Cause & Effect, Gender). This was flagged as "many words or sections" by the user — the component is built and proven on one term; a fuller site sweep to find and wrap every candidate word is still open.

---

## 4. Web Companion App — full build history

### Architecture (unchanged since v0.1)
- **Stack**: Supabase (Postgres + Auth) + plain HTML/CSS/JS, no framework, no build step. Deployed via Vercel/Netlify.
- **Schema**: 4 tables — `stages`, `moments` (with `is_anchor` flag for "Who are you?"), `users` (Supabase Auth), `responses`.
- **Critical design rule, never change this**: `responses` is **append-only** — no UPDATE/DELETE policy. This is what makes the Day-1-vs-now comparison and Time Capsule features possible, and it protects users from any future app bug silently altering past answers.

### v0.1 (confirmed working before this doc's conversation started)
Auth, one stage, local-draft autosave, basic Return screen, JSON export.

### v0.2 — built across this conversation
- **Ported all 5 real workbook phases** into seed SQL (`seed_stage1.sql`–`seed_stage5.sql`), sourced from the actual 47-page PDF (`dark_theme.pdf`) after an earlier mix-up where a marketing-deck PDF was mistakenly provided instead
- Deliberately **did not seed** the workbook's own 0–10 "Baseline" scale exercise — it's the paper equivalent of what the app's Day-1/Return comparison already does automatically
- Converted seed files from hardcoded stage IDs to safe `(select id from stages where title = '...')` subselects, added `verify_seed.sql` sanity-check query
- Built **`the-return.html`** — the flagship Return moment: re-asks the anchor question with zero framing, saves as another append-only response, deliberate pause, then reveals Day-1's answer next to the new one
- Added **dark/light theme toggle**, same palette and `selfTheme` localStorage key as the main website

### v0.2 — additional fixes built in a separate chat session (confirmed working, reviewed and verified in this conversation)
Delivered as `webapp_v0_2_checkin_return_link.zip` — **this is the current source of truth**, superseding all earlier zips.

1. **Save-button bug fixed** (`checkin.html`): the button's label wasn't being reset between questions, so it could still read "Saving…" from the previous question when a new one loaded, looking pre-clicked. Now explicitly reset in `loadMoment()`.
2. **Question-ordering bug fixed** (`return.html` + `checkin.html`): root cause was `.gt('order', 0)` being used as a *filter* — but `order` is a reserved PostgREST query parameter (used for sort direction), so using it as a filter key silently fails the request. Fixed by fetching unfiltered/unsorted and sorting client-side by stage order then moment order.
3. **Back-navigation added** to check-in: a "← Return" link so users aren't forced to answer before leaving.
4. **Same-day block added** to `the-return.html`: if the anchor question was already re-answered today, shows "come back another day" instead of allowing a second same-day comparison (which would defeat the point of the feature).
5. **Response metadata capture added**: new nullable columns `journey_location`, `elapsed_seconds`, `thinking_seconds` on `responses`, via `migration_anchor_metadata.sql` (**already run in Supabase**). Captured on both the Day-1 answer (`onboarding.html`) and every return visit (`the-return.html`).
6. **Markdown export rewrite** (`settings.html`): replaced raw JSON download with a clean, human-readable `.md` file — grouped by stage, prompts and answers in reading order, dates formatted normally ("July 8, 2026"), no field names or database IDs visible.

**All of the above has been reviewed file-by-file against the previously delivered version and verified correct** — including rendering checks of the new UI states (same-day block, back-link).

### v0.2 testing status
User has manually tested all 6 stages ("Before You Begin" + 5 phases) end-to-end with real answers (see `my-journey (10).json` for a full sample export). Core loop confirmed working.

### v0.2 — deployed to production (this conversation)
**The app is live and the full auth flow is confirmed working end-to-end.**

- **Deployed to Netlify** at `self-webapp-journey.netlify.app`, connected to the `mannareddy/self-webapp` GitHub repo.
- **Sign-in bug found and fixed — root cause was NOT the Supabase Auth URL Configuration** (that was already fine). The actual cause: `signInWithOtp` was returning a 500 (`AuthRetryableFetchError`) because the project was relying on **Supabase's built-in default email sender**, which is only intended for casual development testing and is not reliable for real transactional traffic — even at low volume, well under any rate limit (confirmed via Auth Logs: only a handful of same-user test requests, nowhere near the 30/hour email limit).
- **Fix: migrated to custom SMTP via Resend.**
  - Verified sending domain `42self.xyz` in Resend (DKIM confirmed; "Enable receiving" intentionally left off — not needed for outbound-only transactional email).
  - Supabase → Authentication → Emails → SMTP Settings configured: host `smtp.resend.com`, port `465`, username `resend`, password = Resend API key, sender email `hello@42self.xyz`, sender name `*SELF`.
  - Magic-link email delivery confirmed fast and reliable from `hello@42self.xyz`.
- **Custom domain set up: `companion.42self.xyz`.**
  - Netlify: domain added under Domain management (NOT via nameserver delegation — deliberately skipped Netlify's "Update your subdomain's name servers" flow, since that would have handed over full DNS control from GoDaddy to Netlify and put the existing Resend DKIM/SPF records at risk).
  - GoDaddy DNS: single CNAME record added instead — `companion` → `self-webapp-journey.netlify.app.` — keeping GoDaddy as DNS authority.
  - SSL auto-provisioned by Netlify once DNS propagated.
  - Supabase Authentication → URL Configuration updated: Site URL → `https://companion.42self.xyz`, Redirect URLs include `https://companion.42self.xyz/onboarding.html` and `https://companion.42self.xyz/*` (old Netlify subdomain URLs left in place alongside, no need to remove).
- **Full flow verified live** on `companion.42self.xyz`: sign-in → Resend email → magic link → correct redirect → `return.html` loading real user data correctly (stage progress, reflection count, days-since-start all rendering right).

**`companion.42self.xyz` is now the canonical URL — ready to share with the Mirror Room for soft launch.**

---

## 5. v2/v3 spec — DEFERRED, gating rules apply

Captured in `web_companion_v2_v3_spec_md.pdf`, based on external feedback reframing the app's purpose: *"tracking the evolution of the experiencer, not the accumulation of experiences."* Three timelines: External Life, Inner Experience, Evolution of Perspective.

**Already approved and built** (Section 2a — cheap, no architecture change): response metadata columns (see above), Markdown export (see above).

**Still gated — do NOT build yet**:
- **2b (medium)**: consistency callouts ("six weeks apart, you answered this the same way"), post-stage reflection surfacing
- **2c (expensive, v3+)**: Anchor Experiences (manual flagging preferred over AI classification), cross-stage callbacks, full relationship-graph data model

**Gating rule** (explicit in the spec doc): nothing in 2b/2c should be built until there's real evidence of (1) organic multi-week return usage from actual users, not test data, and (2) a specific observed moment where the flat data model visibly fails someone. The spec explicitly recommends manual user-tagging over AI/LLM inference wherever a cheaper non-AI option exists.

### 5a. Reinforced by "The Mirror Across Time" pitch deck (NotebookLM slide deck, reviewed this conversation)
This deck is the narrative/pitch version of the same Timeline-3 vision already gated above — it sharpens the language rather than introducing new scope. Confirms the current mechanism (`the-return.html` + append-only `responses`) is already the working instantiation of "Timeline 3: Evolution of Perspective." One genuinely new candidate idea surfaced by the deck, not previously in the spec:
- **Anchor Experiences**: quietly flag unusually high-emotional-weight responses (rather than treating every entry as equally weighted), so the app can deliberately resurface *those specific* entries years later instead of a generic Time Capsule pull. Logged here as a **2b/2c candidate — still subject to the same gating rule above**: do not build until organic multi-week return usage exists and a real flat-data-model failure is observed.

---

## 6. Working tools & workflow notes

- **Message-limit problem**: long single-thread conversations covering multiple work areas (marketing + website CSS + app build) burn through limits fast, especially with image-heavy content. Splitting work into separate chats per area helps.
- **GitHub repo**: `mannareddy/self-webapp` (public). GitHub's web UI **cannot rename or move folders** — only individual files, and not binary ones (PDFs, docx, images) reliably. For any real reorganization, **GitHub Desktop** (free, no terminal) is the recommended tool — clone locally, reorganize in a normal file explorer, commit + push via the app.
- **Claude Desktop app vs. web**: same account, same models, same message limits (limits are plan-based, not interface-based). Desktop's real advantage is MCP — connecting Claude to local files/folders or a GitHub repo directly, cutting down on re-uploading zips every session.
- **Recommended repo structure** going forward:
  ```
  self-webapp/
    webapp/         ← the actual app code (this file's v0.2 zip, unzipped)
    docs/           ← spec PDFs, feedback docs, JSON exports, this summary file
  ```

---

## 7. Immediate next steps

1. **Web Companion is deployed and live at `companion.42self.xyz`** — full auth flow (Resend SMTP + custom domain) confirmed working end-to-end. Ready to share with the Mirror Room for soft launch whenever Mohan chooses to.
2. **KDP paperback under review** (resubmitted July 18 with corrected margins) — Kindle ebook path is closed (Amazon rejected it: interactive fill-in-the-blank workbook format doesn't qualify for Kindle ebook listing); paperback is the only KDP path going forward. Awaiting Amazon's review outcome.
3. Once paperback is approved, proceed with Etsy and Teachers Pay Teachers listings (Section 2a)
4. Clean up the GitHub repo per the plan in Section 6 (delete stale folders, re-upload clean `webapp/` + `docs/`)
5. Continue real-world testing / soft launch now that deployment, the ordering bug, save-button bug, and same-day block are all fixed
6. Revisit the Ego Architecture section width/alignment issue on 42self.xyz (Section 3, still open)
7. Sweep the rest of the site for glossary-component candidates (Section 3c) — Kosha terms, AUM states, Alchemy column, Hermetic Principles
8. Nothing from the v2/v3 spec (including the Anchor Experiences candidate in 5a) should be started until the gating conditions in Section 5 are met — now more relevant than ever, since real user return-visit data can finally start accumulating post-launch
