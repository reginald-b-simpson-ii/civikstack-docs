/*
  # Update doc_meta with CivikStack branding

  Updates the site metadata to reflect CivikStack branding:
  - Site title: CivikStack Documentation
  - Logo text: CivikStack docs
  - Description: CivikStack ecosystem documentation
  - Footer text: CivikStack Foundation
*/

INSERT INTO doc_meta (site_title, site_description, logo_text, banner_text, banner_enabled, banner_link, footer_text, github_url)
SELECT
  'CivikStack Documentation',
  'Open infrastructure for measuring whether civic services actually work when residents try to use them.',
  'CivikStack docs',
  '',
  false,
  '',
  'CivikStack Foundation',
  ''
WHERE NOT EXISTS (SELECT 1 FROM doc_meta LIMIT 1);

UPDATE doc_meta SET
  site_title = 'CivikStack Documentation',
  site_description = 'Open infrastructure for measuring whether civic services actually work when residents try to use them.',
  logo_text = 'CivikStack docs',
  footer_text = 'CivikStack Foundation';
