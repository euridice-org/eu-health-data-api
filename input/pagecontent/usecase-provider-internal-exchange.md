### Overview

Provider-internal exchange describes how a healthcare provider can use the same interoperability component capabilities within its own environment.

This page is informative. EHDS does not require provider-internal workflow changes. It shows where the interoperability component API surface defined in this IG can support internal exchange, aggregation for external exchange, or both.

<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:80%; height:auto;" role="img" >
      <image href="usecase-provider-internal-exchange.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    </svg>
    <figcaption class="figure-caption"><em>Figure: Provider-Internal Exchange</em></figcaption>
  </figure>
  <p></p>
</div>

A healthcare provider may deploy multiple EHR systems. Those systems may expose document or resource access directly, or the provider may use a gateway, facade, aggregator, or registry-style deployment to present a single EHR system boundary. See [EHR System Composition Patterns](ehr-system-composition.html).

When the provider connects to national infrastructure, the gateway-facing EHR system is responsible for making provider data available through the API surface expected by the Member State. Provider-internal exchange and national exchange can use the same interoperability component capabilities, but they are separate deployment contexts.

### Participants

- **EHR systems** — systems within the healthcare provider. They can act as [Document Access Providers](actors.html#document-access-provider), [Resource Access Providers](actors.html#resource-access-provider), and/or [Document Publishers](actors.html#document-publisher).
- **Gateway, facade, aggregator, or registry** — an implementation pattern used to expose provider data through a single EHR system boundary. See [EHR System Composition Patterns](ehr-system-composition.html).
- **Healthcare professionals** — users within the healthcare provider who may access EEHRxF information through local EHR workflows. User-facing workflow requirements are outside this IG.
- **National infrastructure** — external infrastructure that may consume provider data for cross-organization exchange, access services, or cross-border exchange.

### Requirements

Specific requirements related to this environment include:

* Regulatory
  * The EHDS regulation does not contain specific provider-internal exchange requirements.
  * Provider-internal exchange can support Member State obligations by making provider data available for national infrastructure, access services, or MyHealth@EU.

* Access patterns
  * EHR systems may support resource and/or document based access.
  * Registry-style deployments require a registry or repository component that can provide access to published EEHRxF documents.
  * Registry or repository deployments define which component retains published EEHRxF document versions and makes them available for later access.

* Authorization
  * EHR systems acting as Document/Resource Access providers may contain their own authorization server, or use an organization-level authorization server to control API access.
  * EHR systems are **not** required to use eIDAS wallet-based authorization for provider-internal exchange.

* Patient Identity
  * Healthcare providers may have an Enterprise Master Patient Index (EMPI) that identifies patients known to the organization and shares this patient identity with other EHR systems in the organization.
  * A gateway-facing EHR system is responsible for ensuring that data provided to national infrastructure includes the required national and European identifiers.
