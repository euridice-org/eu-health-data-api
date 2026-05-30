### Overview

A **Health Data Access Service** ([Art. 4](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4)) is provided by a Member State to natural persons or their representatives for accessing their health data. The service can be delivered as a web portal, an API, or other means. It authenticates the patient and queries EHR systems on the patient's behalf. The infrastructure behind these services is country-specific — see [Member State Architectures](member-state-architectures.html).

### Scope

This IG defines the API the access service uses when querying EHR systems. The access service itself — patient authentication (national eID, EU Digital Identity Wallet), consent management, and how queries are routed across EHR systems — is governed by Member State requirements and is out of scope here.

### Participants

- **Health Data Access Service** — [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer). [Document Publisher](actors.html#document-publisher) for Patient-provided data.
- **EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider)

### Workflow

1. Patient authenticates to the access service (e.g., national eID, EU Digital Identity Wallet)
2. Patient reviews and manages consent preferences within the service
3. Service queries EHR systems for the patient's [documents](document-exchange.html) and/or [resources](resource-access.html)
4. Service presents data to the patient

### Authorization

The patient's identity and authorization are established at the access service. At the EHR API surface, the consumer is an authorized system-to-system caller; the mechanism is described in [Authorization](authorization.html). Patient consent preferences are enforced by the access service and/or the EHR system per Member State policy.

#### Patient-Provided Data 

Articles 5 give patients the right to insert data into to their health record using the Health Data Access Service. In this context, a Health Data Access service could also act as a [Document Publisher](actors.html#document-publisher), submitting patient-sourced documents to an EHR system via ITI-105. Patient-sourced content may be tagged using `.meta.security` or `Provenance` resources to distinguish it from clinician-authored data (informative; see content specifications). See the [Wellness App](usecase-wellness-app.html) for a related use case where wellness applications are used to submit patient-provided data.
