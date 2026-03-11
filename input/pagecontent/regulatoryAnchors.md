### EHDS Regulation

This Implementation Guide addresses technical requirements from the European Health Data Space (EHDS) regulation, specifically focusing on the interoperability requirements placed on EHR systems.

The regulatory basis is primarily found in EHDS ANNEX II - Essential Requirements for EHR Systems ([EUR-Lex](https://eur-lex.europa.eu/eli/reg/2025/327/oj/eng#anx_II), [Local Copy](ehds-annex-ii.html)), which describes an obligation for EHR systems to include an *Interoperability Component* that does the following:

- §2.1: "SHALL provide an **interface enabling access** to the personal electronic health data [formatted in EEHRxF]"
- §2.2: "SHALL **be able to receive** personal electronic health data [formatted in EEHRxF]"

Note that this IG does NOT create legal obligations on EHR Systems unless adopted by the European Commission.

### Xt-EHR Joint Action

This IG inherits and builds upon the work of the Xt-EHR Joint Action, which has created deliverables drafting the EHDS Implementing Acts. Specifically, we inherit the work done in Xt-EHR Work Package 5.1 which has mapped the EHDS text to more precise EHR requirements.

These requirements have also been adjusted to harmonize with Xt-EHR Work Packages 6 and 7, which define requirements for each priority category.

For more details on the Xt-EHR work, see [the Xt-EHR Website](https://www.xt-ehr.eu/work-packages/). Note: Xt-EHR deliverables are not yet publicly released.

### Requirements Framework

The EHDS regulation defines the interoperability component at a high level, but interoperability needs to be defined with technical precision in order for two systems to effectively achieve interoperability.

This table describes the bridge between the regulation text and precise and implementable specifications.

| **Layer**                     | **EHDS Regulation** | **EHR Functional Requirements** | **Technical Specifications (You Are Here)** |
|-------------------------------|---------------------|--------------------------------|---------------------------------------------|
| **Description**               | Law. High-level description of interoperability goals. | EHDS Implementing acts. System roles and capabilities, requirements  on EHR systems to achieve those goals <br/><br/> | Strictly defined interoperability technical rules. Implementable Guide describing use FHIR (or other) specifications. <br/><br/>**Basis of interoperability conformance** |
| **Level of Technical Detail** | low | medium | high |
| **Example**                   | EHDS Annex § 2.1: The EHR system should provide access to data in the EEHRxF format | **api-access-doc**: The EHR system Interoperability Software Component SHALL offer an API that enables an external system (such as a consumer) to access and retrieve its priority category data, for categories where that data is modeled as a FHIR Document <br/> | The **api-access-doc** requirement is met by the EHR System implementing the IHE MHD ITI-67 and ITI-68 transactions as the Document Responder actor.<br/> *Example FHIR Query: GET [base]/DocumentReference?category=123*  |
| **Owner**                     | European Commission | European Commission<br/>(drafted by Xt-EHR), Member States | **To be decided** by the European Commission and Member States. SDOs (HL7 EU, IHE Europe) are proposing a draft with this Implementation Guide |


Legal authority flows from left to right on this diagram. Self-testing of an EHR system in the EHDS Digital Testing Environment is best enabled by the right-most technical specification layer.

### Scope of This IG

The Xt-EHR Work Packages, notably WP 5.1, have drafted the middle layer: EHR Functional Requirements.

We inherit and evolve that work, focusing on the **technical specification layer** of these interoperability requirements, using off the shelf IHE and HL7 standards. The requirements themselves and how they are applied to EHR products are not defined in this IG. These are ultimately owned by the European Commission to be finalized in the EHDS Implementing Acts.

D5.1 defined **26 requirements** across three categories (see Xt-EHR D5.1 Annex for complete list):

- **[In Scope] 15 Interoperability Component Requirements:** This implementation guide primarily focuses on the technical implementation of these requirements.
- **[Out of Scope] 6 Logging Component Requirements:** This Implementation Guide does not specify the logging component format or the interoperability of logs from EHR systems. EHDS ANNEX II requires the generation of local audit logs for review, but does not specify the data format or require interoperability of those logs. Implementers needing standardized audit logging should consider [IHE ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) and [IHE BALP](https://profiles.ihe.net/ITI/BALP/index.html) (Basic Audit Log Patterns), which define FHIR AuditEvent-based audit log profiles. The IHE profiles used in this IG (MHD, PDQm, IUA) recommend but do not require ATNA grouping.
- **[Out of Scope] 5 General requirements:** D5.1 also defines general requirements covering software installation, documentation, performance, and safety of EHR systems. These are not testable API specifications and are therefore out of scope for this IG.

---
### Xt-EHR Deliverable 5.1

Xt-EHR Deliverable 5.1 interpreted 2.1 and 2.2 as two sides of a query-based architecture:

| Regulation | D5.1 Interpretation | IG Actor |
|------------|---------------------|----------|
| §2.1 "provide interface enabling access" | Producer: Serve queries for EEHRxF data | **Access Provider** |
| §2.2 "be able to receive" | Consumer: Initiate queries and receive responses | **Consumer** |

<div style="max-width: 70%; margin: 0 auto;">
{% include img.html img="5-1_exchange.png" caption="Figure: Query-Based Exchange Model" %}
</div>

This interpretation is grounded in the following rationale:

- **Clinical workflow fit**: When a patient arrives at a new care setting, their health data often resides elsewhere. Query-based exchange allows the treating provider to retrieve patient data *at the point of care*, rather than requiring precoordination with the data source to transmit the patient's data.
- **MyHealth@EU alignment**: EU Cross-border services are primarily modeled as query-based exchanges. The requesting country's National Contact Point queries the responding National Contact Point, which queries the providing country's systems.
- **Data availability**: Healthcare is 24/7. An API endpoint can serve requests at any time, ensuring data is accessible when needed for care. With a push architecture, data availability depends on the receiver being online and the sender initiating data transmission.

### §2.1: Provide Access

The **Access Provider** actors ([Document Access Provider](actors.html#document-access-provider), [Resource Access Provider](actors.html#resource-access-provider)) satisfy §2.1 by serving Document and Resource FHIR queries.

#### Delegated Access Option

Alternatively, this IG proposes a path for EHR systems to delegate their §2.1 obligations to another system.

The EHR system implements the [Document Publisher](actors.html#document-publisher) role, publishing data to an Access Provider that serves queries on its behalf.

This pathway addresses real-world deployment scenarios:

- **Systems not suited for 24/7 API hosting**: Not every EHR system is well-suited to serving APIs. For example - an iPad clinician app may create clinical documents but cannot practically act as a server. Such systems "provide access" by publishing to an Access Provider.
- **Aggregation at hospital scale**: A hospital document management system (Access Provider) aggregates data from departmental modules (Publishers) to offer a unified access point for the healthcare organization. This provides a single "digital front door" and improved security benefits. 
- **Aggregation at national scale**: Healthcare organization EHRs (Publishers) submit documents to a national repository (Access Provider), which provides access across the region.

See [Actors](actors.html) for complete definitions and [Example Groupings](actors.html#example-groupings) for deployment illustrations.

---

### §2.2: Receive Data

The **Consumer** actors ([Document Consumer](actors.html#document-consumer), [Resource Consumer](actors.html#resource-consumer)) satisfy §2.2 by initiating Document and Resource queries to retrieve and receive data from Access Providers.

#### Accepting Published Documents

Systems that need to accept documents pushed from Publishers (e.g., national infrastructure, regional repositories, integration engines) may implement the **[Document Submission Option](actors.html#document-submission-option)** on the Document Access Provider actor. This is an *additional* capability for systems acting as aggregation points—it is not required to satisfy §2.2.

---

### Requirements Table

The following table maps each D5.1 interoperability requirement to its implementation in this IG:

#### API Requirements (Access Provider)

> **Terminology note:** D5.1 uses "Producer" to describe the system serving the query API. This IG uses "Access Provider" to make the API-serving role explicit and avoid confusion with content creation.

| D5.1 Req ID | D5.1 Normative Requirement | EHDS Basis | Actor | IG Section | Technical Spec |
|-------------|----------------------------|------------|-------|------------|----------------|
| `api-provider-general` | The EHR system acting as a provider SHALL provide access to its priority category data by offering an API that complies to the EHDS API specification. | Annex II §2.1 | Access Provider | [Document Access Provider](actors.html#document-access-provider), [Resource Access Provider](actors.html#resource-access-provider) | This IG |
| `api-provider-authDiscovery` | The EHR system Interoperability Software Component SHALL enable discovery of its authorization server information to enable a consumer to retrieve authorization. | Annex II §1.4, Art. 36(3)(e) | Access Provider | [Authorization - Discovery](authorization.html#authorization-server-discovery) | SMART .well-known/smart-configuration, IHE IUA |
| `api-provider-authProvideToken` | The EHR system Interoperability Software Component SHALL support issuing authorization tokens to consumer EHR systems. | Annex II §1.4, Art. 36(3)(e) | Access Provider [1] | [Get Access Token (ITI-71)](authorization.html#get-access-token) | SMART Backend token endpoint, IHE IUA |
| `api-provider-authRequireToken` | The EHR system Interoperability Software Component SHALL require a valid authorization token from the Consumer EHR on Interoperability Component exchange. | Annex II §1.4, Art. 36(3)(e) | Access Provider | [Incorporate Access Token (ITI-72)](authorization.html#incorporate-access-token) | Bearer token validation, IHE IUA |
| `api-provider-patient` | The EHR system Interoperability Software Component SHALL offer a patient lookup API. | Annex II §2.1 | Access Provider | [Patient Demographics Supplier](patient-match.html) | PDQm ITI-78 |
| `api-provider-doc` | The EHR system Interoperability Software Component SHALL offer an API that enables an external system to access and retrieve its priority category data modelled as FHIR Documents. | Annex II §2.1 | Access Provider | [Document Responder](document-exchange.html) | MHD ITI-67, ITI-68 |
| `api-provider-resource` | The EHR system Interoperability Software Component SHALL offer search and read access via individual FHIR Resource API(s). | Annex II §2.1 | Access Provider | [Clinical Data Source](resource-access.html) | IPA Server/QEDm |

[1] **Note on Authorization Server:** The EHR system may or may not be bundled with its own authorization server. See [Authorization Server Deployment](authorization.html#authorization-server-deployment) for details.


#### API Requirements (Consumer)

| D5.1 Req ID | D5.1 Normative Requirement | EHDS Basis | Actor | IG Section | Technical Spec |
|-------------|----------------------------|------------|-------|------------|----------------|
| `api-consumer-general` | The EHR system Interoperability Software Component acting as a consumer SHALL consume external priority category data via an API conforming to the EHDS API specification. | Annex II §2.2 | Consumer | [Document Consumer](actors.html#document-consumer), [Resource Consumer](actors.html#resource-consumer) | This IG |
| `api-consumer-authObtainToken` | The EHR system Interoperability Software Component SHALL obtain an authorization token from the provider's designated authorization server. | Annex II §1.4, Art. 36(3)(e) | Consumer | [Get Access Token (ITI-71)](authorization.html#get-access-token) | SMART Backend client credentials grant, IHE IUA |
| `api-consumer-authPresentToken` | The EHR system Interoperability Software Component SHALL present a valid token to the Provider EHR on Interoperability Component Exchange. | Annex II §1.4, Art. 36(3)(e) | Consumer | [Incorporate Access Token (ITI-72)](authorization.html#incorporate-access-token) | Bearer token in Authorization header |
| `api-consumer-patient` | The EHR system Interoperability Software Component SHALL support an external patient lookup query API. | Annex II §2.2 | Consumer | [Patient Demographics Consumer](patient-match.html) | PDQm Consumer |
| `api-consumer-doc` | The EHR system Interoperability Software Component SHALL support an external document query API. | Annex II §2.2 | Consumer | [Document Consumer](document-exchange.html) | MHD Document Consumer |
| `api-consumer-resource` | The EHR system Interoperability Software Component SHALL support an external resource query API. | Annex II §2.2 | Consumer | [Clinical Data Consumer](resource-access.html) | IPA Client/QEDm |

### Content Format Requirements

These requirements apply regardless of which pathway is used to provide or receive data. The content must be valid EEHRxF whether served directly by an Access Provider or published via ITI-105.

| D5.1 Req ID | D5.1 Normative Requirement | EHDS Basis | Actor | IG Section | Technical Spec |
|-------------|----------------------------|------------|-------|------------|----------------|
| `api-producer-data` | The EHR system SHALL be capable of providing priority category data that conforms to the EEHRxF data format. | Annex II §2.1, §2.4 | Any system providing data | Priority Category Content Profiles | HL7 EU Content IGs |
| `api-consumer-data` | The EHR system SHALL be able to receive and handle data conforming to the EEHRxF data format. | Annex II §2.2 | Any system receiving data | Priority Category Content Profiles | HL7 EU Content IGs |

### Security Requirements

| D5.1 Req ID | D5.1 Normative Requirement | EHDS Basis | Actor | IG Section | Technical Spec |
|-------------|----------------------------|------------|-------|------------|----------------|
| `api-encryption` | The EHR system Interoperability Component SHALL be capable of transport-encrypted data exchange. | Annex II §1.4, Art. 36(3)(e) | All | [Transport Security](authorization.html#transport-security) | TLS 1.2+ |

---

### Xt-EHR Deliverable 8.1: Data Model and Conformance Framework

The preceding sections describe how this IG implements D5.1's exchange requirements. This section describes the relationship to D8.1, which defines the data model and conformance framework for the content that flows through those exchanges.

D8.1 defines what conformant health data looks like: the fields a Patient Summary must contain, the obligations on systems that create or consume that data, and the scope of conformance a system can claim. This IG implements D5.1's exchange requirements as FHIR actors and transactions. The Content IGs implement D8.1's data requirements as FHIR profiles. Together, they provide a complete interoperability specification.

> Note: D8.1 is an in-progress Xt-EHR deliverable, not yet publicly released. This section summarizes the concepts this IG builds upon.

```mermaid
graph LR
    subgraph exchange["<b>EXCHANGE</b> — this IG"]
        direction TB
        doc["<b>FHIR Document Exchange</b><br/>MHD: ITI-67 find, ITI-68 retrieve"]
        res["<b>Resource Exchange</b><br/>IPA: FHIR search + read"]
    end

    subgraph content["<b>CONTENT</b> — Content IGs"]
        direction TB
        priority["<b>Priority Category IGs</b><br/>PS, HDR, Lab, Imaging<br/><i>D8.1 Priority Interop Profiles</i>"]
        resource["<b>EU Core + Category IGs</b><br/>Allergy, Condition, Immunization, ...<br/><i>D8.1 Resource Interop Profiles</i>"]
        logical["<b>Xt-EHR Logical Models</b><br/>WP6 / WP7"]
        priority --> logical
        resource --> logical
    end

    doc --> priority
    res --> resource

    style exchange fill:#e8f4fd,stroke:#4a86c8,stroke-width:2px,color:#333
    style content fill:#e8f5e9,stroke:#4a8c5c,stroke-width:2px,color:#333
    style doc fill:#fff,stroke:#4a86c8,stroke-width:1px
    style res fill:#fff,stroke:#4a86c8,stroke-width:1px
    style priority fill:#fff,stroke:#4a8c5c,stroke-width:1px
    style resource fill:#fff,stroke:#4a8c5c,stroke-width:1px
    style logical fill:#f5f5f5,stroke:#999,stroke-width:1px
```

*Figure: This IG defines exchange patterns (left); Content IGs define data profiles (right). Both trace to Xt-EHR logical models. An implementable EHR system combines both.*

#### Two Conformance Paths

D8.1 defines two types of Interoperability Profile that a system can claim conformance to:

**Priority Interoperability Profiles** apply to systems that produce or consume a complete priority dataset — a Patient Summary, a Discharge Report, a Laboratory Report, an Imaging Report, an ePrescription, or an eDispensation. Patient Summary, Discharge Report, Laboratory Report, and Imaging Report are structured as FHIR Documents.

**Resource Interoperability Profiles** apply to systems that support individual clinical resources — allergies, conditions, immunizations, medications, observations, and others — without producing or consuming complete priority datasets. D8.1 calls this *scoped conformance*: a system is assessed only for the resources it claims to support.

These are separate conformance paths. A vaccination registry that serves Immunization resources claims conformance to the Immunization Resource Interoperability Profile. A hospital EHR that produces full Patient Summaries claims conformance to the Patient Summary Priority Interoperability Profile. Both are valid under D8.1.

#### Data Requirements vs Exchange Requirements

D8.1 defines data structure and obligations. It does not define exchange mechanisms. D8.1's Producer and Consumer roles describe content creation and consumption: a Producer can populate conformant data; a Consumer can process received data. These obligations are fulfilled by the Content IGs.

The exchange mechanisms — how conformant data moves between systems via APIs — are D5.1's domain, implemented by this IG. This IG maps each D8.1 conformance path to an exchange pattern:

| D8.1 Conformance Path | Exchange Pattern | This IG's Actors |
|---|---|---|
| Priority Interoperability Profile (FHIR Document) | [FHIR Document Exchange](document-exchange.html) (MHD) | [Document Access Provider](actors.html#document-access-provider) ↔ [Document Consumer](actors.html#document-consumer) |
| Resource Interoperability Profile | [Resource Exchange](resource-access.html) (IPA) | [Resource Access Provider](actors.html#resource-access-provider) ↔ [Resource Consumer](actors.html#resource-consumer) |

Neither D5.1 nor D8.1 states which exchange pattern serves which profile type. This IG fills that gap. See [Priority Categories](priority-categories.html) for the complete mapping from each priority category to its data specification and exchange pattern.

For medication data, this IG covers reading MedicationRequest and MedicationStatement as individual resources via resource exchange. The ePrescription and eDispensation workflow transactions (prescribing, dispensing) are out of scope and handled by [IHE MPD](https://profiles.ihe.net/PHARM/MPD/index.html).

#### D8.1 Profile Dependencies

D8.1 specifies that when a Priority Interoperability Profile references another profile (e.g., a Patient Summary references the EHDS Patient profile), the referenced profile's data obligations also apply. This is a data model requirement: the Patient resource inside a Patient Summary must conform to the EHDS Patient profile. It does not by itself mandate independent resource-level exchange for that resource. Data model conformance is the Content IGs' domain; exchange is this IG's domain, based on the system's declared conformance path.

---


