
### Introduction

Authentication and authorization are required by the EHDS. This IG applies [SMART App Launch 2.2](https://hl7.org/fhir/smart-app-launch/STU2.2/) and [IHE IUA Revision 2.5](https://profiles.ihe.net/ITI/IUA/index.html), as selected for each environment in [4.0.1 The European Interoperability Landscape](member-state-architectures.html#401-the-european-interoperability-landscape). This page summarizes the EHDS evidence, compares the two specifications, selects a conformance target for each environment, and then defines the applicable actors, discovery, token, scope, and enforcement requirements. Potential hybrid rules remain future work.

### EHDS Requirements

The EHDS requires identification and authentication of natural persons and health professionals, proxy and representation services, security controls, and logging. The applicable enacted provisions are [Article 4(2)-(3)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4), [Articles 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12), [16](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_16), [30](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_30), [36](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_36), and [73](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_73); [Recitals 7](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_7), [21](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_21), and [112](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_112); and [Annex II section 3](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#anx_2). This factual summary is not legal advice, and several details remain subject to future implementing acts. A valid API token is not itself evidence of consent, a treatment relationship, patient identity, or entitlement beyond its granted scope and applicable local policy.

| EHDS topic | Enacted evidence |
|---|---|
| Identification and login | [Article 16](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_16) establishes electronic identification for access services and future interoperable cross-border mechanisms. [Article 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12) and [Annex II section 3.1](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#anx_2) address health-professional identification and authentication. |
| European Digital Identity Wallet (EIDAS) | [Recital 7](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_7) states that digital and proxy solutions should align with European Digital Identity Wallet technical specifications. The Wallet is an electronic-identification means recognised under [Article 6 of eIDAS](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910#art_6), on which [Articles 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12) and [16](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_16) rely; detailed cross-border alignment remains subject to Article 16 implementing acts. |
| Proxy and representation | [Article 4(2)-(3)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4) and [Recital 21](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_21) require transparent proxy services and representation arrangements. |
| Security | [Article 30](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_30), [Article 36(3)(e)-(f)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_36), [Recital 112](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_112), and [Annex II section 3](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#anx_2) address security, confidentiality, integrity, and EHR security controls. |
| Logging | [Annex II sections 3.2-3.3](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#anx_2) require identified access-event logging and review tooling; [Article 73(1)(e)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_73) requires identifiable logs for secure secondary-use processing. |

Consent, patient matching, audit, identity proofing, client registration, trust establishment, key lifecycle, revocation, federation, and policy administration remain distinct responsibilities. They are established by the applicable deployment and law, not by a token alone.

### IHE IUA And SMART App Launch

SMART and IUA both apply OAuth-based authorization to healthcare APIs, but neither is a subset of the other. SMART couples authorization discovery to the FHIR endpoint and supplies application-launch context and FHIR resource scopes. IUA supports preconfigured, cross-community deployments and can carry user and patient claims in a token.

| Aspect | SMART App Launch | IHE IUA |
|---|---|---|
| Discovery | FHIR server at `{base}/.well-known/smart-configuration` | Authorization Server metadata; locating the server is out of scope |
| Scope model | FHIR resource scopes such as `patient/Observation.rs` | Core IUA has no scopes; MHD integration defines `ITI-65` through `ITI-68` transaction scopes |
| Context | Launch context and token-response parameters | Optional user, patient, role, purpose-of-use, and consent-related claims |
| Interactive use | App launch is a core use case | Authorization-code grant is supported, without an app-launch framework |
| System-to-system use | Backend Services with client credentials, asymmetric authentication, and `system/` scopes | Client credentials with IUA actors and selected integration requirements |

Same-endpoint dual support is not claimed because the two specifications do not define scope, discovery, or token-context precedence.

SMART App Launch is best suited to context-aware application launch or authorization-endpoint discovery from a FHIR server URL. IUA is best suited to established environments where actor locations, including the Authorization Server, are preconfigured, or where user and patient information must be carried in the access token. This IG selects one profile per endpoint and environment; it does not claim same-endpoint dual conformance. Future versions may define hybrid deployments.

SMART deployments SHOULD use IUA-formatted JWT access tokens only where the deployment separately adopts the IUA JWT claim profile; token formatting alone does not claim IUA protocol conformance.

### Using eIDAS for User Authorization

Where the selected environment requires electronic identification under the EHDS, the
Authorization Server SHALL use an eIDAS-recognised electronic-identification means to
authenticate the end user before making its authorization decision. This applies to interactive
SMART or IUA authorization-code flows, not to a pre-authorized SMART Backend Service using
`client_credentials`. The Authorization Server validates the authentication result, establishes
the user session, applies the applicable authorization policy, and issues a code or token only
after successful authorization.

The [European Digital Identity Wallet](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910#art_6)
can provide that electronic-identification result where applicable. A deployment MAY use
[OpenID for Verifiable Presentations 1.0](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)
to obtain and validate a verifiable presentation from a Wallet, but this IG does not select a
presentation format, credential schema, or Wallet-to-Authorization-Server profile. The
applicable eIDAS assurance, health-professional status, and local authorization policy remain
separate from the OAuth grant and access-token scopes.

{% include img.html svg="authorization-eidas-sequence.svg"
    caption="eIDAS authentication in an authorization flow" %}

### Environment-Specific Requirements

The figure below described the European interoperability landscape.

{% include img.html svg="EHDS-overview.drawio.svg"
    caption="European Interoperability Landscape" %}

Within this box, the white/grey boxes represents different environments. The authorization requirements in this
specification are environment specific. The different environment used are :

- **MyHealth@EU:** established cross-border infrastructure. IHE IUA is recommended.
- **National Interoperability Infrastructure:** established Member State infrastructure with
    preconfigured participants. IHE IUA is recommended where user or patient claims are needed.
- **Wellness Applications:** patient or clinician applications connecting to health data access
    services or EHR systems. SMART App Launch is required; SMART Backend Services is permitted
    only for the separately defined pre-authorized server-to-server flow.
- **Healthcare Provider:** internal clinical and gateway-facing deployments. SMART is required:
    Backend Services applies to system-to-system uploads and interactive SMART App Launch applies
    to clinician access.

#### MyHealth@EU

IHE IUA is recommended for MyHealth@EU. This IG gives no additional explicit authorization guidance for this environment.

#### National Interoperability Infrastructure

IHE IUA is RECOMMENDED where the established national environment preconfigures the participants and requires user or patient claims. Those are IUA token claims, not OAuth scopes. The applicable IUA actors, transaction scopes, and metadata are selected by the deployed MHD transactions.

#### Wellness Applications

Wellness Applications SHALL use SMART App Launch. 

A Wellness Application connecting to a Health Data Access Service (HDAS) SHALL use SMART App Launch. It is RECOMMENDED that it discovers  the authorization endpoint using the SMART App Launch discovery mechanism. As this app will access confidential information, it is RECOMMENDED to use the confidential client profile.

A clinician-launched Wellness Application SHALL use SMART App Launch. It is RECOMMENDED that the target if the launch is a FHIR server hosted by the Wellness Application allowsing the EHR to retrieve relevant information. The Wellness Application SHALL support current-patient launch context and use Clinician Access for EHR Launch, or Clinician Access for Standalone when not launched by an EHR. 

A patient-launched Wellness Application typically will use SMART App Launch with the EHR as FHIR server, use the applicable Patient Access for EHR Launch or Patient Access for Standalone Apps capability set, and follow the applicable Argonaut Write successor for write workflows.

A Wellness Application connecting to a preconfigured, server-side provider-hosted EHR-system SHOULD use SMART Backend Services. 

#### Healthcare Provider

Healthcare Provider deployments SHALL use SMART. A system-to-system upload through a gateway to national infrastructure SHALL use SMART Backend Services. Interactive clinician access SHALL use SMART App Launch and select Clinician Access for Standalone or Clinician Access for EHR Launch according to launch mode. Each use case SHALL state the selected subset; this IG does not infer a backend profile for an interactive flow.

For every flow, the client, independent Authorization Server, Resource Server/FHIR server, user type, launch mode, data direction, and discovery model SHALL be identified. The authorization diagrams and use-case pages apply these selections; HDAS refers to the Health Data Access Service.

The ActorDefinition and `kind = requirements` CapabilityStatement resources in this IG describe
cross-environment requirements. Provider actors pair with the Resource Server role selected for the
environment; consumers and other token-obtaining actors pair with the selected authorization-client
role. These abstract CapabilityStatements do not advertise one fixed security-service coding. A
concrete deployment CapabilityStatement SHALL advertise only its selected service: `SMART-on-FHIR`
for SMART or the IHE `IUA` coding for IUA, unless a future profile explicitly defines dual
conformance. The Resource Server role is implemented by the protected FHIR endpoint and remains
distinct from the Authorization Server, including when both are co-located.

<a name="authorization-server-discovery"></a>
<a name="get-access-token"></a>
<a name="incorporate-access-token"></a>
<a name="authorization-server-deployment"></a>
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

IUA does not define a universal CORS requirement. System-to-system IUA does not require CORS. A deployment supporting browser IUA Authorization Clients SHALL define an explicit IG CORS policy: public metadata may be cross-origin, while token and protected-resource endpoints allow only explicitly authorized client origins.

<a name="transport-security"></a>
### Tokens, Scopes, Enforcement, And Errors

All token and protected-resource exchanges SHALL use TLS 1.2 or later. Access tokens are short-lived bearer tokens; they need not be JWTs unless the selected IUA option requires JWT format. A Resource Server MAY use [IUA ITI-102 token introspection](https://profiles.ihe.net/ITI/TF/Volume2/ITI-102.html) where selected.

Requested and granted scopes are distinct. Resource Servers SHALL enforce granted scopes and applicable policy. SMART v2 resource scopes use `<patient|user|system>/<ResourceType>.<cruds>` as described in [SMART scopes](https://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html). Interactive flows use the applicable `patient/` and `user/` scopes; Backend Services uses the applicable `system/` scopes. The resource inventory is maintained in [Resource Access](resource-access.html).

For IUA-protected MHD transactions, the separate transaction scopes are `ITI-65`, `ITI-66`, `ITI-67`, and `ITI-68`, only when the corresponding transaction is supported. ITI-105 has no IUA-defined transaction scope and uses the applicable SMART scope or a future explicitly IG-defined extension. No scope family is a substitute for the other.

Authentication failures use `401 Unauthorized`; authenticated requests lacking authority use `403 Forbidden`. A deployment MAY use `404 Not Found` to conceal resource existence only when it documents that policy consistently. Consent and audit remain separate responsibilities.

### Potential Future Work

Future work may define a hybrid IHE IUA/SMART profile, including claim and scope mappings, discovery precedence, token-context precedence, error semantics, audit identity, and same-endpoint dual-conformance rules. These topics are not normative for this release.

{% include auth-todo.md %}
