# Design

The following decisions guide the design.

## Base technology to use

This specification uses OAuth2 profiles for API authorization. End-user authentication is a
separate responsibility and may use a Wallet or another deployment-selected mechanism.

## Auth related usage patterns

The following use cases/usage patterns are identified:
* system-2-system authorization
* patient-2-system authorization
* clinician-2-system authorization

For both patient and clinician, a further specialization includes a launch from one application where the context of the original application is imposed on the second (SMART App Launch).

## Authorization related actors

The following common actors are defined:
* Authentication Service - Authenticates end users, directly or using a Wallet or upstream identity provider; supplies a trusted authentication result. This is an IG-defined role, not a formal IUA or SMART actor.
* Authorization Server - Applies authorization policy and issues API access tokens. It relies on an acceptable Authentication Service result when user authentication is required and authenticates clients as required by the selected flow.
* Resource Server - Validates tokens and enforces access control on protected resources (the FHIR API)
* Authorization Client - A client that retrieves access tokens and presents them as part of transactions.

**Decision:** Authentication Service and EU Authorization Server MAY be grouped in one implementation
or separately deployed. Authorization Server / Resource Server co-location is a separate optional
choice; neither grouping is required of an API provider. The EU prefix denotes this IG's roles,
not EU-operated infrastructure. Existing Authorization Server identifiers are retained.

The formal IUA and SMART actors and mappings remain as defined in
[Actors and Transactions](../input/pagecontent/actors.md) and
[Authorization](../input/pagecontent/authorization.md). Using a separate Authentication Service
does not transfer the protocol Authorization Server's conformance obligations.

### PR 99: AndriesHamster Review Disposition

Source: [review comment](https://github.com/euridice-org/eu-health-data-api/pull/99#discussion_r4245521795).
These are local dispositions; no GitHub reply or thread resolution is implied.

| Review topic | Decision and source evidence |
|---|---|
| Direct / indirect identity and access management | Clarify IUA direct and intermediary access, but do not adopt JWT-only wording. The selected token option controls format and claims; authentication and API authorization remain separate. See Authorization comparison. |
| Claims versus scopes | Clarify that claims convey identity and authorization context while scopes express permitted interactions; granted scopes may themselves be a token claim. Core IUA has no API-specific scope vocabulary; ITI-65 through ITI-68 apply only to corresponding MHD transactions grouped with IUA. See Authorization comparison and token section. |
| Duplicated / provider-contained Authorization Server | Show an independent Authorization Server outside required provider groupings in actor diagrams. Authentication Service grouping and Resource Server co-location are independent optional deployment choices. See actor groupings and displayed figures. |
| Separate identity and API-token issuance | Accept distinct Authentication Service and Authorization Server responsibilities. The interface between separate implementations is deployment-defined. Neither an ID token nor an app-mediated token exchange is mandatory; a concrete exchange profile is deferred. See Authentication And API Authorization. |
| Wallet login followed by EHR upload | App sign-in does not grant EHR API access. The API authorization flow can rely on Wallet-backed authentication directly or through an upstream service; write scopes and a supported receiving interaction are still required. See Wallet example and Wellness use case. |
| Why SMART for provider access | Preserve the IG's current environment choice and explain discovery/launch rationale; this is not an EHDS protocol mandate or an assertion that IUA cannot support clinicians. Backend Services and interactive Clinician Access remain distinct. |
| Suggested flow segmentation | Add an environment/flow matrix rather than replace environments with "application-guided authentication" versus patient/clinician access. These are overlapping dimensions. No protocol-selection mandate changes are adopted. |

**Boundary:** This release does not standardize an independently interoperable Authentication Service
interface, federation profile, or identity-token-to-API-access-token exchange. Separate implementations
need explicit trust, recipient/audience, freshness/replay, assurance and identity-mapping agreements.
An OIDC ID token, Wallet presentation, or IUA access token is not automatically interchangeable with
an access token for another API. IUA also describes optional SAML/JWT assertion grants for federation;
these do not establish a mandatory interface for the new actor or imply RFC 8693 support.

#### Requirement Coverage And Validation

| Requirements | Result and evidence |
| --- | --- |
| AUTH-ACTOR-000/000A, AUTH-ACTOR-002/002A | Met: four generic roles, the IG-defined Authentication Service, preserved Authorization Server identity and formal protocol duties; see Actors.fsh and the actor-grouping narrative. |
| AUTH-ACTOR-005/006/009/010, AUTH-CHECK-001/006/013/014 | Met: optional authentication/authorization grouping, independent resource-server co-location, consistent displayed group diagrams and authentication sequence; no universal server topology. |
| AUTH-GEN-003/005/006, AUTH-TOKEN-002/003 | Met for this change: distinct identity evidence, client authentication, API tokens, contextual claims, granted scopes and policy; deployment-defined trust interface explicitly bounded. |
| AUTH-PAGE-ENV-004/005/006, AUTH-CHECK-009/012 | Existing protocol selections preserved; flow matrix and Wellness/portal examples clarify interactive versus pre-authorized access without adopting a new protocol-selection policy. |
| AUTH-ACCEPT-003/004/007 | Build completed with SUSHI 0 errors / 0 warnings. Generated actor pages, artifact discoverability, six dependent pages, two displayed grouping diagrams and the authentication sequence checked. Eight generated CapabilityStatements retain their existing security selections. |

QA compared with the unchanged branch baseline: **1 error / 12 warnings / 45 informational
messages / 0 broken links**, versus **1 / 12 / 44 / 1**. The pre-existing terminology error is
the display for LOINC `85430-7` on the imaging-report DocumentReference example; the 12 warnings
are unchanged. The added informational message suggests assigning an OID to the new ActorDefinition.
The broken landscape link on the authorization page was corrected. Diagram previews were
visually inspected; the active figures use local PlantUML-generated SVGs, with legacy draw.io
metadata preserved in the no-longer-included artwork.


## Differences between SMART on FHIR and IUA

IUA leaves locating the Authorization Server to the deployment. Its optional metadata transaction
uses `https://{host}/.well-known/oauth-authorization-server` on that server. Core IUA defines no
API-specific scope vocabulary; MHD integration adds transaction scopes when grouped with IUA.

SMART App Launch has been optimized for deployments where the client does not now the authorization server and discovers it using the `./wellknown` endpoint on the FHIR server. It also supports launching application within a certain scope boundary, something that IUA does not clearly defines.

SMART resource scopes use `<patient|user|system>/<ResourceType>.<cruds>`. IUA MHD transaction scopes
are separate from contextual token claims. Neither scope syntax nor claims alone determine access policy.

IHE-IUA documents elements like the current user and organization as claims in the JWT-token (using identifiers), SMART App Launch adds them as additional parameters (using logical Ids and possibly identifiers) next to the token when the access-token is provided.

These (and likely other) differences make a situation where both IHE-IUA and SMART App Launch are combined possible but but requiring additional specification which is infeasible in the current scope and timeframe of this specification.

**Conclusion:** Allowing both SMART App Launch and IHE-IUA on the same deployment should be allowed but deferred to future versions of the spec.

**Conclusion:** For each deployment a decision has be made to what flavour of OAuth to support.

## Support of EIDASH user authentication

EHDS names [Regulation (EU) No 910/2014 (eIDAS)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910) in eight provisions, but only two of them attach an eIDAS obligation to a service that authenticates an end user. [Article 12](https://www.ringholm.com/ehds/article-12.htm) makes possession of eIDAS-recognised electronic identification means a condition of access to health professional access services, and [Article 16(1)](https://www.ringholm.com/ehds/article-16.htm) obliges the electronic health data access services under [Article 4](https://www.ringholm.com/ehds/article-4.htm) to accept such means so that the natural person's right to use them can be exercised. The remaining references — [Article 2(1)(f)](https://www.ringholm.com/ehds/article-2.htm), Article 16(2) to 16(4), Article 19(2)(m) and Article 96(1)(a) — bind the Commission, the Member States or the digital health authorities to define infrastructure, adopt implementing acts or cooperate with supervisory bodies, rather than requiring any particular system to authenticate a user by eIDAS means. No eIDAS obligation attaches to secondary use, to HealthData@EU or to authorised participants. Constraining eIDAS to the patient and health professional access services therefore reflects the scope of the enacted text exactly, and avoids importing an identity-assurance requirement into components that the Regulation does not subject to one.

**Decision:** this guide requires eIDAS-recognised electronic identification only for the patient access service and the health professional access service, because those are the only two services on which EHDS places such an obligation. Two qualifications are carried through into the specification text:

1. For the health professional access service, the Article 36 common-specification alternative is preserved. eIDAS is not stated as the only admissible mechanism.
2. For the patient access service, the requirement is expressed as an obligation to accept eIDAS-recognised means, not an obligation to reject other means, matching the right-based wording of Article 16(1).

**Decision:** No eIDAS requirement is placed on secondary use, on HealthData@EU, on authorised participants, or on system-to-system exchange between EHR systems, since the Regulation imposes none.

## Where to use SMART App Launch or IHE=IUA

This makes SMART App Launch more suited to the APIS's where such discovery is benificial and deployment would benifit from a target environment independent development. This specically applies to:
* Wellness related APIs:
  * Wellness (HDAS)
  * Wellnes (Direct)

The launch and discovery mechanism also benifits application deployed within Healthcare Providers:
* (Internet based) Clinician applications operating in healtcare providers
* Application that are launched with context.

Other deployments might benifit from one or the other but no clear preference can be identified.

## Client registration

For all deployments accept for Wellness Apps, client registration is required. In the case of Patient accessing their healthdata, UDAP Dynamic Client Registration (UDAP DCR) should be considered to auto-register an application.

## Open topic to be speced out

Scopes used for WADO access. Current DICOM item might address.
