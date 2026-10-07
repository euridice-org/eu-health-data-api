### Overview

Provider-internal exchange describes how a healthcare provider can use the same Interoperability Component capabilities within its own environment.

This page is informative. EHDS does not dictate how a provider exchanges data internally. Healthcare providers already use many interoperability standards and local integration patterns that are not covered here. This page does not model all provider-internal exchange; it focuses on where the Interoperability Component capabilities defined in this IG can be used within a healthcare provider environment to **support** internal exchange.

{% include img.html img="usecase-provider-internal-exchange.drawio.svg" caption="Provider-Internal Exchange" width="80%" %}

A healthcare provider commonly deploys multiple EHR systems. Those systems may expose document or resource access directly, or the provider may use a gateway, facade, aggregator, or registry-style deployment to present a single EHR system boundary. See [EHR System Composition Patterns](ehr-system-composition.html).

In provider-internal exchange, EHR systems may also act as [Document Consumers](actors.html#document-consumer) or [Resource Consumers](actors.html#resource-consumer) when retrieving EEHRxF data from another internal system or a provider-level gateway.

When the provider connects to national infrastructure, the gateway-facing EHR system is responsible for making provider data available through the API surface expected by the Member State. Provider-internal exchange and national exchange can use the same Interoperability Component capabilities, but they are separate deployment contexts with separate requirements.

### Participants

- **EHR systems** — systems within the healthcare provider. They can act as [Document Consumers](actors.html#document-consumer), [Resource Consumers](actors.html#resource-consumer), [Document Access Providers](actors.html#document-access-provider), [Resource Access Providers](actors.html#resource-access-provider), and/or [Document Publishers](actors.html#document-publisher).
- **Gateway, facade, aggregator, or registry** — an implementation pattern used to expose provider data through a single EHR system boundary. See [EHR System Composition Patterns](ehr-system-composition.html).
- **Healthcare professionals** — users within the healthcare provider who may access EEHRxF information through local EHR workflows. User-facing workflow requirements are outside this IG.
- **National infrastructure** — external infrastructure that may consume provider data for cross-organization exchange, access services, or cross-border exchange.

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
  * The Healthcare Provider environment SHALL use SMART. Gateway system-to-system uploads use SMART Backend Services; interactive clinician access uses SMART App Launch with the applicable Clinician Access capability set.
  * A protected Document/Resource Access Provider has the [EU Authorization Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.html) role, realized as a SMART FHIR Resource Server. The consuming EHR system has the [EU Authorization Client](ActorDefinition-eu-authorization-client-eu-api.html) role, realized as a SMART Backend Service or SMART App according to the flow.
  * The [EU Authorization Server](ActorDefinition-eu-authorization-server-eu-api.html) is independent and MAY be co-located or organization-level. SMART-specific requirements are in [Authorization](authorization.html#healthcare-provider).
  * EHR systems are **not** required to use eIDAS wallet-based authorization for provider-internal exchange.

* Patient Identity
  * Healthcare providers may have an Enterprise Master Patient Index (EMPI) that identifies patients known to the organization and shares this patient identity with other EHR systems in the organization.
  * A gateway-facing EHR system is responsible for ensuring that data provided to national infrastructure includes the required national and European identifiers.
