# The Ultimate Journey — Web Companion (v0.1)

This is the first working build: auth, one stage of daily check-ins,
local-draft autosave, and the Return screen with time-based progress.
It matches the v0.1 scope in `web_companion_mvp_spec.md`.

## What's here

```
webapp/
  index.html        landing page
  login.html        magic-link sign in / sign up (same flow for both)
  onboarding.html    Day 1 anchor question ("Who are you?")
  return.html        home screen — progress + "today's reflection" CTA
  checkin.html       one moment at a time, with draft autosave
  settings.html      sign out, data export
  css/theme.css      shared styling — your existing dark/gold brand
  js/supabase-client.js   Supabase connection (needs your keys — see below)
  sql/schema.sql          run this first, once
  sql/seed_stage1.sql     run this second, once — Stage 1 content
```

No build step, no framework, no npm install. Every page is loaded directly
by the browser and talks to Supabase via a CDN script tag.

## Setup — do this once

### 1. Create a Supabase project
Go to [supabase.com/dashboard](https://supabase.com/dashboard) → New Project.
Free tier is enough for v0.1 and quite a while beyond it.

### 2. Run the schema
Open your project → SQL Editor → New Query. Paste in the full contents of
`sql/schema.sql`, run it. Then do the same with `sql/seed_stage1.sql`.

### 3. Get your API keys
Project Settings → API. You need:
- **Project URL** (looks like `https://abcdefgh.supabase.co`)
- **anon / public key** (a long string starting with `eyJ...`)

Open `js/supabase-client.js` and paste both into the two constants at the top.
This key is meant to be public-facing — Row Level Security (already set up
by schema.sql) is what actually protects the data, not keeping this secret.

### 4. Turn on email auth (should be on by default)
Authentication → Providers → Email should already be enabled. No extra
setup needed for the magic-link flow used here.

### 5. Deploy
Easiest path: push this `webapp/` folder to a GitHub repo, then connect it
to [Vercel](https://vercel.com) or [Netlify](https://netlify.com) — both
auto-deploy static sites straight from a repo with no configuration needed
for a plain HTML/CSS/JS project like this one.

## Testing it locally before deploying

Any simple local server works, since these are just static files. From
inside the `webapp/` folder:

```bash
python3 -m http.server 8000
```

Then open `http://localhost:8000` in your browser. Note: Supabase's
magic-link redirect (`emailRedirectTo`) is set to `window.location.origin`,
so it'll correctly point back to `localhost:8000` while testing, and to
your real deployed URL once it's live — nothing to change between the two.

## What's deliberately NOT here yet (v0.2+)

- Only Stage 1 is seeded. Add more via new seed SQL files once v0.1 feels right.
- Checkbox/scale question types aren't rendered (schema supports them, UI doesn't yet).
- The Return moment (Day 1 vs. later anchor-question comparison) — can't
  test this meaningfully until real time has passed for real users anyway.
- Reflection Time Capsule scheduled job — needs a bit of Supabase Edge
  Functions or a cron service; worth adding once Stage 1 is proven out.
- Theme toggle (dark/light) — CSS is dark-only for now; the variables
  are structured so a light theme is a matter of adding a second `:root`
  block, not a rewrite.

## A note on the append-only design

`schema.sql` deliberately does not create an UPDATE or DELETE policy on
the `responses` table. This isn't an oversight — it means even a future
bug in the app code cannot silently edit or erase someone's past answer.
Leave it this way.
