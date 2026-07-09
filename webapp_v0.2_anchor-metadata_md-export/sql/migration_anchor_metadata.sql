-- ============================================================
-- Migration: anchor-question response metadata
-- ============================================================
-- Run this once in the Supabase SQL Editor, after schema.sql.
-- Adds three NULLABLE columns to responses. Nullable means every
-- existing row (and every future row inserted from checkin.html,
-- which does NOT set these) stays valid — no backfill, no
-- migration of existing data. The append-only guarantee on
-- responses is untouched: this is additive columns only, same
-- idea as the "richer response metadata" item in the v2/v3 spec.
--
-- journey_location : where in the journey this answer was given
--                     e.g. 'Onboarding — Day 1', 'Return visit #2'
-- elapsed_seconds   : time from the question appearing on screen
--                     to the moment they clicked save
-- thinking_seconds  : time from the question appearing to their
--                     FIRST keystroke — i.e. how long they sat
--                     with it before writing anything
-- ============================================================

alter table responses
  add column if not exists journey_location text,
  add column if not exists elapsed_seconds int,
  add column if not exists thinking_seconds int;
