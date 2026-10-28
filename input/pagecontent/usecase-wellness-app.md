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

The [Patient-Provided Data](patient-provided-data.html) page illustrates how existing actors and transactions can support [EHDS Article 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5). For example, the wellness application or its linked health data access service can act as a [Document Publisher](actors.html#document-publisher) using ITI-105, with a receiving system implementing the [Document Submission Option](actors.html#document-submission-option). A service holding patient-provided data can also expose it through existing document query/retrieval or resource query capabilities. These are informative examples, not a mandatory transport path.

A shared, machine-readable convention is needed to distinguish patient- or representative-inserted data; its encoding remains open. Implementations need to enforce protection of professionally inserted data using their authorization arrangements and the established document lifecycle. Original submissions and provenance remain intact, and appropriately marked data can be made available to authorized consumers without prior clinical review. See [Regulatory Anchors — Article 5](regulatoryAnchors.html#article-5-insert) for the regulatory context.

Per [Art. 48(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_48), interoperability does not entail automatic sharing. The patient's consent and choice of data categories and circumstances, representative authority where relevant, and application linking are established through the applicable application, access-service, and Member State arrangements before exchange.

#### Future Work: Resource-Level Patient-Provided Data

Patient-provided data extends beyond priority-category documents. For individual resources (observations, medications, etc.), we recommend future work follows an approach analogous to the [FHIR CGM specification](https://build.fhir.org/ig/HL7/cgm/), modeling the needs of a specific use case and its interaction with care providers — for example:
- Continuous glucose monitoring and other device-sourced observations
- Patient-reported vitals/observations (fitness trackers, home monitoring)
- Patient-reported medications and supplements
