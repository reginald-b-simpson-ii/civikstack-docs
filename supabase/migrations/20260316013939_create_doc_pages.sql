/*
  # Create doc_pages table

  1. New Tables
    - `doc_pages`
      - `id` (uuid, primary key)
      - `category_id` (uuid, FK to doc_categories) - which sidebar section this belongs to
      - `title` (text, not null) - page title
      - `slug` (text, not null) - URL-safe identifier, unique within category
      - `description` (text) - short summary for search results and cards
      - `content` (text, not null) - the documentation content (markdown/HTML)
      - `sort_order` (integer, default 0) - ordering within the category
      - `is_hidden` (boolean, default false) - whether to hide from sidebar
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)

  2. Indexes
    - Unique composite index on (category_id, slug)
    - Index on sort_order for fast ordering

  3. Security
    - Enable RLS on `doc_pages` table
    - Add policy for public read access
*/

CREATE TABLE IF NOT EXISTS doc_pages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  category_id uuid NOT NULL REFERENCES doc_categories(id),
  title text NOT NULL,
  slug text NOT NULL,
  description text DEFAULT '',
  content text NOT NULL DEFAULT '',
  sort_order integer NOT NULL DEFAULT 0,
  is_hidden boolean NOT NULL DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(category_id, slug)
);

CREATE INDEX IF NOT EXISTS idx_doc_pages_sort_order ON doc_pages(sort_order);

ALTER TABLE doc_pages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read doc pages"
  ON doc_pages
  FOR SELECT
  TO anon, authenticated
  USING (is_hidden = false);
