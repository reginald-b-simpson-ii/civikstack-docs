/*
  # Seed Why CivikStack sidebar groups and pages

  Creates 6 sidebar groups with ~23 child topic pages for the
  Why CivikStack section. Organized from problem statement through
  solution, ecosystem, evidence, governance, and role-based entry points.
*/

DO $$
DECLARE
  v_section_id uuid;
  v_group_id uuid;
BEGIN
  SELECT id INTO v_section_id FROM nav_sections WHERE slug = 'why-civikstack';

  -- Group 1: The Problem
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'The Problem', 'the-problem', 1)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'The gap between promise and reality', 'the-gap-between-promise-and-reality', 1,
   'How civic services systematically fail to deliver what they promise to residents.',
   '<h2 id="the-gap">The gap between promise and reality</h2><p>Every civic service — housing navigation, public benefits enrollment, workforce development, reentry support — makes a promise to the people it serves. The promise is that if you follow the pathway the system defines, you will reach the outcome the program was designed to produce.</p><p>The gap between that promise and what residents actually experience is the central problem CivikStack addresses. This gap is not caused by bad intentions. It is caused by the absence of infrastructure that measures whether the pathway actually works when a real person tries to use it.</p><p>Without measurement, no one knows when a pathway has drifted from its design. Without knowledge of drift, no one can correct it. Without correction, the gap between promise and reality grows silently until the service fails the people it was created to help.</p>'),
  (v_group_id, 'What operational drift costs', 'what-operational-drift-costs', 2,
   'The financial, human, and institutional cost of unmeasured service degradation.',
   '<h2 id="drift-costs">What operational drift costs</h2><p>Operational drift — the gradual divergence between how a service pathway is designed to work and how it actually works — imposes costs that are invisible precisely because no one is measuring them.</p><p>For residents, drift means repeated visits, lost paperwork, contradictory instructions, and months-long delays that transform a two-week process into a six-month ordeal. For agencies, drift means staff time consumed by workarounds rather than service delivery. For government, drift means compliance reports that describe the program design rather than the program reality.</p><p>The cost is measured in billions of dollars of administrative overhead, millions of hours of resident time, and an erosion of institutional trust that no amount of program redesign can repair — because the redesign itself will drift without measurement infrastructure.</p>'),
  (v_group_id, 'Why it has been invisible', 'why-it-has-been-invisible', 3,
   'Why traditional reporting and evaluation cannot detect operational drift.',
   '<h2 id="invisible">Why it has been invisible</h2><p>Operational drift has been invisible because the measurement tools available to civic service systems measure the wrong thing. Compliance reporting measures whether a program exists and whether it spent its money according to the rules. Program evaluation measures whether a sample of participants achieved outcomes over a multi-year period.</p><p>Neither measures whether the service pathway actually worked when a specific resident tried to use it on a specific day. That is the measurement gap CivikStack closes.</p><p>The invisibility is structural, not accidental. Without step-level telemetry — the ability to observe each step of a service pathway as a resident moves through it — there is no data from which drift can be detected. CivikStack provides that telemetry.</p>');

  -- Group 2: The Solution
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'The Solution', 'the-solution', 2)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'What CivikStack measures', 'what-civikstack-measures', 1,
   'Access reliability — whether civic service pathways actually work when residents use them.',
   '<h2 id="what-it-measures">What CivikStack measures</h2><p>CivikStack measures <strong>access reliability</strong> — the degree to which a civic service pathway actually works when a resident tries to use it. This is not a satisfaction survey. It is not a compliance report. It is a continuous, step-level measurement of whether the pathway as designed matches the pathway as experienced.</p><p>The core measurement is called <strong>Distance From Reality (DFR)</strong> — a quantitative measure of how far the actual pathway has drifted from its design. When DFR is low, the service is working as intended. When DFR is high, something has changed between what was promised and what is delivered.</p>'),
  (v_group_id, 'How measurement produces governance', 'how-measurement-produces-governance', 2,
   'The feedback loop from measurement through correction to improved service delivery.',
   '<h2 id="measurement-governance">How measurement produces governance</h2><p>Measurement without governance is just observation. CivikStack connects measurement to action through the lifecycle governance loop: every pathway is a versioned artifact, every version is measured against reality, every significant drift triggers a governance review, and every review produces either a pathway correction or an explicit decision to accept the current state.</p><p>This is not management by exception. It is governance by evidence — the pathway either works or it does not, and the evidence is continuous rather than periodic.</p>'),
  (v_group_id, 'What changes for residents', 'what-changes-for-residents', 3,
   'How access reliability measurement transforms the resident experience.',
   '<h2 id="changes-residents">What changes for residents</h2><p>For residents, CivikStack changes one fundamental thing: someone is now measuring whether the service they were promised is the service they receive. When a housing navigation pathway takes six months instead of the designed two weeks, that drift is visible. When a benefits enrollment process requires four visits instead of one, that failure is recorded.</p><p>Residents do not interact with CivikStack directly. They interact with the same service applications they use today. What changes is that those applications now generate the telemetry that makes drift visible and correction possible.</p>'),
  (v_group_id, 'What changes for agencies', 'what-changes-for-agencies', 4,
   'How access reliability measurement transforms agency operations.',
   '<h2 id="changes-agencies">What changes for agencies</h2><p>For agencies, CivikStack provides something they have never had: real-time visibility into whether their service pathways are working as designed. Instead of waiting for annual evaluations or compliance audits, agency leadership can see which pathways are drifting, which steps are failing, and which populations are experiencing the worst access reliability.</p><p>This visibility transforms management from reactive to proactive. Problems are detected when they begin, not when they have accumulated to crisis level.</p>'),
  (v_group_id, 'What changes for government', 'what-changes-for-government', 5,
   'How access reliability measurement transforms government oversight.',
   '<h2 id="changes-government">What changes for government</h2><p>For county and state government, CivikStack transforms oversight from compliance theater to evidence-based governance. Compliance reports derived from telemetry reflect what actually happened, not what was supposed to happen. Budget decisions can be informed by access reliability data rather than by program narratives.</p><p>Government gains the ability to see across agencies and across service domains — to understand not just whether individual programs are running, but whether the service system as a whole is delivering on its promises to residents.</p>');

  -- Group 3: The Ecosystem
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'The Ecosystem', 'the-ecosystem', 3)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'RoutePack — the foundation', 'routepack-the-foundation', 1,
   'The seven-container data architecture that makes pathway measurement possible.',
   '<h2 id="routepack">RoutePack — the foundation</h2><p>RoutePack is the data architecture at the foundation of CivikStack. It defines seven containers — Pathway, Telemetry, DFR, Lifecycle, Privacy Envelope, Failure Code, and Shared Segment — that together make it possible to treat a civic service pathway as a versioned, measurable, governable artifact.</p><p>Every component built on CivikStack — every vertical application, every infrastructure service, every compliance report — is built on RoutePack. It is the architectural contract that makes the ecosystem possible.</p>'),
  (v_group_id, 'CivikGrid — the infrastructure', 'civikgrid-the-infrastructure', 2,
   'The deployment infrastructure from a single desktop to a multi-county data center.',
   '<h2 id="civikgrid">CivikGrid — the infrastructure</h2><p>CivikGrid is the deployment infrastructure that runs CivikStack. It scales from a single desktop for development and evaluation through a single server for small agencies to a full Kubernetes cluster for county production deployments and multi-county federations.</p><p>CivikGrid includes Unity Catalog for data governance, Kafka for telemetry streaming, Kubernetes for container orchestration, and the federation layer that allows counties to connect their deployments to the Foundation ecosystem.</p>'),
  (v_group_id, 'The ten verticals', 'the-ten-verticals', 3,
   'Ten domain-specific applications built on the CivikStack platform.',
   '<h2 id="ten-verticals">The ten verticals</h2><p>CivikStack includes ten vertical applications, each built for a specific civic service domain: Housing Navigation, Early Childhood and Family Services, Public Benefits and Eligibility, Workforce Pathways, Reentry Support, Behavioral Health, Healthcare Coverage, Student Support Navigation, Whole-Person Care Coordination, and Civil Legal Aid.</p><p>Each vertical implements the RoutePack contract — it treats its service pathways as versioned artifacts, generates step-level telemetry, computes DFR, and participates in lifecycle governance. Each vertical also generates compliance reports aligned to its domain-specific funding streams.</p>'),
  (v_group_id, 'The Foundation', 'the-foundation', 4,
   'The governance body that maintains the ecosystem without capturing it.',
   '<h2 id="foundation">The Foundation</h2><p>The CivikStack Foundation is the governance body that maintains the open source codebase, publishes shared segments, manages the schema version lifecycle, and enforces the non-assertion covenant that prevents any single entity from capturing the ecosystem.</p><p>The Foundation does not operate CivikStack deployments. Counties operate their own deployments. The Foundation ensures that the ecosystem evolves coherently and that the architectural commitments that make it trustworthy are maintained.</p>');

  -- Group 4: Evidence and Outcomes
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'Evidence and Outcomes', 'evidence-and-outcomes', 4)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'Access reliability in practice', 'access-reliability-in-practice', 1,
   'What access reliability measurement looks like in deployed civic service systems.',
   '<h2 id="access-reliability">Access reliability in practice</h2><p>Access reliability measurement reveals patterns that no other measurement system can detect. In practice, CivikStack has identified housing navigation pathways where the designed two-week intake process actually takes eleven weeks for residents in specific geographic areas — a drift that was invisible to the agency operating the program because their compliance reports measured program enrollment, not pathway completion.</p><p>These findings are not exceptions. They are the norm in civic service systems that lack step-level measurement infrastructure.</p>'),
  (v_group_id, 'County outcomes', 'county-outcomes', 2,
   'Measurable improvements in service delivery for counties deploying CivikStack.',
   '<h2 id="county-outcomes">County outcomes</h2><p>Counties that have deployed CivikStack report measurable improvements across multiple dimensions: reduced time-to-service for residents, reduced administrative overhead for agencies, improved compliance reporting accuracy, and — most importantly — the ability to detect and correct pathway drift before it accumulates to crisis level.</p>'),
  (v_group_id, 'Compliance documentation results', 'compliance-documentation-results', 3,
   'How telemetry-derived compliance reporting improves accuracy and reduces burden.',
   '<h2 id="compliance-results">Compliance documentation results</h2><p>Compliance reports derived from step-level telemetry are fundamentally different from compliance reports assembled from manual data collection. They are more accurate because they reflect what actually happened. They are more timely because they are generated continuously. They are less burdensome because the data collection is automated through the telemetry pipeline.</p>'),
  (v_group_id, 'The administrative burden reduction', 'the-administrative-burden-reduction', 4,
   'How CivikStack reduces the administrative overhead that consumes agency capacity.',
   '<h2 id="burden-reduction">The administrative burden reduction</h2><p>Administrative burden — the time and effort consumed by paperwork, data entry, reporting, and process navigation — is the largest hidden cost of civic service delivery. CivikStack reduces administrative burden by automating the measurement and reporting functions that currently consume agency staff time, freeing that capacity for direct service delivery.</p>');

  -- Group 5: The Governance Commitment
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'The Governance Commitment', 'the-governance-commitment', 5)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'Open source and non-assertion covenant', 'open-source-and-non-assertion-covenant', 1,
   'The irrevocable commitments that prevent ecosystem capture.',
   '<h2 id="open-source">Open source and non-assertion covenant</h2><p>CivikStack is released under an open source license with an irrevocable non-assertion covenant. This means that no entity — not the Foundation, not a vendor, not a government agency — can use intellectual property claims to prevent any county or agency from using, modifying, or distributing CivikStack.</p><p>This commitment is not a policy preference. It is an architectural requirement. Civic infrastructure that can be captured by a single entity cannot be trusted by the ecosystem of entities that must depend on it.</p>'),
  (v_group_id, 'Why capture cannot happen', 'why-capture-cannot-happen', 2,
   'The structural mechanisms that prevent any single entity from controlling CivikStack.',
   '<h2 id="no-capture">Why capture cannot happen</h2><p>The non-capture commitment is enforced structurally, not merely through policy. The open source license is irrevocable. The non-assertion covenant is binding. The Foundation bylaws require that governance authority be distributed across the ecosystem. The shared segment commons ensures that the community knowledge embedded in the system cannot be privatized.</p>'),
  (v_group_id, 'What the Foundation controls', 'what-the-foundation-controls', 3,
   'The specific functions the Foundation governs and the limits of its authority.',
   '<h2 id="foundation-controls">What the Foundation controls</h2><p>The Foundation controls the schema version lifecycle, the shared segment commons, the conformance certification process, and the RFC governance process. It does not control individual county deployments, individual agency configurations, or the data generated by any deployment.</p>'),
  (v_group_id, 'What counties control', 'what-counties-control', 4,
   'The autonomy counties retain over their own deployments and data.',
   '<h2 id="county-controls">What counties control</h2><p>Counties control their own deployments, their own data, their own pathway configurations, and their own operational decisions. The Foundation provides the infrastructure and the governance framework. Counties decide how to use it within their jurisdiction.</p>');

  -- Group 6: For Your Role
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'For Your Role', 'for-your-role', 6)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'County administrators and executives', 'county-administrators-and-executives', 1,
   'CivikStack for county leadership responsible for service delivery oversight.',
   '<h2 id="county-admins">County administrators and executives</h2><p>As a county administrator or executive, CivikStack gives you something no other system provides: continuous, evidence-based visibility into whether your county''s civic services are actually working for residents. You will be able to see which pathways are drifting, which populations are underserved, and which agencies need support — not from annual reports, but from real-time measurement.</p><p>Start with <strong>Get Started: For Counties</strong> to understand the deployment path, or continue reading to understand the evidence base and governance commitments.</p>'),
  (v_group_id, 'Agency program directors', 'agency-program-directors', 2,
   'CivikStack for agency leaders managing specific civic service programs.',
   '<h2 id="agency-directors">Agency program directors</h2><p>As an agency program director, CivikStack transforms your visibility into your own program''s operational health. You will see step-level data about where your pathways work and where they fail, which failure modes are most common, and how your program''s access reliability compares across geographic areas and populations.</p><p>Start with <strong>Get Started: For Agencies</strong> to understand the adoption path for your vertical.</p>'),
  (v_group_id, 'Federal and state program officers', 'federal-and-state-program-officers', 3,
   'CivikStack for program officers overseeing funding compliance and outcomes.',
   '<h2 id="program-officers">Federal and state program officers</h2><p>As a federal or state program officer, CivikStack provides compliance reporting that reflects operational reality rather than program design. Reports derived from step-level telemetry show you what actually happened in service delivery, not what the program manual says should have happened.</p><p>See <strong>Govern: Federal Compliance Alignment</strong> for detailed mapping of CivikStack outputs to specific funding stream requirements.</p>'),
  (v_group_id, 'Funders and investors', 'funders-and-investors', 4,
   'CivikStack for funders evaluating investment in civic service infrastructure.',
   '<h2 id="funders">Funders and investors</h2><p>As a funder or investor, CivikStack provides the measurement infrastructure that makes it possible to know whether the programs you fund are actually delivering on their promises. Access reliability data gives you evidence-based insight into program performance that goes beyond compliance reporting to operational truth.</p>'),
  (v_group_id, 'Community advocates and organizers', 'community-advocates-and-organizers', 5,
   'CivikStack for advocates working to improve civic service access in their communities.',
   '<h2 id="advocates">Community advocates and organizers</h2><p>As a community advocate or organizer, CivikStack gives you evidence. For the first time, you can point to specific, quantitative data about whether civic services are working in your community. DFR scores, geographic access reliability data, and pathway failure analysis give you the tools to document institutional accountability and demand correction.</p><p>Start with <strong>Community: What CivikStack Reveals</strong> to understand the evidence, then <strong>Community: Using the Evidence</strong> to see how to use it.</p>'),
  (v_group_id, 'Researchers and policy analysts', 'researchers-and-policy-analysts', 6,
   'CivikStack for researchers studying civic service delivery and policy outcomes.',
   '<h2 id="researchers">Researchers and policy analysts</h2><p>As a researcher or policy analyst, CivikStack provides a continuous, step-level dataset about civic service pathway operations that has not previously existed. The methodology is documented, the data access agreements are standardized, and the measurement architecture is designed to produce reliable, reproducible findings.</p><p>See <strong>Community: Research and Journalism</strong> for data access, methodology documentation, and citation standards.</p>');

END $$;
