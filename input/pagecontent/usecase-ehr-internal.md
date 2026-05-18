### Overview

A **healthcare provider organization** deploys one or more EHR systems to manage patient health data internally. The EHR systems serve clinical workflows within the organization and support the organization's obligations to make data available through national health infrastructure.

This use case describes the **organization-internal perspective**: how EHR systems within a healthcare provider use this IG's API patterns internally and position themselves to support outward connectivity.

### Scope

This use case is **informative**. Whether internal EHR systems are individually required to expose a conformant API surface is determined by national implementation acts and Member State policy — not by this IG. This IG defines the API contract; organizations and Member States determine which systems are required to implement it.

### Actors

Within the healthcare provider:

- **EHR systems** act as [Document Publisher](actors.html#document-publisher), [Document Access Provider](actors.html#document-access-provider), and/or [Resource Access Provider](actors.html#resource-access-provider)
- **An outward-facing gateway or facade system** (when present) aggregates internal EHR systems and exposes a single conformant API surface to external consumers

### Workflow

1. Clinician documents patient encounter — structured data entered into EHR
2. EHR makes data available internally (documents, resources, or both)
3. Internal systems may exchange using this IG's document exchange patterns — an EHR acting as Document Publisher submits documents to an Access Provider via [ITI-105](document-exchange.html)
4. Alternatively, a FHIR-native EHR acts as its own Document Access Provider, materializing documents on demand from its resource store
5. When the organization connects to national infrastructure, outward-facing transactions use the same API patterns — the gateway or facade presents one conformant endpoint to the national layer

### Technical Flow

EHR systems within an organization may implement any combination of roles:

- **Document Publisher only** — produces and submits documents via ITI-105; does not host a query API. Suitable for source systems (lab, imaging, pharmacy) that publish to a central organizational or national repository.
- **Document Access Provider** — hosts query and retrieval API (ITI-67, ITI-68). May receive submissions from internal Publishers via the [Document Submission Option](actors.html#document-submission-option).
- **FHIR-native on-demand Responder** — holds clinical data as FHIR resources; assembles FHIR Document Bundles at retrieval time. No ITI-105 publication needed. See [Document Exchange](document-exchange.html) for on-demand document patterns.
- **Resource Access Provider** — exposes individual FHIR resources (Observation, Condition, MedicationStatement, etc.) for discrete query.

### Organizational Gateway / Facade

Organizations with multiple internal EHR systems may deploy an outward-facing system that:

- Aggregates document and resource access across internal systems
- Presents a single conformant `EEHRxF-DocumentAccessProvider` endpoint to external consumers (national infrastructure, cross-border NCP, access services)
- Handles internal fan-out to constituent systems via proprietary or standards-based mechanisms

Per [IHE General Introduction §6.3](https://profiles.ihe.net/GeneralIntro/ch-6.html), the facade's internal communication with constituent systems may use proprietary methods. The externally-exposed IHE interface capability is what determines conformance.

### Relationship to National Infrastructure

Internal EHR systems support the organization; the organization supports the Member State's national infrastructure obligations. The connection outward — to national document repositories, identity services, authorization infrastructure, and ultimately the MyHealth@EU network — is an organizational and national-level concern.

This IG defines the API contract at the point where EHR systems connect outward. How national infrastructure is structured, and which systems within a healthcare organization are required to implement this contract, is determined by each Member State.

See [Use Case — Cross-Organization via National Infrastructure](usecase-cross-org.html) for the external connectivity perspective.
