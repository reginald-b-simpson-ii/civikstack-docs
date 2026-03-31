/*
  # Create doc_categories table

  1. New Tables
    - `doc_categories`
      - `id` (uuid, primary key)
      - `title` (text, not null) - display title of the category
      - `slug` (text, unique, not null) - URL-safe identifier
      - `sort_order` (integer, default 0) - ordering within the sidebar
      - `parent_id` (uuid, nullable) - self-referencing FK for nesting
      - `icon` (text, nullable) - optional Lucide icon name
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)

  2. Security
    - Enable RLS on `doc_categories` table
    - Add policy for public read access (documentation is publicly viewable)
*/

CREATE TABLE IF NOT EXISTS doc_categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  slug text UNIQUE NOT NULL,
  sort_order integer NOT NULL DEFAULT 0,
  parent_id uuid REFERENCES doc_categories(id),
  icon text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE doc_categories ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read doc categories"
  ON doc_categories
  FOR SELECT
  TO anon, authenticated
  USING (true);
