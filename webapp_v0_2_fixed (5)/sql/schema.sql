-- ============================================================
-- The Ultimate Journey — Web Companion
-- Database Schema (Supabase / Postgres)
-- ============================================================
-- Run this in the Supabase SQL Editor (Dashboard > SQL Editor > New Query)
-- after creating your Supabase project. Run the whole file once.
-- ============================================================

-- ------------------------------------------------------------
-- STAGES (renamed from "phases" — static reference data)
-- ------------------------------------------------------------
create table stages (
  id serial primary key,
  title text not null,
  subtitle text,
  "order" int not null
);

-- ------------------------------------------------------------
-- MOMENTS (renamed from "exercises" — static reference data)
-- ------------------------------------------------------------
create table moments (
  id serial primary key,
  stage_id int not null references stages(id),
  prompt text not null,
  type text not null default 'text',  -- 'text', 'checkbox', 'scale'
  "order" int not null,
  is_anchor boolean not null default false  -- marks the "Who are you?" repeat-question
);

-- ------------------------------------------------------------
-- RESPONSES (the important one — append-only, never overwritten)
-- ------------------------------------------------------------
create table responses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  moment_id int not null references moments(id),
  answer text not null,
  created_at timestamptz not null default now()
);

-- Index to make "get my most recent answer per moment" and
-- "get my answers from around this date" fast as data grows.
create index idx_responses_user_moment on responses(user_id, moment_id, created_at desc);
create index idx_responses_user_created on responses(user_id, created_at);

-- ------------------------------------------------------------
-- ROW LEVEL SECURITY
-- ------------------------------------------------------------
-- stages and moments: readable by anyone logged in (it's just the
-- workbook content, not private data)
alter table stages enable row level security;
alter table moments enable row level security;

create policy "Stages are readable by authenticated users"
  on stages for select
  to authenticated
  using (true);

create policy "Moments are readable by authenticated users"
  on moments for select
  to authenticated
  using (true);

-- responses: users can only ever see/insert their OWN rows.
-- No update or delete policy is created on purpose — this enforces
-- the append-only design at the database level, not just in the app code.
alter table responses enable row level security;

create policy "Users can read their own responses"
  on responses for select
  to authenticated
  using (auth.uid() = user_id);

create policy "Users can insert their own responses"
  on responses for insert
  to authenticated
  with check (auth.uid() = user_id);

-- Explicitly no UPDATE or DELETE policy on responses.
-- This means even if a bug in the app code tried to edit or delete
-- a past answer, Postgres itself would refuse — the append-only
-- guarantee is enforced by the database, not just trusted to the UI.
