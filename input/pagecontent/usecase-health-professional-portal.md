### Overview

A **Health Professional Access Service** ([Art. 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12)) is provided by a Member State to health professionals for accessing their patients' health data. The service can be delivered as a web portal, an API, or other means. It authenticates the professional, locates the patient, and accesses data from EHR systems. The infrastructure behind these services is country-specific — see [Member State Architectures](member-state-architectures.html).

### Scope

This IG defines the Interoperability Component API surface the access service can use to query EHR systems. Requirements for the access service itself — including how the professional authenticates (e.g., eIDAS), how the patient is selected, and how queries are routed across EHR systems — are governed by Member State requirements and are **out of scope** here.

### Participants

- **Health Professional Access Service** — [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer)
- **EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider)

### Workflow

1. Health professional authenticates to the access service
2. Service identifies the patient (see [Patient Lookup](patient-match.html))
3. Service queries EHR systems for [documents](document-exchange.html) and/or [resources](resource-access.html)
4. Professional reviews the retrieved data

The service may query EHR systems directly, through national infrastructure that federates queries, or through a combination — see [Cross-Organization via National Infrastructure](usecase-cross-org.html).

### Authorization

Healthcare Provider deployments SHALL use [SMART](authorization.html#healthcare-provider). For API requests from a server-side access service to EHR systems, [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html#use-this-profile-when-the-following-conditions-all-apply) is recommended only when the client is pre-authorized, uses asymmetric confidential-client authentication, and does not require runtime end-user authorization. If the API request instead requires interactive clinician authorization, use the applicable [SMART Clinician Access flow](authorization.html#healthcare-provider). The professional's identity and authorization are established at the access service; this does not by itself authorize access to every matching resource. At the Interoperability Component API surface, the access service acts as the [EU Authorization Client](ActorDefinition-eu-authorization-client-eu-api.html), and the protected EHR endpoint acts as the [EU Authorization Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.html). The [EU Authorization Server](ActorDefinition-eu-authorization-server-eu-api.html) is a distinct participant. See [Authorization](authorization.html) for the normative requirements.
