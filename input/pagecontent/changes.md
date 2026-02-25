This page tracks significant changes to the EU Health Data API Implementation Guide. Target: wide review ballot opening March 9, 2026.

**February 25, 2026** — Patient lookup refinements: added design rationale, chained identifier search option, publication identity guidance. Clarified query examples (#12, #23, #67). Merged PR #69 (patient lookup clarifications from #68).

**February 5-6, 2026** — Restructured regulatory anchors with D5.1 query-based exchange interpretation. Replaced broken SVG actor diagrams with PNGs and Mermaid. Added priority categories table with content IG links to front page. Incorporated Euridice meeting feedback.

**February 4, 2026** — Aligned authorization with SMART Backend Services. Added MHD Simplified Publish Option references (#13). Renamed IG from `euridice-api` to `eu-health-data-api`. Added IUA/SMART interoperability STU note (#55).

**February 2, 2026** — Implemented Authorization Server deployment flexibility (#16). Added DocumentReference example instance for EPS (#49). Changed primary resource access reference from QEDm to IPA. Merged PR #52 (Bas review: authorization, category, layout improvements).

**January 26-28, 2026** — Implemented "Receive" interpretation and ITI-105 publication model with Document Submission Option. Implemented Spencer review quick fixes (18 items). Removed unused dependencies (PIXm, bulk data). Updated EHDS Priority Category CodeSystem references.

**January 23, 2026** — Various quick fixes. Improved document category approach.

**January 14, 2026** — Simplified patient lookup to two options: ITI-78 (identifier required) + ITI-119 ($match optional). Reorganized CapabilityStatements around composite actors. Established IPA as primary resource access reference. Improved sequence diagrams with IHE transaction labels.

**January 12, 2026** — Added open issues page with ballot feedback questions. Moved open issues into IG. Changed EU Base to EU Core for resource access data models.

**January 8, 2026** — Consolidated open issues into single tracking page. Added MHD and Resource Access CapabilityStatements. Restructured IG per review feedback. Replaced ASCII diagrams with Mermaid. Fixed heading levels across all pages.

**January 7, 2026** — Initial draft for wide review. Composite actor model built on IHE MHD, PDQm, IUA and HL7 SMART Backend Services. Functional requirements for authorization, patient matching, document exchange, resource access, and capability discovery. Use cases for health professional portals, patient portals, and cross-border NCP exchange. EPS priority area fully specified.

**January 3, 2026** — Major IG restructure. New page hierarchy with Introduction, Functional, Implementation, and Priority Areas sections. Simplified use case pages. Enhanced patient summary example walkthrough. Removed 15 deprecated files.
