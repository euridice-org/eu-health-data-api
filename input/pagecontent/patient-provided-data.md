### Overview

[Article 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5) of the EHDS Regulation gives natural persons, or their representatives referred to in [Article 4(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4), the right to insert information in their own EHR through electronic health data access services or applications linked to those services. The regulation attaches two conditions to that right:

1. **Distinguishability** — inserted information "shall be clearly distinguishable as having been inserted by the natural person or by his or her representative".
2. **Non-alteration** — natural persons and their representatives "shall not be able to directly alter the electronic health data and related information inserted by health professionals".

This IG satisfies Article 5 for document-shaped data using existing actors — no new actor is defined. The patient-facing service (a [Health Data Access Service](usecase-health-data-portal.html) or a [linked application](usecase-wellness-app.html)) acts as a [Document Publisher](actors.html#document-publisher) and submits the patient-provided document in EEHRxF format via [ITI-105 Simplified Publish](document-exchange.html#iti-105-simplified-publish) to a Document Access Provider implementing the [Document Submission Option](actors.html#document-submission-option).

See [Regulatory Anchors — EHDS Article 5](regulatoryAnchors.html#article-5-insert) for the mapping from the regulation text to the requirements on this page.

### Scope

This page normatively specifies the **document-based** insertion path: patient-provided priority-category data submitted as an EEHRxF document. The following are out of scope:

- **Resource-level insertion** — creating or updating individual FHIR resources (Observation, MedicationStatement, etc.) is deferred; see [Resource Exchange](resourceExchange.html) for the open problems and possible future approaches.
- **Patient identity and authentication** — how the natural person authenticates to the access service (national eID, EU Digital Identity Wallet) is Member State infrastructure.
- **Application linking and consent** — how an application is linked to an access service and how Article 48(2) consent is captured is out of scope for this API; see [Security Model](#security-model) below for the overall picture.
- **Verification of representative authority** — establishing that a representative may act for the natural person is an [Article 4(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4) proxy-service and user-level authorization concern; see [Authorization — User-Level Authorization](authorization.html#user-level-authorization).
- **Clinical review workflow** — how health professionals review, annotate, or incorporate patient-provided information into the professional record is a clinical-workflow and Member State matter.

### Distinguishing Patient-Provided Documents {#distinguishing-patient-provided-documents}

When a submitted document contains information provided by the natural person or their representative, the Document Publisher SHALL mark it as patient-provided. The following mechanisms apply:

| Mechanism | Requirement |
|---|---|
| `DocumentReference.author` | SHALL identify the actual author or authors when known. In addition to a `Patient` or `RelatedPerson`, this may be a `Practitioner`, `PractitionerRole`, `Organization`, or `Device`, for example when a natural person submits information originally generated outside the EHDS realm. A logical (identifier) reference is acceptable, consistent with [ITI-105 patient identity handling](document-exchange.html#patient-identity-in-document-publication). |
| `DocumentReference.securityLabel` | SHALL include `PATRPT` (patient reported) from `http://terminology.hl7.org/CodeSystem/v3-ObservationValue`. In this IG, `PATRPT` classifies information submitted through the Article 5 patient insertion channel, including submission by a representative; it does not assert that the Patient authored the underlying document. |
| `meta.source` | SHOULD be populated on the submitted DocumentReference (and the document Bundle) with a URI identifying the originating system — the health data access service or linked application. This adds system-level provenance independently of document authorship. |
| Document `Bundle.meta.security` | SHOULD carry the same provenance label as `DocumentReference.securityLabel`, so the marking travels with the document content itself when it is retrieved via ITI-68 and circulates detached from its DocumentReference. |
| `Composition.author` | SHOULD identify the actual author or authors, subject to the applicable [content IG](priority-categories.html)'s constraints — content IGs own Composition profiling. |
| `Provenance` | MAY accompany the document for finer-grained attribution, including identifying the Patient or RelatedPerson responsible for the submission when that person is not the document author. |
{: .grid}

> **Note:** `DocumentReference.context.sourcePatientInfo` conveys the *subject's* demographics at publication time. It is not an authorship mechanism and does not satisfy the distinguishability requirement.

> **Provenance classification, not access control.** Access to write data through the insertion channel is governed by the security mechanism in use, together with the service receiving the data — see [Security Model](#security-model) and [Authorization](authorization.html). `PATRPT` records that the information was provided through the Article 5 patient insertion channel; it does not impose an access-control obligation and does not identify the document's author. The receiving service SHOULD verify that this marking is consistent with the authenticated submission context. `author`, `meta.source`, and any accompanying `Provenance` retain the more precise person, device, organization, and system attribution.

The receiving Document Access Provider SHALL persist the supplied `author`, `securityLabel`, and `meta.source` of received patient-provided documents and return them unaltered in ITI-67 responses, and SHALL NOT remove security labels from document content retrieved via ITI-68. This allows any Document Consumer to distinguish documents submitted through the Article 5 channel from documents submitted through professional channels without conflating submission provenance with authorship.

Note that MHD ITI-105 requires none of these elements structurally (the [MHD SimplifiedPublish DocumentReference profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.SimplifiedPublish.DocumentReference.html) has `author` and `securityLabel` as optional must-support elements); the requirements above are conditional EU requirements that apply when the document is patient-provided.

### Non-Alteration of Professional Data {#non-alteration-of-professional-data}

Article 5 requires that natural persons and their representatives "shall not be able to directly alter" data inserted by health professionals. The insertion channel enforces this as follows:

- **Submissions create new documents.** The [Document Submission Option](actors.html#document-submission-option) declares the `create` interaction, and the Document Publisher scope is `system/DocumentReference.c`. The Access Provider SHALL store each patient-provided submission as a new document; a submission SHALL NOT directly modify existing documents or resources.
- **Mutating relationships target own submissions only.** MHD publication is not purely additive: a submission with `relatesTo.code = replaces` causes the Document Recipient to mark the prior DocumentReference as `superseded`, and MHD deployments may support further update or removal mechanisms for previously published documents. On the patient insertion channel, these mutating mechanisms SHALL be restricted to content previously submitted through that channel: the Access Provider SHALL reject — returning an OperationOutcome — a patient-provided submission whose `relatesTo.code = replaces` targets a DocumentReference that is not itself marked `PATRPT` for the same subject, and SHALL apply the same restriction to any update or removal mechanism it offers on this channel.
- **Non-mutating append relationships are permitted.** A patient-provided submission MAY use `relatesTo.code = appends` to link a new document, such as personal notes, to an existing professional or patient-provided document for the same subject. The Access Provider SHALL store the appended material as a new DocumentReference marked `PATRPT` and SHALL NOT change the status or content of the target document. Other relationship types are outside the scope of this insertion workflow.
- **Professional data untouched.** No mechanism on the insertion channel — creation, replacement, update, or removal — SHALL alter documents or resources inserted by health professionals.

How health professionals review, annotate, or incorporate patient-provided information into the professional record is outside this API. EHDS Recital 12 notes that information inserted by natural persons "might not be as reliable" as professionally entered data and "does not have the same clinical or legal value" — the distinguishability marking above is what lets downstream systems apply such policy.

### Representatives (Article 4(2)) {#representatives}

Article 5 extends the insertion right to representatives referred to in [Article 4(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4): natural persons authorized through a proxy service, and legal representatives acting under national law.

At this IG's system-to-system API surface, all Article 5 submissions use the `PATRPT` classification. When the representative is also the document author, `DocumentReference.author` may identify that `RelatedPerson`; otherwise an accompanying `Provenance` resource may record the representative as the submitting agent without replacing the document's original authorship. Establishing and verifying the representative's *authority* is a Member State proxy-service and user-level authorization concern, out of scope for this version — see [Authorization — User-Level Authorization](authorization.html#user-level-authorization).

### Wellness Applications (Article 48(2)) {#wellness-applications}

[Article 48(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_48) constrains how wellness applications share data into an EHR system: interoperability does not entail automatic sharing; sharing or transmission is only possible in accordance with Article 5 and after the natural person's consent; and the person chooses which categories of data are shared and under which circumstances.

Those consent and category-level choices are established in the wellness application and access-service layer, outside this API. Only the resulting transmission uses this IG's transactions: the wellness application (or the access service acting for it) plays the [Document Publisher](actors.html#document-publisher) role and the requirements on this page apply unchanged. See the [Wellness Apps](usecase-wellness-app.html) use case.

### Security Model (Informative) {#security-model}

This section describes what an overall security model for Article 5 insertion could look like, layer by layer. Only layer 3 is normatively specified by this IG; the other layers are Member State or deployment concerns, described here so implementers can see where each responsibility sits.

1. **Person authentication.** The natural person authenticates to the health data access service with a Member State eID or the EU Digital Identity Wallet (eIDAS 2.0). A representative's authority is established through the Article 4(2) proxy service. Both are Member State infrastructure, outside this API.

2. **Application linking and consent.** The access service links a wellness or other application to the person's identity and records the Article 48(2) consent, including which data categories may be inserted and under which circumstances. A [SMART App Launch](https://hl7.org/fhir/smart-app-launch/)-style authorization is a plausible realization, but is not mandated by this IG.

3. **System-to-system trust (this IG's layer).** The submitting service obtains an access token via SMART Backend Services / IHE IUA ([ITI-71](authorization.html#get-access-token)) and presents it on the ITI-105 submission ([ITI-72](authorization.html#incorporate-access-token)). The insertion channel needs only the write scope `system/DocumentReference.c`; deployments SHOULD issue insertion clients no broader scopes (least privilege). The Access Provider **trusts the access service or linked application to have performed layers 1 and 2** — this trust delegation is the model's key assumption, and Member State onboarding of insertion clients should reflect it.

4. **Data-level provenance.** The `PATRPT` security label identifies information submitted through the Article 5 channel, while `author`, `meta.source`, and optional `Provenance` retain more precise attribution. Together these markings let downstream consumers and clinical-decision contexts apply policy to patient-provided data — for example, excluding it from automated decision support until reviewed. This operationalizes Recital 12's distinction in clinical and legal value. These markings cross-reference the security context of layers 1–3; they are not themselves an access-control mechanism.

5. **Non-alteration enforcement.** Submissions create new documents, and replacement, update, and removal are restricted to the person's own prior submissions ([above](#non-alteration-of-professional-data)), preventing the patient channel from altering professional data at the API level, independent of any user-interface controls.

6. **Audit.** EHDS Annex II requires local audit logging; this IG does not specify log formats (see [Regulatory Anchors](regulatoryAnchors.html)). Implementers needing standardized audit logging for insertion events should consider [IHE ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) and [IHE BALP](https://profiles.ihe.net/ITI/BALP/index.html).

7. **Future work: token-level person context.** With user-level authorization (SMART App Launch, UDAP, EU Digital Identity Wallet integration — see [Authorization — User-Level Authorization](authorization.html#user-level-authorization)), the Access Provider could *verify* the binding between the submission and the person or representative, rather than trusting the submitting service. This would also give proxy authorizations a token-level representation.

### Examples

- [Patient-Provided DocumentReference](DocumentReference-example-documentreference-patient-provided.html) — authored and submitted by the natural person (`author` = Patient, securityLabel `PATRPT`)
- [Representative-Provided DocumentReference](DocumentReference-example-documentreference-representative-provided.html) — authored and submitted by an Article 4(2) representative (`author` = RelatedPerson, securityLabel `PATRPT`)
- [Patient-Appended Notes DocumentReference](DocumentReference-example-documentreference-patient-appended-notes.html) — a new patient-provided document linked with `relatesTo.code = appends` to an existing professional document
