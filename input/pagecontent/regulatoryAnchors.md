### EHDS Regulation

This Implementation Guide addresses technical requirements from the European Health Data Space (EHDS) regulation, specifically focusing on the interoperability requirements placed on EHR systems.

The regulatory basis is primarily found in EHDS ANNEX II - Essential Requirements for EHR Systems ([EUR-Lex](https://eur-lex.europa.eu/eli/reg/2025/327/oj/eng#anx_II)), which describes an obligation for EHR systems to include an *Interoperability Component* that does the following:

- [EHDS Annex II §2.1](https://eur-lex.europa.eu/eli/reg/2025/327/oj/eng#anx_II): "SHALL provide an **interface enabling access** to the personal electronic health data [formatted in EEHRxF]"
- [EHDS Annex II §2.2](https://eur-lex.europa.eu/eli/reg/2025/327/oj/eng#anx_II): "SHALL **be able to receive** personal electronic health data [formatted in EEHRxF]"

In addition, this IG addresses the patient insertion right of the regulation body text:

- [EHDS Article 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5): natural persons, or their representatives ([Art. 4(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4)), "shall have the right to **insert information** in the EHR", clearly distinguishable as inserted by them, without altering data inserted by health professionals — see [Article 5: Insert Information](#article-5-insert)

Note that this IG does NOT create legal obligations on EHR Systems unless adopted by the European Commission.

### Xt-EHR Joint Action

This IG inherits and builds upon the work of the Xt-EHR Joint Action, which has created deliverables drafting the EHDS Implementing Acts. Two deliverables are central: D5.1 defines exchange requirements — how data flows between systems — and D8.1 defines the data model and conformance framework — what conformant data looks like. This IG implements D5.1 as FHIR actors and transactions for **exchange**, and references D8.1 **content** profiles carried by those exchanges.

These requirements have also been adjusted to harmonize with Xt-EHR Work Packages 6 and 7, which define requirements for each priority category.

For more details on the Xt-EHR work, see [the Xt-EHR Website](https://www.xt-ehr.eu/work-packages/). The Xt-EHR deliverables, including D5.1, D5.2, and D8.1, are available on the [Xt-EHR deliverables page](https://www.xt-ehr.eu/deliverables/).

### Requirements Framework

The EHDS regulation defines the Interoperability Component at a high level, but interoperability needs to be defined with technical precision in order for two systems to effectively achieve interoperability.

This table describes the bridge between the regulation text and precise and implementable specifications.

| **Layer**                     | **EHDS Regulation** | **EHR Functional Requirements** | **Technical Specifications (You Are Here)** |
|-------------------------------|---------------------|--------------------------------|---------------------------------------------|
| **Description**               | Law. High-level description of interoperability goals. | EHDS Implementing acts. System roles and capabilities, requirements on EHR systems to achieve those goals. | Strictly defined interoperability technical rules. Implementable guide describing use of FHIR (or other) specifications. **Basis of interoperability conformance.** |
| **Level of Technical Detail** | Low | Medium | High |
| **Example**                   | EHDS Annex II §2.1: The EHR system shall provide access to data in the EEHRxF format. | **api-access-doc**: The EHR system Interoperability Software Component SHALL offer an API that enables an external system to access and retrieve its priority category data modelled as FHIR Documents. | The **api-access-doc** requirement is met by implementing MHD ITI-67 and ITI-68 as Document Responder. Example: `GET [base]/DocumentReference?patient=123&type=...` |
| **Owner**                     | European Commission | European Commission (drafted by Xt-EHR), Member States | **To be decided** by the European Commission and Member States. SDOs (HL7 EU, IHE Europe) propose a draft with this Implementation Guide. |
{: .grid}


Legal authority flows from left to right on this diagram. Self-testing of an EHR system in the EHDS Digital Testing Environment is best enabled by the right-most technical specification layer.

### Scope of This IG

The Xt-EHR Work Packages, notably WP 5.1, have drafted the middle layer: EHR Functional Requirements.

We inherit and evolve that work, focusing on the **technical specification layer** of these interoperability requirements, using off the shelf IHE and HL7 standards. The requirements themselves and how they are applied to EHR products are not defined in this IG. These are ultimately owned by the European Commission to be finalized in the EHDS Implementing Acts.

D5.1 defined **26 requirements** across three categories (see Xt-EHR D5.1 Annex for complete list):

- **[In Scope] 15 Interoperability Component requirements:** This implementation guide primarily focuses on the technical implementation of these requirements.
- **[Out of Scope] 6 Logging Component Requirements:** This Implementation Guide does not specify the logging component format or the interoperability of logs from EHR systems. EHDS ANNEX II requires the generation of local audit logs for review, but does not specify the data format or require interoperability of those logs. Implementers needing standardized audit logging should consider [IHE ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) and [IHE BALP](https://profiles.ihe.net/ITI/BALP/index.html) (Basic Audit Log Patterns), which define FHIR AuditEvent-based audit log profiles. The IHE profiles used in this IG (MHD, PDQm, IUA) recommend but do not require ATNA grouping.
- **[Out of Scope] 5 General requirements:** D5.1 also defines general requirements covering software installation, documentation, performance, and safety of EHR systems. These are not testable API specifications and are therefore out of scope for this IG.

---
### Xt-EHR Deliverable 5.1

Xt-EHR Deliverable 5.1 interpreted 2.1 and 2.2 as two sides of a query-based architecture:

| Regulation | D5.1 Interpretation | IG Actor |
|------------|---------------------|----------|
| EHDS Annex II §2.1 "provide interface enabling access" | Producer: Serve queries for EEHRxF data | **Access Provider** |
| EHDS Annex II §2.2 "be able to receive" | Consumer: Initiate queries and receive responses | **Consumer** |

<div style="max-width: 70%; margin: 0 auto;">
{% include img.html img="5-1_exchange.png" caption="Figure 2: Query-Based Exchange Model" %}
</div>

This interpretation is grounded in the following rationale:

- **Clinical workflow fit**: When a patient arrives at a new care setting, their health data often resides elsewhere. Query-based exchange allows the treating provider to retrieve patient data *at the point of care*, rather than requiring precoordination with the data source to transmit the patient's data.
- **MyHealth@EU alignment**: EU Cross-border services are primarily modeled as query-based exchanges. The requesting country's National Contact Point queries the responding National Contact Point, which queries the providing country's systems.
- **Data availability**: Healthcare is 24/7. An API endpoint can serve requests at any time, ensuring data is accessible when needed for care. With a push architecture, data availability depends on the receiver being online and the sender initiating data transmission.

### EHDS Annex II §2.1: Provide Access {#annex-ii-21-provide-access}

The **Access Provider** actors ([Document Access Provider](actors.html#document-access-provider), [Resource Access Provider](actors.html#resource-access-provider)) satisfy [EHDS Annex II §2.1](https://eur-lex.europa.eu/eli/reg/2025/327/oj/eng#anx_II) by serving Document and Resource FHIR queries.

#### Delegated Access Option

Alternatively, this IG proposes a path for EHR systems to delegate their [EHDS Annex II §2.1](https://eur-lex.europa.eu/eli/reg/2025/327/oj/eng#anx_II) obligations to another system.

The EHR system implements the [Document Publisher](actors.html#document-publisher) role, publishing data to an Access Provider that serves queries on its behalf.

This pathway addresses real-world deployment scenarios:

- **Systems not suited for 24/7 API hosting**: Not every EHR system is well-suited to serving APIs. For example - an iPad clinician app may create clinical documents but cannot practically act as a server. Such systems "provide access" by publishing to an Access Provider.
- **Aggregation at hospital scale**: A hospital document management system (Access Provider) aggregates data from departmental modules (Publishers) to offer a unified access point for the healthcare organization. This provides a single "digital front door" and improved security benefits. 
- **Aggregation at national scale**: Healthcare organization EHRs (Publishers) submit documents to a national repository (Access Provider), which provides access across the region.

See [Actors](actors.html) for complete definitions and [Example Groupings](actors.html#example-groupings) for deployment illustrations.

---

### EHDS Annex II §2.2: Receive Data {#annex-ii-22-receive-data}

The **Consumer** actors ([Document Consumer](actors.html#document-consumer), [Resource Consumer](actors.html#resource-consumer)) satisfy [EHDS Annex II §2.2](https://eur-lex.europa.eu/eli/reg/2025/327/oj/eng#anx_II) by initiating Document and Resource queries to retrieve and receive data from Access Providers.

#### Accepting Published Documents

Systems that need to accept documents pushed from Publishers (e.g., national infrastructure, regional repositories, integration engines) may implement the **[Document Submission Option](actors.html#document-submission-option)** on the Document Access Provider actor. This is an *additional* capability for systems acting as aggregation points—it is not required to satisfy [EHDS Annex II §2.2](https://eur-lex.europa.eu/eli/reg/2025/327/oj/eng#anx_II).

---

### EHDS Article 5: Insert Information {#article-5-insert}

[Article 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5) gives natural persons, or their representatives referred to in [Article 4(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4), the right to insert information in their own EHR through electronic health data access services or applications linked to those services. Inserted information must be clearly distinguishable as inserted by the person or representative, and natural persons must not be able to directly alter electronic health data inserted by health professionals.

This IG satisfies Article 5 for document-shaped data using existing actors — no new actor is defined. The full specification is on the [Patient-Provided Data](patient-provided-data.html) page; the mapping is:

| Article 5 element | IG mechanism |
|---|---|
| Insertion channel via access service or linked application | The patient-facing service acts as a [Document Publisher](actors.html#document-publisher), submitting via ITI-105 to a Document Access Provider implementing the [Document Submission Option](actors.html#document-submission-option) |
| "Clearly distinguishable" | `DocumentReference.securityLabel` = `PATRPT` identifies the Article 5 submission channel; `author`, `meta.source`, and optional `Provenance` retain precise authorship and submission provenance — see [Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents) |
| No direct alteration of professional data | Submissions create new documents; replacement, update, and removal are restricted to the person's own prior submissions — see [Non-Alteration](patient-provided-data.html#non-alteration-of-professional-data) |
| Representatives (Art. 4(2)) | The submission uses `PATRPT`; a `RelatedPerson` may be the document author or may be recorded as the submitting agent in `Provenance`. Verifying the representative's authority is a Member State proxy-service and user-level authorization concern, out of scope here — see [Representatives](patient-provided-data.html#representatives) |
| Wellness applications (Art. 48(2)) | Same transport (Document Publisher); consent and category-level sharing choices occur in the application / access-service layer, out of scope for this API — see [Wellness Applications](patient-provided-data.html#wellness-applications) |
{: .grid}

Resource-level insertion (individual observations, medications) is deferred; see [Resource Exchange](resourceExchange.html).

---

### Requirements Table

The following table maps each D5.1 interoperability requirement to its implementation in this IG:

#### API Requirements (Access Provider)

> **Terminology note:** D5.1 uses "Producer" to describe the system serving the query API. This IG uses "Access Provider" to make the API-serving role explicit and avoid confusion with content creation.

| D5.1 Req ID | D5.1 Normative Requirement | EHDS Basis | Actor | IG Section | Technical Spec |
|-------------|----------------------------|------------|-------|------------|----------------|
| `api-provider-general` | The EHR system acting as a provider SHALL provide access to its priority category data by offering an API that complies to the EHDS API specification. | Annex II §2.1 | Access Provider | [Document Access Provider](actors.html#document-access-provider), [Resource Access Provider](actors.html#resource-access-provider) | This IG |
| `api-provider-backendAuthDiscovery` | The EHR system Interoperability Software Component SHALL enable discovery of its authorization server information to enable a consumer to retrieve authorization. | Annex II §1.4, Art. 36(3)(e) | Access Provider | [Authorization - Discovery](authorization.html#authorization-server-discovery) | SMART .well-known/smart-configuration, IHE IUA |
| `api-provider-backendAuthProvideToken` | The EHR system Interoperability Software Component SHALL support issuing authorization tokens to consumer EHR systems. | Annex II §1.4, Art. 36(3)(e) | Access Provider [1] | [Get Access Token (ITI-71)](authorization.html#get-access-token) | SMART Backend Services token endpoint, IHE IUA |
| `api-provider-backendAuthRequireToken` | The EHR system Interoperability Software Component SHALL require a valid authorization token from the Consumer EHR on Interoperability Component exchange. | Annex II §1.4, Art. 36(3)(e) | Access Provider | [Incorporate Access Token (ITI-72)](authorization.html#incorporate-access-token) | Bearer token validation, IHE IUA |
| `api-provider-patient` | The EHR system Interoperability Software Component SHALL offer a patient lookup API. | Annex II §2.1 | Access Provider | [Patient Demographics Supplier](patient-match.html) | PDQm ITI-78 |
| `api-provider-doc` | The EHR system Interoperability Software Component SHALL offer an API that enables an external system to access and retrieve its priority category data modelled as FHIR Documents. | Annex II §2.1 | Access Provider | [Document Responder](document-exchange.html) | MHD ITI-67, ITI-68 |
| `api-provider-resource` | The EHR system Interoperability Software Component SHALL offer search and read access via individual FHIR Resource API(s). | Annex II §2.1 | Access Provider | [Clinical Data Source](resource-access.html) | IPA Server |

[1] **Note on Authorization Server:** The EHR system may or may not be bundled with its own authorization server. See [Authorization Server Deployment](authorization.html#authorization-server-deployment) for details.


#### API Requirements (Consumer)

| D5.1 Req ID | D5.1 Normative Requirement | EHDS Basis | Actor | IG Section | Technical Spec |
|-------------|----------------------------|------------|-------|------------|----------------|
| `api-consumer-general` | The EHR system Interoperability Software Component acting as a consumer SHALL consume external priority category data via an API conforming to the EHDS API specification. | Annex II §2.2 | Consumer | [Document Consumer](actors.html#document-consumer), [Resource Consumer](actors.html#resource-consumer) | This IG |
| `api-consumer-backendAuthObtainToken` | The EHR system Interoperability Software Component SHALL obtain an authorization token from the provider's designated authorization server. | Annex II §1.4, Art. 36(3)(e) | Consumer | [Get Access Token (ITI-71)](authorization.html#get-access-token) | SMART Backend Services client credentials grant, IHE IUA |
| `api-consumer-backendAuthPresentToken` | The EHR system Interoperability Software Component SHALL present a valid token to the Provider EHR on Interoperability Component Exchange. | Annex II §1.4, Art. 36(3)(e) | Consumer | [Incorporate Access Token (ITI-72)](authorization.html#incorporate-access-token) | Bearer token in Authorization header |
| `api-consumer-patient` | The EHR system Interoperability Software Component SHALL support an external patient lookup query API. | Annex II §2.2 | Consumer | [Patient Demographics Consumer](patient-match.html) | PDQm Consumer |
| `api-consumer-doc` | The EHR system Interoperability Software Component SHALL support an external document query API. | Annex II §2.2 | Consumer | [Document Consumer](document-exchange.html) | MHD Document Consumer |
| `api-consumer-resource` | The EHR system Interoperability Software Component SHALL support an external resource query API. | Annex II §2.2 | Consumer | [Clinical Data Consumer](resource-access.html) | IPA Client |

#### Patient Insertion Requirements (Article 5)

> **Origin note:** Xt-EHR D5.1 defines no requirement covering Article 5. The requirement IDs below originate in **this IG** (they are not D5.1 IDs) and are proposed for consideration in the EHDS Implementing Acts.

| Req ID (this IG) | Normative Requirement | EHDS Basis | Actor | IG Section | Technical Spec |
|-------------|----------------------------|------------|-------|------------|----------------|
| `api-publisher-patientInsert` | A system submitting information provided by a natural person or their representative (e.g., a health data access service or a linked application) SHALL submit that information as an EEHRxF document via ITI-105 Simplified Publish. | Art. 5, Art. 4(1)–(2), Annex II §2.2 | Document Publisher | [Patient-Provided Data](patient-provided-data.html) | MHD ITI-105 |
| `api-publisher-patientDistinguish` | The Document Publisher SHALL mark documents submitted through the Article 5 patient insertion channel with `DocumentReference.securityLabel` `PATRPT`. `DocumentReference.author` SHALL identify the actual document author or authors when known, `meta.source` SHOULD identify the originating system, and `Provenance` MAY identify the submitting Patient or RelatedPerson when they are not the author. | Art. 5, Recital 12 | Document Publisher | [Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents) | v3-ObservationValue provenance code |
| `api-provider-patientDistinguish` | The Document Access Provider SHALL preserve the author, security labels, and `meta.source` of received patient-provided documents and return them unaltered via ITI-67/ITI-68. | Art. 5, Recital 12 | Document Access Provider (Document Submission Option) | [Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents) | MHD ITI-67, ITI-68 |
| `api-provider-patientNoAlter` | A patient-provided submission SHALL NOT alter professional-authored documents or resources. Mechanisms that change previously submitted content (`relatesTo.code = replaces`, update, or removal) SHALL be restricted to the person's own prior patient-provided submissions for the same subject. A new patient-provided document MAY use `relatesTo.code = appends` to link to an existing document for the same subject without altering the target. | Art. 5 | Document Access Provider (Document Submission Option) | [Non-Alteration of Professional Data](patient-provided-data.html#non-alteration-of-professional-data) | FHIR `create`; `DocumentReference.relatesTo` |
{: .grid}

### Content Format Requirements

These requirements apply regardless of which pathway is used to provide or receive data. The content must be valid EEHRxF whether served directly by an Access Provider or published via ITI-105.

| D5.1 Req ID | D5.1 Normative Requirement | EHDS Basis | Actor | IG Section | Technical Spec |
|-------------|----------------------------|------------|-------|------------|----------------|
| `api-producer-data` | The EHR system SHALL be capable of providing priority category data that conforms to the EEHRxF data format. | Annex II §2.1, §2.4 | Any system providing data | Priority Category Content Profiles | HL7 EU Content IGs |
| `api-consumer-data` | The EHR system SHALL be able to receive and handle data conforming to the EEHRxF data format. | Annex II §2.2 | Any system receiving data | Priority Category Content Profiles | HL7 EU Content IGs |

### Security Requirements

| D5.1 Req ID | D5.1 Normative Requirement | EHDS Basis | Actor | IG Section | Technical Spec |
|-------------|----------------------------|------------|-------|------------|----------------|
| `api-backendEncryption` | The EHR system Interoperability Component SHALL be capable of transport-encrypted data exchange. | Annex II §1.4, Art. 36(3)(e) | All | [Transport Security](authorization.html#transport-security) | TLS 1.2+ |

---

### Xt-EHR Deliverable 8.1: Data Model and Conformance Framework

The preceding sections describe how this IG implements D5.1's exchange requirements. This section describes the relationship to D8.1, which defines the data model and conformance framework for the content that flows through those exchanges.

D8.1 defines what conformant health data looks like: the fields a Patient Summary must contain, the obligations on systems that create or consume that data, and the scope of conformance a system can claim. This IG implements D5.1's exchange requirements as FHIR actors and transactions. The Content IGs implement D8.1's data requirements as FHIR profiles. Together, they provide a complete interoperability specification.

> Note: [D8.1](https://www.xt-ehr.eu/deliverables/) is published on the Xt-EHR deliverables page. This section summarizes the concepts this IG builds upon.

<div style="max-width: 70%; margin: 0 auto;">
{% include img.html img="ContentExchangeXtEhr.png" caption="Figure 3: Relationship between Xt-EHR deliverables and this IG. D5.1 exchange requirements are implemented by MHD (document exchange) and IPA (resource exchange). D8.1 data content profiles are implemented by HL7 EU Priority Category IGs and HL7 EU Core Resources." %}
</div>

#### D8.1 Conformance Paths

D8.1 defines two types of Interoperability Profile that a system can claim conformance to:

**Priority Interoperability Profiles** apply to systems that produce or consume a complete priority dataset — a Patient Summary, a Discharge Report, a Laboratory Report, an Imaging Report, an ePrescription, or an eDispensation. Patient Summary, Discharge Report, Laboratory Report, and Imaging Report are structured as FHIR Documents.

**Resource Interoperability Profiles** apply to systems that support individual clinical resources — allergies, conditions, immunizations, medications, observations, and others — without producing or consuming complete priority datasets. D8.1 calls this *scoped conformance*: a system is assessed only for the resources it claims to support.

These are separate conformance paths. A vaccination registry that serves Immunization resources claims conformance to the Immunization Resource Interoperability Profile. A hospital EHR that produces full Patient Summaries claims conformance to the Patient Summary Priority Interoperability Profile. Both are valid under D8.1.

#### Content vs Exchange

D8.1 defines **content**: data structure and obligations. D8.1's Producer and Consumer roles describe content creation and consumption — a Producer populates conformant data; a Consumer processes received data. The Content IGs fulfill these obligations as FHIR profiles.

D5.1 defines **exchange**: how conformant data moves between systems via APIs. This IG implements D5.1 as FHIR actors and transactions (see [Xt-EHR Deliverable 5.1](#xt-ehr-deliverable-51) above).

Neither deliverable states which exchange pattern serves which content profile type. This IG bridges that gap: [Priority Categories](priority-categories.html) maps each priority category to its content specification and exchange pattern. A conformant implementation combines both — for example, the [Retrieve a Patient Summary](example-patient-summary.html) use case requires the EU Patient Summary IG for content and this IG's document exchange for transport.

For medication data, this IG covers reading MedicationRequest and MedicationStatement as individual resources via resource exchange. The ePrescription and eDispensation workflow transactions (prescribing, dispensing) are out of scope and handled by [IHE MPD](https://profiles.ihe.net/PHARM/MPD/index.html).

#### D8.1 Profile Dependencies

D8.1 specifies that when a Priority Interoperability Profile references another profile (e.g., a Patient Summary references the EHDS Patient profile), the referenced profile's data obligations also apply. This is a data model requirement: the Patient resource inside a Patient Summary must conform to the EHDS Patient profile. It does not by itself mandate independent resource-level exchange for that resource. Data model conformance is the Content IGs' domain; exchange is this IG's domain, based on the system's declared conformance path.

---
