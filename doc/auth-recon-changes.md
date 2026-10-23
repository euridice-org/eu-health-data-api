# Authorization Reconciliation Branch Changes

## Scope and comparison basis

This summary covers the `eu-health-data-api-ballot-recon-auth` worktree as inspected on 2026-10-23. The committed comparison starts at the branch's merge base with `origin/main` (`4dfaccefd7095d81aa4a986cd5a7c300f42765b8`) and ends at `6b2e89e` (`FHIR-56699: Clarify CT grouping and NTPv4 guidance`). There are 30 commits not reachable from `origin/main` in this snapshot, including merge commits. The net three-dot diff covers 82 files, with 5,751 insertions and 1,667 deletions.

The worktree is also six commits ahead of `origin/eu-health-data-api-ballot-recon-auth`. At inventory time it had 12 modified tracked files; this new summary document is an additional uncommitted file. The pre-existing uncommitted changes are described separately below and are not part of the committed-history counts.

## Committed changes

### Authorization model and environment-specific flows

- Added and iteratively revised the central [Authorization page](../input/pagecontent/authorization.md) to distinguish user authentication, client authentication, API authorization, token issuance and enforcement, consent, patient matching, and audit.
- Made authorization selection environment- and endpoint-specific, retaining IHE IUA and SMART as distinct profiles rather than declaring SMART universal or implying automatic dual conformance.
- Clarified interactive SMART App Launch versus SMART Backend Services, including use-case selection, discovery, authorization code with PKCE, Backend Services pre-authorization/asymmetric client authentication, and applicable scope families.
- Added and refined EHDS, eIDAS, and European Digital Identity Wallet context while keeping assurance-level selection and a specific Wallet integration profile out of scope absent supporting requirements.

### Actors, capabilities, scopes, and use cases

- Separated generic Health Data API roles from protocol-specific IUA and SMART roles and clarified Authentication Service, Authorization Server, and Resource Server responsibilities in [Actors.fsh](../input/fsh/Actors.fsh) and [actors.md](../input/pagecontent/actors.md).
- Updated document and resource [CapabilityStatements](../input/fsh/capabilitystatements/) and their human-readable introductions, including security-service declarations, supported interactions, and distinctions between SMART resource scopes and applicable IUA MHD transaction scopes.
- Expanded [capability discovery](../input/pagecontent/capability-discovery.md), [resource access](../input/pagecontent/resource-access.md), and implementation/use-case guidance so the examples identify the relevant endpoint, participants, protocol, flow, and deployment-dependent choices.

### Supporting material, diagrams, and traceability

- Added or revised authorization sequence diagrams, exchange-flow figures, captions, source diagrams, and rendered SVG/PNG assets; improved readability and terminology across the related pages.
- Added maintained research and decision material, including [authorization decisions](decisions.md), the [EHDS authorization summary](ehds-auth-summary.md), and the [SMART/IUA comparison](smart-vs-iua.md), plus an authorization follow-up checklist and a proposed ballot-ticket-resolution index.
- Added purple change marking for authorization-related content during reconciliation and corrected the LOINC display in an imaging-report example.

### Commits explicitly linked to tickets

These four commits name a Jira ticket in their subject. The short descriptions below reflect the commit and its linked ticket, not a claim about Jira closure.

| Commit | Change |
|---|---|
| [`fef5d8b`](https://github.com/euridice-org/eu-health-data-api/commit/fef5d8b) — [FHIR-56615](https://jira.hl7.org/browse/FHIR-56615) | Clarifies SMART scope and GDPR boundaries, including the distinction between technical authorization and regulatory/legal questions. |
| [`61abb39`](https://github.com/euridice-org/eu-health-data-api/commit/61abb39) — [FHIR-56584](https://jira.hl7.org/browse/FHIR-56584) | Adds informative logging considerations and distinguishes API access events from later user-access events without mandating a universal audit format or transport. |
| [`06f6360`](https://github.com/euridice-org/eu-health-data-api/commit/06f6360) — [FHIR-56616](https://jira.hl7.org/browse/FHIR-56616) | Removes IG-authored CORS requirements and retains separate generic and IUA Authorization Client roles. |
| [`6b2e89e`](https://github.com/euridice-org/eu-health-data-api/commit/6b2e89e) — [FHIR-56699](https://jira.hl7.org/browse/FHIR-56699) | Clarifies CT grouping and NTPv4 guidance; the ticket also raises ATNA implications. |

## Related ballot tickets

The branch's current [proposed ticket-resolution index](../input/includes/proposed-ticket-resolutions.md) tracks the following 22 tickets. “Coverage” reproduces that index's current working-tree label; it is not the Jira workflow status. The index also records open questions and resolution directions.

| Ticket | Topic in the resolution index | Coverage |
|---|---|---|
| [FHIR-56367](https://jira.hl7.org/browse/FHIR-56367) | eIDAS/Wallet note for Access Providers | Partially addressed |
| [FHIR-56368](https://jira.hl7.org/browse/FHIR-56368) | SMART alignment with eIDAS, Wallet, and GDPR | Partially addressed |
| [FHIR-56369](https://jira.hl7.org/browse/FHIR-56369) | Whether additional IUA client constraints require a distinct actor | Partially addressed |
| [FHIR-56386](https://jira.hl7.org/browse/FHIR-56386) | Applicable IUA roles in the HPAS flow | Addressed |
| [FHIR-56388](https://jira.hl7.org/browse/FHIR-56388) | mTLS/RFC 8705 alongside `private_key_jwt` | Not addressed |
| [FHIR-56581](https://jira.hl7.org/browse/FHIR-56581) | SMART/IUA comparison coverage | Addressed |
| [FHIR-56584](https://jira.hl7.org/browse/FHIR-56584) | User-level authorization, token context, and audit | Addressed |
| [FHIR-56615](https://jira.hl7.org/browse/FHIR-56615) | Regulatory fit and avoiding universal SMART requirements | Partially addressed |
| [FHIR-56616](https://jira.hl7.org/browse/FHIR-56616) | Distinct actor when requirements extend beyond IUA | Partially addressed |
| [FHIR-56639](https://jira.hl7.org/browse/FHIR-56639) | Context for resource scopes | Addressed |
| [FHIR-56650](https://jira.hl7.org/browse/FHIR-56650) | Provider parameter support versus Consumer permission | Partially addressed |
| [FHIR-56660](https://jira.hl7.org/browse/FHIR-56660) | Direct patient-to-EHR access alongside the broker model | Partially addressed |
| [FHIR-56698](https://jira.hl7.org/browse/FHIR-56698) | Backend Services rationale, IUA relationship, and scope granularity | Partially addressed |
| [FHIR-56699](https://jira.hl7.org/browse/FHIR-56699) | CT, ATNA, and NTP guidance | Partially addressed |
| [FHIR-56705](https://jira.hl7.org/browse/FHIR-56705) | Backend Services as one token-obtainment option | Addressed |
| [FHIR-56713](https://jira.hl7.org/browse/FHIR-56713) | Protocol-specific references and non-universal SMART use | Addressed |
| [FHIR-56838](https://jira.hl7.org/browse/FHIR-56838) | Terminology, obligation strength, and regulatory baseline | Partially addressed |
| [FHIR-56845](https://jira.hl7.org/browse/FHIR-56845) | EU-specific actors and IHE/SMART positioning | Partially addressed |
| [FHIR-56848](https://jira.hl7.org/browse/FHIR-56848) | Avoiding mandatory Backend Services in CapabilityStatements | Addressed |
| [FHIR-56852](https://jira.hl7.org/browse/FHIR-56852) | Replacing blanket Backend Services requirements | Addressed |
| [FHIR-57252](https://jira.hl7.org/browse/FHIR-57252) | Optional FAST Security framework | Not addressed |
| [FHIR-57498](https://jira.hl7.org/browse/FHIR-57498) | Home Member State in IUA claims | Not addressed |

The [authorization follow-up checklist](../input/includes/auth-todo.md) additionally references [FHIR-56666](https://jira.hl7.org/browse/FHIR-56666); the proposed-resolution index explicitly excludes it from its 22-ticket scope.

## Jira approval request (copy/paste)

**Suggested summary:** Request approval of the EU Health Data API authorization reconciliation changes

**Description:**

```text
The authorization model and its dependent IG artifacts have been reconciled across
the narrative, FSH, CapabilityStatements, use cases, and diagrams. In particular,
the branch:

- Reworked the Authorization page to distinguish user authentication, client
  authentication, API authorization, token issuance/enforcement, consent, patient
  matching, and audit, and to select IHE IUA or SMART by environment, endpoint,
  and flow rather than making SMART universal or implying automatic dual
  conformance.
- Added separate interactive SMART App Launch and SMART Backend Services
  guidance, including discovery, authorization-code/PKCE requirements, and the
  Backend Services prerequisites of pre-authorization, asymmetric client
  authentication, and no runtime end-user authorization.
- Defined generic Health Data API authorization roles separately from protocol
  actors; revised actor definitions, capability security declarations, supported
  interactions, and scope descriptions to align with the selected flows.
- Updated exchange and access use cases and diagrams to show the relevant actors,
  endpoints, and protocol choices; added EHDS/eIDAS/European Digital Identity
  Wallet context without selecting an unsupported assurance level or Wallet
  integration profile.
- Added supporting authorization research, a SMART/IUA comparison, proposed
  resolutions for related ballot tickets, and informative logging/audit guidance.
  Ticket-specific changes also removed IG-authored CORS requirements and clarified
  IHE CT grouping and NTPv4 guidance.

The current worktree additionally refines protocol citations and discovery/flow
guidance in several use-case pages, updates the ticket-resolution index, registers
the informative logging page, and removes the purple authorization-change styling.
These local edits are not yet committed.

Please review and approve this branch delta for incorporation into the EU Health
Data API Implementation Guide. The changes are presented for review in
[PR #99](https://github.com/euridice-org/eu-health-data-api/pull/99). The linked
ticket-resolution index classifies related requests as addressed, partially
addressed, or not addressed and records remaining decisions; this request does
not treat unresolved proposals as adopted requirements or imply that Jira
tickets are closed.

Related tickets covered by the branch's resolution index:
FHIR-56367, FHIR-56368, FHIR-56369, FHIR-56386, FHIR-56388,
FHIR-56581, FHIR-56584, FHIR-56615, FHIR-56616, FHIR-56639,
FHIR-56650, FHIR-56660, FHIR-56698, FHIR-56699, FHIR-56705,
FHIR-56713, FHIR-56838, FHIR-56845, FHIR-56848, FHIR-56852,
FHIR-57252, FHIR-57498.

FHIR-56666 is separately referenced in the authorization follow-up checklist
and is outside that 22-ticket resolution index.
```

## Current uncommitted worktree changes

The following edits were present but uncommitted at inspection time:

- The [proposed ticket-resolution index](../input/includes/proposed-ticket-resolutions.md) is being refreshed, including the 22-ticket coverage labels above; the [authorization follow-up checklist](../input/includes/auth-todo.md) records additional follow-up and PR-comment work.
- The [Authorization page](../input/pagecontent/authorization.md) has two layout directives. The HDAS, wellness-app, HPAS, internal-exchange, cross-organization, and cross-border NCP use-case pages are being refined with released SMART/IUA links and more explicit discovery, launch, grant, actor, transaction, and scope guidance.
- [FHIR-eu-health-data-api.xml](../FHIR-eu-health-data-api.xml) registers the informative logging page. The landing-page work note no longer says authorization changes are marked in purple, and the stylesheet removes the associated purple change-marking rules.

The uncommitted use-case files are [cross-border NCP](../input/pagecontent/usecase-cross-border-ncp.md), [cross-organization exchange](../input/pagecontent/usecase-cross-org.md), [Health Data Access Service](../input/pagecontent/usecase-health-data-portal.md), [Health Professional Access Service](../input/pagecontent/usecase-health-professional-portal.md), [provider internal exchange](../input/pagecontent/usecase-provider-internal-exchange.md), and [wellness app](../input/pagecontent/usecase-wellness-app.md). The landing page is [index.md](../input/pagecontent/index.md); the change-marking styles are in [hl7eu.css](../ig-template/content/assets/css/hl7eu.css).
