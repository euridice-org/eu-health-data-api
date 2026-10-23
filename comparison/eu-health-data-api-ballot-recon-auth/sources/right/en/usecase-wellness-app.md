# Wellness Apps - EU Health Data API v1.0.0-ballot

## Wellness Apps

### Overview

A wellness application is software, or a combination of hardware and software, intended for use by a natural person to process electronic health data for information on a person's health or for the delivery of care for purposes other than the provision of healthcare ([Art. 2(2)(ab)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_2_ab)).

Under EHDS, wellness application interoperability is not a separate API defined by this IG. A wellness application may claim interoperability with an EHR system only when the relevant common specifications and Annex II requirements are met ([Art. 47-48](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_47)). Article 48 limits sharing or transmission of data from the wellness application to the patient's Article 5 right to insert information into their EHR, with patient consent and control over the categories and circumstances of sharing.

Article 5 allows patients to insert information into their EHR through electronic health data access services or applications linked to those services. This page describes how those linked-application access and insertion use cases can use the same Interoperability Component transactions defined elsewhere in this IG.

### Scope

This page is informative about the exchange workflow. For interactive third-party app access, see the recommendation in [Authorization](authorization.md#wellness-applications). Patient identity, consent management, and eIDAS assurance remain deployment and Member State responsibilities; an access token does not replace them.

### Participants

* **Wellness application** — [Document Consumer](actors.md#document-consumer) and/or [Resource Consumer](actors.md#resource-consumer); optionally [Document Publisher](actors.md#document-publisher) for patient-written data.
* **EHR system** — [Document Access Provider](actors.md#document-access-provider) and/or [Resource Access Provider](actors.md#resource-access-provider); may support the [Document Submission Option](actors.md#document-submission-option) for patient-written data
* **Health data access service** — Patient-facing access service that may authenticate the patient, establish consent, and link the wellness application; outside this IG's scope

For each protected API hop, the consuming application has the [Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.md) role, the protected endpoint has the [Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.md) role, and the [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.md) remains distinct. The selected SMART roles and flow depend on the hop described below.

For interactive access, the [Authentication Service](ActorDefinition-authentication-service-eu-api.md) authenticates the user, potentially using a Wallet. It may be grouped with the Authorization Server or separately deployed under an agreed trust relationship. Logging into the Wellness Application does not authorize it to use an EHR API: the app must complete the selected API authorization flow, which may reuse trusted authentication or request another sign-in. Neither an EHR-hosted login page nor app-mediated identity-token exchange is required. The resulting API access token, not the Wallet presentation or an OIDC ID token, accompanies the protected request. See the [Wallet example](authorization.md#using-eidas-for-user-authentication) and [optional groupings](actors.md#authentication-and-authorization-groupings).

EHDS does not specify whether the wellness application sends data through the health data access service or directly to an EHR system after linkage and authorization have been established.

#### Wellness Application Exchange Patterns

* **HDAS-linked wellness exchange** — the patient identity, consent, and app-linking context is established through the health data access service or Member State access-service infrastructure. Classify the EHR-facing interaction separately: an interactive authorization uses Patient or Clinician Access; a server-side hop uses Backend Services only when all its applicability conditions hold.
* **Direct EHR wellness integration** — a wellness application exchanges EEHRxF data directly with an EHR system under an authorization model accepted by that deployment. This IG does not require EHR systems to implement health data access service app-linking or national patient-consent workflows locally.

#### Authorizing Patient Data Exchange

The [Wellness Applications section of Authorization](authorization.md#wellness-applications) owns the authorization requirements. The following mappings identify the flow and participants for each hop without adding separate conformance rules:

* **Wellness application to HDAS**: SMART App Launch. The wellness application is the [SMART App](ActorDefinition-smart-app-eu-api.md); the protected HDAS endpoint is a [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.md); and the [SMART Authorization Server](ActorDefinition-smart-authorization-server-eu-api.md) is distinct. The applicable Patient or Clinician Access capability set follows the user's role and the launch pattern.
* **Clinician-launched wellness application**: interactive SMART App Launch EHR Launch, with a [SMART Launching System](ActorDefinition-smart-launching-system-eu-api.md), SMART App, SMART Authorization Server, and protected SMART FHIR Resource Server. The applicable profile is Clinician Access for EHR Launch with current-patient context, or Clinician Access for Standalone when the app is not launched by an EHR.
* **Patient-launched wellness application**: interactive SMART App Launch with the EHR as FHIR server. The applicable profile is Patient Access for EHR Launch or Patient Access for Standalone Apps according to how the app is started. Write workflows follow the applicable Argonaut Write successor.
* **Preconfigured server-side access to a provider-hosted EHR**: SMART Backend Services, with the client realized as a [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.md). This flow requires pre-authorized access, asymmetric confidential-client authentication, and no runtime end-user authorization; the protected endpoint is a SMART FHIR Resource Server and the SMART Authorization Server remains distinct.

These flows use the generic Health Data API Authorization Client, Health Data API Authorization Server, and Health Data API Resource Server roles; the applicable SMART App or SMART Backend Service and SMART server roles provide the protocol-specific conformance details.

### Accessing Patient Data

1. The patient authenticates to the health data access service or another Member State-recognized service context.
1. The patient authorizes a wellness application to access their data.
1. The wellness application acts as a Document Consumer and/or Resource Consumer.
1. The access endpoint acts as a Document Access Provider and/or Resource Access Provider. That endpoint may be the health data access service, national infrastructure, or another EHR-facing endpoint authorized under Member State rules.

### Art. 5: Insertion of Patient-Provided Data (Informative)

Article 5 gives patients the right to insert information into their own EHR through health data access services or applications linked to those services. Article 48 allows wellness applications that claim EHR interoperability to share or transmit wellness application data to an EHR system only for that Article 5 purpose and only with patient consent and category-level control.

EHDS has not fully specified the expected data, service-linking model, review workflow, or transport path for Article 5 insertion.

#### Submitting Patient-Provided Documents

A wellness application may submit patient-provided priority-category data in EEHRxF format to an EHR system directly or through health data access service infrastructure using the [Document Publisher](actors.md#document-publisher) interactions defined in this IG (ITI-105), where the receiving EHR system supports the [Document Submission Option](actors.md#document-submission-option).

To distinguish patient-provided data from clinician-authored data, resources may carry `.meta.security` tags and/or [Provenance](https://hl7.org/fhir/provenance.html) resources indicating the patient as the source.

#### Future Work: Resource-Level Patient-Provided Data

Patient-provided data extends beyond priority-category documents. For individual resources (observations, medications, etc.), we recommend future work follows an approach analogous to the [FHIR CGM specification](https://build.fhir.org/ig/HL7/cgm/), modeling the needs of a specific use case and its interaction with care providers — for example:

* Continuous glucose monitoring and other device-sourced observations
* Patient-reported vitals/observations (fitness trackers, home monitoring)
* Patient-reported medications and supplements

