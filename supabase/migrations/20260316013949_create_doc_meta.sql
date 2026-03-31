/*
  # Create doc_meta table

  1. New Tables
    - `doc_meta`
      - `id` (uuid, primary key)
      - `site_title` (text) - documentation site name
      - `site_description` (text) - site description for meta tags
      - `logo_text` (text) - text displayed as logo
      - `banner_text` (text) - announcement banner content
      - `banner_enabled` (boolean) - whether to show the banner
      - `banner_link` (text) - optional link for the banner
      - `footer_text` (text) - footer copyright/attribution text
      - `github_url` (text) - link to GitHub repo

  2. Security
    - Enable RLS on `doc_meta` table
    - Add policy for public read access
*/

CREATE TABLE IF NOT EXISTS doc_meta (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  site_title text NOT NULL DEFAULT 'Documentation',
  site_description text DEFAULT 'Modern documentation site',
  logo_text text DEFAULT 'Nextra',
  banner_text text DEFAULT '',
  banner_enabled boolean NOT NULL DEFAULT false,
  banner_link text DEFAULT '',
  footer_text text DEFAULT '',
  github_url text DEFAULT ''
);

ALTER TABLE doc_meta ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read doc meta"
  ON doc_meta
  FOR SELECT
  TO anon, authenticated
  USING (true);
