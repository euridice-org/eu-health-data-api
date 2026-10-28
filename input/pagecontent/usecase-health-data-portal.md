### Overview

A **Health Data Access Service** ([Art. 4](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4)) is provided by a Member State to natural persons or their representatives for accessing their health data. The service can be delivered as a web portal, an API, or other means. It authenticates the patient and accesses data from EHR systems on the patient's behalf. The infrastructure behind these services is country-specific — see [Member State Architectures](member-state-architectures.html).

### Scope

This IG defines the Interoperability Component API surface the access service uses when querying EHR systems. The access service itself — patient authentication (national eID, EU Digital Identity Wallet), consent management, and how queries are routed across EHR systems — is governed by Member State requirements and is out of scope here.

### Participants

- **Health Data Access Service** — [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer). [Document Publisher](actors.html#document-publisher) for Patient-provided data.
- **EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider). Depending on the context, this could be a national EHR system or a healthcare provider EHR system, or other.

### Workflow

1. Patient authenticates to the access service (e.g., national eID, EU Digital Identity Wallet)
2. Patient reviews and manages consent preferences within the service
3. Service queries EHR systems for the patient's [documents](document-exchange.html) and/or [resources](resource-access.html)
4. Service presents data to the patient

### Authorization

The patient's identity and authorization are established at the access service. At the Interoperability Component API surface, the consumer is an authorized system-to-system caller; the mechanism is described in [Authorization](authorization.html). Patient consent preferences and app-linking rules are established by the access service or Member State infrastructure; this IG describes only the EHR-facing system-to-system exchange.

### Art. 5: Insertion of Patient-Provided Data (Informative)

The [Patient-Provided Data](patient-provided-data.html) page illustrates how existing actors and transactions can support [EHDS Article 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5). For example, the Health Data Access Service can act as a [Document Publisher](actors.html#document-publisher) using ITI-105, with a receiving system implementing the [Document Submission Option](actors.html#document-submission-option). A service holding patient-provided data can also expose it through existing document query/retrieval or resource query capabilities. These are informative examples, not a mandatory transport path.

A shared, machine-readable convention is needed to distinguish patient- or representative-inserted data; its encoding remains open. Implementations need to enforce protection of professionally inserted data using their authorization arrangements and the established document lifecycle. Original submissions and provenance remain intact, and appropriately marked data can be made available to authorized consumers without prior clinical review. See [Regulatory Anchors — Article 5](regulatoryAnchors.html#article-5-insert) for the regulatory context.

Consent, representative authority, and application linking are established through the applicable access-service and Member State arrangements before exchange.

#### Future Work: Resource-Level Patient-Provided Data

Patient-provided data extends beyond priority-category documents. For individual resources (observations, medications, etc.), we recommend future work follows an approach analogous to the [FHIR CGM specification](https://build.fhir.org/ig/HL7/cgm/), modeling the needs of a specific use case and its interaction with care providers — for example:
- Continuous glucose monitoring and other device-sourced observations
- Patient-reported vitals/observations (fitness trackers, home monitoring)
- Patient-reported medications and supplements
