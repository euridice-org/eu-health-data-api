# Design

The following decisions guide the design.

## Base technology to use

This specification requires OAuth2 as the main authentication and authorization mechanism.

## Auth related usage patterns

The following use cases/usage patterns are identified:
* system-2-system authorization
* patient-2-system authorization
* clinician-2-system authorization

For both patient and clinician, a further specialization includes a launch from one application where the context of the original application is imposed on the second (SMART App Launch).

## Authorization related actors

The following common actors are defined:
* Authorization Server - Issues access tokens to clients after validating their identity credentials and authenticating the user.
* Resource Server - Validates tokens and enforces access control on protected resources (the FHIR API)
* Authorization Client - A client that retrieves access tokens and presents them as part of transactions.

The SMART App Launch actors are:
* TBD

The following groupings are present when IHE-IUA is used:
* TBD

The following groupings are present when SMART App Launch is used:
* TBD


## Differences between SMART on FHIR and IUA

IUA has been optimized for situations where the client knowns the authorization server to use and scopes access on transactions. Discovery is based on `https://{host}/.well-known/oauth-authorization-server` on the authorization server.

SMART App Launch has been optimized for deployments where the client does not now the authorization server and discovers it using the `./wellknown` endpoint on the FHIR server. It also supports launching application within a certain scope boundary, something that IUA does not clearly defines.

Smart App Launch scopes define what a user is allowed to do on a resource level <user-type>/<Resource>/<cruds> (where user can be system, patient or user). IHE-IUA recommends IHE-transcation based scopes.

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



