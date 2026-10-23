# Logging and Audit Considerations (Informative) - EU Health Data API v1.0.0-ballot

## Logging and Audit Considerations (Informative)

This page is **informative**. This Implementation Guide specifies interoperability for API interactions. It does not define an EHR logging format, a common audit service, or an exchange mechanism for audit records between systems. [EHDS Annex II sections 3.2-3.3](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#anx_2) include local logging and review requirements for EHR systems; the applicable requirements and their implementation are determined by the regulation and relevant deployment policy. This page is explanatory and does not add conformance requirements to this Implementation Guide. See [Regulatory Anchors](regulatoryAnchors.md#scope-of-this-ig) for the scope of this guide.

### API Events and Later User Access

An API access event and a later user's access to the data are different events that may occur in different systems. For example:

1. A professional at a Health Professional Access Service selects a patient, and that service requests data from a source EHR through the API. The source EHR can record the API request and its response or release of data according to its local logging requirements.
1. The receiving system stores or otherwise makes the returned data available. If a user later views that data in the receiving system, that system can record the user access according to its own local logging requirements.

The source EHR does not necessarily observe the later user access in the receiving system. Conversely, a record of the API request at the source does not by itself describe every subsequent use of the received data. These records therefore describe different points in the access path; this example does not define a shared audit record or require the systems to exchange or correlate their logs.

### Authentication, Authorization, and Logging

Authentication and API authorization are also distinct from logging. Depending on the selected environment and authorization flow, a request may carry user or clinical context, or may use a pre-authorized system-to-system flow without runtime user authentication. Implementations should not assume that every API access token contains an end-user identity. What information is available to a local logging component, and how it is associated with a local user or event, depends on the deployment and applicable policy. See [Authorization](authorization.md#authentication-and-api-authorization) for the authentication and API authorization boundaries.

### Logging Infrastructure and Scope

Deployments may use [syslog](https://www.rfc-editor.org/rfc/rfc5424), [IHE ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), or [IHE BALP](https://profiles.ihe.net/ITI/BALP/index.html), as appropriate to their logging needs. This informative guidance does not mandate a particular logging technology or profile.

This page does not prescribe audit-event content, identifiers, retention, transport, a common log format, cross-system log interoperability, or cross-system correlation. It does not determine the legal basis for access, consent policy, or the responsibilities assigned to a particular service or EHR. Those matters remain governed by applicable law, adopted specifications, and deployment policy.

