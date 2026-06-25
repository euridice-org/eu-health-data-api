### Overview

A **Health Data Access Service** ([Art. 4](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4)) enables a patient to access their own health data from EHR systems. The service authenticates the patient and queries EHR systems on the patient's behalf.

### Scope

This IG defines the interoperability component API surface the access service uses when querying EHR systems. The access service itself — patient authentication (national eID, EU Digital Identity Wallet), consent management, and how queries are routed across EHR systems — is governed by Member State requirements and is out of scope here.

### Participants

- **Health Data Access Service** — [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer). [Document Publisher](actors.html#document-publisher) for Patient-provided data.
- **EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider)

### Workflow

1. Patient authenticates to the access service (e.g., national eID, EU Digital Identity Wallet)
2. Patient reviews and manages consent preferences within the service
3. Service queries EHR systems for the patient's [documents](document-exchange.html) and/or [resources](resource-access.html)
4. Service presents data to the patient

### Authorization

The patient's identity and authorization are established at the access service. At the interoperability component API surface, the consumer is an authorized system-to-system caller; the mechanism is described in [Authorization](authorization.html). Patient consent preferences and app-linking rules are established by the access service or Member State infrastructure; this IG describes only the EHR-facing system-to-system exchange.

#### Patient-Provided Data 

Article 5 gives patients the right to insert information into their EHR through the Health Data Access Service or applications linked to that service. In this context, a Health Data Access Service can support patient-provided data directly, or establish the authorization and linking context used by a wellness application. For the EHR-facing document case, the Health Data Access Service or linked application could act as a [Document Publisher](actors.html#document-publisher), submitting patient-sourced documents to an EHR system via ITI-105. Patient-sourced content may be tagged using `.meta.security` or `Provenance` resources to distinguish it from clinician-authored data (informative; see content specifications). See the [Wellness App](usecase-wellness-app.html) for the linked-application case.
