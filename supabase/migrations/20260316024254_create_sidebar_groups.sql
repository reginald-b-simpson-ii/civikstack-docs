/*
  # Create sidebar_groups table

  1. New Tables
    - `sidebar_groups`
      - `id` (uuid, primary key)
      - `section_id` (uuid, FK to nav_sections) - which nav section this group belongs to
      - `title` (text, not null) - display title in the sidebar
      - `slug` (text, not null) - URL-safe identifier
      - `sort_order` (integer, default 0) - ordering within the section
      - `created_at` (timestamptz)

  2. Indexes
    - Unique composite index on (section_id, slug)

  3. Security
    - Enable RLS on `sidebar_groups` table
    - Add policy for public read access
*/

CREATE TABLE IF NOT EXISTS sidebar_groups (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  section_id uuid NOT NULL REFERENCES nav_sections(id),
  title text NOT NULL,
  slug text NOT NULL,
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  UNIQUE(section_id, slug)
);

CREATE INDEX IF NOT EXISTS idx_sidebar_groups_sort ON sidebar_groups(section_id, sort_order);

ALTER TABLE sidebar_groups ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read sidebar groups"
  ON sidebar_groups
  FOR SELECT
  TO anon, authenticated
  USING (true);
