### Overview

A wellness application is software, or a combination of hardware and software, intended for use by a natural person to process electronic health data for information on a person's health or for the delivery of care for purposes other than the provision of healthcare ([Art. 2(2)(ab)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_2_ab)).

Under EHDS, wellness application interoperability is not a separate API defined by this IG. A wellness application may claim interoperability with an EHR system only when the relevant common specifications and Annex II requirements are met ([Art. 47-48](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_47)). Article 48 limits sharing or transmission of data from the wellness application to the patient's Article 5 right to insert information into their EHR, with patient consent and control over the categories and circumstances of sharing.

Article 5 allows patients to insert information into their EHR through electronic health data access services or applications linked to those services. This page describes how those linked-application access and insertion use cases can use the same Interoperability Component transactions defined elsewhere in this IG.

### Scope

This page is informative. It covers the EHR-facing exchange patterns for wellness applications and applications linked to health data access services. Requirements for the health data access service itself, including patient identity, app linking, consent management, eIDAS 2.0 patient wallet use, and any app authorization or launch protocol, are out of scope.

### Participants

- **Wellness application** — [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer); optionally [Document Publisher](actors.html#document-publisher) for patient-written data.
- **EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider); may support the [Document Submission Option](actors.html#document-submission-option) for patient-written data
- **Health data access service** — Patient-facing access service that may authenticate the patient, establish consent, and link the wellness application; outside this IG's scope

EHDS does not specify whether the wellness application sends data through the health data access service or directly to an EHR system after linkage and authorization have been established.

#### Wellness Application Exchange Patterns

- **HDAS-linked wellness exchange** — the patient identity, consent, and app-linking context is established through the health data access service or Member State access-service infrastructure. The EHR-facing interaction remains a system-to-system exchange.
- **Direct EHR wellness integration** — a wellness application exchanges EEHRxF data directly with an EHR system under an authorization model accepted by that deployment. This IG does not require EHR systems to implement health data access service app-linking or national patient-consent workflows locally.

#### Authorizing Patient Data Exchange

For a wellness application to act on behalf of a patient, an authorization mechanism is required that ties the exchange to the patient's identity, consent, and application authorization context. Defining that patient-level authorization mechanism is outside this IG's scope. Implementers may consider the [SMART App Launch](https://hl7.org/fhir/smart-app-launch/) framework for this app-linking and authorization need.

### Accessing Patient Data

1. The patient authenticates to the health data access service or another Member State-recognized service context.
2. The patient authorizes a wellness application to access their data.
3. The wellness application acts as a Document Consumer and/or Resource Consumer.
4. The access endpoint acts as a Document Access Provider and/or Resource Access Provider. That endpoint may be the health data access service, national infrastructure, or another EHR-facing endpoint authorized under Member State rules.

### Art. 5: Insertion of Patient-Provided Data (Informative)

Article 5 gives patients the right to insert information into their own EHR through health data access services or applications linked to those services. This IG specifies the document-based path normatively: the wellness application (directly, or through health data access service infrastructure) acts as a [Document Publisher](actors.html#document-publisher) using ITI-105, and the receiving system implements the [Document Submission Option](actors.html#document-submission-option). See [Patient-Provided Data](patient-provided-data.html) for the normative requirements and [Regulatory Anchors — Article 5](regulatoryAnchors.html#article-5-insert) for the regulation mapping.

Patient-provided documents are distinguishable from clinician-authored documents by `DocumentReference.author` (the Patient, or a RelatedPerson for a representative), the `PATRPT`/`SDMRPT` security label, and `meta.source` identifying the originating system, as specified in [Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents). Patient-provided submissions cannot alter professional data: submissions create new documents, and replacement, update, and removal are restricted to the person's own prior submissions.

Per [Art. 48(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_48), interoperability does not entail automatic sharing: the patient's consent and choice of data categories and circumstances are established in the wellness application / access-service layer, outside this API; only the resulting transmission uses the Document Publisher transactions.

#### Future Work: Resource-Level Patient-Provided Data

Patient-provided data extends beyond priority-category documents. For individual resources (observations, medications, etc.), we recommend future work follows an approach analogous to the [FHIR CGM specification](https://build.fhir.org/ig/HL7/cgm/), modeling the needs of a specific use case and its interaction with care providers — for example:
- Continuous glucose monitoring and other device-sourced observations
- Patient-reported vitals/observations (fitness trackers, home monitoring)
- Patient-reported medications and supplements
