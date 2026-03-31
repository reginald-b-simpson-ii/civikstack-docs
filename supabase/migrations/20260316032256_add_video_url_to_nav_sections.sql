/*
  # Add video_url column to nav_sections

  1. Modified Tables
    - `nav_sections`
      - Added `video_url` (text, nullable) - URL for the section landing page video

  2. Notes
    - Column is nullable so sections without videos show a placeholder
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'nav_sections' AND column_name = 'video_url'
  ) THEN
    ALTER TABLE nav_sections ADD COLUMN video_url text;
  END IF;
END $$;