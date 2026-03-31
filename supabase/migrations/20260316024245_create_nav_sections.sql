/*
  # Create nav_sections table

  1. New Tables
    - `nav_sections`
      - `id` (uuid, primary key)
      - `label` (text, not null) - display label in the navigation bar
      - `slug` (text, unique, not null) - URL-safe identifier
      - `sort_order` (integer, default 0) - ordering in the nav bar
      - `landing_title` (text) - title shown on section landing page
      - `landing_subtitle` (text) - subtitle shown on section landing page
      - `landing_body` (text) - body text shown on section landing page
      - `created_at` (timestamptz)

  2. Security
    - Enable RLS on `nav_sections` table
    - Add policy for public read access (documentation is publicly viewable)
*/

CREATE TABLE IF NOT EXISTS nav_sections (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  label text NOT NULL,
  slug text UNIQUE NOT NULL,
  sort_order integer NOT NULL DEFAULT 0,
  landing_title text NOT NULL DEFAULT '',
  landing_subtitle text NOT NULL DEFAULT '',
  landing_body text NOT NULL DEFAULT '',
  created_at timestamptz DEFAULT now()
);

ALTER TABLE nav_sections ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read nav sections"
  ON nav_sections
  FOR SELECT
  TO anon, authenticated
  USING (true);
