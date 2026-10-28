### Overview

[Article 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5) of the EHDS Regulation gives natural persons, or their representatives referred to in [Article 4(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4), the right to insert information in their own EHR through electronic health data access services or applications linked to those services. The regulation attaches two conditions to that right:

1. **Distinguishability** — inserted information "shall be clearly distinguishable as having been inserted by the natural person or by his or her representative".
2. **Non-alteration** — natural persons and their representatives "shall not be able to directly alter the electronic health data and related information inserted by health professionals".

This page provides **informative guidance** on how existing actors and transactions can support patient-provided data exchange. It introduces no new API conformance requirements and does not prescribe a single transport path. Existing requirements for the actors, transactions, and content profiles used still apply.

See [Regulatory Anchors — EHDS Article 5](regulatoryAnchors.html#article-5-insert) for the relationship between this guidance and the regulation.

### Scope

The document exchange example assumes patient-provided priority-category data conforms to the applicable [EEHRxF content IG](priority-categories.html). This page does not define new clinical content models. Unstructured patient notes and individual measurements may be useful, but defining their content models and resource-level insertion is future work; see [Resource Exchange](resourceExchange.html).

Patient authentication, application linking, consent capture, verification of representative authority, and clinical review workflows are deployment or Member State concerns. They are described here only to explain how they relate to API exchange.

### Example Exchange Paths {#example-exchange-paths}

A patient-facing [Health Data Access Service](usecase-health-data-portal.html) or [linked application](usecase-wellness-app.html) can use existing actors as follows:

1. **Publish a document.** The service establishes the person's identity, authority, and consent, obtains system-to-system authorization, and identifies the patient, for example using the existing [patient lookup](patient-match.html) mechanisms. Acting as a [Document Publisher](actors.html#document-publisher), it submits an EEHRxF document through [ITI-105 Simplified Publish](document-exchange.html#iti-105-simplified-publish) to a Document Access Provider implementing the [Document Submission Option](actors.html#document-submission-option).
2. **Expose documents for query and retrieval.** The service holding patient-provided documents can act as a [Document Access Provider](actors.html#document-access-provider). An authorized Document Consumer finds and retrieves them through ITI-67 and ITI-68. How the person initially supplies the data to that service is outside this exchange.
3. **Expose existing resource data for query.** Where suitable content models exist, a service can make patient-provided data available through the existing [Resource Access Provider](actors.html#resource-access-provider) query/read capabilities. This does not define an API for patients to create or update individual resources.

ITI-105 is one concrete submission example, not a mandatory route for all patient-provided information. The need to distinguish patient-provided data applies across exchange paths.

### Distinguishing Patient-Provided Documents {#distinguishing-patient-provided-documents}

A shared, machine-readable convention is needed to identify information inserted by a natural person or their representative. Receiving systems and downstream consumers need to recognize and preserve this distinction, including when a document is retrieved separately from its metadata. Display text alone cannot support that interoperability. See [EHDS Article 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5) and [EHDS Recital 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#rct_12) for the legal context of this distinction.

This IG identifies that dependency but leaves the specific encoding and representative attribution to coordinated content-standardization work, which may be defined across IGs or in another appropriate specification. It does not select a security-label code, introduce an authorship constraint, or prescribe a Provenance transport. See [Open Issues](open-issues.html) for the outstanding convention questions.

The convention needs to distinguish **submission provenance** from **authorship**: a person may submit a document authored by a practitioner, device, or another person. Submission does not make that person the document's author. Likewise, identifying the patient whose record is concerned does not identify who submitted the information.

Marking information as patient-provided records its origin; that classification alone neither establishes permission to modify it nor implies clinical endorsement. Implementations need to relate submission provenance to the trusted submission context, while using their authorization arrangements to decide what actions are allowed.

### Non-Alteration of Professional Data {#non-alteration-of-professional-data}

Implementations need to enforce the protection in [EHDS Article 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5) against patients or representatives directly altering professionally inserted data and related information. This responsibility cannot be met by a user-interface restriction alone when submissions can arrive through an API. The enforcement mechanism is an implementation detail; this guidance does not define a new authorization protocol or patient-specific conformance requirement.

For document-handling parts of the API, use the established [MHD document relationships](https://profiles.ihe.net/ITI/MHD/ITI-105.html#231054123-replace-transform-signs-and-append-associations) and applicable [XDS lifecycle semantics](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.2.2.3). Patient submissions do not need a separate document lifecycle. For example:

- An `appends` relationship links a new addendum to an existing document; it does not rewrite the original document.
- A `transforms` relationship links a separate alternative representation to its source. It does not authorize changing the source content. Additional commentary is an addendum rather than a transformation.
- Replacement uses the existing lifecycle to supersede a prior document. A patient or representative needs authority over the affected prior submission; a matching patient identifier or patient-provided marking alone cannot establish that authority. Replacement cannot be used to supersede professionally inserted data through the patient submission path.
- Implementations need to consider every affected document and metadata change, including propagated lifecycle effects in an XDS-backed deployment. The same protection applies to any update or removal mechanisms they offer. Requests that would violate it need to be rejected before changes are applied.

The applicable MHD/XDS specifications define the relationships and their lifecycle effects. This guidance explains the protection implementations need to enforce when applying them to patient submissions.

### Preservation and Availability of Submitted Data {#preservation-and-availability}

The original submitted document and its submission provenance need to remain intact. Receiving data is not permission to rewrite its clinical content. Appropriately marked patient-provided data can be made available to authorized consumers without prior clinical review: making it available through the API does not imply clinical endorsement.

Clinical review and reconciliation into a clinician-validated record are separate activities. If reconciliation or conversion produces another representation, keep it as a separate, traceable derivative linked to the original, rather than overwriting the submitted document. Established document relationships support that traceability. Signing a document can likewise use the established signing relationship while preserving the submitted information.

An authorized correction can use the established replacement lifecycle, retaining the original content and provenance as historical material. Superseding a document's lifecycle status is distinct from rewriting its content. Access remains subject to the applicable authorization and consent arrangements.

### Representatives (Article 4(2)) {#representatives}

The workflow can also support a representative under [Article 4(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4) acting on behalf of the natural person. Implementations need to establish and verify the representative's authority through the applicable proxy-service and user-level authorization arrangements; see [Authorization — User-Level Authorization](authorization.html#user-level-authorization).

The shared convention needs to support attribution of representative submissions without conflating representation with document authorship. The precise representation is left to that work. This page does not prescribe a RelatedPerson, Provenance, or token-level model for representatives.

### Wellness Applications (Article 48(2)) {#wellness-applications}

Under [Article 48(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_48), consent and category-level sharing choices are established in the wellness application and access-service layer; interoperability alone does not entail automatic sharing. Once the applicable consent and authority have been established, the application or access service can use the existing exchange paths above. See the [Wellness Apps](usecase-wellness-app.html) use case for the Article 48(2) context.

### Security Model (Informative) {#security-model}

The following describes responsibilities in an example deployment. The existing [Authorization](authorization.html) requirements apply to system-to-system transactions; this section adds no Article 5-specific requirements.

1. **Person authentication and representative authority.** The access service authenticates the person and verifies any representative authority using the applicable Member State arrangements.
2. **Application linking and consent.** The service establishes which application can act for the person and which data may be shared, under the applicable consent arrangements.
3. **System-to-system trust.** In the publish example, the submitting service obtains a token through SMART Backend Services / IHE IUA and presents it on the ITI-105 request. Existing scopes, such as `system/DocumentReference.c`, govern transaction access. The receiving service needs a trust arrangement with the submitting service for person authentication, representative authority, and consent; transaction access alone does not establish authority over an existing document.
4. **Submission provenance.** The shared machine-readable convention enables consumers to recognize patient- and representative-inserted data. It supports decisions about clinical use independently of API availability.
5. **Protection of professional data.** The receiving implementation checks authorization and document-lifecycle effects before applying changes, as described [above](#non-alteration-of-professional-data).
6. **Audit.** Implementers can use existing audit mechanisms for submission and lifecycle events. Audit log formats are outside this IG's scope; see [Regulatory Anchors](regulatoryAnchors.html).

### Examples

These informative examples illustrate document metadata, actual authorship, and existing document relationships. They show persisted DocumentReferences, not complete ITI-105 requests or clinical document payloads. The examples retain `meta.source` for the submitting system and `securityLabel` `PATRPT` as illustrative submission metadata. These choices do not establish a required encoding; a shared patient/representative-submission convention remains to be agreed as described above. Clinical content remains governed by the applicable content IG.

- [Patient-Authored DocumentReference](DocumentReference-example-documentreference-patient-provided.html) — authored and submitted by the natural person
- [Practitioner-Authored, Patient-Submitted DocumentReference](DocumentReference-example-documentreference-patient-submitted.html) — authored by a practitioner and submitted unchanged by the patient
- [Representative-Provided DocumentReference](DocumentReference-example-documentreference-representative-provided.html) — illustrates actual authorship by a representative, without defining how representative authority or submission attribution is encoded
- [Patient-Appended Notes DocumentReference](DocumentReference-example-documentreference-patient-appended-notes.html) — illustrates the existing `appends` relationship; it does not define a content model for patient notes
- [Patient-Submitted Transformation DocumentReference](DocumentReference-example-documentreference-patient-transformed.html) — illustrates a separate alternative representation linked to its source, preserving the original document
