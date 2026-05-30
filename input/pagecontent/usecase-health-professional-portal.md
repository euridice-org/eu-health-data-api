### Overview

A **Health Professional Access Service** ([Art. 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12)) is provided by a Member State to health professionals for accessing their patients' health data. The service can be delivered as a web portal, an API, or other means. It authenticates the professional, locates the patient, and queries one or more EHR systems. The infrastructure behind these services is country-specific — see [Member State Architectures](member-state-architectures.html).

### Scope

This IG defines the API the access service uses to query EHR systems. Requirements for the access service itself — including how the professional authenticates (e.g., eIDAS), how the patient is located, and how queries are routed — are governed by Member State requirements and are **out of scope** here.

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

Two deployment patterns are in use:

**Broker model (HPAS as intermediary):** The professional authenticates to the HPAS (e.g., eIDAS). The HPAS holds system-level credentials and queries EHR systems using SMART Backend Services. At the EHR API surface, the consumer is an authorized system-to-system caller; the professional's identity is asserted by the HPAS.

**Direct-EHR-auth model:** The professional authenticates directly to the EHR system using institutional credentials, as described in IPA and SMART on FHIR. In this model, the EHR enforces access policy at the API surface.

Both patterns are consistent with this IG; the choice depends on Member State architecture. See [Authorization](authorization.html) for the SMART/IUA details that apply to either model.
