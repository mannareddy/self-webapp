-- ============================================================
-- Seed data: Stage 3 — "The Diverse Paths"
-- (Phase 3 of the workbook: Self-Enquiry — Pillars 1, 2 & 4)
-- ============================================================
-- Run this AFTER seed_stage2.sql, once.
-- This is the longest phase in the workbook by design (per its own
-- intro text) — curated down to the questions that carry each pillar
-- on their own; the "Going Deeper — Optional" extended question bank
-- stays in the PDF rather than becoming 20+ moments here.
-- ============================================================

insert into stages (title, subtitle, "order") values
  ('The Diverse Paths', 'Self-Enquiry — Who Am I, Where Am I From, What Can I Do', 3);

insert into moments (stage_id, prompt, type, "order", is_anchor) values
  ((select id from stages where title = 'The Diverse Paths'), 'What is my deepest desire?', 'text', 1, false),
  ((select id from stages where title = 'The Diverse Paths'), 'What makes me angry? Anger often points straight at what you value most.', 'text', 2, false),
  ((select id from stages where title = 'The Diverse Paths'), 'What could I do forever, even with no monetary compensation?', 'text', 3, false),
  ((select id from stages where title = 'The Diverse Paths'), 'What am I most afraid of?', 'text', 4, false),
  ((select id from stages where title = 'The Diverse Paths'), 'What is my definition of success?', 'text', 5, false),
  ((select id from stages where title = 'The Diverse Paths'), 'What do you carry that you didn''t choose — a belief, a fear, a story about yourself — that you''re now ready to actually look at?', 'text', 6, false),
  ((select id from stages where title = 'The Diverse Paths'), 'What is your actual current reality right now: your responsibilities, your constraints, the real shape of the life you''re starting from?', 'text', 7, false),
  ((select id from stages where title = 'The Diverse Paths'), 'What is the smallest true action available to you today that your old persona would never have allowed?', 'text', 8, false),
  ((select id from stages where title = 'The Diverse Paths'), 'Pick the one thing from above you''re most likely to actually do. What''s the very first, concrete step — something you could do in the next 48 hours?', 'text', 9, false);
