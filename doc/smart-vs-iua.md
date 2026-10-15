# SMART App Launch vs IHE IUA — Comparison

Status: reference note for the authorization ballot reconciliation. Slide-ready.

Verified against **SMART App Launch v2.2.0 (STU 2.2)** and **IHE IUA Revision 2.5 Trial Implementation (18 June 2026)**.

Related notes: [decisions.md](decisions.md), [IHEIUA-summary.md](IHEIUA-summary.md), [aspects-of-auth.md](aspects-of-auth.md), [design-transaction-eidas-authentcation.md](design-transaction-eidas-authentcation.md).

## Comparison

Both build on OAuth 2.1. Neither is a subset of the other.

| | SMART App Launch | IHE IUA |
|---|---|---|
| Base standard | OAuth 2.1 + OpenID Connect + FHIR | OAuth 2.1 + FHIR directly |
| Relationship to the other | — | "Not based on SMART-on-FHIR, but does strive to not conflict with that standard" |
| Discovery anchored at | FHIR server, `{fhir base}/.well-known/smart-configuration` | Authorization Server, `https://{host}/.well-known/oauth-authorization-server` (ITI-103, optional) |
| Finding the Authorization Server | Advertised by the FHIR server | Explicitly out of scope; the client must already know it |
| Scope model | Resource-level, `patient/Observation.rs` | None defined in core IUA; the MHD integration adds transaction scopes `ITI-65` to `ITI-68` |
| Launch context | `launch`, `launch/patient`, `launch/encounter`, `fhirContext` | None, deliberately rejected |
| User identity | `openid` + `fhirUser`, returned in an `id_token` | Optional JWT claims `subject_name`, `subject_role`, `person_id` |
| Context delivery | Parameters alongside the access token | Claims inside the token; the Resource Server matches them against the request |
| Purpose of use and roles | Not defined | `purpose_of_use`, `subject_role`, XUA-aligned |
| Consent data | Not defined | BPPC extension: `patient_id`, `doc_id`, `acp` |
| System-to-system | SMART Backend Services | Client credentials grant |
| Interactive flows | Core focus | Supported; the Authorization Server shall support the authorization code grant |
| User authentication method | Not constrained | Not constrained, deferred to national extensions |

## Key takeaways

- **Neither is "the healthcare one".** Both cover interactive and system-to-system flows.
- **The real split is architectural.** SMART couples the FHIR server to the Authorization Server; IUA keeps them independent.
- **Scopes are the incompatibility.** `ITI-67` authorizes a transaction; `patient/DocumentReference.rs` authorizes a resource plus interaction. They overlap without being equivalent, and neither is a machine-checkable subset of the other.
- **IUA has no app-launch framework.** SMART has no purpose-of-use, role, or consent claims.
- **Combining both is permitted but undefined.** IUA ITI TF-2: 3.72.4.3 requires the Resource Server to verify that the scope covers the transaction, so a SMART-only token fails with HTTP 401 unless the guide defines precedence.

## What each is good at

| Strength | SMART | IUA |
|---|---|---|
| Client built without prior knowledge of the deployment | yes | |
| Application launched with patient or encounter context | yes | |
| Well-established scope vocabulary | yes | |
| Loose coupling, and non-FHIR resources | | yes |
| Purpose of use, roles and consent carried in the token | | yes |
| Cross-community and document sharing (XDS, XCA) | | yes |

## Corrections to commonly repeated statements

| Statement often made | Correction |
|---|---|
| "IUA claims it supports SMART on FHIR" | IUA states it "is not based on SMART-on-FHIR, but does strive to not conflict with that standard". Closed Issue 13 describes a "(partial) overlap in the supported use-cases". IUA claims no SMART conformance. |
| "IUA is focused on system-to-system" | The Authorization Server shall support both the authorization code and client credentials grants (ITI TF-1: 34.1.1.2). Three of the four use cases in 34.4.2.1 are interactive, including a patient native mobile app. The real gap is that the user authentication method is unconstrained. |
| "IUA adds transaction-scoped scopes" | Core IUA defines no scopes at all (Closed Issue 11, Open Issue 14, ITI TF-2: 3.103.4.2.2). The `ITI-65` to `ITI-68` scopes are defined by the MHD updates carried in the supplement (3.65.5.2 to 3.68.5.2) and apply only when MHD actors are grouped with IUA actors. |
| "SMART is not for system-to-system" | SMART Backend Services covers autonomous clients, using `client_credentials`, `private_key_jwt` and `system/` scopes. |
| "SMART scopes are `user-type/Resource/cruds`" | The separator before the permissions is a dot: `patient/Observation.rs`. Since v2, scopes may also carry search-parameter constraints. |
| "IUA is looking to align with SMART, which makes it volatile" | Harmonisation comment is invited through Closed Issues 11 and 13, which are closed in Rev 2.5. The declared volatility lies elsewhere: Open Issue 15 (OAuth 2.1 draft tracking) and Open Issue 14 (possible adoption of Rich Authorization Requests). |

## Decisions required to support both in one deployment

### Discovery and binding

| # | Decision | Conflict |
|---|---|---|
| A1 | Which discovery documents a Resource Server must publish | SMART anchors at the FHIR base; IUA anchors at the Authorization Server, and ITI-103 is optional |
| A2 | Which `CapabilityStatement.rest.security.service` codings are published | IUA requires the code `IUA`; SMART uses `SMART-on-FHIR` |
| A3 | How a client determines which mode applies | IUA states that locating the Authorization Server is out of scope |
| A4 | Consistency rule between the two documents | They can disagree about `token_endpoint` |

### Scopes

| # | Decision | Conflict |
|---|---|---|
| B1 | Which vocabulary is authoritative | Transaction scope versus resource-plus-interaction scope |
| B2 | Behaviour when a token carries only one family | ITI TF-2: 3.72.4.3 leads to HTTP 401 |
| B3 | Whether a normative mapping table is defined | Neither specification provides one |
| B4 | Precedence when the two families disagree | Undefined in both |
| B5 | Whether both families must be requested together | Increases request size and risks silent partial grants |
| B6 | SMART v1 versus v2 permission syntax | `.read`/`.write` versus `.cruds`, advertised as `permission-v1` or `permission-v2` |
| B7 | Scopes for non-MHD APIs | IPA and QEDm resource access, and WADO |

### Token content and context

| # | Decision | Conflict |
|---|---|---|
| C1 | Where patient context lives | IUA `person_id` and BPPC `patient_id` in the token, versus the SMART `patient` token-response parameter |
| C2 | Precedence when both are present and disagree | Undefined in both |
| C3 | How user identity is represented | IUA `subject_name` as an identifier, versus SMART `fhirUser` as a resource URL |
| C4 | Whether an `id_token` is issued | IUA has no `id_token` and no `nonce` |
| C5 | Whether purpose of use and role are required | IUA defines them, SMART does not |
| C6 | Whether consent data is carried | IUA BPPC extension, SMART silent |
| C7 | Whether launch context is permitted in IUA mode | IUA has no launch mechanism by design |
| C8 | Authentication context claims | Needed for eIDAS (`acr`, `amr`), defined by neither |

### Client authentication and registration

| # | Decision | Note |
|---|---|---|
| D1 | Permitted client authentication methods | IUA mandates `client_secret_basic` as the baseline; SMART Backend Services requires `private_key_jwt`. Both allow other reliable methods |
| D2 | Whether `private_key_jwt` is required for system-to-system | Recommended, but IUA does not name it |
| D3 | Registration model | UDAP Dynamic Client Registration is proposed for patient apps; IUA places registration out of scope |
| D4 | Redirect URI matching rule | IUA requires a fixed registered URI but states no matching algorithm |

### Protocol conformance details

| # | Decision | Note |
|---|---|---|
| E1 | PKCE challenge method | Both require PKCE. SMART shall use `S256` and shall not allow `plain`; IUA says the method "may be `S256`". Tighten to `S256` |
| E2 | `state` | Required by IUA, optional in OAuth 2.1 |
| E3 | Token lifetimes | IUA: codes single-use or 5 minutes, access tokens up to 1 hour with 5 minutes recommended. SMART Backend Services: `expires_in` should not exceed 300 seconds |
| E4 | Refresh tokens | Optional in IUA; SMART Backend Services should not issue them |
| E5 | OAuth 2.1 draft version | IUA cites draft-09 in ITI-71 but draft-01 in ITI-72, ITI-102 and ITI-103 |
| E6 | Grant types | Confirm alignment between the IUA client credentials grant and SMART Backend Services |

### Introspection

| # | Decision |
|---|---|
| F1 | Whether opaque tokens are permitted or JWT is mandatory |
| F2 | Whether the introspection response must carry `extensions.ihe_iua`, as ITI TF-2: 3.102.4.2.2 requires |
| F3 | Whether SMART context parameters appear in the introspection output |

### Enforcement and audit

| # | Decision |
|---|---|
| G1 | Resource Server behaviour when the patient claim and the requested patient do not match |
| G2 | Error semantics, HTTP 401 versus 403 versus OAuth error codes |
| G3 | ATNA audit identity. IUA mandates `alias"<"user"@"issuer">"` derived from `aud`, `sub` and `iss`; SMART does not constrain these, so mixed deployments produce inconsistent audit records |

### User authentication

| # | Decision |
|---|---|
| H1 | Both specifications leave the method unconstrained; this is where the eIDAS step applies |
| H2 | The `acr` value vocabulary and its mapping to eIDAS assurance levels |
| H3 | How "eIDAS required" is distinguished from "eIDAS preferred" |
| H4 | How health professional status is proven, since eIDAS authenticates a person and not a role |

## Minimum set for feasible dual support

1. **B1 to B4** — scope authority, mapping and precedence. Everything else is survivable; this is not.
2. **A1 and A2** — which discovery documents and security codes are published.
3. **C1 and C2** — where patient context lives and which representation wins.
4. **F2** — introspection content, if opaque tokens are allowed.
5. **G3** — audit identity consistency.

That is roughly ten normative statements. The existing conclusion to defer dual support remains well founded, because B3 requires a mapping table that neither specification provides and that would need its own consensus process.

## Alternative worth considering

Permit both **per deployment** but forbid both **on the same Resource Server endpoint**.

This removes B2, B4, C2, F3 and G3 entirely, because no token ever carries both scope families, while still allowing a Member State to choose either approach. It may deliver most of the flexibility at a fraction of the specification cost.
