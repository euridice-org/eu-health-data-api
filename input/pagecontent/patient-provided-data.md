### Overview

[Article 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5) of the EHDS Regulation gives natural persons, or their representatives referred to in [Article 4(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4), the right to insert information in their own EHR through electronic health data access services or applications linked to those services. This page provides **informative guidance** on how existing actors and transactions defined in this IG can support this right. Patient-provided data is not restricted to a single transport method, such as [Document Publication](document-exchange.html#document-publication); it can use any transaction in this IG, such as [Document Consumption](document-exchange.html#document-consumption).

The regulation attaches two conditions:

1. **Distinguishability** — inserted information "shall be clearly distinguishable as having been inserted by the natural person or by his or her representative".
2. **Non-alteration** — natural persons and their representatives "shall not be able to directly alter the electronic health data and related information inserted by health professionals". Because this requirement applies to how natural persons interact with data, it is not implemented here.

See [Regulatory Anchors — EHDS Article 5](regulatoryAnchors.html#article-5-insert) for more details about the regulatory source.

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

Implementing Article 5 requires a shared, machine-readable convention to identify information inserted by a natural person or their representative. "Inserted" is interpreted as the person or representative providing information into their health record, by any channel (health data access service, other user interface, wellness application, API, etc.). It is important to differentiate whether the person authored the information or only transported it:

- **Patient Transport of Provider-Created Data**, such as priority category formatted documents the person downloaded through a health data access service under [Article 3(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_3). These already use the content models in [Priority Categories](priority-categories.html), and the original author remains the author.
- **Patient-Authored Data**, such as the person's own notes or wellness device measurements. Defining models for this content is outside the scope of this IG.

How to label information provided by a patient is a content-standardization question. For priority category documents, this IG makes an informative recommendation to use these [v3 ObservationValue](http://terminology.hl7.org/CodeSystem/v3-ObservationValue) security labels:

- `PATRPT` (patient reported): inserted by the natural person.
- `SDMRPT` (substitute decision maker reported): inserted by their representative.

The label belongs primarily on the document content itself, in `meta.security` of the FHIR document `Bundle` and its `Composition`. It can also be carried in `DocumentReference.securityLabel`.

### Wellness Applications (Article 48(2)) {#wellness-applications}

Under [Article 48(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_48), consent and category-level sharing choices are established in the wellness application and access-service layer; interoperability alone does not entail automatic sharing. Once the applicable consent and authority have been established, the application or access service can use the existing exchange paths above. See the [Wellness Apps](usecase-wellness-app.html) use case for the Article 48(2) context.

### Security Model (Informative) {#security-model}

The following describes responsibilities in an example deployment. The existing [Authorization](authorization.html) requirements apply to system-to-system transactions.

1. **Person authentication and representative authority.** The access service authenticates the person and verifies any representative authority using the applicable Member State arrangements.
2. **Application linking and consent.** The service establishes which application can act for the person and which data may be shared, under the applicable consent arrangements.
3. **System-to-system trust.** In the publish example, the submitting service obtains a token through SMART Backend Services / IHE IUA and presents it on the ITI-105 request. Existing scopes, such as `system/DocumentReference.c`, govern transaction access. The receiving service relies on a trust arrangement with the submitting service for person authentication, representative authority, and consent.
4. **Labeling.** Patient- or representative-inserted information can be labeled as described in [Distinguishing Patient-Provided Documents](#distinguishing-patient-provided-documents).
5. **Audit.** Implementers can use existing audit mechanisms. Audit log formats are outside this IG's scope; see [Regulatory Anchors](regulatoryAnchors.html).

### Examples

These informative examples show a patient-inserted, practitioner-authored document submitted with [ITI-105](document-exchange.html#iti-105-simplified-publish) and then returned to a Document Consumer by an [ITI-67](document-exchange.html#document-consumption) query. The original author remains the author; the `PATRPT` label marks the patient insertion.

- [Patient-Inserted Document](Bundle-example-patient-inserted-document.html) — a practitioner-authored FHIR document labeled `PATRPT` in `Bundle.meta.security` and `Composition.meta.security`
- [ITI-105 Simplified Publish Request](DocumentReference-example-patient-inserted-iti105.html) — the DocumentReference submitted by the health data access service, with the document embedded and `securityLabel` mirroring `PATRPT`
- [ITI-67 Query Result](Bundle-example-patient-inserted-searchset.html) — a search result containing the patient-inserted document alongside a clinician-published one
