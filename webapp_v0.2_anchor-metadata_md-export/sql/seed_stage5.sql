-- ============================================================
-- Seed data: Stage 5 — "The Final Destination"
-- (Phase 5 of the workbook: Pillars 3 & 5, and the Loop That Keeps
-- This Alive)
-- ============================================================
-- Run this AFTER seed_stage4.sql, once.
--
-- Deliberately NOT seeded here: the workbook's own "Your Baseline,
-- Revisited" exercise (rate 7 areas 0-10, compare to page 4). That's
-- the workbook's paper equivalent of exactly what the app's anchor
-- question + Return screen already does automatically, every time
-- someone comes back — no reason to duplicate a one-time scale
-- exercise here when the app's whole mechanism is a better, ongoing
-- version of the same idea.
-- ============================================================

insert into stages (title, subtitle, "order") values
  ('The Final Destination', 'Why am I here, and where am I going', 5);

insert into moments (stage_id, prompt, type, "order", is_anchor) values
  ((select id from stages where title = 'The Final Destination'), 'Sit with this for thirty seconds before answering: what''s different about a thought, a feeling, or a worry once you notice you''re the one watching it, rather than the one trapped inside it?', 'text', 1, false),
  ((select id from stages where title = 'The Final Destination'), 'If there''s one thing you came here to give the world — not to prove, not to earn, just to give — what is it?', 'text', 2, false),
  ((select id from stages where title = 'The Final Destination'), 'What does the world need from you specifically — not from people in general, from you?', 'text', 3, false),
  ((select id from stages where title = 'The Final Destination'), 'A year from now, what would have to be different about you — not your circumstances, you — for this whole process to have been worth it?', 'text', 4, false),
  ((select id from stages where title = 'The Final Destination'), 'What''s the vision you''re actually walking toward, once you strip away what you think you''re supposed to want?', 'text', 5, false),
  ((select id from stages where title = 'The Final Destination'), 'What''s the one sentence, in your own words from anywhere in this workbook, you''d most want to remember a year from now?', 'text', 6, false),
  ((select id from stages where title = 'The Final Destination'), 'What''s the one question from this workbook you didn''t fully answer — the one you skipped past, or answered too quickly to be honest?', 'text', 7, false);
