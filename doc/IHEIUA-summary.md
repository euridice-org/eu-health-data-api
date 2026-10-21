# IHE-IUA Guidance for Scopes and Roles with IHE-MHD

Source: [IHE-IUA Revision 2.5, Trial Implementation](https://profiles.ihe.net/ITI/IUA/), published June 18, 2026, and [IHE-MHD 4.2.5-comment](https://profiles.ihe.net/ITI/MHD/). This is a technical summary of the profile guidance, not an authorization or legal policy.

## IUA authorization roles

IHE-IUA separates authorization functions from the roles defined by the protected business profile:

- **Authorization Client** obtains an access token and attaches it to the protected REST request.
- **Authorization Server** authenticates the client and, where applicable, the user; evaluates consent and configured policy; and issues the access token.
- **Resource Server** hosts the protected service, validates or introspects the token, and enforces the authorization decision.

The IUA actors may be grouped with actors from MHD. The MHD actor describes the system's role in document exchange; the IUA actor describes its authorization function.

## MHD and IUA actor groupings

| MHD actor | IUA actor | Authorization-related responsibility |
| --- | --- | --- |
| Document Source | Authorization Client | Obtain a token and submit documents |
| Document Consumer | Authorization Client | Obtain a token and search or retrieve documents |
| Document Recipient | Resource Server | Protect document submission |
| Document Responder | Resource Server | Protect searches and document retrieval |

The MHD actors remain responsible for their MHD transactions. IUA adds the authorization mechanism to those transactions.

## MHD transaction scopes

When the relevant MHD actors are grouped with IUA actors, the IUA supplement defines these transaction-specific scopes:

| MHD transaction | Scope | Implied authorization |
| --- | --- | --- |
| Provide Document Bundle [ITI-65](https://profiles.ihe.net/ITI/MHD/ITI-65.html) | `ITI-65` | Patient-specific Create/Update for the `DocumentManifest`, `DocumentReference`, `List`, and `Binary` resources involved in the submission |
| Find Document Lists [ITI-66](https://profiles.ihe.net/ITI/MHD/ITI-66.html) | `ITI-66` | Patient-specific Search/Read for `DocumentManifest` resources |
| Find Document References [ITI-67](https://profiles.ihe.net/ITI/MHD/ITI-67.html) | `ITI-67` | Patient-specific Search/Read for `DocumentReference` resources |
| Retrieve Document [ITI-68](https://profiles.ihe.net/ITI/MHD/ITI-68.html) | `ITI-68` | Patient-specific Read for `Binary` resources |

These scopes authorize the corresponding **full MHD transaction**. For example, `ITI-67` authorizes use of Find Document References; it does not grant unrestricted access to every `DocumentReference` in the repository.

Further refinement is allowed in realm- or project-specific implementations. Refinements may restrict document types, patients, organizations, purposes of use, confidentiality classes, or other operation details. Such refinements are deployment-specific additions; core IUA does not define a universal vocabulary for them.

## Are the ITI scopes required?

The `ITI-xx` scopes are required when the relevant MHD actor claims the IUA grouping. In that case, the MHD Authorization Client shall request the scope corresponding to the MHD transaction, and the grouped Resource Server shall require and enforce the authorization token for that transaction.

MHD does not require IUA, however. An MHD implementation that does not implement the IUA grouping is not required by MHD to use the `ITI-65` through `ITI-68` scopes. The requirement is conditional on using IUA with MHD, and applies only to the MHD transaction being authorized.

The Authorization Server still makes the final grant decision: it may grant the requested scope, issue a narrower grant, or reject the request. A client should therefore request the minimum scope needed for the transaction. Any realm- or project-specific refinements are additional to the base MHD transaction scope.

## Scope and final access decisions

A scope is only one input to the final access decision. The Resource Server should evaluate the combination of:

- the granted scope;
- token validity and audience;
- the MHD transaction and its query or resource data;
- authorization-context claims such as subject, organization, role, purpose of use, and patient identifier; and
- consent, confidentiality, organizational, and other local policy.

The Resource Server shall verify that the token scope covers the requested transaction and that relevant claims correspond to the transaction data. For example, where a patient identifier is carried in the authorization context, it may need to correspond to the patient targeted by the MHD request.

The Resource Server may restrict the response or reject the request even when the Authorization Server issued a valid token. Possession of `ITI-65` does not by itself establish that a Document Source may publish every document for every patient. Similarly, possession of `ITI-68` does not by itself establish entitlement to retrieve every patient's document.

## Roles are not permissions

IUA does not define a universal mapping from a clinical or organizational role to an MHD permission. It does not by itself define rules such as:

- a clinician may access only patients under their care;
- a consumer may retrieve only treatment documents;
- an organization may publish only its own documents; or
- a caller may use emergency or break-glass access.

Those rules must be defined by the deployment, national policy, another IHE profile, or an implementation guide. They may be expressed through deployment-specific scopes, token claims, consent artifacts, and Resource Server policy.

IUA conveys authorization information and requires enforcement; it does not define the complete policy-management or consent model. IUA explicitly does not replace consent-management mechanisms such as BPPC.

## Claims and consent context

Depending on the token option and deployment, IUA authorization tokens can carry context such as:

- `subject_role`;
- `subject_organization` and `subject_organization_id`;
- `purpose_of_use`;
- `person_id`; and
- BPPC-related patient and consent claims such as `patient_id`, `doc_id`, and `acp`.

These claims are inputs to policy evaluation. They are not automatically proof of a clinical relationship, patient match, consent, or entitlement.

## Relation to SMART on FHIR

IUA is OAuth-based but is not SMART on FHIR. IUA is intended for HTTP RESTful transactions generally and uses MHD transaction scopes such as `ITI-65` and `ITI-68`. SMART uses FHIR-specific launch, context, and scope conventions such as `patient/*.read` and `user/*.read`.

SMART and IUA can coexist, but an implementation must explicitly define how their scopes and claims are harmonized. A SMART scope should not be assumed to substitute for an IUA MHD transaction scope, or vice versa.

## Practical guidance for MHD implementations

1. If using IUA, group the MHD client actor with an IUA Authorization Client and the MHD server actor with an IUA Resource Server.
2. When the IUA grouping is claimed, request the minimum MHD transaction scope required: `ITI-65`, `ITI-66`, `ITI-67`, or `ITI-68`.
3. Restrict the token to the intended Resource Server using the OAuth `resource` parameter and corresponding audience handling where supported.
4. Ensure the Resource Server validates the token, scope, audience, expiry, and relevant authorization-context claims.
5. Apply additional patient, consent, confidentiality, organizational, and business rules at the Resource Server.
6. Define any finer-grained scopes or role-to-permission mappings as part of the applicable realm, national policy, or implementation guide.

The current IUA MHD integration text specifically defines scopes for ITI-65 through ITI-68. Implementations using newer or additional MHD transactions should verify whether corresponding IUA scope guidance exists for the applicable version, or define the authorization behavior explicitly for the deployment.
