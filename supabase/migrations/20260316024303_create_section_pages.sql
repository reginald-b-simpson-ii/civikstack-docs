/*
  # Create section_pages table

  1. New Tables
    - `section_pages`
      - `id` (uuid, primary key)
      - `group_id` (uuid, FK to sidebar_groups) - which sidebar group this page belongs to
      - `title` (text, not null) - page title
      - `slug` (text, not null) - URL-safe identifier
      - `description` (text) - short summary for search results
      - `content` (text) - the documentation content (HTML)
      - `sort_order` (integer, default 0) - ordering within the group
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)

  2. Indexes
    - Unique composite index on (group_id, slug)
    - Index on sort_order for fast ordering

  3. Security
    - Enable RLS on `section_pages` table
    - Add policy for public read access
*/

CREATE TABLE IF NOT EXISTS section_pages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  group_id uuid NOT NULL REFERENCES sidebar_groups(id),
  title text NOT NULL,
  slug text NOT NULL,
  description text NOT NULL DEFAULT '',
  content text NOT NULL DEFAULT '',
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(group_id, slug)
);

CREATE INDEX IF NOT EXISTS idx_section_pages_sort ON section_pages(group_id, sort_order);

ALTER TABLE section_pages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read section pages"
  ON section_pages
  FOR SELECT
  TO anon, authenticated
  USING (true);
