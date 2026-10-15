# Proposed Authorization Ballot Ticket Resolutions

## Summary

| Ticket | Request summary | Addressed? | Resolution direction |
|---|---|---|---|
| [FHIR-56367](https://jira.hl7.org/browse/FHIR-56367) | Add an eIDAS/Wallet note for Access Providers. | Partial | Keep the obligation scoped to applicable access services; consider an actor cross-reference. |
| [FHIR-56368](https://jira.hl7.org/browse/FHIR-56368) | Explain SMART alignment with eIDAS, Wallet, and GDPR. | Partial | Retain current high-level guidance; leave assurance mapping and detailed GDPR/Wallet profiles open. |
| [FHIR-56369](https://jira.hl7.org/browse/FHIR-56369) | Clarify whether additional IUA client constraints need a distinct actor. | Partial | Clarify core IUA versus conditional IG/MHD requirements in the actor definition. |
| [FHIR-56386](https://jira.hl7.org/browse/FHIR-56386) | Include IUA in the Health Professional Access Service flow where applicable. | Partial | Keep protocol selection environment-specific; clarify the use-case boundary. |
| [FHIR-56388](https://jira.hl7.org/browse/FHIR-56388) | Add mTLS/RFC 8705 as an option alongside `private_key_jwt`. | No | Leave outstanding pending review of mTLS support against the selected profiles. |
| [FHIR-56581](https://jira.hl7.org/browse/FHIR-56581) | Expand the IUA/SMART comparison beyond one example. | Yes | Accept the existing multi-aspect comparison table and applicability guidance. |
| [FHIR-56584](https://jira.hl7.org/browse/FHIR-56584) | Clarify user-level authorization, token context, and audit scope. | Partial | Explain the boundary between interactive identity, API authorization, and local audit. |
| [FHIR-56615](https://jira.hl7.org/browse/FHIR-56615) | Explain SMART's EU regulatory fit and avoid a universal SMART mandate. | Partial | Preserve environment-specific SMART/IUA choices; leave detailed mapping and GDPR guidance open. |
| [FHIR-56616](https://jira.hl7.org/browse/FHIR-56616) | Define a distinct actor if the IG adds requirements beyond IUA. | Partial | Keep generic EU and IUA roles distinct; clarify which IUA behaviors are IG-specific. |
| [FHIR-56639](https://jira.hl7.org/browse/FHIR-56639) | Explain the listed resource scopes. | Partial | Explain `.rs` and link the resource list to scope conventions and capability support. |
| [FHIR-56650](https://jira.hl7.org/browse/FHIR-56650) | State Consumer MAY and Provider SHOULD/MAY parameter obligations separately. | Partial | Separate client use from server support while preserving each keyword's meaning. |
| [FHIR-56660](https://jira.hl7.org/browse/FHIR-56660) | Acknowledge direct patient-to-EHR access alongside the broker model. | No | Add an informative alternative-pattern note without changing the broker workflow. |
| [FHIR-56666](https://jira.hl7.org/browse/FHIR-56666) | Correct four editorial details in the Patient Summary example. | Partial | Rename the token step; retain the corrected lookup link and resolve category framing. |
| [FHIR-56698](https://jira.hl7.org/browse/FHIR-56698) | Explain SMART Backend Services rationale, IUA relationship, and scope granularity. | Partial | Clarify there is no required SMART/IUA binding; leave national scope mapping local or future work. |
| [FHIR-56699](https://jira.hl7.org/browse/FHIR-56699) | Clarify CT recommendation and ATNA/ITI-19/ITI-20 implications. | Partial | State CT strength and audit transaction scope after confirming intended IHE requirements. |
| [FHIR-56705](https://jira.hl7.org/browse/FHIR-56705) | Make clear SMART Backend Services is one option in the example. | Partial | Label it as a SMART example, link environment selection, and rename the token step. |
| [FHIR-56713](https://jira.hl7.org/browse/FHIR-56713) | Use protocol-specific references and clarify SMART is not universal. | Yes | Accept the current separate sections and environment-specific SMART/IUA selection. |
| [FHIR-56838](https://jira.hl7.org/browse/FHIR-56838) | Clarify protocol terminology, obligation strength, and regulatory baseline. | Partial | Accept current regulatory and environment guidance; require approval before broadening supported frameworks. |
| [FHIR-56845](https://jira.hl7.org/browse/FHIR-56845) | Make actor descriptions EU-specific and clarify IHE/SMART positioning. | Partial | Clarify that IHE conformance alone is insufficient; preserve IUA where selected by environment. |
| [FHIR-56848](https://jira.hl7.org/browse/FHIR-56848) | Avoid making SMART Backend Services mandatory in CapabilityStatements. | Yes | Accept the abstract statements' environment-selected IUA, Backend Services, or interactive SMART modes. |
| [FHIR-56852](https://jira.hl7.org/browse/FHIR-56852) | Replace a blanket Backend Services SHALL with flexible requirements. | Partial | Clarify the Functional page's common flow; retain specific environment-level requirements. |
| [FHIR-57252](https://jira.hl7.org/browse/FHIR-57252) | Add FAST Security as an optional framework. | No | Defer for this release, consistent with the recorded comment; keep as a future-scope decision. |
| [FHIR-57498](https://jira.hl7.org/browse/FHIR-57498) | Decide how to convey the home Member State in IUA claims. | No | Keep open until claim semantics, identifier format, and conformance strength are agreed. |

## Scope and Basis

This report compares the 23 tickets in this directory with the current content in the `eu-health-data-api-ballot-recon-auth` worktree. The fork worktree is clean and has no uncommitted diff, so these findings describe the current source snapshot; they do not attribute individual passages to a particular commit or claim that they were introduced by this branch. All ticket records below are locally unresolved, including those marked Triaged. These are proposed dispositions for workgroup review, not Jira updates.

Coverage labels describe the current specification text: **Addressed**, **Partially addressed**, or **Not addressed**. A proposed disposition may recommend clarification or deferment where the ticket requests a policy decision. The authorization requirements limit this IG's considered authorization specifications to SMART and IHE IUA; suggestions to add other mechanisms therefore need explicit scope approval rather than being silently adopted.

## Ticket Findings

### [FHIR-56367](https://jira.hl7.org/browse/FHIR-56367): Add eIDAS/EU Wallet note (Access Provider)

- **Local status:** Waiting for Input.
- **Request:** Add an eIDAS/EU Digital Identity Wallet compliance note for access mechanisms or Access Providers.
- **Current content:** **Partially addressed.** [Authorization](authorization.html) summarizes the EHDS/eIDAS basis and requires an eIDAS-recognized identification means for interactive authorization where required. [Actors](actors.html) does not assign that obligation to the Document or Resource Access Provider.
- **Proposed resolution:** Record that the authorization page now covers the eIDAS and Wallet context, but the requested Access Provider-specific note is not present. Keep the regulatory obligation scoped to the applicable access service and deployment; do not imply every API provider must itself operate a Wallet or perform end-user identity proofing. Decide whether to add an explicit cross-reference in the actor description.

### [FHIR-56368](https://jira.hl7.org/browse/FHIR-56368): Clarify SMART compliance with EU regulation

- **Local status:** Triaged.
- **Request:** Explain SMART alignment with eIDAS, the EU Digital Identity Wallet, and GDPR; consider assurance-level mapping and Wallet integration details.
- **Current content:** **Partially addressed.** [Authorization](authorization.html) cites EHDS/eIDAS provisions, describes eIDAS-recognized identification in interactive flows, and notes that a Wallet may provide the result. It explicitly leaves assurance levels, presentation format, credential schema, and Wallet-to-Authorization-Server profile to deployment. It does not provide a SMART-to-eIDAS assurance mapping or specific GDPR analysis.
- **Proposed resolution:** Acknowledge the regulatory summary and high-level Wallet compatibility already present. Leave assurance mapping, Wallet profile selection, and GDPR-specific guidance open unless the workgroup supplies an applicable regulatory or implementation requirement; do not imply those details are standardized by this IG.

### [FHIR-56369](https://jira.hl7.org/browse/FHIR-56369): Clarify IUA vs SMART actor usage

- **Local status:** Triaged.
- **Request:** Clarify whether additional constraints on an IUA Authorization Client require a separately named, derived, or ad hoc actor; SMART is stated as the reference when requirements conflict.
- **Current content:** **Partially addressed.** [Actors and Transactions](actors.html) defines a generic EU Authorization Client that expressly does not claim IUA or SMART conformance, plus a protocol-specific IHE IUA Authorization Client. [Authorization](authorization.html) separates core IUA requirements from this IG's MHD transaction integration and additional recommendations. The IUA actor description still includes a least-privilege scope behavior, so the boundary between base-actor requirements and IG-specific constraints could be clearer.
- **Proposed resolution:** Record the generic/protocol-specific actor separation and the explicit IUA boundary already in place. Clarify in the IUA actor description which behaviors are core IUA and which are conditional IG/MHD requirements; do not claim universal SMART precedence, since the current page selects a protocol by environment and does not claim same-endpoint dual conformance.

### [FHIR-56386](https://jira.hl7.org/browse/FHIR-56386): Health Professional Access Service Authorization

- **Local status:** Waiting for Input.
- **Request:** Add IHE IUA to the authorization portion of the Health Professional Access Service technical flow, which had referred only to SMART.
- **Current content:** **Partially addressed.** [Authorization](authorization.html) recommends IUA for MyHealth@EU and relevant National Interoperability Infrastructure deployments, while requiring SMART for Healthcare Provider deployments. The [Health Professional Access Service use case](usecase-health-professional-portal.html) explains the Healthcare Provider SMART flow and links to the normative page, but does not itself restate the IUA alternative for a national-infrastructure deployment.
- **Proposed resolution:** Retain the environment-specific selection in Authorization. Clarify in the use-case page that its SMART requirement applies to Healthcare Provider deployments and that national-infrastructure deployments follow the IUA recommendation when applicable; do not state that both protocols are required for every HPAS flow.

### [FHIR-56388](https://jira.hl7.org/browse/FHIR-56388): Security and Authorization

- **Local status:** Waiting for Input.
- **Request:** Add RFC 8705 mutual TLS as an optional, higher-assurance alternative to `private_key_jwt`, including certificate-bound access tokens.
- **Current content:** **Not addressed.** [Authorization](authorization.html) specifies `private_key_jwt` for SMART Backend Services and describes short-lived bearer tokens and TLS, but does not mention RFC 8705 or mTLS.
- **Proposed resolution:** Keep the existing SMART Backend Services requirements as written and record the mTLS proposal as outstanding. Adding RFC 8705 as a supported option requires review against SMART Backend Services and the authorization scope requirements; do not imply it is currently supported by this IG.

### [FHIR-56581](https://jira.hl7.org/browse/FHIR-56581): IUA & SMART Differences

- **Local status:** Waiting for Input.
- **Request:** Expand the IUA/SMART comparison beyond one example to cover differences relevant to this IG.
- **Current content:** **Addressed.** [Authorization](authorization.html) contains a comparison table for discovery, scope model, context, interactive use, and system-to-system use, followed by applicability guidance and environment-specific selection.
- **Proposed resolution:** Accept the expanded comparison as addressing the request. The table distinguishes SMART resource scopes from IUA/MHD transaction scopes and explains where each protocol fits. Any remaining technical disagreement should be raised as a specific correction, rather than reopening the general request for a comparison.

### [FHIR-56584](https://jira.hl7.org/browse/FHIR-56584): Authorization & User Level

- **Local status:** Waiting for Input.
- **Request:** Question the exclusion of user-level authentication/authorization, given user information in tokens and the relationship to audit messages.
- **Current content:** **Partially addressed.** [Authorization](authorization.html) distinguishes interactive end-user authentication, IUA user/patient claims, SMART user/patient scopes, and audit responsibilities. The [Health Data Access Service use case](usecase-health-data-portal.html) assigns patient identity and authorization to the access service; [index](index.html) still excludes user-level authorization and audit logging formats. The text does not directly explain how user-level identity information relates to local audit records.
- **Proposed resolution:** Record that interactive authorization and token context are now described, while user-interface authentication/session management and interoperable audit-log formats remain outside the API scope. Add a concise explanation of the boundary between local end-user audit events and API-level authorization only if the workgroup confirms it; do not infer that token claims alone establish identity, consent, or audit completeness.

### [FHIR-56615](https://jira.hl7.org/browse/FHIR-56615): SMART should be preferred not mandatory

- **Local status:** Waiting for Input.
- **Request:** Explain SMART's EU regulatory context, consider eIDAS assurance and Wallet integration, address GDPR, and avoid making SMART universally mandatory.
- **Current content:** **Partially addressed.** [Authorization](authorization.html) has the eIDAS/Wallet discussion and selects protocols per environment: IUA is recommended in MyHealth@EU and certain national deployments, while SMART is required in Wellness Application and Healthcare Provider deployments. It does not map assurance levels or address GDPR in detail.
- **Proposed resolution:** Record that SMART is not a universal solution, but is required in the environments the IG explicitly names; IUA is selected or recommended in others. The current environment-specific requirements supersede a blanket “SMART preferred” rule. Leave assurance-level mapping and GDPR analysis open pending a specific, in-scope requirement.

### [FHIR-56616](https://jira.hl7.org/browse/FHIR-56616): Revise the IUA Authorization Client actor

- **Local status:** Waiting for Input.
- **Request:** If the IG adds requirements beyond the standard IUA Authorization Client, define a distinct actor to avoid conformance ambiguity.
- **Current content:** **Partially addressed.** [Actors and Transactions](actors.html) has separate generic EU and IUA Authorization Client definitions. [Authorization](authorization.html) states that core IUA is separate from MHD integration and added recommendations, but the IUA-specific ActorDefinition does not explicitly label its added behaviors as conditional or IG-specific.
- **Proposed resolution:** Retain the distinct generic EU and protocol-specific IUA roles, and clarify the IUA actor's boundary against core IUA. Decide whether an additional EU-profile actor is needed only if the workgroup confirms a normative profile beyond the current actor plus conditional MHD requirements.

### [FHIR-56639](https://jira.hl7.org/browse/FHIR-56639): Add explanations to the scopes section

- **Local status:** Triaged.
- **Request:** Explain the SMART scopes listed for resource access, such as `system/AllergyIntolerance.rs` and `system/Condition.rs`.
- **Current content:** **Partially addressed.** [Resource Access](resource-access.html) identifies the list as SMART App Launch 2.2 FHIR Resource Scopes for the separately classified Backend Services/direct-system use case, distinguishes them from IUA scopes, and links interactive scopes to Authorization. It does not explain the `.rs` suffix next to the list. [Authorization](authorization.html) gives the general SMART scope form and separates `system/`, `patient/`, and `user/` scopes.
- **Proposed resolution:** Keep the context and protocol distinction already present. Add or link a short explanation that `.rs` grants read and search for the named resource, and that the list is not a requirement for every server; resource support is declared through the CapabilityStatement.

### [FHIR-56650](https://jira.hl7.org/browse/FHIR-56650): Clarify authorization parameter SHOULDs and consumer MAYs

- **Local status:** Waiting for Input.
- **Request:** Separate Provider and Consumer obligations and say explicitly that Consumers MAY supply parameters that Providers SHOULD or MAY support.
- **Current content:** **Partially addressed.** [Authorization](authorization.html) already separates some client assertion construction requirements from Authorization Server validation and describes server discovery metadata. It does not explicitly state the requested Consumer MAY language for the parameter lists described by the ticket.
- **Proposed resolution:** Update the affected parameter list to state Provider support and Consumer use separately, retaining each existing conformance keyword and avoiding a blanket rule that every client must send every supported parameter. Confirm the precise parameter list from the ballot context before changing requirements.

### [FHIR-56660](https://jira.hl7.org/browse/FHIR-56660): Reference the direct-EHR-auth pattern on the Health Data Access Service page

- **Local status:** Triaged.
- **Request:** Acknowledge direct patient-to-EHR authentication using SMART/IPA as a deployed alternative to the broker model, with a brief consent-enforcement note; retain both patterns.
- **Current content:** **Not addressed on the requested use-case page.** The [Health Data Access Service use case](usecase-health-data-portal.html) describes patient authentication at the service and service-to-EHR access. [Member State Architectures](member-state-architectures.html) discusses centralized and federated infrastructure patterns, not direct patient-to-EHR authentication. No direct-auth alternative or comparative consent note appears in the reviewed material.
- **Proposed resolution:** Add an informative paragraph that distinguishes this IG's broker workflow from direct patient-to-EHR SMART/IPA access and acknowledges both as deployment patterns without preferring one. Keep consent obligations tied to EHDS and Member State rules; do not assert that direct authentication is universally deployed or that it alone guarantees consent enforcement.

### [FHIR-56666](https://jira.hl7.org/browse/FHIR-56666): Editorial updates to the example Patient Summary page

- **Local status:** Triaged.
- **Request:** Rename Step 2 to “Obtain Access Token”; correct the Patient Match link; reconcile the “Issue 12” reference; explain or remove `DocumentReference.category` using an XDS classCode.
- **Current content:** **Partially addressed.** [Example Patient Summary](example-patient-summary.html) still uses “Obtain Authorization Token.” Its patient link now reads “Patient Lookup” and targets a page that documents both ITI-78 search and optional ITI-119 `$match`. The example has no Issue 12 reference; [Open Issues](open-issues.html) identifies Issue 12 as MADO dual-encoding. The example still includes the XDS `SUMMARIES` category coding without an explanatory comment.
- **Proposed resolution:** Accept “Patient Lookup” as an accurate label for the page's search and match options, and record that no Issue 12 citation remains in this example. Change the Step 2 heading to “Obtain Access Token” and either explain the category coding or remove it after the category/type framing is decided.

### [FHIR-56698](https://jira.hl7.org/browse/FHIR-56698): SMART Authorization

- **Local status:** Waiting for Input.
- **Request:** Explain the rationale for SMART Backend Services and its alleged binding to an IUA Authorization Server; question resource-level scopes versus coarser national regulatory groupings; suggest foundational OAuth references.
- **Current content:** **Partially addressed.** [Authorization](authorization.html) explains why SMART and IUA fit different deployment conditions, selects one profile per endpoint/environment, and explicitly does not claim same-endpoint dual conformance. [Resource Access](resource-access.html) lists SMART resource scopes and distinguishes them from IUA transaction scopes. The IG does not map national regulatory groupings to SMART scopes or cite RFC 6749/RFC 8414 in the reviewed sections.
- **Proposed resolution:** Clarify that the current model does not require an IUA Authorization Server binding for a SMART endpoint; the two profiles are selected per environment and same-endpoint dual conformance is not claimed. Keep national regulatory scope mapping as local policy or future work unless a shared mapping is agreed. Add OAuth RFC references only if needed to support a specific normative statement.

### [FHIR-56699](https://jira.hl7.org/browse/FHIR-56699): Foundational IHE Profiles CT, ATNA

- **Local status:** Waiting for Input.
- **Request:** Make IHE Consistent Time a recommendation given national NTP version differences, clarify that ATNA is referenced for TLS rather than implying ITI-19, and note whether ITI-20 is optional.
- **Current content:** **Partially addressed.** [Actors](actors.html) lists CT as a foundational specification and ATNA as a reference for secure transport/TLS 1.2, but does not state CT's conformance strength, discuss NTP versions, or clarify ITI-19/ITI-20. [Authorization](authorization.html) requires TLS 1.2 or later and treats audit as a distinct responsibility.
- **Proposed resolution:** Record that TLS is normative while CT is currently listed without an explicit normative keyword; no NTPv3 requirement is stated in the reviewed text. Clarify the intended CT recommendation and ATNA transaction scope, including ITI-20 optionality, only after confirming the applicable IHE requirements and national variation.

### [FHIR-56705](https://jira.hl7.org/browse/FHIR-56705): Revise “Obtain Authorization Token” step

- **Local status:** Waiting for Input.
- **Request:** Make clear that SMART Backend Services is one possible mechanism in the Patient Summary example, not mandatory for every environment.
- **Current content:** **Partially addressed.** [Example Patient Summary](example-patient-summary.html) says the diagram contrasts SMART Backend Services and IUA, and explicitly says the steps below describe SMART Backend Services. Step 2 itself only describes that SMART flow and still uses the heading “Obtain Authorization Token.” The normative [Authorization](authorization.html) page selects SMART or IUA by environment.
- **Proposed resolution:** State that this is a SMART Backend Services example rather than a universal requirement, link to environment-specific selection, and rename the step to “Obtain Access Token.” Do not broaden the IG beyond its selected SMART/IUA profiles.

### [FHIR-56713](https://jira.hl7.org/browse/FHIR-56713): Revise references to IUA

- **Local status:** Triaged.
- **Request:** Refer to SMART where it is the actual mechanism, clarify whether IUA is only background, and state that SMART is not mandatory.
- **Current content:** **Addressed in substance.** [Authorization](authorization.html) has separate SMART and IUA sections and explicitly selects by environment: IUA is recommended for MyHealth@EU and relevant national deployments; SMART is required for Wellness Applications and Healthcare Provider deployments. IUA is therefore an active option, not merely background. The page does not assert a general precedence rule or same-endpoint dual conformance.
- **Proposed resolution:** Accept the environment-specific terminology and selection as addressing the request's ambiguity. Preserve that SMART is required in named environments but is not universal; do not describe IUA as only a reference framework or remove its active use.

### [FHIR-56838](https://jira.hl7.org/browse/FHIR-56838): Revise authorization page

- **Local status:** Waiting for Input.
- **Request:** Use protocol-specific terminology; distinguish preferred from required approaches; establish applicable eIDAS 2/EU requirements as the regulatory baseline; consider permitting other approaches.
- **Current content:** **Partially addressed.** [Authorization](authorization.html) cites EHDS/eIDAS provisions, separately describes SMART and IUA, and assigns normative strength by environment. It requires SMART in two named environments and recommends IUA in others. It does not permit authorization frameworks beyond SMART and IUA, consistent with the current authorization requirements.
- **Proposed resolution:** Accept the regulatory anchoring and environment-specific SHALL/RECOMMENDED distinctions as implemented. Leave the request to permit other approaches unresolved because it would expand the IG's declared authorization scope; obtain workgroup approval before changing that scope. Keep protocol names aligned with the selected flow rather than labeling IUA as background.

### [FHIR-56845](https://jira.hl7.org/browse/FHIR-56845): Revise actors and SMART references

- **Local status:** Waiting for Input.
- **Request:** Lead with EU-specific actors, clarify that IHE conformance alone is insufficient, remove IUA Authorization Client from generic groupings, and position SMART as preferred but not exclusive.
- **Current content:** **Partially addressed; one requested change conflicts with the environment model.** [Actors and Transactions](actors.html) defines generic EU authorization roles that do not by themselves claim protocol conformance, and composite actors refer to selected IUA or SMART roles by environment. [Actors](actors.html) still introduces the model as orchestration of IHE actors. [Authorization](authorization.html) selects SMART or IUA per environment rather than making SMART globally preferred.
- **Proposed resolution:** Preserve the generic EU actor boundary and state clearly that conformance to an underlying IHE profile alone does not establish conformance to this IG. Do not remove IUA from environment-selected groupings or impose blanket SMART preference without workgroup approval; IUA remains a selected/recommended profile in specified environments.

### [FHIR-56848](https://jira.hl7.org/browse/FHIR-56848): SMART Backend Services requirements

- **Local status:** Waiting for Input.
- **Request:** Ensure CapabilityStatements do not make SMART Backend Services mandatory where IUA or interactive SMART may apply.
- **Current content:** **Addressed in the abstract CapabilityStatement model.** For example, the [Document Consumer CapabilityStatement](CapabilityStatement-document-consumer-eu-api.html) distinguishes IUA, SMART Backend Services, and Interactive SMART, and says concrete deployments select one security-service coding for their environment. Other actor statements use the same pattern. [Authorization](authorization.html) limits Backend Services to qualifying pre-authorized server-to-server flows.
- **Proposed resolution:** Accept the CapabilityStatement approach: Backend Services is one selected mode, not a universal SHALL for all actors and transactions. Keep the selected security-service coding and flow-specific requirements explicit; reconcile overview wording separately under FHIR-56852.

### [FHIR-56852](https://jira.hl7.org/browse/FHIR-56852): Systems SHOULD support SMART Backend Services

- **Local status:** Waiting for Input.
- **Request:** Replace a blanket SMART Backend Services SHALL with SHOULD and optionally allow other mechanisms.
- **Current content:** **Partially addressed.** The blanket wording quoted in the ticket is not present in the reviewed source. [Authorization](authorization.html) scopes SMART and IUA by environment and limits Backend Services to specific flows. [Functional](functional.html) says authorization may use SMART Backend Services or IUA, but its common-flow list says “Authorize using SMART Backend Services” without the environmental qualification.
- **Proposed resolution:** Do not replace the environment model with a blanket SHOULD for Backend Services “for all transactions.” Clarify the Functional page's common-flow step to say “use the authorization profile selected for the environment and use case”; retain the specific SHALL/SHOULD requirements in Authorization and the CapabilityStatements.

### [FHIR-57252](https://jira.hl7.org/browse/FHIR-57252): Include FAST Security as an optional Authorization Framework

- **Local status:** Triaged.
- **Request:** Add FAST Security as an optional authorization/trust framework to address registration and scaling.
- **Current content:** **Not addressed.** The current [Authorization](authorization.html) selects SMART and IHE IUA and its future-work note concerns a possible hybrid of those profiles; FAST is not included. A ticket comment recommends deferring FAST until the authorization framework discussion is more stable, but the local Jira resolution remains unresolved.
- **Proposed resolution:** Recommend deferral for this release, consistent with the recorded workgroup comment, and retain the ticket as a future-scope decision. Do not describe FAST as supported or add it to the current conformance target without workgroup agreement.

### [FHIR-57498](https://jira.hl7.org/browse/FHIR-57498): IHE IUA lacks claim for home member state

- **Local status:** Triaged.
- **Request:** Determine whether cross-border authorization needs a Member State-of-origin claim, potentially by reusing IUA `home_community_id` or defining an EHDS-specific claim.
- **Current content:** **Not addressed.** The authorization narrative discusses optional IUA user/patient claims generally but does not define `home_community_id` for Member State identification. No occurrence of that claim is present in the reviewed authorization sources or ticket checklist.
- **Proposed resolution:** Keep the issue open for a policy decision. Before adding a requirement, establish the intended semantics and identifier format, whether the claim is optional/recommended/required, and which authorization servers/resource servers must use it. Do not equate “home community” with “Member State” without an agreed mapping.

## Summary

- **Addressed in substance:** FHIR-56581, FHIR-56713, FHIR-56848.
- **Partially addressed:** FHIR-56367, FHIR-56368, FHIR-56369, FHIR-56386, FHIR-56584, FHIR-56615, FHIR-56616, FHIR-56639, FHIR-56650, FHIR-56666, FHIR-56698, FHIR-56699, FHIR-56705, FHIR-56838, FHIR-56845, FHIR-56852.
- **Not addressed:** FHIR-56388, FHIR-56660, FHIR-57252, FHIR-57498.

These proposed dispositions are based on current source content and remain subject to workgroup review. The authorization page's worknote links here for the request-by-request analysis and retains the resolution work as pending.