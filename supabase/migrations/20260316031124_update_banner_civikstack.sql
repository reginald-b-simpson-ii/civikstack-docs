/*
  # Update banner to CivikStack branding

  1. Changes
    - Updates `banner_text` from old Nextra text to CivikStack announcement
    - Updates `banner_link` to point to CivikStack docs landing
*/

UPDATE doc_meta
SET
  banner_text = 'CivikStack documentation is now live. Explore the platform.',
  banner_link = '/docs/why-civikstack'
WHERE banner_text LIKE '%Nextra%';
