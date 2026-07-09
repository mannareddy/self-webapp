-- ============================================================
-- Seed data: Stage 2 — "The Inner Turn"
-- (Phase 2 of the workbook: The Arrival Fallacy & The Emotion Barometer)
-- ============================================================
-- Run this AFTER seed_stage1.sql, once.
-- Curated subset, same approach as Stage 1 — the full phase has more
-- questions (the Arrival Audit table, the RRRR-style breathing steps)
-- that don't fit a single-answer text moment; those stay in the PDF.
-- v0.2 scope: still text-only rendering, same as v0.1.
-- ============================================================

insert into stages (title, subtitle, "order") values
  ('The Inner Turn', 'The Arrival Fallacy — and turning the dial inward', 2);

insert into moments (stage_id, prompt, type, "order", is_anchor) values
  ((select id from stages where title = 'The Inner Turn'), 'Think of the last thing you really wanted and got. What did you feel in the first five minutes?', 'text', 1, false),
  ((select id from stages where title = 'The Inner Turn'), 'What did you feel a week later?', 'text', 2, false),
  ((select id from stages where title = 'The Inner Turn'), 'If you''re honest — what are you currently chasing, that you''ve quietly already decided will finally be enough?', 'text', 3, false),
  ((select id from stages where title = 'The Inner Turn'), 'If your mind is a radio playing a station full of static — what''s the loudest station playing right now, today, before you''ve done anything about it?', 'text', 4, false),
  ((select id from stages where title = 'The Inner Turn'), 'Think of something that''s been bothering you the last few days. Is it guilt (pointing backward), fear (pointing forward), or frustration (pointing at right now)? Once you''ve named it — what rule, exactly, did the world just break?', 'text', 5, false),
  ((select id from stages where title = 'The Inner Turn'), 'For sixty seconds, watch your thoughts pass like cars on a road, without following any of them. Roughly how many distinct thoughts passed through — and was there a gap between any two of them?', 'text', 6, false);
