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

---

## 3. 42self.xyz website updates — DONE

- Added **"The Feedback Loop"** section: 6 recurring self-enquiry checkbox questions + a `localStorage`-backed check-in counter, placed right after the diagnostic section, followed by the Gumroad workbook CTA
- Fixed desktop/laptop width issue: content columns were hard-capped at 660/980px; added responsive breakpoints (1024px/1300px/1600px)
- **Open/unresolved**: user flagged the Ego Architecture section's alignment as "weird" on laptop. Root cause identified (inconsistent fixed-width elements: 700/560/820px blocks independently centered, creating a staircase effect) but **not yet fixed** — revisit if raised again.

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

---

## 5. v2/v3 spec — DEFERRED, gating rules apply

Captured in `web_companion_v2_v3_spec_md.pdf`, based on external feedback reframing the app's purpose: *"tracking the evolution of the experiencer, not the accumulation of experiences."* Three timelines: External Life, Inner Experience, Evolution of Perspective.

**Already approved and built** (Section 2a — cheap, no architecture change): response metadata columns (see above), Markdown export (see above).

**Still gated — do NOT build yet**:
- **2b (medium)**: consistency callouts ("six weeks apart, you answered this the same way"), post-stage reflection surfacing
- **2c (expensive, v3+)**: Anchor Experiences (manual flagging preferred over AI classification), cross-stage callbacks, full relationship-graph data model

**Gating rule** (explicit in the spec doc): nothing in 2b/2c should be built until there's real evidence of (1) organic multi-week return usage from actual users, not test data, and (2) a specific observed moment where the flat data model visibly fails someone. The spec explicitly recommends manual user-tagging over AI/LLM inference wherever a cheaper non-AI option exists.

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

1. Clean up the GitHub repo per the plan in Section 6 (delete stale folders, re-upload clean `webapp/` + `docs/`)
2. Deploy the current `webapp_v0_2_checkin_return_link.zip` contents to the live Vercel/Netlify site (replacing whatever's currently deployed)
3. Continue real-world testing now that the ordering bug, save-button bug, and same-day block are fixed
4. Revisit the Ego Architecture section width/alignment issue on 42self.xyz (Section 3, still open)
5. Nothing from the v2/v3 spec should be started until the gating conditions in Section 5 are met
