-- ============================================================
-- Verification query — run this any time to check what's actually
-- in the database. Not part of setup; just a sanity check.
-- ============================================================
-- Expected after running schema.sql + all 5 seed files:
--   'Before You Begin'       — 1 moment  (the anchor question)
--   'The Default OS'         — 7 moments
--   'The Inner Turn'         — 6 moments
--   'The Diverse Paths'      — 9 moments
--   'Savoring the Footsteps' — 6 moments
--   'The Final Destination'  — 7 moments
-- ============================================================

select
  stages.id as stage_id,
  stages."order",
  stages.title,
  count(moments.id) as moment_count
from stages
left join moments on moments.stage_id = stages.id
group by stages.id, stages."order", stages.title
order by stages."order";
