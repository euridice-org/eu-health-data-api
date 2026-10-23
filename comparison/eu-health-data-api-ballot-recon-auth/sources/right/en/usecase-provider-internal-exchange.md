# Provider-Internal Exchange - EU Health Data API v1.0.0-ballot

## Provider-Internal Exchange

### Overview

Provider-internal exchange describes how a healthcare provider can use the same Interoperability Component capabilities within its own environment.

This page is informative. EHDS does not dictate how a provider exchanges data internally. Healthcare providers already use many interoperability standards and local integration patterns that are not covered here. This page does not model all provider-internal exchange; it focuses on where the Interoperability Component capabilities defined in this IG can be used within a healthcare provider environment to **support** internal exchange.

**Provider-Internal Exchange**

A healthcare provider commonly deploys multiple EHR systems. Those systems may expose document or resource access directly, or the provider may use a gateway, facade, aggregator, or registry-style deployment to present a single EHR system boundary. See [EHR System Composition Patterns](ehr-system-composition.md).

In provider-internal exchange, EHR systems may also act as [Document Consumers](actors.md#document-consumer) or [Resource Consumers](actors.md#resource-consumer) when retrieving EEHRxF data from another internal system or a provider-level gateway.

When the provider connects to national infrastructure, the gateway-facing EHR system is responsible for making provider data available through the API surface expected by the Member State. Provider-internal exchange and national exchange can use the same Interoperability Component capabilities, but they are separate deployment contexts with separate requirements.

### Participants

* **EHR systems** — systems within the healthcare provider. They can act as [Document Consumers](actors.md#document-consumer), [Resource Consumers](actors.md#resource-consumer), [Document Access Providers](actors.md#document-access-provider), [Resource Access Providers](actors.md#resource-access-provider), and/or [Document Publishers](actors.md#document-publisher).
* **Gateway, facade, aggregator, or registry** — an implementation pattern used to expose provider data through a single EHR system boundary. See [EHR System Composition Patterns](ehr-system-composition.md).
* **Healthcare professionals** — users within the healthcare provider who may access EEHRxF information through local EHR workflows. User-facing workflow requirements are outside this IG.
* **National infrastructure** — external infrastructure that may consume provider data for cross-organization exchange, access services, or cross-border exchange.

### Environment-Specific Considerations

Considerations related to this environment include:

* Regulatory 
* The EHDS regulation does not contain specific provider-internal exchange requirements.
* Provider-internal exchange can support Member State obligations by making provider data available for national infrastructure, access services, or MyHealth@EU.
 
* Access patterns 
* EHR systems may support resource and/or document based access.
* Registry-style deployments require a registry or repository component that can provide access to published EEHRxF documents.
* Registry or repository deployments define which component retains published EEHRxF document versions and makes them available for later access.
 
* Authorization 
* The Healthcare Provider environment's authorization mapping is defined in [Authorization](authorization.md#healthcare-provider). For a gateway's pre-authorized system-to-system upload, the consuming system is the [Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.md), realized as a [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.md), and the protected endpoint is the [Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.md), realized as a [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.md). This flow applies only when its pre-authorization, asymmetric confidential-client authentication, and no-runtime-user-authorization prerequisites are met.
* For interactive clinician access, the client is a [SMART App](ActorDefinition-smart-app-eu-api.md), the protected endpoint is a SMART FHIR Resource Server, and the [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.md) remains a distinct participant. A [SMART Launching System](ActorDefinition-smart-launching-system-eu-api.md) participates for EHR Launch. Select Clinician Access for EHR Launch or Clinician Access for Standalone according to how the app is started; the [Authorization](authorization.md#smart-app-launch) page owns the flow requirements.
* Applicable user-identification requirements are described in [Authorization](authorization.md#using-eidas-for-user-authentication); this provider-internal scenario does not define a separate Wallet authorization flow.
 
* Patient Identity 
* Healthcare providers may have an Enterprise Master Patient Index (EMPI) that identifies patients known to the organization and shares this patient identity with other EHR systems in the organization.
* A gateway-facing EHR system is responsible for ensuring that data provided to national infrastructure includes the required national and European identifiers.
 

