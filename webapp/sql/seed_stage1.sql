-- ============================================================
-- Seed data: onboarding anchor + Stage 1 ("The Default OS")
-- ============================================================
-- Run this AFTER schema.sql, once.
-- v0.1 scope: only "text" type moments are rendered by the app.
-- The `type` column already supports 'checkbox' and 'scale' for
-- v0.2 — seeded here so the schema doesn't need to change later,
-- but the UI only builds a text-input renderer for now.
-- ============================================================

-- Stage 0: onboarding-only stage, holds just the anchor question.
-- Kept separate from Stage 1 so the anchor question's repeat-logic
-- (Day 1 vs. Return) never gets tangled up with regular stage progress.
insert into stages (title, subtitle, "order") values
  ('Before You Begin', null, 0);

insert into moments (stage_id, prompt, type, "order", is_anchor) values
  (1, 'Who are you?', 'text', 1, true);

-- Stage 1: The Default OS (Phase 1 of the workbook, curated subset for v0.1)
insert into stages (title, subtitle, "order") values
  ('The Default OS', 'Catching the autopilot running your life', 1);

insert into moments (stage_id, prompt, type, "order", is_anchor) values
  (2, 'Think of one moment in the last 24 hours when you reacted instantly — before you''d consciously decided anything. What was the moment?', 'text', 1, false),
  (2, 'What did you feel in your body in the half-second before you reacted?', 'text', 2, false),
  (2, 'If you''d had ten seconds to pause first, would you have done the same thing — or was that the autopilot?', 'text', 3, false),
  (2, 'Name one decision pattern that''s repeated itself over the last few years — something you keep doing, or keep avoiding, regardless of the specific circumstances each time.', 'text', 4, false),
  (2, 'The first time this pattern showed up that you can remember — how old were you, roughly, and what was happening?', 'text', 5, false),
  (2, 'Whose voice, rule, or fear does this pattern actually sound like, if you trace it honestly? Yours — or something inherited?', 'text', 6, false),
  (2, 'Right now, today — mostly autopilot, mostly aware, or somewhere genuinely mixed? Where would you honestly place yourself?', 'text', 7, false);

-- Note: stage_id values above (1 and 2) assume this is a fresh database
-- where the serial IDs start at 1. If you've run this before and are
-- re-seeding, check the actual generated IDs in the stages table first.
