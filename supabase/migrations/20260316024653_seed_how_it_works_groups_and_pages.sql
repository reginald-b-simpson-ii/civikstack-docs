/*
  # Seed How It Works sidebar groups and pages

  Creates 7 sidebar groups with ~38 child topic pages for the
  How It Works section. Organized from core mechanism through
  RoutePack, CivikGrid, verticals, interagency, design doctrine, and compliance.
*/

DO $$
DECLARE
  v_section_id uuid;
  v_group_id uuid;
BEGIN
  SELECT id INTO v_section_id FROM nav_sections WHERE slug = 'how-it-works';

  -- Group 1: The Core Mechanism
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'The Core Mechanism', 'the-core-mechanism', 1)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'Service pathways as versioned artifacts', 'service-pathways-as-versioned-artifacts', 1,
   'How CivikStack treats every service pathway as a versioned, measurable object.',
   '<h2 id="versioned-artifacts">Service pathways as versioned artifacts</h2><p>In CivikStack, every civic service pathway — the sequence of steps a resident follows to access a service — is treated as a versioned artifact. Like source code in a version control system, each pathway has a defined structure, a version history, and a measurable state. When the pathway changes, a new version is published. When the pathway drifts from its design, the drift is detected and measured.</p><p>This is the foundational architectural decision that makes everything else possible. Without versioning, there is no baseline to measure against. Without measurement, there is no evidence of drift. Without evidence, there is no governance.</p>'),
  (v_group_id, 'What step-level telemetry is', 'what-step-level-telemetry-is', 2,
   'The continuous observation of each step in a service pathway as residents move through it.',
   '<h2 id="step-telemetry">What step-level telemetry is</h2><p>Step-level telemetry is the continuous observation of each step in a service pathway as a resident moves through it. When a resident begins a housing intake process, each step — initial contact, eligibility screening, document collection, assessment, referral, placement — generates a telemetry event that records what happened, when it happened, and whether the step succeeded or failed.</p><p>This telemetry is not surveillance. The Privacy Envelope ensures that telemetry data is structurally separated from personally identifiable information. What is measured is the pathway''s operational health, not the resident''s personal journey.</p>'),
  (v_group_id, 'Distance From Reality — the measurement', 'distance-from-reality-the-measurement', 3,
   'The quantitative measure of how far a pathway has drifted from its design.',
   '<h2 id="dfr">Distance From Reality — the measurement</h2><p>Distance From Reality (DFR) is the core quantitative measure in CivikStack. It computes the distance between the pathway as designed (the versioned artifact) and the pathway as experienced (the telemetry record). A DFR of zero means the pathway is working exactly as designed. As DFR increases, the pathway has drifted further from its intended operation.</p><p>DFR is computed continuously from the telemetry stream. It is not a periodic assessment or a sample-based evaluation. It is a real-time measurement of operational health.</p>'),
  (v_group_id, 'Lifecycle governance — the correction loop', 'lifecycle-governance-the-correction-loop', 4,
   'How detected drift triggers governance review and pathway correction.',
   '<h2 id="lifecycle-governance">Lifecycle governance — the correction loop</h2><p>The lifecycle governance loop is the mechanism that connects measurement to action. When DFR exceeds a threshold, the pathway enters a governance review state. The review determines whether the drift requires a pathway correction (the design is right but the operation has drifted) or a pathway revision (the operation is right but the design needs updating).</p><p>This closed loop — measure, detect, review, correct — is what transforms CivikStack from a measurement system into a governance system.</p>'),
  (v_group_id, 'Privacy as architecture — not policy', 'privacy-as-architecture-not-policy', 5,
   'How the Privacy Envelope ensures privacy through structural separation rather than policy controls.',
   '<h2 id="privacy-architecture">Privacy as architecture — not policy</h2><p>CivikStack implements privacy as an architectural constraint, not a policy preference. The Privacy Envelope structurally separates telemetry data from personally identifiable information at the data layer. It is not possible to reconstruct a resident''s identity from the telemetry stream because the identifying information is never present in the telemetry pipeline.</p><p>This is a stronger guarantee than policy-based privacy controls, which depend on compliance and can be overridden. Architectural privacy cannot be overridden without changing the architecture itself.</p>');

  -- Group 2: The Foundation: RoutePack
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'The Foundation: RoutePack', 'the-foundation-routepack', 2)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'The seven containers', 'the-seven-containers', 1,
   'The seven data containers that compose the RoutePack architecture.',
   '<h2 id="seven-containers">The seven containers</h2><p>RoutePack defines seven containers: <strong>Pathway</strong> (the versioned service pathway artifact), <strong>Telemetry</strong> (step-level operational events), <strong>DFR</strong> (distance from reality computations), <strong>Lifecycle</strong> (governance state transitions), <strong>Privacy Envelope</strong> (structural PII separation), <strong>Failure Code</strong> (standardized failure taxonomy), and <strong>Shared Segment</strong> (community-governed pathway components).</p><p>Together, these seven containers provide the complete data architecture needed to treat a civic service pathway as a measurable, governable artifact.</p>'),
  (v_group_id, 'The closed-loop control architecture', 'the-closed-loop-control-architecture', 2,
   'How the seven containers work together as a closed-loop governance system.',
   '<h2 id="closed-loop">The closed-loop control architecture</h2><p>The seven containers form a closed-loop control system. Pathways define the intended operation. Telemetry observes the actual operation. DFR measures the distance between them. Lifecycle governance triggers correction when the distance exceeds acceptable thresholds. The Privacy Envelope constrains what can be observed. Failure Codes standardize how failures are classified. Shared Segments ensure that community knowledge is preserved across pathway versions.</p>'),
  (v_group_id, 'The pathway artifact in detail', 'the-pathway-artifact-in-detail', 3,
   'Technical specification of the pathway versioned artifact structure.',
   '<h2 id="pathway-artifact">The pathway artifact in detail</h2><p>A pathway artifact is a structured document that defines every step in a civic service pathway, the expected sequence, the expected duration, the success and failure conditions for each step, and the relationships between steps. It is versioned — every change produces a new version with a traceable history.</p><p>The pathway artifact is the baseline against which all telemetry is measured. It is the "design" half of the design-vs-reality comparison that DFR computes.</p>'),
  (v_group_id, 'The telemetry event in detail', 'the-telemetry-event-in-detail', 4,
   'Technical specification of the telemetry event schema and semantics.',
   '<h2 id="telemetry-event">The telemetry event in detail</h2><p>A telemetry event is a structured record of a single step outcome in a service pathway. It records the pathway version, the step identifier, the timestamp, the outcome (success, failure, or timeout), the failure code if applicable, and the metadata needed for DFR computation — all within the Privacy Envelope constraint that no personally identifiable information is present in the event.</p>'),
  (v_group_id, 'The DFR formula in detail', 'the-dfr-formula-in-detail', 5,
   'The mathematical specification of the Distance From Reality computation.',
   '<h2 id="dfr-formula">The DFR formula in detail</h2><p>The DFR formula computes a normalized distance between the designed pathway and the observed pathway across multiple dimensions: step completion rates, step duration distributions, failure mode frequencies, and sequence adherence. The formula produces a single scalar value that summarizes the pathway''s operational health.</p><p>The formula is documented in full in the Build section for developers who need to implement or verify DFR computation.</p>'),
  (v_group_id, 'The lifecycle state machine', 'the-lifecycle-state-machine', 6,
   'The formal state machine governing pathway lifecycle transitions.',
   '<h2 id="lifecycle-state-machine">The lifecycle state machine</h2><p>Every pathway exists in one of a defined set of lifecycle states: Draft, Published, Active, Drifting, Under Review, Corrected, Deprecated, and Archived. Transitions between states are governed by the lifecycle state machine, which defines what conditions trigger each transition and what governance actions are required.</p>');

  -- Group 3: The Infrastructure: CivikGrid
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'The Infrastructure: CivikGrid', 'the-infrastructure-civikgrid', 3)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'From desktop to data center', 'from-desktop-to-data-center', 1,
   'How CivikGrid scales from development to production to multi-county federation.',
   '<h2 id="desktop-to-datacenter">From desktop to data center</h2><p>CivikGrid is designed to scale across five tiers: Tier 1 (Desktop and development), Tier 2 (Single server), Tier 3 (Small cluster), Tier 4 (County production), and Tier 5 (Multi-county and data center). The same RoutePack architecture runs at every tier — what changes is the infrastructure that supports it.</p>'),
  (v_group_id, 'Unity Catalog and data governance', 'unity-catalog-and-data-governance', 2,
   'How Unity Catalog provides the data governance layer for CivikStack.',
   '<h2 id="unity-catalog">Unity Catalog and data governance</h2><p>Unity Catalog provides the data governance layer that controls access to telemetry data, DFR computations, and compliance reporting outputs. It enforces the Privacy Envelope at the data access layer — even if a query could theoretically reconstruct identifying information, Unity Catalog prevents the query from executing.</p>'),
  (v_group_id, 'Kafka and the telemetry pipeline', 'kafka-and-the-telemetry-pipeline', 3,
   'How Kafka provides the real-time telemetry streaming infrastructure.',
   '<h2 id="kafka-telemetry">Kafka and the telemetry pipeline</h2><p>Kafka provides the real-time streaming infrastructure that moves telemetry events from vertical applications to the DFR computation engine and from the DFR engine to the governance and reporting systems. The topic architecture is designed to maintain Privacy Envelope separation at the transport layer.</p>'),
  (v_group_id, 'Kubernetes and the deployment model', 'kubernetes-and-the-deployment-model', 4,
   'How Kubernetes provides the container orchestration for CivikGrid.',
   '<h2 id="kubernetes">Kubernetes and the deployment model</h2><p>CivikGrid uses Kubernetes for container orchestration at Tier 3 and above. The namespace architecture isolates vertical applications from each other and from the infrastructure services. Network policies enforce the architectural boundaries that prevent unauthorized data flow between components.</p>'),
  (v_group_id, 'Federation — how counties connect', 'federation-how-counties-connect', 5,
   'How independent county deployments federate to form the CivikStack ecosystem.',
   '<h2 id="federation">Federation — how counties connect</h2><p>Federation is the mechanism that connects independent county CivikGrid deployments into the broader CivikStack ecosystem. Counties share anonymized access reliability data, shared segment versions, and schema updates through the federation layer — while maintaining complete control over their own deployment and their own resident data.</p>'),
  (v_group_id, 'The Publish Gate', 'the-publish-gate', 6,
   'The quality and conformance gate for pathway publication.',
   '<h2 id="publish-gate">The Publish Gate</h2><p>The Publish Gate is the conformance checkpoint that every pathway must pass before it can be published to production. It validates that the pathway artifact conforms to the RoutePack schema, that telemetry integration is correct, that the Privacy Envelope is maintained, and that the pathway meets the vertical contract requirements.</p>');

  -- Group 4: The Ten Verticals
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'The Ten Verticals', 'the-ten-verticals', 4)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'Housing Navigation', 'housing-navigation', 1, 'Access reliability for housing services.', '<h2 id="housing">Housing Navigation</h2><p>The Housing Navigation vertical provides access reliability measurement for housing services including coordinated entry, rapid re-housing, permanent supportive housing, and transitional housing pathways. It generates compliance outputs aligned to HUD Continuum of Care and HMIS requirements.</p>'),
  (v_group_id, 'Early Childhood and Family Services', 'early-childhood-and-family-services', 2, 'Access reliability for early childhood programs.', '<h2 id="early-childhood">Early Childhood and Family Services</h2><p>The Early Childhood vertical covers childcare access, Head Start enrollment, home visiting programs, early intervention services, and family support pathways. It measures whether families can actually access the services they are referred to within the timeframes the programs promise.</p>'),
  (v_group_id, 'Public Benefits and Eligibility', 'public-benefits-and-eligibility', 3, 'Access reliability for benefits enrollment.', '<h2 id="benefits">Public Benefits and Eligibility</h2><p>The Public Benefits vertical measures access reliability for Medicaid enrollment, SNAP benefits, TANF, childcare subsidies, and other public benefit programs. It generates compliance outputs aligned to CMS Medicaid and SNAP reporting requirements.</p>'),
  (v_group_id, 'Workforce Pathways', 'workforce-pathways', 4, 'Access reliability for workforce development.', '<h2 id="workforce">Workforce Pathways</h2><p>The Workforce vertical measures access reliability for job training, career counseling, supportive services, and employment placement pathways. It generates compliance outputs aligned to WIOA Title I requirements.</p>'),
  (v_group_id, 'Reentry Support', 'reentry-support', 5, 'Access reliability for reentry services.', '<h2 id="reentry">Reentry Support</h2><p>The Reentry vertical measures access reliability for people returning from incarceration — housing placement, employment assistance, substance use treatment, family reunification, and supervision compliance pathways. It generates compliance outputs aligned to Second Chance Act requirements.</p>'),
  (v_group_id, 'Behavioral Health', 'behavioral-health', 6, 'Access reliability for behavioral health services.', '<h2 id="behavioral-health">Behavioral Health</h2><p>The Behavioral Health vertical measures access reliability for mental health services, substance use treatment, crisis intervention, and 988 crisis line follow-up pathways. It generates compliance outputs aligned to CCBHC and 988 reporting requirements.</p>'),
  (v_group_id, 'Healthcare Coverage', 'healthcare-coverage', 7, 'Access reliability for healthcare coverage enrollment.', '<h2 id="healthcare">Healthcare Coverage</h2><p>The Healthcare Coverage vertical measures access reliability for managed care enrollment, plan selection, primary care assignment, and care coordination pathways. It generates compliance outputs aligned to CMS managed care requirements.</p>'),
  (v_group_id, 'Student Support Navigation', 'student-support-navigation', 8, 'Access reliability for student support services.', '<h2 id="student-support">Student Support Navigation</h2><p>The Student Support vertical measures access reliability for McKinney-Vento homeless student services, IDEA special education pathways, school-based mental health, and family engagement pathways. It generates compliance outputs aligned to McKinney-Vento and IDEA requirements.</p>'),
  (v_group_id, 'Whole-Person Care Coordination', 'whole-person-care-coordination', 9, 'Access reliability for cross-system care coordination.', '<h2 id="whole-person">Whole-Person Care Coordination</h2><p>The Whole-Person Care vertical measures access reliability across multiple service domains simultaneously — coordinating housing, healthcare, behavioral health, employment, and benefits into a unified pathway. It is the most complex vertical because it spans the cross-vertical shared segment commons.</p>'),
  (v_group_id, 'Civil Legal Aid', 'civil-legal-aid', 10, 'Access reliability for civil legal services.', '<h2 id="legal-aid">Civil Legal Aid</h2><p>The Civil Legal Aid vertical measures access reliability for legal assistance pathways including housing court representation, benefits appeals, family law matters, and consumer protection. It generates compliance outputs aligned to LSC performance reporting requirements.</p>');

  -- Group 5: Interagency Coordination
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'Interagency Coordination', 'interagency-coordination', 5)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'How referrals work in CivikStack', 'how-referrals-work-in-civikstack', 1, 'Cross-vertical referral architecture.', '<h2 id="referrals">How referrals work in CivikStack</h2><p>In CivikStack, a referral between agencies is a cross-vertical pathway transition — it is measured, versioned, and governed like any other pathway step. When a housing navigator refers a resident to benefits enrollment, that referral generates telemetry in both verticals, and the DFR computation tracks whether the referral actually resulted in the intended service connection.</p>'),
  (v_group_id, 'The cross-vertical shared segment commons', 'the-cross-vertical-shared-segment-commons', 2, 'How shared pathway segments work across verticals.', '<h2 id="shared-segments">The cross-vertical shared segment commons</h2><p>Shared segments are pathway components that appear in multiple verticals — eligibility verification, document collection, consent management, and similar cross-cutting functions. The shared segment commons ensures that these components are defined once, governed collectively, and used consistently across all verticals that need them.</p>'),
  (v_group_id, 'Life event orchestration', 'life-event-orchestration', 3, 'How CivikStack coordinates across life events.', '<h2 id="life-events">Life event orchestration</h2><p>Life event orchestration is the coordination of multiple service pathways triggered by a single life event — job loss, housing instability, family crisis, or reentry from incarceration. CivikStack measures the coordination reliability of these multi-pathway responses, not just the individual pathway reliability.</p>'),
  (v_group_id, 'The interagency coordination network', 'the-interagency-coordination-network', 4, 'The network layer enabling cross-agency service coordination.', '<h2 id="coordination-network">The interagency coordination network</h2><p>The interagency coordination network is the infrastructure layer that enables agencies to coordinate service delivery across vertical boundaries while maintaining the Privacy Envelope and respecting the data governance constraints of each participating agency.</p>');

  -- Group 6: The Design Doctrine
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'The Design Doctrine', 'the-design-doctrine', 6)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'What Wayfinder governs', 'what-wayfinder-governs', 1, 'The Wayfinder design system scope.', '<h2 id="wayfinder-governs">What Wayfinder governs</h2><p>Wayfinder is the design doctrine that governs all CivikStack surfaces, components, and interactions. It establishes five constraints — Truth, Reliability, Fidelity, Elegance, and Evolution — that every design decision must satisfy.</p>'),
  (v_group_id, 'Truth — the foundational constraint', 'truth-the-foundational-constraint', 2, 'The requirement for truthful representation.', '<h2 id="truth">Truth — the foundational constraint</h2><p>Truth is the requirement that every surface in CivikStack accurately represents the underlying operational reality. No dashboard may show a metric that contradicts the telemetry. No report may claim an outcome that the data does not support. Truth is non-negotiable.</p>'),
  (v_group_id, 'Reliability — the operational constraint', 'reliability-the-operational-constraint', 3, 'The requirement for consistent, dependable operation.', '<h2 id="reliability">Reliability — the operational constraint</h2><p>Reliability is the requirement that every CivikStack component operates consistently and predictably. A frontline worker must be able to trust that the application will work the same way every time. An agency director must be able to trust that the metrics are computed consistently.</p>'),
  (v_group_id, 'Fidelity — the meaning constraint', 'fidelity-the-meaning-constraint', 4, 'The requirement for faithful representation of domain meaning.', '<h2 id="fidelity">Fidelity — the meaning constraint</h2><p>Fidelity is the requirement that every representation in CivikStack faithfully preserves the meaning of the underlying domain. A housing pathway must be represented in terms that housing practitioners recognize. A benefits enrollment process must use the terminology that benefits workers use.</p>'),
  (v_group_id, 'Elegance — the form constraint', 'elegance-the-form-constraint', 5, 'The requirement for clarity and simplicity in design.', '<h2 id="elegance">Elegance — the form constraint</h2><p>Elegance is the requirement that every CivikStack surface achieves its purpose with the minimum necessary complexity. Elegance is not decoration — it is the discipline of removing everything that does not serve the user''s task.</p>'),
  (v_group_id, 'Evolution — the continuity constraint', 'evolution-the-continuity-constraint', 6, 'The requirement for graceful change over time.', '<h2 id="evolution">Evolution — the continuity constraint</h2><p>Evolution is the requirement that CivikStack can change without breaking. Every schema change, every pathway revision, every governance process modification must be designed to preserve continuity for the people and systems that depend on the current state.</p>');

  -- Group 7: Compliance Reporting
  INSERT INTO sidebar_groups (section_id, title, slug, sort_order)
  VALUES (v_section_id, 'Compliance Reporting', 'compliance-reporting', 7)
  RETURNING id INTO v_group_id;

  INSERT INTO section_pages (group_id, title, slug, sort_order, description, content) VALUES
  (v_group_id, 'How reports derive from telemetry', 'how-reports-derive-from-telemetry', 1, 'The telemetry-to-reporting pipeline.', '<h2 id="reports-telemetry">How reports derive from telemetry</h2><p>Compliance reports in CivikStack are not assembled from manual data collection. They are derived directly from the telemetry stream — the same data that computes DFR also produces the metrics required by federal and state compliance frameworks. This means the reports reflect what actually happened, not what someone entered into a reporting form.</p>'),
  (v_group_id, 'Mapping to federal requirements', 'mapping-to-federal-requirements', 2, 'How telemetry maps to specific federal compliance frameworks.', '<h2 id="federal-mapping">Mapping to federal requirements</h2><p>Each vertical maps its telemetry events to the specific data elements required by its federal funding streams. The Housing vertical maps to HUD CoC and HMIS requirements. The Benefits vertical maps to CMS Medicaid and SNAP requirements. These mappings are maintained as part of the vertical contract and validated through the conformance test suite.</p>'),
  (v_group_id, 'The audit trail', 'the-audit-trail', 3, 'How CivikStack maintains a complete audit trail.', '<h2 id="audit-trail">The audit trail</h2><p>Every telemetry event, every DFR computation, every lifecycle state transition, and every compliance report is part of an immutable audit trail. The audit trail is maintained by the infrastructure — it cannot be modified after creation. This provides the evidentiary foundation that compliance officers and auditors require.</p>'),
  (v_group_id, 'What CivikStack reporting does and does not cover', 'what-civikstack-reporting-does-and-does-not-cover', 4, 'Scope and limitations of CivikStack compliance reporting.', '<h2 id="reporting-scope">What CivikStack reporting does and does not cover</h2><p>CivikStack compliance reporting covers the operational metrics that can be derived from step-level telemetry — service delivery events, outcome tracking, and access reliability measures. It does not cover financial reporting, personnel management, or programmatic metrics that require data sources outside the service delivery pathway.</p>');

END $$;
