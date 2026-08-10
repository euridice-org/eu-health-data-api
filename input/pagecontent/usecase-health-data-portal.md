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

Article 5 gives patients the right to insert information into their own EHR through health data access services or applications linked to those services. This IG specifies the document-based path normatively: the Health Data Access Service acts as a [Document Publisher](actors.html#document-publisher) using ITI-105, and the receiving system implements the [Document Submission Option](actors.html#document-submission-option). See [Patient-Provided Data](patient-provided-data.html) for the normative requirements and [Regulatory Anchors — Article 5](regulatoryAnchors.html#article-5-insert) for the regulation mapping.

Patient-provided documents are distinguishable from clinician-authored documents by `DocumentReference.author` (the Patient, or a RelatedPerson for a representative), the `PATRPT`/`SDMRPT` security label, and `meta.source` identifying the originating system, as specified in [Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents). Patient-provided submissions cannot alter professional data: submissions create new documents, and replacement, update, and removal are restricted to the person's own prior submissions.

#### Future Work: Resource-Level Patient-Provided Data

Patient-provided data extends beyond priority-category documents. For individual resources (observations, medications, etc.), we recommend future work follows an approach analogous to the [FHIR CGM specification](https://build.fhir.org/ig/HL7/cgm/), modeling the needs of a specific use case and its interaction with care providers — for example:
- Continuous glucose monitoring and other device-sourced observations
- Patient-reported vitals/observations (fitness trackers, home monitoring)
- Patient-reported medications and supplements
