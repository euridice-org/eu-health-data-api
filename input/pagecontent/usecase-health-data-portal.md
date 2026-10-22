### Overview

A **Health Data Access Service** ([Art. 4](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4)) is provided by a Member State to natural persons or their representatives for accessing their health data. The service can be delivered as a web portal, an API, or other means. It authenticates the patient and accesses data from EHR systems on the patient's behalf. The infrastructure behind these services is country-specific — see [Member State Architectures](member-state-architectures.html).

### Scope

This IG defines the Interoperability Component API surface the access service uses when querying EHR systems. The access service itself — patient authentication (national eID, EU Digital Identity Wallet), consent management, and how queries are routed across EHR systems — is governed by Member State requirements and is out of scope here.

### Participants

- **Health Data Access Service** — [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer). [Document Publisher](actors.html#document-publisher) for Patient-provided data.
- **EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider). Depending on the context, this could be a national EHR system or a healthcare provider EHR system, or other.

### Workflow

1. Patient authenticates to the access service (e.g., national eID, EU Digital Identity Wallet)
2. Patient reviews and manages consent preferences within the service. The patient's preferences in the service are separate from the legal basis for processing under GDPR, which this IG does not define.
3. Service queries EHR systems for the patient's [documents](document-exchange.html) and/or [resources](resource-access.html)
4. Service presents data to the patient

### Authorization

<div class="auth-change" markdown="1">

The patient's identity and authorization are established at the access service.
At the Interoperability Component API surface, the access service acts as the
[Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.html),
and the protected EHR endpoint acts as the
[Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.html).
The [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.html)
is a distinct participant.

For interactive access, the [Authentication Service](ActorDefinition-authentication-service-eu-api.html)
supplies user authentication and may be grouped with the Authorization Server or separately deployed.
Portal sign-in alone does not authorize a downstream EHR request; see
[authentication and API authorization](authorization.html#authentication-and-api-authorization).

This use case spans deployment environments and does not select one flow for every EHR-facing hop.
Use the environment mapping in [Authorization](authorization.html#environment-specific-requirements):

- For a MyHealth@EU hop, authorization remains outside this IG; deployment guidance recommends
  alignment with [IHE IUA](authorization.html#myhealth-eu).
- For a National Interoperability Infrastructure hop, IHE IUA is recommended when participants
  and the Authorization Server are preconfigured and user or patient claims are needed. When
  selected, the generic roles map to the [IHE IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.html),
  [IHE IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.html), and
  [IHE IUA Authorization Server](ActorDefinition-iua-authorization-server-eu-api.html); the
  deployment selects applicable transactions and MHD scopes.
- For a wellness application-to-HDAS hop, the interactive client is a [SMART App](ActorDefinition-smart-app-eu-api.html),
  the protected HDAS endpoint is a [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.html),
  and the [SMART Authorization Server](ActorDefinition-smart-authorization-server-eu-api.html)
  is distinct. This is SMART App Launch; an EHR Launch also involves a
  [SMART Launching System](ActorDefinition-smart-launching-system-eu-api.html).
- For a separate Healthcare Provider hop, an interactive request uses a SMART App and the
  applicable SMART FHIR Resource Server and SMART Authorization Server roles. A server-side
  request uses a [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.html) only
  under the Backend Services prerequisites below; the protected endpoint remains the SMART FHIR
  Resource Server and the SMART Authorization Server remains distinct.

Interactive clinician or patient authorization uses the applicable SMART App Launch capability
set. SMART Backend Services describes a separate server-side flow whose prerequisites include
pre-authorized access, asymmetric confidential-client authentication, and no runtime end-user
authorization. The applicable SMART roles and requirements are described in
[Authorization](authorization.html#smart-app-launch). The specific environment and flow for each
downstream hop remain deployment-dependent. Patient consent preferences and app-linking rules
remain the responsibility of the access service or Member State infrastructure.

</div>

### Art. 5: Insertion of Patient-Provided Data (Informative)

Article 5 gives patients the right to insert information into their own EHR through health data access services or applications linked to those services.

EHDS has not fully specified the expected data, service-linking model, review workflow, or transport path for Article 5 insertion.

#### Submitting Patient-Provided Documents

A Health Data Access Service may submit patient-provided priority-category data in EEHRxF format to an EHR system using the [Document Publisher](actors.html#document-publisher) interactions defined in this IG (ITI-105), where the receiving EHR system supports the [Document Submission Option](actors.html#document-submission-option).

To distinguish patient-provided data from clinician-authored data, resources may carry `.meta.security` tags and/or [Provenance](https://hl7.org/fhir/provenance.html) resources indicating the patient as the source.

#### Future Work: Resource-Level Patient-Provided Data

Patient-provided data extends beyond priority-category documents. For individual resources (observations, medications, etc.), we recommend future work follows an approach analogous to the [FHIR CGM specification](https://build.fhir.org/ig/HL7/cgm/), modeling the needs of a specific use case and its interaction with care providers — for example:
- Continuous glucose monitoring and other device-sourced observations
- Patient-reported vitals/observations (fitness trackers, home monitoring)
- Patient-reported medications and supplements
