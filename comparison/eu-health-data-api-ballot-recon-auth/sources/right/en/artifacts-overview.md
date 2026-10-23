# Artifacts Overview - EU Health Data API v1.0.0-ballot

## Artifacts Overview

This page groups the artifacts defined in this implementation guide by purpose. The complete, publisher-generated list is available on the [Artifacts Summary](artifacts.md) page.

### ActorDefinitions

| | | |
| :--- | :--- | :--- |
| Name | Title | Description |
| [AuthenticationServiceEuApi](ActorDefinition-authentication-service-eu-api.md) | Authentication Service | The Authentication Service authenticates an end user, directly or through a Wallet or upstream identity provider, and supplies an authentication result trusted by the Health Data API Authorization Server. It does not grant API access or issue API access tokens in this role. This IG-defined role is not a formal IHE IUA or SMART actor. It MAY be grouped with the [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.md) in one implementation; the interface between separate implementations is deployment-defined, not an interoperable transaction specified by this IG. No ID token or token exchange is required by the actor split. See [authentication and authorization groupings](actors.md#authentication-and-authorization-groupings) and [Authorization](authorization.md#authentication-and-api-authorization). |
| [DocumentAccessProviderEuApi](ActorDefinition-document-access-provider-actor-eu-api.md) | EEHRxF Document Access Provider | The Document Access Provider actor provides access to EEHRxF FHIR Documents by receiving documents from Document Publishers and serving them to Document Consumers. This composite actor groups MHD Document Recipient, MHD Document Responder, PDQm Patient Demographics Supplier, and the applicable IUA Resource Server or SMART FHIR Resource Server role. An Authorization Server is independent; it may be co-located only as an optional deployment. See [Authorization](authorization.md#environment-specific-requirements) for the selected role.See [Document Access Provider CapabilityStatement](CapabilityStatement-document-access-provider-eu-api.md) for technical requirements. |
| [DocumentConsumerEuApi](ActorDefinition-document-consumer-actor-eu-api.md) | EEHRxF Document Consumer | The Document Consumer actor consumes EEHRxF FHIR Documents by querying a Document Access Provider. This composite actor groups MHD Document Consumer, PDQm Patient Demographics Consumer, and the IUA Authorization Client, SMART App, or SMART Backend Service role selected by the environment and use case. The Authorization Server is a separate participant. See [Authorization](authorization.md#environment-specific-requirements) for the selected role.See [Document Consumer CapabilityStatement](CapabilityStatement-document-consumer-eu-api.md) for technical requirements. |
| [DocumentPublisherAccessProviderEuApi](ActorDefinition-document-publisher-access-provider-actor-eu-api.md) | EEHRxF Grouped Document Publisher/Access Provider | The grouped Document Publisher/Access Provider actor represents a deployment where document production and access provision are co-located in the same system. In this configuration, document submission (ITI-105) is internal and only document query/retrieval (ITI-67, ITI-68) is exposed externally. The external protected endpoint groups with the applicable IUA Resource Server or SMART FHIR Resource Server role. Internal publication does not create another externally advertised authorization role. An Authorization Server remains a separate participant and may be co-located only as an optional deployment. See [Authorization](authorization.md#environment-specific-requirements) for the selected role.This is common for hospital EHR systems that produce and serve their own documents.See [Grouped Document Publisher/Access Provider CapabilityStatement](CapabilityStatement-document-publisher-access-provider-eu-api.md) for technical requirements. |
| [DocumentPublisherEuApi](ActorDefinition-document-publisher-actor-eu-api.md) | EEHRxF Document Publisher | The Document Publisher actor produces EEHRxF FHIR Documents and publishes them to a Document Access Provider. This composite actor groups MHD Document Source, PDQm Patient Demographics Consumer, and the IUA Authorization Client or SMART Backend Service role selected by the environment and use case. The Authorization Server is a separate participant. See [Authorization](authorization.md#environment-specific-requirements) for the selected protocol and flow.See [Document Publisher CapabilityStatement](CapabilityStatement-document-publisher-eu-api.md) for technical requirements. |
| [EuAuthorizationClientEuApi](ActorDefinition-eu-authorization-client-eu-api.md) | Health Data API Authorization Client | The Health Data API Authorization Client obtains an access token from the selected Authorization Server and presents it to a protected API. Client authentication, grants, scopes, discovery, and launch context depend on the selected environment and protocol; public SMART interactive clients do not authenticate at the token endpoint. This generic role does not by itself claim IHE IUA or SMART conformance. See the applicable [IHE IUA Authorization Client](https://profiles.ihe.net/ITI/IUA/index.html#34111-authorization-client), [SMART App](ActorDefinition-smart-app-eu-api.md), or [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.md) definition and the relevant [Authorization](authorization.md) requirements. |
| [EuAuthorizationResourceServerEuApi](ActorDefinition-eu-authorization-resource-server-eu-api.md) | Health Data API Resource Server | The Health Data API Resource Server hosts a protected API, validates or introspects access tokens as applicable, and enforces granted authorization and local policy. It does not issue access tokens or validate client assertions for an independent Authorization Server. This generic role does not by itself claim IHE IUA or SMART conformance. See the applicable [IHE IUA Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#34113-resource-server) or [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.md) definition and the relevant [Authorization](authorization.md) requirements. |
| [EuAuthorizationServerEuApi](ActorDefinition-eu-authorization-server-eu-api.md) | Health Data API Authorization Server | The Health Data API Authorization Server issues access tokens after applying the authentication and authorization requirements of the selected environment and protocol. When user authentication is required, it relies on an acceptable result from the [Authentication Service](ActorDefinition-authentication-service-eu-api.md), with which it MAY be grouped. Authentication alone does not establish API access entitlement. Client assertion validation applies only when the selected flow uses asymmetric client authentication. The Authorization Server remains responsibility-distinct from a Resource Server, including when the two are co-located. This generic role does not by itself claim IHE IUA or SMART conformance. The Health Data API qualifier identifies this IG's role, not a central EU-operated service. See the applicable [IHE IUA Authorization Server](https://profiles.ihe.net/ITI/IUA/index.html#34112-authorization-server) or [SMART Authorization Server](ActorDefinition-smart-authorization-server-eu-api.md) definition and the relevant [Authorization](authorization.md) requirements. |
| [IuaAuthorizationClientEuApi](ActorDefinition-iua-authorization-client-eu-api.md) | IHE IUA Authorization Client | The IHE IUA Authorization Client authenticates to the Authorization Server, requests least-privilege scopes, and presents the resulting bearer token to the Resource Server. It implements the applicable IUA transactions. See the [IHE IUA Authorization Client](https://profiles.ihe.net/ITI/IUA/index.html#34111-authorization-client) and [Authorization](authorization.md#ihe-iua). |
| [IuaAuthorizationServerEuApi](ActorDefinition-iua-authorization-server-eu-api.md) | IHE IUA Authorization Server | The independent IHE IUA Authorization Server authenticates clients, validates client assertions when selected, applies issuance policy, prevents replay, and issues tokens. Where user authentication is required, it may use the IG-defined Authentication Service; this does not remove any applicable IUA Authorization Server conformance obligation. It does not provide protected-resource enforcement. See the [IHE IUA Authorization Server](https://profiles.ihe.net/ITI/IUA/index.html#34112-authorization-server) and [Authorization](authorization.md#ihe-iua). IUA requires this role to be grouped with a CT Time Client; see [required actor groupings](https://profiles.ihe.net/ITI/IUA/index.html#343-iua-required-actor-groupings) and the shared [Time Synchronization](authorization.md#time-synchronization) deployment guidance. |
| [IuaResourceServerEuApi](ActorDefinition-iua-resource-server-eu-api.md) | IHE IUA Resource Server | The IHE IUA Resource Server validates or introspects access tokens and enforces granted authorization and local policy for protected resources. It does not validate client assertions for an independent Authorization Server. See the [IHE IUA Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#34113-resource-server) and [Authorization](authorization.md#ihe-iua). IUA requires this role to be grouped with a CT Time Client; see [required actor groupings](https://profiles.ihe.net/ITI/IUA/index.html#343-iua-required-actor-groupings) and the shared [Time Synchronization](authorization.md#time-synchronization) deployment guidance. |
| [ResourceAccessProviderEuApi](ActorDefinition-resource-access-provider-actor-eu-api.md) | EEHRxF Resource Access Provider | The Resource Access Provider actor provides access to FHIR resources following IPA patterns. This enables direct resource access complementing document-based exchange. This composite actor groups IPA Server, PDQm Patient Demographics Supplier, and the applicable IUA Resource Server or SMART FHIR Resource Server role. An Authorization Server is independent; it may be co-located only as an optional deployment. See [Authorization](authorization.md#environment-specific-requirements) for the selected role.See [Resource Access Provider CapabilityStatement](CapabilityStatement-resource-access-provider-eu-api.md) for technical requirements. |
| [ResourceConsumerEuApi](ActorDefinition-resource-consumer-actor-eu-api.md) | EEHRxF Resource Consumer | The Resource Consumer actor queries for clinical data resources from a Resource Access Provider following IPA patterns. This composite actor groups IPA Client, PDQm Patient Demographics Consumer, and the IUA Authorization Client or SMART App or SMART Backend Service role selected by the environment and use case. The Authorization Server is a separate participant. See [Authorization](authorization.md#environment-specific-requirements) for the selected role.See [Resource Consumer CapabilityStatement](CapabilityStatement-resource-consumer-eu-api.md) for technical requirements. |
| [SmartAppEuApi](ActorDefinition-smart-app-eu-api.md) | SMART App | The SMART App is an interactive client using authorization code and PKCE in standalone or EHR-launch mode. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html) and [Authorization](authorization.md#smart-app-launch). |
| [SmartAuthorizationServerEuApi](ActorDefinition-smart-authorization-server-eu-api.md) | SMART Authorization Server | The SMART Authorization Server authenticates clients as applicable, authorizes requests, and issues tokens. It remains a distinct participant from the protected FHIR Resource Server. For interactive flows it may rely on the IG-defined Authentication Service for user authentication without transferring its SMART conformance obligations. Backend Services does not require runtime end-user authentication. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/) and [Authorization](authorization.md#smart-app-launch). This IG recommends CT Time Client grouping for this server role in both interactive and Backend Services modes; see [SMART Server Time Synchronization](authorization.md#smart-server-time-synchronization) and the shared [Time Synchronization](authorization.md#time-synchronization) deployment guidance. |
| [SmartBackendServiceEuApi](ActorDefinition-smart-backend-service-eu-api.md) | SMART Backend Service | The SMART Backend Service is a pre-authorized confidential server-side client using client credentials, asymmetric client authentication, and applicable system scopes. See [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html) and [Authorization](authorization.md#smart-app-launch). |
| [SmartFhirResourceServerEuApi](ActorDefinition-smart-fhir-resource-server-eu-api.md) | SMART FHIR Resource Server | The SMART FHIR Resource Server hosts protected FHIR resources, validates access tokens, and enforces granted SMART scopes. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/) and [Authorization](authorization.md#smart-app-launch). This IG recommends CT Time Client grouping for this server role in both interactive and Backend Services modes; see [SMART Server Time Synchronization](authorization.md#smart-server-time-synchronization) and the shared [Time Synchronization](authorization.md#time-synchronization) deployment guidance. |
| [SmartLaunchingSystemEuApi](ActorDefinition-smart-launching-system-eu-api.md) | SMART Launching System | The SMART Launching System initiates an EHR launch and supplies the launch context for an interactive SMART App. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html) and [Authorization](authorization.md#smart-app-launch). |

### CapabilityStatement Profiles

| | | |
| :--- | :--- | :--- |
| Name | Title | Description |
| [EuApiDeploymentCapabilityStatement](StructureDefinition-eu-api-deployment-capabilitystatement.md) | EU Health Data API Deployment CapabilityStatement | A concrete EU Health Data API deployment CapabilityStatement declaring one selected authorization security service. |

### CapabilityStatement Instances

| | | |
| :--- | :--- | :--- |
| Name | Title | Description |
| [DocumentAccessProviderEuApi](CapabilityStatement-document-access-provider-eu-api.md) | EEHRxF Document Access Provider CapabilityStatement | Requirements for an EEHRxF Document Access Provider serving FHIR Documents to Document Consumers. |
| [DocumentAccessProviderSubmissionOptionEuApi](CapabilityStatement-document-access-provider-submission-option-eu-api.md) | EEHRxF Document Access Provider - Document Submission Option | Requirements for the Document Submission Option on an EEHRxF Document Access Provider. |
| [DocumentConsumerEuApi](CapabilityStatement-document-consumer-eu-api.md) | EEHRxF Document Consumer CapabilityStatement | Requirements for an EEHRxF Document Consumer that queries and retrieves FHIR Documents. |
| [DocumentPublisherAccessProviderEuApi](CapabilityStatement-document-publisher-access-provider-eu-api.md) | EEHRxF Grouped Document Publisher/Access Provider CapabilityStatement | Requirements for a deployment that combines an internal Document Publisher with an external-facing Document Access Provider. |
| [DocumentPublisherEuApi](CapabilityStatement-document-publisher-eu-api.md) | EEHRxF Document Publisher CapabilityStatement | Requirements for an EEHRxF Document Publisher that submits FHIR Documents to a Document Access Provider. |
| [ResourceAccessProviderEuApi](CapabilityStatement-resource-access-provider-eu-api.md) | EEHRxF Resource Access Provider CapabilityStatement | Requirements for an EEHRxF Resource Access Provider that serves clinical FHIR resources using IPA patterns. |
| [ResourceConsumerEuApi](CapabilityStatement-resource-consumer-eu-api.md) | EEHRxF Resource Consumer CapabilityStatement | Requirements for an EEHRxF Resource Consumer that queries clinical FHIR resources using IPA patterns. |

### DocumentReference

| | | |
| :--- | :--- | :--- |
| Name | Title | Description |
| [Example - European Patient Summary DocumentReference](DocumentReference-example-documentreference-eps.md) |  | Example DocumentReference showing an EPS document with EEHRxF category coding.This example demonstrates the recommended search strategy:* `category` = Patient-Summaries (EHDS priority category for coarse filtering)
* `type` = 60591-5 (LOINC code for clinical precision)
**Example query to find this document by priority category:**```
GET [base]/DocumentReference?patient=Patient/example-patient&category=https://euridice.ec.europa.eu/fhir/eehrxf/CodeSystem/document-priority-category-eu-api|Patient-Summaries

```
**Example query to find this document by type:**```
GET [base]/DocumentReference?patient=Patient/example-patient&type=http://loinc.org|60591-5

```
 |
| [Example - Hospital Discharge Report DocumentReference](DocumentReference-example-documentreference-hdr.md) |  | Example DocumentReference for a hospital discharge report.**Example query:**```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|18842-5

```
 |
| [Example - Imaging Report DocumentReference](DocumentReference-example-documentreference-imaging-report.md) |  | Example DocumentReference for a diagnostic imaging report.**Example query:**```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|85430-7

```
 |
| [Example - Imaging Study Manifest (DICOM KOS)](DocumentReference-example-documentreference-imaging-manifest-kos.md) |  | Example DocumentReference for a DICOM KOS-encoded imaging study manifest.This is one half of the dual-DocumentReference pattern for imaging manifests. The DICOM KOS DocumentReference is linked to its FHIR manifest counterpart via `relatesTo.code = transforms`. |
| [Example - Imaging Study Manifest (FHIR)](DocumentReference-example-documentreference-imaging-manifest-fhir.md) |  | Example DocumentReference for a FHIR-encoded imaging study manifest.This is one half of the dual-DocumentReference pattern for imaging manifests. The FHIR manifest DocumentReference is linked to its DICOM KOS counterpart via `relatesTo.code = transforms`.**Example query to find imaging manifests by type:**```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|18748-4&status=current

```
 |
| [Example - Laboratory Report DocumentReference](DocumentReference-example-documentreference-laboratory.md) |  | Example DocumentReference for a laboratory report.**Example query:**```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|11502-2

```
 |

### Terminology

| | | | |
| :--- | :--- | :--- | :--- |
| Name | Type | Title | Description |
| [DocumentPriorityCategoryEuApiCS](CodeSystem-document-priority-category-eu-api.md) | CodeSystem | EEHRxF Document Priority Category CodeSystem | CodeSystem for priority document categories in EEHRxF as the document categories as defined in the EHDS regulation. |
| [DocumentReferenceCategoryTypeEuApi](ConceptMap-document-reference-category-type-eu-api.md) | ConceptMap | EEHRxF MHD DocumentReference ConceptMap | mapping from the EHDS regulatory priority categories to the LOINC document category codes for clinical precision in document identification. |
| [DocumentTypeDischargeReportEuApiVS](ValueSet-document-type-discharge-report-eu-api.md) | ValueSet | EEHRxF Document Type ValueSet for Discharge Reports | ValueSet for specific document types within the Discharge Report priority category. |
| [DocumentTypeEuApiVS](ValueSet-document-type-eu-api.md) | ValueSet | EEHRxF Document Type ValueSet | Document type codes for clinical precision in document identification. |
| [DocumentTypeLaboratoryReportEuApiVS](ValueSet-document-type-laboratory-report-eu-api.md) | ValueSet | EEHRxF Document Type ValueSet for Laboratory Reports | ValueSet for specific document types within the Laboratory Report priority category. |
| [DocumentTypeMedicalImagingEuApiVS](ValueSet-document-type-medical-imaging-eu-api.md) | ValueSet | EEHRxF Document Type ValueSet for Medical Imaging | ValueSet for specific document types within the Medical Imaging priority category. |
| [DocumentTypePatientSummaryEuApiVS](ValueSet-document-type-patient-summary-eu-api.md) | ValueSet | EEHRxF Document Type ValueSet for Patient Summaries | ValueSet for specific document types within the Patient Summary priority category. |
| [EuApiAuthorizationSecurityServiceVS](ValueSet-eu-api-authorization-security-service.md) | ValueSet | EU Health Data API Authorization Security Service ValueSet | Security services that a concrete EU Health Data API deployment may select for its protected FHIR interface. |

### Other

| | | | |
| :--- | :--- | :--- | :--- |
| Name | Type | Title | Description |
| [ExampleDocumentAccessProviderEPSLab](CapabilityStatement-example-capabilitystatement-document-access-provider.md) | CapabilityStatement | Example: Document Access Provider Supporting EPS and Laboratory |  |

