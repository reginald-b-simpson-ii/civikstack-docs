/*
  # Seed CivikStack navigation sections

  Inserts the 6 top-level navigation sections:
  1. Why CivikStack - entry point for evaluating relevance
  2. How It Works - mechanism and architecture explanation
  3. Get Started - deployment and adoption paths
  4. Build - technical reference for developers
  5. Govern - constitutional and process governance
  6. Community - advocates, residents, practitioners, researchers
*/

INSERT INTO nav_sections (slug, label, sort_order, landing_title, landing_subtitle, landing_body) VALUES
(
  'why-civikstack',
  'Why CivikStack',
  1,
  'Why CivikStack',
  'Every year, billions of dollars flow into civic services. Almost none of it is measured by whether the service actually worked when a resident tried to use it. CivikStack is the infrastructure that closes that gap.',
  'Select a section in the sidebar to explore the case for CivikStack, the evidence behind it, and the governance commitments that make it trustworthy.'
),
(
  'how-it-works',
  'How It Works',
  2,
  'How It Works',
  'CivikStack treats every civic service pathway as a versioned, measurable artifact with operational health monitoring. This section explains the mechanism from the pathway artifact through drift detection to governance and correction.',
  'Start with The Core Mechanism for a plain-language explanation, or jump to The Foundation: RoutePack for the technical architecture.'
),
(
  'get-started',
  'Get Started',
  3,
  'Get Started',
  'Whether you are a county deploying CivikGrid, an agency adopting a vertical, a frontline worker learning your application, or a compliance officer generating your first report — your path starts here.',
  'Select your role in the sidebar to begin. Each path is complete for its task — you will not need to read sections written for a different role to accomplish your primary goal.'
),
(
  'build',
  'Build',
  4,
  'Build',
  'Technical reference for civic technologists, platform engineers, and vertical application developers building on, deploying, or extending the CivikStack infrastructure.',
  'Start with Architecture for the full system picture, then Schemas and APIs for the data contracts, then Building a Vertical Application for the step-by-step construction guide.'
),
(
  'govern',
  'Govern',
  5,
  'Govern',
  'The constitutional framework, RFC process, working group structure, shared segment commons, federal compliance alignment, and Foundation governance for the CivikStack ecosystem.',
  'The Constitution establishes what cannot be changed by any single actor. The RFC Process describes how the community governs evolution. Federal Compliance Alignment maps CivikStack outputs to specific funding stream requirements.'
),
(
  'community',
  'Community',
  6,
  'Community',
  'CivikStack is infrastructure for people who refuse to let the gap between promised and actual civic services be invisible. This section is for community advocates, residents, practitioners, researchers, and journalists.',
  'Start with What CivikStack Reveals to understand what the system measures, then Using the Evidence to see how access reliability data supports accountability.'
);
