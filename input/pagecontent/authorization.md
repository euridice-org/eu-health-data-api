
<div class="auth-change" markdown="1">

### Introduction

Authentication and authorization are required by the EHDS. This IG applies [SMART App Launch 2.2](https://hl7.org/fhir/smart-app-launch/STU2.2/) and [IHE IUA Revision 2.5](https://profiles.ihe.net/ITI/IUA/index.html), as selected for each environment in [The European Interoperability Landscape](implementation.html#the-european-interoperability-landscape). This page summarizes the EHDS evidence, compares the two specifications, selects a conformance target for each environment, and then defines the applicable actors, discovery, token, scope, and enforcement requirements. Potential hybrid rules remain future work.

### EHDS Requirements

The EHDS requires identification and authentication of natural persons and health professionals, proxy and representation services, security controls, and logging. The applicable enacted provisions are [Article 4(2)-(3)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4), [Articles 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12), [16](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_16), [30](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_30), [36](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_36), and [73](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_73); [Recitals 7](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_7), [21](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_21), and [112](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_112); and [Annex II section 3](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#anx_2). This factual summary is not legal advice, and several details remain subject to future implementing acts. A valid API token is not itself evidence of consent, a treatment relationship, patient identity, or entitlement beyond its granted scope and applicable local policy.

| EHDS topic | Enacted evidence |
|---|---|
| Identification and login | [Article 16](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_16) establishes electronic identification for access services and future interoperable cross-border mechanisms. [Article 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12) and [Annex II section 3.1](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#anx_2) address health-professional identification and authentication. |
| European Digital Identity Wallet (EIDAS) | [Recital 21](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_21) states that digital proxy solutions should align with European Digital Identity Wallet technical specifications. The Wallet is an electronic-identification means recognised under [Article 6 of eIDAS](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910#art_6), on which [Articles 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12) and [16](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_16) rely; detailed cross-border alignment remains subject to Article 16 implementing acts. |
| Proxy and representation | [Article 4(2)-(3)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4) and [Recital 21](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_21) require transparent proxy services and representation arrangements. |
| Security | [Article 30](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_30), [Article 36(3)(e)-(f)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_36), [Recital 112](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_112), and [Annex II section 3](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#anx_2) address security, confidentiality, integrity, and EHR security controls. |
| Logging | [Annex II sections 3.2-3.3](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#anx_2) require identified access-event logging and review tooling; [Article 73(1)(e)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_73) requires identifiable logs for secure secondary-use processing. |

Consent, patient matching, audit, identity proofing, client registration, trust establishment, key lifecycle, revocation, federation, and policy administration remain distinct responsibilities. They are established by the applicable deployment and law, not by a token alone.

### IHE IUA And SMART App Launch

SMART and IUA both apply OAuth-based authorization to healthcare APIs, but neither is a subset of the other. SMART couples authorization discovery to the FHIR endpoint and supplies application-launch context and FHIR resource scopes. [IUA](https://profiles.ihe.net/ITI/IUA/index.html#3442-use-cases) supports direct access and access through intermediaries using OAuth-based authorization. Its [JWT option](https://profiles.ihe.net/ITI/IUA/index.html#3714221-json-web-token-option) profiles claims for user identity, clinical context, and consent-related information where applicable; other supported token options do not require JWT format. Cross-community use still requires agreed trust and authorization policy.

| Aspect | SMART App Launch | IHE IUA |
|---|---|---|
| Discovery | FHIR server at `{base}/.well-known/smart-configuration` | Authorization Server metadata; locating the server is out of scope |
| Scope model | FHIR resource scopes such as `patient/Observation.rs` | Core IUA defines no API-specific scope vocabulary; MHD integration defines `ITI-65` through `ITI-68` when the corresponding MHD actors are grouped with IUA |
| Context | Launch context and token-response parameters | Profiles user identity, clinical context, and consent-related claims under the applicable token option and integration |
| Interactive use | App launch is a core use case | Authorization-code grant is supported, without an app-launch framework |
| System-to-system use | Backend Services with client credentials, asymmetric authentication, and `system/` scopes | Client credentials with IUA actors and selected integration requirements |

Same-endpoint dual support is not claimed because the two specifications do not define scope, discovery, or token-context precedence.

SMART App Launch is best suited to context-aware application launch or authorization-endpoint discovery from a FHIR server URL. IUA is suited to established environments where actor locations, including the Authorization Server, are preconfigured, and the deployment requires IUA transaction integration or its JWT claim profile. This IG selects one profile per concrete endpoint; a deployment may expose distinct endpoints using different profiles, but it does not claim same-endpoint dual conformance. Future versions may define hybrid deployments.

SMART deployments do not automatically use the IUA JWT claim profile. That is an IUA token
option, not a protocol-independent overlay. A deployment that needs equivalent claims with SMART
must separately define their issuance, validation, and semantics; this IG defines no
cross-protocol claim profile.

Claims and scopes are orthogonal. Scopes express requested or granted access to interactions;
claims convey identity or other context that an Authorization Server issues and a Resource Server
may use with the granted scope and local policy. A scope may itself be represented as a token claim,
but that does not make the concepts interchangeable. Core IUA defines no API-specific scope
vocabulary; the [MHD integration](https://profiles.ihe.net/ITI/IUA/index.html#3364-use-with-the-internet-user-authorization-iua-profile)
defines transaction scopes only for the corresponding MHD transactions grouped with IUA. Neither
contextual claims nor scopes alone establish consent or entitlement to every matching resource.

<a name="authorization-server-deployment"></a>
#### Authentication And API Authorization

The [Authentication Service](ActorDefinition-authentication-service-eu-api.html) authenticates an
end user, directly or through a Wallet or upstream identity provider. The
[Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.html) relies on an
acceptable authentication result when user authentication is required, applies authorization
policy, and issues API access tokens. The
[Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.html)
validates or introspects tokens and enforces granted authorization. See
[Authentication and Authorization Groupings](actors.html#authentication-and-authorization-groupings)
for the logical roles and deployment boundaries.

The Authentication Service MAY be grouped with the Authorization Server in one implementation,
or they may be separately deployed. In the latter case, their trust relationship and authentication
interface are deployment-defined, not an interoperable transaction specified by this IG. The
deployment must establish trusted authentication sources, intended recipients, freshness and replay
controls, applicable assurance, and mapping to local users and patients. Authentication alone
does not grant API access. The Authentication Service is IG-defined; using it does not transfer
the formal [IUA Authorization Server](https://profiles.ihe.net/ITI/IUA/index.html#34112-authorization-server)
or [SMART Authorization Server](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html)
conformance obligations.

Authorization Server / Resource Server co-location is a separate optional deployment choice, not
a required provider grouping. A Resource Server accepts tokens only under its established issuer
trust, token-validation arrangements, audience or resource binding, granted scopes, and local policy.
SMART discovery can publish absolute authorization endpoints on a different host; it does not
require common hosting or a common operator. Each illustrated Authorization Server serves the
illustrated API trust relationship, not all APIs or all Member States.

An [OIDC ID token](https://openid.net/specs/openid-connect-core-1_0.html#IDToken) describes an
authentication event for its intended client; it is not an API access token. A Wallet presentation
is likewise not an API access token. A deployment could separately profile
[OAuth Token Exchange](https://www.rfc-editor.org/rfc/rfc8693.html#section-2), but neither this actor
separation nor Wallet support requires an app to exchange identity evidence for an API token.
Acceptance of such evidence, its audience, trust and authorization semantics would need a separate
profile; no such exchange is claimed here.

[IUA's grant discussion](https://profiles.ihe.net/ITI/IUA/index.html#34411-authorization-grant-types)
also describes optional SAML and JWT assertion grants for federation. These are distinct from
RFC 8693 token exchange and from an OIDC ID token; accepting a particular assertion still requires
the deployment's trust and protocol agreements. This IG does not select one of those interfaces
for the Authentication Service.

### Using eIDAS for User Authentication

The [European Digital Identity Wallet](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910#art_6) (under eIDAS) can work alongside a SMART authorization flow. The Authorization Server can use the Wallet as one way to authenticate the user, while SMART handles the application’s authorization to access health data.

Where the selected environment requires support for eIDAS-recognised electronic identification—for example, electronic health data access services under [EHDS Article 16(1)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_16)—the Authorization Server SHALL support authentication using those means, directly or through an identity provider. This applies to interactive
SMART or IUA authorization-code flows, not to a pre-authorized SMART Backend Service using
`client_credentials`. The Authorization Server validates the authentication result, establishes
the user session, applies the applicable authorization policy, and issues a code or token only
after successful authorization.

A deployment MAY use
[OpenID for Verifiable Presentations 1.0](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)
to obtain and validate a verifiable presentation from a Wallet, but this IG does not select a
presentation format, credential schema, or Wallet-to-Authorization-Server profile. The
applicable eIDAS assurance, health-professional status, and local authorization policy remain
separate from the OAuth grant and access-token scopes. Where an applicable rule or deployment
specifies an eID assurance level, [eIDAS Article 8](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:02014R0910-20241018#art_8)
and [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/eli/reg_impl/2015/1502/oj/eng)
address assurance levels for electronic-identification schemes and means. The EHDS does not
select a universal assurance level for health API access, and an eID assurance level does not
itself authorize access to an API resource.



{% include img.html svg="authorization-eidas-sequence.svg"
    caption="eIDAS authentication in an authorization flow" %}

The [EUDI Wallet Architecture and Reference Framework (ARF) v3.0.0](https://eudi.dev/3.0.0/)
is an informative guide to harmonised Wallet implementation, not a replacement
for binding eIDAS requirements ([§1.3](https://eudi.dev/3.0.0/main/01-introduction/#13-purpose-scope-and-audience)).
Its Annex 2 requirements apply to named actors, not Users
([A.2.1.1](https://eudi.dev/3.0.0/annexes/annex-2/annex-2.02-high-level-requirements-by-topic/#a2211-overview),
[A.2.1.2](https://eudi.dev/3.0.0/annexes/annex-2/annex-2.02-high-level-requirements-by-topic/#a2212-key-words)).
For implementation guidance, see the [reference architecture](https://eudi.dev/3.0.0/main/04-high-level-architecture/#43-reference-architecture),
[presentation flows](https://eudi.dev/3.0.0/main/04-high-level-architecture/#44-data-presentation-flows),
[OpenID4VP with HAIP](https://eudi.dev/3.0.0/main/05-data-model-and-data-exchange-protocols/#574-remote-attestation-presentation-using-openid4vp-and-haip),
and [trust model](https://eudi.dev/3.0.0/main/06-trust-model/).

Under eIDAS, using the Wallet for user authentication is at the User's
[voluntary request and limited to the minimum data necessary](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:02014R0910-20241018#art_5f);
this does not remove an applicable environment-conditioned identification
requirement. A service provider is a Wallet Relying Party when it requests
Wallet attributes; an Authorization Server is not automatically one. For
Relying Party registration and Wallet authentication, including request replay
protection, see [ARF §6.4.2](https://eudi.dev/3.0.0/main/06-trust-model/#642-relying-party-registration)
for registration, and [§6.6.3.2](https://eudi.dev/3.0.0/main/06-trust-model/#6632-wallet-unit-authenticates-the-relying-party-instance)
with [Annex 2 RPA_01](https://eudi.dev/3.0.0/annexes/annex-2/annex-2.02-high-level-requirements-by-topic/#RPA_01)
for Wallet authentication of the Relying Party and replay protection.
The Wallet authenticates its User and obtains approval before releasing
attributes ([§6.6.3.5](https://eudi.dev/3.0.0/main/06-trust-model/#6635-wallet-unit-obtains-user-approval-for-presenting-selected-attributes));
that approval is not a legal basis for processing
([§6.6.3.5.1](https://eudi.dev/3.0.0/main/06-trust-model/#66351-introduction)). If a Relying Party relies on
Wallet-side authentication to bind a presenter to a PID or device-bound
attestation, it verifies device binding; the ARF also describes other
[user-binding methods](https://eudi.dev/3.0.0/main/06-trust-model/#6639-relying-party-instance-verifies-or-trusts-user-binding).
LoA High concerns PID authentication, not all attestations
([§2.2](https://eudi.dev/3.0.0/main/02-eudi-wallet-functionalities/#22-identification-and-authentication)).

The ARF does not define a Wallet-to-Authorization-Server integration profile
or how a deployment maps Wallet results to local accounts or patients and makes
authorization decisions. A validated result may be used as upstream user
authentication before continuing the selected SMART or IUA authorization-code
flow with local policy. A Wallet presentation is not an access token or grant
and does not itself confer API authorization or determine the protocol's scopes
or claims.

For example, a patient can sign in to a Wellness Application using a Wallet without yet granting
that app access to an EHR. The app initiates the selected
[SMART authorization-code flow](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html)
for the target EHR API. Its Authorization Server arranges authentication through the Authentication
Service, which may reuse a trusted existing session or request another Wallet presentation.
After applying access policy, the Authorization Server returns an authorization code; the app
redeems it with PKCE and receives an API access token. The app does not send its Wallet presentation
or an ID token to the FHIR API in place of that access token. Wallet request routing, including
same-device interaction, is deployment-specific; an EHR-hosted login page is not required.
Uploading data additionally requires granted write permissions and a supported receiving interaction;
sign-in does not create either.

### Environment-Specific Requirements

The figure below described the European interoperability landscape.

{% include img.html svg="EHDS-overview.drawio.svg"
    caption="European Interoperability Landscape" %}

Within this box, the white/grey boxes represents different environments. The authorization requirements in this
specification are environment specific. The different environment used are :

- **MyHealth@EU:** authorization is outside the scope of this IG. Alignment with [IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html) is recommended.
- **National Interoperability Infrastructure:** established Member State infrastructure with
    preconfigured participants. [IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html) is recommended where
    [user or patient claims](https://profiles.ihe.net/ITI/IUA/index.html#3714221-json-web-token-option) are needed.
- **Wellness Applications:** patient or clinician applications connecting to health data access
    services or EHR systems. [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html)
    is recommended where interactive third-party FHIR API access is offered; [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html#profile-audience-and-scope)
    is permitted only for the separately defined pre-authorized server-to-server flow.
- **Healthcare Provider:** internal clinical and gateway-facing deployments. [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html) is recommended where interactive third-party FHIR API access is offered:
    [Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html#use-this-profile-when-the-following-conditions-all-apply) applies to system-to-system uploads and interactive [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html) applies
    to clinician access.

#### MyHealth@EU

Authorization for MyHealth@EU is outside the scope of this IG. Deployments should align with
[IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html).

#### National Interoperability Infrastructure

For preconfigured system-to-system endpoints in the national infrastructure,
[IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html) is RECOMMENDED where national policy requires
IUA transaction integration or its [JWT Token Option](https://profiles.ihe.net/ITI/IUA/index.html#3714221-json-web-token-option).
This recommendation is limited to those endpoints; it does not require every endpoint in the
National Interoperability Infrastructure to use IUA. A system-to-system endpoint MAY instead use
[SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html#use-this-profile-when-the-following-conditions-all-apply)
when all of its applicability conditions are met. The deployment selects one profile per
Resource Server endpoint; distinct endpoints may select different profiles, but this IG does not
define dual conformance on one endpoint.

Interactive Wellness Application access to an HDAS or HPAS SHALL use
[SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html), including the
applicable Patient or Clinician Access flow. This interactive selection does not change the
separate profile choice for preconfigured system-to-system endpoints.

For endpoints selecting IUA, use the applicable [IUA actors](https://profiles.ihe.net/ITI/IUA/index.html#341-iua-actors-transactions-and-content-modules)
and metadata. Add [IUA MHD transaction scopes](https://profiles.ihe.net/ITI/IUA/index.html#3364-use-with-the-internet-user-authorization-iua-profile)
only for supported ITI-65 through ITI-68 transactions whose MHD actors are grouped with IUA.
Core IUA defines no API-specific scope vocabulary, and ITI-105 has no IUA-defined transaction
scope. SMART endpoints use the applicable SMART FHIR resource scopes instead.

#### Wellness Applications

Many Wellness Applications will developed to work in different member states or with differnet HDAS deployments in a member state. This requires such applications to discover th authorization infrastruture for this HDAS. Where a system offers third-party applications interactive access to its FHIR API, it SHOULD support [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html) using the applicable Patient or Clinician Access capability set.

Where a Health Data Access Service (HDAS) offers third-party applications interactive access to its FHIR API, it SHOULD support [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html) using the applicable Patient or Clinician Access capability set.

It is RECOMMENDED that it discovers the authorization endpoint using the
[SMART App Launch discovery mechanism](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#retrieve-well-known-smart-configuration).
As this app will access confidential information, it is RECOMMENDED to use the
[confidential client profile](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#support-for-public-and-confidential-apps).

Where interactive third-party app access is offered, a clinician-launched Wellness Application SHOULD use
[SMART App Launch EHR Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#launch-app-ehr-launch).
For the recommended Wellness-hosted-data pattern, the launch target is an application and the
FHIR server is hosted by the Wellness Application, allowing data to be retrieved into the EHR. The
Wellness Application SHALL support [current-patient launch context](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#apps-that-launch-from-the-ehr)
and use [Clinician Access for EHR Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/conformance.html#clinician-access-for-ehr-launch),
or [Clinician Access for Standalone](https://hl7.org/fhir/smart-app-launch/STU2.2/conformance.html#clinician-access-for-standalone)
when not launched by an EHR.

A patient-launched Wellness Application typically will use
[SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html)
with the EHR as FHIR server, use the applicable [Patient Access for EHR Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/conformance.html#capability-sets)
or [Patient Access for Standalone Apps](https://hl7.org/fhir/smart-app-launch/STU2.2/conformance.html#patient-access-for-standalone-apps)
capability set, and follow the applicable Argonaut Write successor for write workflows.

A Wellness Application connecting to a preconfigured, server-side provider-hosted
EHR-system SHOULD use [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html#use-this-profile-when-the-following-conditions-all-apply).

#### Healthcare Provider

Where a system offers third-party applications interactive access to its FHIR API, it SHOULD support [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html) using the applicable Patient or Clinician Access capability set.

This is this IG's environment-specific choice, not an EHDS requirement to use SMART and not a
claim that IUA cannot support clinician access. SMART provides FHIR-based endpoint discovery and
standalone or EHR-launch context; its Backend Services profile separately supports pre-authorized
system-to-system access. A provider's own user interface does not become a third-party SMART App
merely because a clinician signs in.

A system-to-system uploading of EEHRxF data to a gateway in order to provide the information
to the national infrastructure SHOULD use [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html#use-this-profile-when-the-following-conditions-all-apply).

<a name="authorization-server-discovery"></a>
<a name="get-access-token"></a>
<a name="incorporate-access-token"></a>

#### Flow Classification

Environment and flow are separate dimensions. "Application-guided authentication" is not an
alternative to patient or clinician access: either user type may authenticate through an app-guided
flow, and [IUA supports interactive access](https://profiles.ihe.net/ITI/IUA/index.html#3442-use-cases)
as well as system-to-system exchange. The existing environment selections above remain applicable.

| Flow | Client and user | Protected FHIR endpoint / data direction | Authorization and authentication | Endpoint location |
|---|---|---|---|---|
| Wellness to HDAS | SMART App; patient or clinician | HDAS API; supported reads or writes | Selected Patient or Clinician Access capability set; API Authorization Server uses Authentication Service for user authentication | SMART discovery from the target FHIR base |
| Patient Wellness to EHR | SMART App; patient, standalone or EHR launch | EHR API; access or supported patient-provided submission | Applicable Patient Access capability set, authorization code and PKCE; Authentication Service may use Wallet | SMART discovery from EHR FHIR base |
| Clinician accessing Wellness-hosted data | SMART App; clinician, standalone or EHR launch | Wellness-hosted API; data retrieved into EHR | Applicable Clinician Access capability set and current-patient context where required; launch target is an application, not the FHIR API itself | SMART discovery from Wellness FHIR base |
| Pre-authorized Wellness backend to EHR | SMART Backend Service; no runtime authorizing user | Provider-hosted EHR API; supported exchange | Client credentials and asymmetric client authentication; no runtime Authentication Service step | Preconfigured deployment; required SMART metadata remains applicable |
| Provider system to gateway | SMART Backend Service; no runtime authorizing user | Gateway API; EEHRxF upload | Pre-authorized Backend Services; no runtime Authentication Service step | Configured gateway FHIR base and SMART metadata |
| Interactive provider access | SMART App; clinician, standalone or EHR launch | Selected EHR API; permitted clinician interactions | Applicable Clinician Access capability set; API Authorization Server relies on Authentication Service | SMART discovery from target FHIR base |
| Established national exchange | Selected IUA Authorization Client; user context if applicable | Configured protected API; selected transactions | IUA recommendation above; Authentication Service only when the selected flow requires user authentication | Authorization Server location preconfigured; selected IUA metadata |

In each row, the API Authorization Server is the server selected for that endpoint and trust
relationship; it need not be hosted by the FHIR server. See the
[optional actor groupings](actors.html#authentication-and-authorization-groupings).

### SMART App Launch

The SMART roles used by this IG are [SMART App](ActorDefinition-smart-app-eu-api.html), [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.html), [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.html), [SMART Authorization Server](ActorDefinition-smart-authorization-server-eu-api.html), and [SMART Launching System](ActorDefinition-smart-launching-system-eu-api.html). Registration and client-key exchange are out of band.

Interactive Patient and Clinician Access flows SHALL use the authorization-code grant and PKCE as specified by [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html). All SMART Apps SHALL support PKCE; servers SHALL support `S256` and SHALL NOT support `plain`. Public clients do not authenticate at the token endpoint. Confidential interactive clients use their registered authentication method.

Patient Access for Standalone Apps requires `launch-standalone`, `client-public` or `client-confidential-symmetric`, `context-standalone-patient`, and `permission-patient`. Patient Access for EHR Launch requires `launch-ehr`, a permitted client capability, `context-ehr-patient`, and `permission-patient`. Clinician Access for Standalone requires `launch-standalone`, a permitted client capability, `permission-user`, and `permission-patient`. Clinician Access for EHR Launch requires `launch-ehr`, a permitted client capability, `context-ehr-patient`, `context-ehr-encounter`, `permission-user`, and `permission-patient`. These released capability sets are defined by [SMART conformance](https://hl7.org/fhir/smart-app-launch/STU2.2/conformance.html).

SMART Backend Services requires pre-authorized access, `client_credentials`, `private_key_jwt`, and normally `system/` scopes, as specified by [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html) and [asymmetric client authentication](https://hl7.org/fhir/smart-app-launch/STU2.2/client-confidential-asymmetric.html). Client assertions SHALL use an appropriate `typ`, `alg`, `kid`, `iss`, `sub`, `aud`, `exp`, and `jti`; the Authorization Server SHALL validate the signature, short expiry, audience, and replay protection. These requirements do not apply to public interactive clients.

#### SMART Discovery And CORS

FHIR capabilities are discovered from `[base]/metadata`; SMART metadata is discovered from `[base]/.well-known/smart-configuration`. SMART discovery SHALL publish absolute endpoint URLs and align its `token_endpoint`, grant types, capabilities, token-endpoint authentication methods, signing algorithms, and scopes with the selected flow. Interactive modes additionally publish the authorization endpoint, authorization-code and PKCE support, launch capabilities, and the selected Patient or Clinician capability set. Backend Services publishes `client_credentials`, asymmetric authentication, and supported system scopes. `jwks_uri` is for server-key discovery only; client keys are registered out of band.

Backend Services uses confidential server-side clients and does not itself require browser CORS. Where a deployment supports browser SMART Apps, `metadata` and `.well-known/smart-configuration` SHALL be available cross-origin; token and protected FHIR endpoints SHALL allow only registered client origins.

### IHE IUA

The IUA roles used by this IG are [IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.html), [IUA Authorization Server](ActorDefinition-iua-authorization-server-eu-api.html), and [IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.html). IUA mode uses the applicable [Authorization Client](https://profiles.ihe.net/ITI/IUA/index.html#34111-authorization-client), [Authorization Server](https://profiles.ihe.net/ITI/IUA/index.html#34112-authorization-server), and [Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#34113-resource-server) requirements. Core IUA requirements are separate from this IG's MHD transaction integration and from the additional recommendations here.

The Authorization Client authenticates to the Authorization Server, requests least-privilege scopes, and presents its bearer token. The Authorization Server authenticates the client, validates any client assertion, applies issuance policy, limits scopes to authorized scopes, prevents assertion replay, and issues tokens. The Resource Server validates token activity, expiry, issuer/signature or introspection, audience/resource binding where applicable, granted scope, request/claim consistency, and local policy. A Resource Server does not validate a client assertion for an independent Authorization Server.

IUA does not define a universal CORS requirement. System-to-system IUA does not require CORS. A deployment supporting browser IUA Authorization Clients SHALL define an explicit CORS policy: public metadata may be cross-origin, while token and protected-resource endpoints allow only explicitly authorized client origins.

<a name="transport-security"></a>
### Tokens, Scopes, Enforcement, And Errors

All token and protected-resource exchanges SHALL use TLS 1.2 or later. Access tokens are short-lived bearer tokens; they need not be JWTs unless the selected IUA option requires JWT format. A Resource Server MAY use [IUA ITI-102 token introspection](https://profiles.ihe.net/ITI/TF/Volume2/ITI-102.html) where selected.

Requested and granted scopes are distinct. Resource Servers SHALL enforce granted scopes and applicable policy. SMART v2 resource scopes use `<patient|user|system>/<ResourceType>.<cruds>` as described in [SMART scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html). Interactive flows use the applicable `patient/` and `user/` scopes; Backend Services uses the applicable `system/` scopes. The resource inventory is maintained in [Resource Access](resource-access.html).

For IUA-protected MHD transactions, the separate transaction scopes are `ITI-65`, `ITI-66`, `ITI-67`, and `ITI-68`, only when the corresponding transaction is supported. ITI-105 has no IUA-defined transaction scope and uses the applicable SMART scope or a future explicitly IG-defined extension. No scope family is a substitute for the other.

Protected-resource error responses follow the selected authorization specification. IUA token verification, scope matching, and access-policy failures return `401 Unauthorized` as specified in [ITI-72](https://profiles.ihe.net/ITI/IUA/index.html#37243-expected-actions). SMART requests may return `403 Forbidden` when access is denied by underlying permissions, as described in [SMART scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#smarts-scopes-are-used-to-delegate-access). A deployment MAY use `404 Not Found` to conceal resource existence only where permitted by the selected specification and when it documents that policy consistently. Consent and audit remain separate responsibilities.

### Potential Future Work

Future work may define a hybrid IHE IUA/SMART profile, including claim and scope mappings, discovery precedence, token-context precedence, error semantics, audit identity, and same-endpoint dual-conformance rules. These topics are not normative for this release.

</div>

{% include auth-todo.md %}
