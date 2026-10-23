# Health Data Access Service - EU Health Data API v1.0.0-ballot

## Health Data Access Service

### Overview

A **Health Data Access Service** ([Art. 4](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4)) is provided by a Member State to natural persons or their representatives for accessing their health data. The service can be delivered as a web portal, an API, or other means. It authenticates the patient and accesses data from EHR systems on the patient's behalf. The infrastructure behind these services is country-specific — see [Member State Architectures](member-state-architectures.md).

### Scope

This IG defines the Interoperability Component API surface the access service uses when querying EHR systems. The access service itself — patient authentication (national eID, EU Digital Identity Wallet), consent management, and how queries are routed across EHR systems — is governed by Member State requirements and is out of scope here.

### Participants

* **Health Data Access Service** — [Document Consumer](actors.md#document-consumer) and/or [Resource Consumer](actors.md#resource-consumer). [Document Publisher](actors.md#document-publisher) for Patient-provided data.
* **EHR system** — [Document Access Provider](actors.md#document-access-provider) and/or [Resource Access Provider](actors.md#resource-access-provider). Depending on the context, this could be a national EHR system or a healthcare provider EHR system, or other.

### Workflow

1. Patient authenticates to the access service (e.g., national eID, EU Digital Identity Wallet)
1. Patient reviews and manages consent preferences within the service. The patient's preferences in the service are separate from the legal basis for processing under GDPR, which this IG does not define.
1. Service queries EHR systems for the patient's[documents](document-exchange.md)and/or[resources](resource-access.md)
1. Service presents data to the patient

### Authorization

The patient's identity and authorization are established at the access service. At the Interoperability Component API surface, the access service acts as the [Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.md), and the protected EHR endpoint acts as the [Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.md). The [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.md) is a distinct participant.

For interactive access, the [Authentication Service](ActorDefinition-authentication-service-eu-api.md) supplies user authentication and may be grouped with the Authorization Server or separately deployed. Portal sign-in alone does not authorize a downstream EHR request; see [authentication and API authorization](authorization.md#authentication-and-api-authorization).

This use case spans deployment environments and does not select one flow for every EHR-facing hop. Use the environment mapping in [Authorization](authorization.md#environment-specific-requirements):

* For a MyHealth@EU hop, authorization remains outside this IG; deployment guidance recommends alignment with [IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html), as described in [Authorization](authorization.md#myhealth-eu).
* For a National Interoperability Infrastructure hop, [IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html) is recommended when participants and the Authorization Server are preconfigured and user or patient claims are needed. When selected, the generic roles map to the [IHE IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.md), [IHE IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.md), and [IHE IUA Authorization Server](ActorDefinition-iua-authorization-server-eu-api.md); the deployment selects applicable transactions and MHD scopes. The client obtains a token with [ITI-71](https://profiles.ihe.net/ITI/TF/Volume2/ITI-71.html) and presents it to the protected endpoint with [ITI-72](https://profiles.ihe.net/ITI/TF/Volume2/ITI-72.html); any MHD transaction scope is limited to the supported interaction, as described in [Authorization](authorization.md#national-interoperability-infrastructure).
* For a wellness application-to-HDAS hop, the interactive flow is [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html), and the client is a [SMART App](ActorDefinition-smart-app-eu-api.md), the protected HDAS endpoint is a [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.md), and the [SMART Authorization Server](ActorDefinition-smart-authorization-server-eu-api.md) is distinct. This is SMART App Launch; an EHR Launch also involves a [SMART Launching System](ActorDefinition-smart-launching-system-eu-api.md).
* For a separate Healthcare Provider hop, an interactive request uses [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html) with a SMART App and the applicable SMART FHIR Resource Server and SMART Authorization Server roles. A server-side request uses a [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.md) only under the Backend Services prerequisites below; the protected endpoint remains the SMART FHIR Resource Server and the SMART Authorization Server remains distinct.

For an interactive SMART hop, identify the target FHIR base and registered app, then use the endpoint's [SMART discovery metadata](authorization.md#smart-discovery), user's role, and launch context to select Patient or Clinician Access and Standalone or EHR Launch. Interactive access uses the [SMART App Launch authorization-code flow](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html) with PKCE as described in [Authorization](authorization.md#smart-app-launch). [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html) is a separate server-side flow whose prerequisites include pre-authorized access, asymmetric confidential-client authentication, and no runtime end-user authorization. The applicable SMART roles and requirements are described in [Authorization](authorization.md#smart-app-launch). The specific environment and flow for each downstream hop remain deployment-dependent. Patient consent preferences and app-linking rules remain the responsibility of the access service or Member State infrastructure.

### Art. 5: Insertion of Patient-Provided Data (Informative)

Article 5 gives patients the right to insert information into their own EHR through health data access services or applications linked to those services.

EHDS has not fully specified the expected data, service-linking model, review workflow, or transport path for Article 5 insertion.

#### Submitting Patient-Provided Documents

A Health Data Access Service may submit patient-provided priority-category data in EEHRxF format to an EHR system using the [Document Publisher](actors.md#document-publisher) interactions defined in this IG (ITI-105), where the receiving EHR system supports the [Document Submission Option](actors.md#document-submission-option).

To distinguish patient-provided data from clinician-authored data, resources may carry `.meta.security` tags and/or [Provenance](https://hl7.org/fhir/provenance.html) resources indicating the patient as the source.

#### Future Work: Resource-Level Patient-Provided Data

Patient-provided data extends beyond priority-category documents. For individual resources (observations, medications, etc.), we recommend future work follows an approach analogous to the [FHIR CGM specification](https://build.fhir.org/ig/HL7/cgm/), modeling the needs of a specific use case and its interaction with care providers — for example:

* Continuous glucose monitoring and other device-sourced observations
* Patient-reported vitals/observations (fitness trackers, home monitoring)
* Patient-reported medications and supplements

