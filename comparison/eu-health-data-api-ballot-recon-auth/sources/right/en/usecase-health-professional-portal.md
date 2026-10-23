# Health Professional Access Service - EU Health Data API v1.0.0-ballot

## Health Professional Access Service

### Overview

A **Health Professional Access Service** ([Art. 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12)) is provided by a Member State to health professionals for accessing their patients' health data. The service can be delivered as a web portal, an API, or other means. It authenticates the professional, locates the patient, and accesses data from EHR systems. The infrastructure behind these services is country-specific — see [Member State Architectures](member-state-architectures.md).

### Scope

This IG defines the Interoperability Component API surface the access service can use to query EHR systems. Requirements for the access service itself — including how the professional authenticates (e.g., eIDAS), how the patient is selected, and how queries are routed across EHR systems — are governed by Member State requirements and are **out of scope** here.

### Participants

* **Health Professional Access Service** — [Document Consumer](actors.md#document-consumer) and/or [Resource Consumer](actors.md#resource-consumer)
* **EHR system** — [Document Access Provider](actors.md#document-access-provider) and/or [Resource Access Provider](actors.md#resource-access-provider)

### Workflow

1. Health professional authenticates to the access service
1. Service identifies the patient (see[Patient Lookup](patient-match.md))
1. Service queries EHR systems for[documents](document-exchange.md)and/or[resources](resource-access.md)
1. Professional reviews the retrieved data

The service may query EHR systems directly, through national infrastructure that federates queries, or through a combination — see [Cross-Organization via National Infrastructure](usecase-cross-org.md).

### Authorization

At each EHR-facing API boundary, the access service is the [Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.md), the protected EHR endpoint is the [Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.md), and the [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.md) is distinct. The professional's authentication at the access service does not itself authorize the downstream FHIR request or every matching resource.

The service may reach EHRs directly or through national infrastructure, so its title does not by itself determine the authorization environment. For a Healthcare Provider hop, an interactive clinician request maps to [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html): the client is a [SMART App](ActorDefinition-smart-app-eu-api.md), the protected endpoint a [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.md), and the [SMART Authorization Server](ActorDefinition-smart-authorization-server-eu-api.md) is distinct. A [SMART Launching System](ActorDefinition-smart-launching-system-eu-api.md) participates for EHR Launch. Identify the target FHIR base and registered app, then use the endpoint's [SMART discovery metadata](authorization.md#smart-discovery) and how the app is started to select Clinician Access for EHR Launch or Clinician Access for Standalone. Interactive access uses authorization code with PKCE as described in [Authorization](authorization.md#smart-app-launch). A server-side request maps to a [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.md) only when access is pre-authorized, the client uses asymmetric confidential-client authentication, and no runtime end-user authorization is required. For a National Interoperability Infrastructure hop, [IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html) is recommended only under the conditions in [Authorization](authorization.md#national-interoperability-infrastructure); when selected, the generic roles map to the [IHE IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.md), [IHE IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.md), and [IHE IUA Authorization Server](ActorDefinition-iua-authorization-server-eu-api.md). The actual environment and flow remain deployment-dependent. See [Authorization](authorization.md#environment-specific-requirements) for the normative requirements and protocol roles.

For the server-side flow, see the [SMART Backend Services profile](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html) and its requirements in [Authorization](authorization.md#smart-app-launch). When an NII endpoint selects IUA, the client obtains a token with [ITI-71](https://profiles.ihe.net/ITI/TF/Volume2/ITI-71.html) and presents it with [ITI-72](https://profiles.ihe.net/ITI/TF/Volume2/ITI-72.html); MHD transaction scopes depend on the supported interaction and are described in [Authorization](authorization.md#national-interoperability-infrastructure).

For interactive access, the [Authentication Service](ActorDefinition-authentication-service-eu-api.md) authenticates the professional, directly or through an upstream identity service, and may be grouped with the Authorization Server or separately deployed. This does not grant downstream API access or add runtime user authentication to a pre-authorized Backend Service. See [authentication and API authorization](authorization.md#authentication-and-api-authorization).

