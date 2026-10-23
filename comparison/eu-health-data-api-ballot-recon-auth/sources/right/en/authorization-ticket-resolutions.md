# Proposed Authorization Ticket Resolutions - EU Health Data API v1.0.0-ballot

## Proposed Authorization Ticket Resolutions

# Proposed Authorization Ballot Ticket Resolutions

## Summary

| | | | |
| :--- | :--- | :--- | :--- |
| [FHIR-56367](https://jira.hl7.org/browse/FHIR-56367) | Add an eIDAS/Wallet note for Access Providers. | Partially addressed | Retain service-specific regulatory guidance; decide whether an actor cross-reference is needed. |
| [FHIR-56368](https://jira.hl7.org/browse/FHIR-56368) | Explain SMART alignment with eIDAS, Wallet, and GDPR. | Partially addressed | Retain upstream-authentication guidance; leave assurance mapping, GDPR detail, and Wallet profile selection open. |
| [FHIR-56369](https://jira.hl7.org/browse/FHIR-56369) | Clarify whether extra IUA client constraints need a distinct actor. | Partially addressed | Retain generic/protocol actor separation; clarify provenance of added constraints. |
| [FHIR-56386](https://jira.hl7.org/browse/FHIR-56386) | Include applicable IUA roles in the HPAS flow. | Addressed | Accept explicit IUA roles for qualifying national-infrastructure hops, without a universal IUA mandate. |
| [FHIR-56388](https://jira.hl7.org/browse/FHIR-56388) | Add mTLS/RFC 8705 alongside private_key_jwt. | Not addressed | Retain private_key_jwt; defer mTLS until token-binding and profile requirements are defined. |
| [FHIR-56581](https://jira.hl7.org/browse/FHIR-56581) | Compare all IG-relevant SMART/IUA differences. | Addressed | Accept the expanded comparison; optional links can improve navigation without duplicating detail. |
| [FHIR-56584](https://jira.hl7.org/browse/FHIR-56584) | Clarify user-level authorization, token context, and audit. | Addressed | Accept the modified clarification; keep user context and audit responsibilities deployment-specific. |
| [FHIR-56615](https://jira.hl7.org/browse/FHIR-56615) | Explain regulatory fit and avoid universal SMART requirements. | Partially addressed | Preserve flow-specific choices; leave assurance mapping and detailed GDPR treatment open. |
| [FHIR-56616](https://jira.hl7.org/browse/FHIR-56616) | Define a distinct actor if requirements exceed IUA. | Partially addressed | Reconcile the same actor-boundary question as the earlier IUA-client ticket. |
| [FHIR-56639](https://jira.hl7.org/browse/FHIR-56639) | Explain resource scopes. | Addressed | Accept contextual guidance and linked capability explanations in place of the standalone list. |
| [FHIR-56650](https://jira.hl7.org/browse/FHIR-56650) | Separate Consumer MAY and Provider SHOULD/MAY parameter obligations. | Partially addressed | Retain current discovery and scope distinctions; do not add a blanket Consumer-MAY rule without a specific operation and parameter set. |
| [FHIR-56660](https://jira.hl7.org/browse/FHIR-56660) | Acknowledge direct patient-to-EHR access alongside the broker model. | Partially addressed | Cross-reference direct-EHR guidance on the requested access-service pages and clarify consent implications. |
| [FHIR-56698](https://jira.hl7.org/browse/FHIR-56698) | Explain Backend Services rationale, IUA relationship, and scope granularity. | Partially addressed | Accept independent profiles; leave national scope mapping and foundational-RFC disposition explicit. |
| [FHIR-56699](https://jira.hl7.org/browse/FHIR-56699) | Clarify CT recommendation and ATNA/ITI-19/ITI-20 implications. | Partially addressed | Confirm CT strength and ATNA grouping; reconcile diagrams and logging boundaries. |
| [FHIR-56705](https://jira.hl7.org/browse/FHIR-56705) | Make Backend Services one option in the example. | Addressed | Accept explicit SMART/IUA actors and the SMART-only token-request illustration. |
| [FHIR-56713](https://jira.hl7.org/browse/FHIR-56713) | Use protocol-specific references; clarify SMART is not universal. | Addressed | Accept environment/flow selection; retain IUA as an active option. |
| [FHIR-56838](https://jira.hl7.org/browse/FHIR-56838) | Clarify terminology, obligation strength, and regulatory baseline. | Partially addressed | Preserve scoped eIDAS obligations; resolve strength inconsistencies and wider-framework requests explicitly. |
| [FHIR-56845](https://jira.hl7.org/browse/FHIR-56845) | Make actors EU-specific and clarify IHE/SMART positioning. | Partially addressed | Clarify IG conformance beyond base IHE; do not remove applicable IUA groupings without a decision. |
| [FHIR-56848](https://jira.hl7.org/browse/FHIR-56848) | Avoid mandatory Backend Services in CapabilityStatements. | Addressed | Accept abstract requirements with environment-selected IUA, Backend Services, or interactive SMART modes. |
| [FHIR-56852](https://jira.hl7.org/browse/FHIR-56852) | Replace the blanket Backend Services SHALL. | Addressed | Accept conditional requirements and the corrected Functional overview. |
| [FHIR-57252](https://jira.hl7.org/browse/FHIR-57252) | Add FAST Security as an optional framework. | Not addressed | Defer FAST for this release while preserving future consideration; do not add FAST conformance rules. |
| [FHIR-57498](https://jira.hl7.org/browse/FHIR-57498) | Convey the home Member State in IUA claims. | Not addressed | Agree semantics, identifiers, issuers, validation, and conformance strength before adding a claim or mapping. |

## Scope and Basis

This report compares the same 22 listed tickets from the authorization ballot checklist and local ballot directory with the current `eu-health-data-api-ballot-recon-auth` source snapshot. [FHIR-56666](https://jira.hl7.org/browse/FHIR-56666) remains excluded from this report's existing scope. Jira records were refreshed from the live export; the report and worknote already had uncommitted edits at the start of the refresh. Where a synced Jira disposition differs from an older per-ticket analysis artifact, the entries distinguish the Jira record from the proposed direction. Each listed ticket received an isolated read-only review, followed by direct verification of the original record and important source claims. No passage is attributed to a particular commit or claimed as newly introduced by this branch.

Coverage labels describe implementation, not Jira closure: **Addressed**, **Partially addressed**, or **Not addressed**. Local statuses and resolutions in this report are not Jira updates. These are proposed workgroup dispositions, not new conformance requirements.

Evidence links target published IG pages and generated actors or CapabilityStatements. The maintained SMART/IUA comparison is broader than the table rendered on [Authorization](authorization.md#ihe-iua-and-smart-app-launch). Outstanding same-endpoint hybrid questions are future work, not prerequisites for the currently selected single-profile endpoints. Authorization scope remains SMART App Launch and IHE IUA; other frameworks require explicit approval.

**Open consistency decision:** current Authorization prose mixes SHOULD/RECOMMENDED support for interactive third-party applications with a SHALL for interactive Wellness access to HDAS/HPAS. The internal authorization requirements also retain broader environment-level SHALL wording. This report preserves those differences for reconciliation; it does not silently strengthen or weaken source requirements, extend the IUA recommendation beyond qualifying preconfigured system-to-system endpoints, or make MyHealth@EU authorization an in-scope conformance target.

## Ticket Findings

### FHIR-56367: Add eIDAS/EU Wallet note (Access Provider)

* **Local status / resolution:** Waiting for Input / Unresolved.
* **Request:** Add an eIDAS/EU Digital Identity Wallet compliance note for access mechanisms or Access Providers.
* **Current content:** **Partially addressed.** [Authorization](authorization.md#ehds-requirements) summarizes the regulatory evidence; [Using eIDAS](authorization.md#using-eidas-for-user-authentication) conditions electronic-identification support on the relevant service/deployment. [Actors](actors.md) does not add the requested note to the Access Provider description.
* **Proposed resolution / open decision:** Retain the service-specific boundary highlighted in the May 13 comment; decide whether the provider actor needs a cross-reference. Do not imply every EHR vendor or API provider must operate a Wallet or perform end-user identity proofing.

### FHIR-56368: Clarify SMART compliance with EU regulation

* **Local status / resolution:** Triaged / Unresolved.
* **Request:** Explain SMART alignment with eIDAS, Wallet, and GDPR, potentially mapping assurance levels and Wallet integration.
* **Current content:** **Partially addressed.** [Using eIDAS](authorization.md#using-eidas-for-user-authentication) cites enacted provisions and assurance references, adds informative Wallet architecture/presentation/trust guidance, and explains upstream authentication before selected SMART or IUA authorization-code flows. It selects neither a universal assurance level nor a Wallet presentation format, credential schema, or integration profile. Detailed GDPR analysis is absent.
* **Proposed resolution / open decision:** Retain these implemented boundaries. Leave concrete assurance mapping, Wallet profile selection, and detailed GDPR treatment for service-specific requirements; neither SMART conformance nor Wallet attribute approval establishes legal compliance or API entitlement.

### FHIR-56369: Clarify IUA vs SMART actor usage

* **Local status / resolution:** Triaged / Unresolved.
* **Request:** Clarify whether extra IUA client constraints need a separately named actor; the original text also described SMART precedence.
* **Current content:** **Partially addressed.** The [generic Authorization Client](ActorDefinition-eu-authorization-client-eu-api.md) avoids automatic protocol conformance, and a separate [IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.md) exists. [Authorization](authorization.md#ihe-iua) separates core IUA from MHD integration and added recommendations, but the IUA actor's least-privilege-scope behavior is not explicitly classified by provenance.
* **Proposed resolution / open decision:** Classify core IUA, conditional MHD integration, and IG additions. Decide whether any adopted normative delta needs a derived actor; generic-role separation alone does not prove that question resolved. Do not restore universal SMART precedence.

### FHIR-56386: Health Professional Access Service Authorization

* **Local status / resolution:** Waiting for Input / Unresolved.
* **Request:** Include IUA in the HPAS authorization flow, previously described only with SMART.
* **Current content:** **Addressed.** [HPAS Authorization](usecase-health-professional-portal.md#authorization) explicitly maps qualifying national-infrastructure hops to IUA Authorization Client, Resource Server, and Authorization Server actors. It separately identifies interactive SMART clinician access and conditional Backend Services and links central environment requirements.
* **Proposed resolution / open decision:** Accept this inclusion of IUA, subject to workgroup disposition. The service title alone does not select a protocol; neither universal IUA support nor simultaneous SMART/IUA conformance is implied.

### FHIR-56388: Security and Authorization

* **Local status / resolution:** Waiting for Input / Unresolved.
* **Request:** Add RFC 8705/mTLS and certificate-bound access tokens alongside `private_key_jwt`. A comment also objects to mandatory Backend Services in CapabilityStatements.
* **Current content:** **Not addressed.** [Authorization](authorization.md#smart-app-launch) specifies asymmetric client authentication for Backend Services; its token section specifies bearer tokens and TLS, not RFC 8705 support. The abstract CapabilityStatement selected-mode model addresses the comment's separate concern, not the main mTLS request.
* **Proposed resolution / open decision:** Keep mTLS outstanding pending profile compatibility, registration/discovery, certificate lifecycle, and token-binding validation decisions. Do not advertise it as already supported or silently replace inherited SMART requirements.

### FHIR-56581: IUA & SMART Differences

* **Refreshed Jira status / resolution:** Triaged / Persuasive.
* **Request:** Compare all IG-relevant SMART/IUA differences, rather than one example under a blanket SMART-precedence rule.
* **Current content:** **Addressed.** [Authorization](authorization.md#ihe-iua-and-smart-app-launch) compares discovery, scopes, context, interactive use, and system-to-system use and replaces blanket precedence with endpoint selection. The broader maintained comparison is supplementary; its additional distinctions need not all be repeated in the published table.
* **Proposed resolution / open decision:** Accept the comparison and endpoint-selection model. Add navigation to the maintained comparison if useful, without making completeness depend on duplicating every distinction in the published table or copying unresolved hybrid decisions into conformance rules.

### FHIR-56584: Authorization & User Level

* **Refreshed Jira status / resolution:** Triaged / Persuasive with Modification.
* **Request:** Clarify user-level authentication/authorization scope, token user context, and audit-message implications.
* **Current content:** **Addressed.** [Authentication and API authorization](authorization.md#authentication-and-api-authorization) and [actor groupings](actors.md#authentication-and-authorization-groupings) distinguish end-user authentication, token issuance, and API enforcement. [Regulatory Anchors](regulatoryAnchors.md) bounds logging formats and interoperability; the IG does not claim that API-side records capture every subsequent user access in a receiving system.
* **Proposed resolution / open decision:** Accept the modified clarification. Keep the division of logging responsibility explicit without prescribing interoperable log correlation or resolving disputed legal interpretations of access services. Token context does not itself establish consent or audit completeness.

### FHIR-56615: SMART should be preferred not mandatory

* **Local status / resolution:** Waiting for Input / Unresolved.
* **Request:** Explain EU regulatory fit, assurance, Wallet integration, and GDPR constraints; avoid universal SMART requirements.
* **Current content:** **Partially addressed.** [Using eIDAS](authorization.md#using-eidas-for-user-authentication) explains upstream authentication and assurance references but supplies no SMART-to-assurance mapping or detailed GDPR constraints. [Environment-specific requirements](authorization.md#environment-specific-requirements) distinguish IUA endpoints, interactive SMART, and pre-authorized Backend Services rather than imposing Backend Services universally.
* **Proposed resolution / open decision:** Reconcile with [FHIR-56368](https://jira.hl7.org/browse/FHIR-56368). Preserve service-specific obligations and the distinction between profile selection and regulatory compliance. Review concrete assurance/GDPR additions and the strength inconsistency identified above rather than introducing a blanket preference rule.

### FHIR-56616: Revise the IUA Authorization Client actor

* **Local status / resolution:** Waiting for Input / Unresolved.
* **Request:** Define a distinct actor if requirements go beyond the standard IUA Authorization Client.
* **Current content:** **Partially addressed.** Separate [generic](ActorDefinition-eu-authorization-client-eu-api.md) and [IUA](ActorDefinition-iua-authorization-client-eu-api.md) client roles exist, but the latter's least-privilege-scope wording does not explicitly classify base-profile versus IG-added behavior.
* **Proposed resolution / open decision:** Use the same provenance review as [FHIR-56369](https://jira.hl7.org/browse/FHIR-56369). Define a further derived actor only if an adopted normative delta requires one; do not claim the generic role is itself a derived IUA profile.

### FHIR-56639: Add explanations to the scopes section

* **Refreshed Jira status / resolution:** Resolved - No Change / Not Persuasive.
* **Request:** Explain the resource scopes previously listed without context.
* **Current content:** **Addressed.** [Resource Access](resource-access.md#core-resources) replaces the standalone list with flow-specific `patient/`, `user/`, and `system/` context, distinguishes IUA, and links central scope guidance. Its linked [Provider](CapabilityStatement-resource-access-provider-eu-api.md) and [Consumer](CapabilityStatement-resource-consumer-eu-api.md) statements distinguish supported/needed resources and explain `.rs` as read plus search. Resource-support discovery is explained on the narrative page.
* **Proposed resolution / open decision:** Accept removal of the ambiguous list plus contextual guidance and linked capability explanations as addressing the request. This does not require every server to support every listed resource or apply Backend Services scopes to interactive access.

### FHIR-56650: Clarify authorization parameter SHOULDs and consumer MAYs

* **Refreshed Jira status / resolution:** Triaged / Not Persuasive.
* **Request:** Explicitly separate Provider parameter support from Consumer permission to supply the same parameters.
* **Current content:** **Partially addressed.** [Authorization](authorization.md#smart-app-launch) separates client-assertion construction from server validation and describes discovery. [Resource Access](resource-access.md) and client/server capabilities distinguish resource support and requests. These do not explicitly settle the original authorization-parameter list's Consumer MAY wording.
* **Proposed resolution / open decision:** Do not add a blanket Consumer-MAY statement without a specific operation and parameter set. Keep client use and server support distinct, and do not confuse search parameters, OAuth parameters, scopes, and assertion claims.

### FHIR-56660: Reference direct-EHR-auth on the Health Data Access Service page

* **Local status / resolution:** Triaged / Unresolved.
* **Request:** Acknowledge direct patient-to-EHR SMART/IPA access alongside the broker model, with consent-enforcement implications, on HDAS and HPAS where applicable.
* **Current content:** **Partially addressed.** [Wellness exchange patterns](usecase-wellness-app.md#wellness-application-exchange-patterns) distinguish direct-EHR from HDAS-linked exchange, and [Authorization](authorization.md#flow-classification) includes interactive Patient Access to an EHR. The requested [HDAS page](usecase-health-data-portal.md) still describes the access-service model without the explicit direct-auth alternative or comparative consent note.
* **Proposed resolution / open decision:** Cross-reference the existing pattern from the requested pages, without replacing or preferring either architecture. Keep consent implications tied to provider/Member State policy; direct authentication alone does not guarantee consent enforcement. Portal-credential and IPA workflow details should not be claimed as fully implemented by the existing wellness text.

### FHIR-56698: SMART Authorization

* **Refreshed Jira status / resolution:** Triaged / Not Persuasive with Modification.
* **Request:** Explain Backend Services rationale and alleged binding to an IUA Authorization Server; assess resource scopes versus national regulatory groupings and foundational OAuth references.
* **Current content:** **Partially addressed.** [Authorization](authorization.md#ihe-iua-and-smart-app-launch) explains distinct profiles and endpoint selection, not a required SMART-to-IUA binding. It separates claims, SMART resource scopes, and conditional MHD transaction scopes. It does not define a national-regulatory-grouping crosswalk or adopt the ticket's RFC-only alternative.
* **Proposed resolution / open decision:** Retain independent profile selection. Leave national grouping/enforcement mappings to an explicit policy decision, without claiming scope equivalence. Decide whether foundational RFC references support a specific requirement; references alone do not define the requested regulatory-scope semantics.

### FHIR-56699: Foundational IHE Profiles CT, ATNA

* **Local status / resolution:** Waiting for Input / Unresolved.
* **Request:** Make CT a recommendation given national NTP differences; clarify ATNA/ITI-19 implications and ITI-20 optionality.
* **Current content:** **Partially addressed.** [Actors](actors.md) lists CT without explicit strength or NTP-version guidance. [Authorization](authorization.md#tokens-scopes-enforcement-and-errors) requires TLS 1.2 or later; [Regulatory Anchors](regulatoryAnchors.md) bounds logging interoperability and says ATNA grouping is recommended, not required. The [Document Exchange](document-exchange.md) and [Resource Access](resource-access.md) diagrams nevertheless label TLS as ITI-19 ATNA Authenticate Node.
* **Proposed resolution / open decision:** Confirm CT strength/national NTP compatibility and intended ATNA grouping against applicable IHE requirements. Reconcile ITI-19 labels and decide ITI-20 scope explicitly; TLS alone is not proof of complete ATNA conformance.

### FHIR-56705: Revise the token-obtainment step

* **Refreshed Jira status / resolution:** Triaged / Persuasive (resolved 2026-10-22; Pre Applied: Yes).
* **Request:** Make Backend Services one possible authorization mechanism in the example, not mandatory in every environment.
* **Current content:** **Addressed.** [Example Patient Summary](example-patient-summary.md) links SMART or IUA realizations for client, Resource Server, and Authorization Server. Prerequisites, the diagram note, and "Obtain Access Token" explicitly identify the detailed request as a Backend Services illustration and link the selected IUA alternative. Backend Services prerequisites exclude runtime end-user authorization.
* **Proposed resolution / open decision:** Accept this bounded example as addressing the ambiguity. It does not specify every interactive scenario or authorize frameworks beyond the central [Authorization](authorization.md) choices.

### FHIR-56713: Revise references to IUA

* **Refreshed Jira status / resolution:** Triaged / Persuasive (resolved 2026-10-22; Pre Applied: Yes).
* **Request:** Name SMART where it is used, clarify IUA's role, and state that SMART is not mandatory universally.
* **Current content:** **Addressed.** [Authorization](authorization.md) separates profiles and replaces blanket SMART precedence with endpoint and flow selection. IUA remains an active option for qualifying national-infrastructure endpoints, not merely background. MyHealth@EU authorization remains out of scope with an alignment recommendation.
* **Proposed resolution / open decision:** Accept the terminology and selected-profile model. Preserve applicable SMART requirements without claiming SMART is universal, and do not remove IUA from its selected environments.

### FHIR-56838: Revise authorization page

* **Refreshed Jira status / resolution:** Resolved - No Change / Not Persuasive.
* **Request:** Clarify protocol terminology, recommendations versus obligations, alternative mechanisms, and the regulatory baseline added in the comment.
* **Current content:** **Partially addressed.** [Authorization](authorization.md) names selected profiles and cites EHDS/eIDAS provisions with service-specific obligations. Flow-specific recommendations and requirements replace a universal Backend Services mandate, but the strength inconsistencies identified above remain. Unspecified alternative frameworks are not permitted by the current conformance scope.
* **Proposed resolution / open decision:** Retain regulatory anchoring and protocol-specific names. Clarify the regulatory baseline without assigning every EHR vendor a universal Wallet duty, reconcile obligation strength, and obtain scope approval before allowing broader mechanisms.

### FHIR-56845: Revise actors and SMART references

* **Local status / resolution:** Waiting for Input / Unresolved.
* **Request:** Lead with EU-specific actors, clarify IHE conformance is insufficient, remove IUA client groupings, and position SMART as preferred but not exclusive.
* **Current content:** **Partially addressed.** [Actors](actors.md#authentication-and-authorization-groupings) defines generic IG roles and selected protocol groupings, but the opening remains IHE-centered and IUA client groupings remain. [Authorization](authorization.md#environment-specific-requirements) selects profiles by environment/flow, not global SMART preference.
* **Proposed resolution / open decision:** Clarify conformance to this IG beyond underlying IHE profiles. Do not remove applicable IUA groupings or impose global SMART preference without an adopted change; those parts conflict with the current selected-profile model.

### FHIR-56848: SMART Backend Services requirements

* **Local status / resolution:** Waiting for Input / Unresolved.
* **Request:** Avoid mandatory Backend Services across the six listed CapabilityStatements.
* **Current content:** **Addressed.** The cited abstract requirements statements distinguish selected IUA, Backend Services, and interactive SMART modes rather than advertising universal Backend Services. The [Document Consumer](CapabilityStatement-document-consumer-eu-api.md), for example, requires a concrete deployment to select one security-service coding; Backend Services grant/authentication rules apply only to that mode. The same distinction is present in the provider, publisher, combined publisher/provider, resource provider, and resource consumer sources.
* **Proposed resolution / open decision:** Accept the abstract-versus-concrete model as addressing the core request. It does not adopt unspecified frameworks or weaken requirements inherited by a selected SMART mode.

### FHIR-56852: Systems SHOULD support SMART Backend Services

* **Local status / resolution:** Waiting for Input / Unresolved.
* **Request:** Replace the blanket Backend Services SHALL with SHOULD; optionally allow other compliant mechanisms.
* **Current content:** **Addressed.** The blanket statement is absent from the cited abstract capability declarations. [Functional](functional.md) now says "Authorization using SMART or IHE IUA, with the applicable flow" and uses the same distinction in its common-flow list. [Authorization](authorization.md) limits Backend Services requirements to selected pre-authorized flows.
* **Proposed resolution / open decision:** Accept the conditional model as meeting the core request. Do not replace it with an all-transactions Backend Services SHOULD. The optional wider-mechanism sentence does not establish adoption of mTLS or FAST.

### FHIR-57252: Include FAST Security as an optional Authorization Framework

* **Refreshed Jira status / resolution:** Triaged / Considered for Future Use.
* **Request:** Add FAST Security to address scalable trust, registration, authentication, and authorization.
* **Current content:** **Not addressed.** [Authorization](authorization.md) selects SMART and IUA, and the [security-service ValueSet](ValueSet-eu-api-authorization-security-service.md) includes only those services. No FAST conformance model is implemented.
* **Proposed resolution / open decision:** Defer FAST conformance for this release while retaining it for future consideration. Future acceptance requires explicit scope approval and appropriate trust/registration, actor, discovery, token, enforcement, and conformance rules.

### FHIR-57498: IHE IUA lacks claim for home member state

* **Local status / resolution:** Triaged / Unresolved.
* **Request:** Decide whether to add an EHDS claim or map IUA `home_community_id` to the originating Member State.
* **Current content:** **Not addressed.** [Authorization](authorization.md#ihe-iua-and-smart-app-launch) discusses applicable IUA JWT claims generally but defines neither a home-Member-State claim nor that mapping. Generic claim support does not meet this specific interoperability request.
* **Proposed resolution / open decision:** Agree origin semantics, identifier vocabulary, trusted issuers, validation, and conformance strength before defining an extension or mapping. Do not equate home community with Member State without agreement or extend out-of-scope MyHealth@EU authorization through this report.

## Coverage Totals

* **Addressed: 8** - [FHIR-56386](https://jira.hl7.org/browse/FHIR-56386), [FHIR-56581](https://jira.hl7.org/browse/FHIR-56581), [FHIR-56584](https://jira.hl7.org/browse/FHIR-56584), [FHIR-56639](https://jira.hl7.org/browse/FHIR-56639), [FHIR-56705](https://jira.hl7.org/browse/FHIR-56705), [FHIR-56713](https://jira.hl7.org/browse/FHIR-56713), [FHIR-56848](https://jira.hl7.org/browse/FHIR-56848), [FHIR-56852](https://jira.hl7.org/browse/FHIR-56852).
* **Partially addressed: 11** - [FHIR-56367](https://jira.hl7.org/browse/FHIR-56367), [FHIR-56368](https://jira.hl7.org/browse/FHIR-56368), [FHIR-56369](https://jira.hl7.org/browse/FHIR-56369), [FHIR-56615](https://jira.hl7.org/browse/FHIR-56615), [FHIR-56616](https://jira.hl7.org/browse/FHIR-56616), [FHIR-56650](https://jira.hl7.org/browse/FHIR-56650), [FHIR-56660](https://jira.hl7.org/browse/FHIR-56660), [FHIR-56698](https://jira.hl7.org/browse/FHIR-56698), [FHIR-56699](https://jira.hl7.org/browse/FHIR-56699), [FHIR-56838](https://jira.hl7.org/browse/FHIR-56838), [FHIR-56845](https://jira.hl7.org/browse/FHIR-56845).
* **Not addressed: 3** - [FHIR-56388](https://jira.hl7.org/browse/FHIR-56388), [FHIR-57252](https://jira.hl7.org/browse/FHIR-57252), [FHIR-57498](https://jira.hl7.org/browse/FHIR-57498).
* **Total: 22 tickets.**

Outstanding decisions include regulatory assurance/Wallet/GDPR detail, IUA actor-constraint provenance, user/API logging boundaries, parameter obligations, direct-EHR acknowledgement, category framing, national scope mapping, CT/ATNA scope, and authorization obligation strength. mTLS, FAST, and the home-Member-State claim are not implemented. The worknote stays pending because refreshing this analysis does not adopt or apply every resolution.

