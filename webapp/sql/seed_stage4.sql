-- ============================================================
-- Seed data: Stage 4 — "Savoring the Footsteps"
-- (Phase 4 of the workbook: Walking Through Difficulty — On Purpose)
-- ============================================================
-- Run this AFTER seed_stage3.sql, once.
-- The RRRR / Circuit Breaker / Track-Own-Release-Reintegrate tools
-- in this phase are live, in-the-moment techniques, not one-time
-- written answers — they stay as workbook/bonus-content material.
-- What's seeded here is the reflective work that fits a written
-- moment: naming the pattern, and the weekly check-in habit.
-- ============================================================

insert into stages (title, subtitle, "order") values
  ('Savoring the Footsteps', 'Walking through difficulty, on purpose', 4);

insert into moments (stage_id, prompt, type, "order", is_anchor) values
  ((select id from stages where title = 'Savoring the Footsteps'), 'Pick one bad day from the last month. The Architecture of Suffering has five stages — a borrowed identity, comparison, unfairness, insecurity, loss of connection. Which of these can you actually find inside that day?', 'text', 1, false),
  ((select id from stages where title = 'Savoring the Footsteps'), 'Pick a second, completely different bad day, from a different area of life entirely. Do the same stages show up, just wearing different clothes?', 'text', 2, false),
  ((select id from stages where title = 'Savoring the Footsteps'), 'Walk through a recent trigger: Recognize, Resist, Return, Release. What would ''Resist'' — a sixty-second pause before acting — have actually looked like, concretely, in that exact moment?', 'text', 3, false),
  ((select id from stages where title = 'Savoring the Footsteps'), 'Think of a recent moment that knocked you off balance. Where did you feel it in your body? Follow that sensation backward — does it remind you of an earlier moment, even an old one?', 'text', 4, false),
  ((select id from stages where title = 'Savoring the Footsteps'), 'Think of something unresolved right now — a goal that''s stuck, a person who hasn''t responded the way you hoped. Be honest: is it a Need you haven''t taken real action on, or a Want you''ve been quietly trying to control?', 'text', 5, false),
  ((select id from stages where title = 'Savoring the Footsteps'), 'What did I learn this week that the version of me from last week didn''t know yet?', 'text', 6, false);
