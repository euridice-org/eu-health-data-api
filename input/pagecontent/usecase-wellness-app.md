### Overview

A wellness application is software intended for use by a natural person to process electronic health data for health information or care outside healthcare ([Art. 2](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_2_ab)).

Under EHDS, wellness application interoperability is not a separate API defined by this IG. A wellness application may claim interoperability with an EHR system only when the relevant common specifications and Annex II requirements are met ([Art. 47-48](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_47)). Article 48 limits sharing or transmission of data from the wellness application to the patient's Article 5 right to insert information into their EHR, with patient consent and control over the categories and circumstances of sharing.

Article 5 allows patients to insert information into their EHR through electronic health data access services or applications linked to those services. This page describes how those linked-application access and insertion use cases can use the same interoperability component transactions defined elsewhere in this IG.

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

Article 5 gives patients the right to insert information into their own EHR through health data access services or applications linked to those services. Article 48 allows wellness applications that claim EHR interoperability to share or transmit wellness application data to an EHR system only for that Article 5 purpose and only with patient consent and category-level control.

EHDS has not fully specified the expected data, service-linking model, review workflow, or transport path for Article 5 insertion.

#### Submitting Patient-Provided Documents

A wellness application may submit patient-provided priority-category data in EEHRxF format to an EHR system directly or through health data access service infrastructure using the [Document Publisher](actors.html#document-publisher) interactions defined in this IG (ITI-105), where the receiving EHR system supports the [Document Submission Option](actors.html#document-submission-option).

To distinguish patient-provided data from clinician-authored data, resources may carry `.meta.security` tags and/or [Provenance](https://hl7.org/fhir/provenance.html) resources indicating the patient as the source.

#### Future Work: Resource-Level Patient-Provided Data

Patient-provided data extends beyond priority-category documents. For individual resources (observations, medications, etc.), we recommend future work follows an approach analogous to the [FHIR CGM specification](https://build.fhir.org/ig/HL7/cgm/), modeling the needs of a specific use case and its interaction with care providers — for example:
- Continuous glucose monitoring and other device-sourced observations
- Patient-reported vitals/observations (fitness trackers, home monitoring)
- Patient-reported medications and supplements
