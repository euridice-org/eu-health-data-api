Open issues under discussion in this IG. Each has a corresponding [GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues) where you can add input to existing issues, or create your own. 

We welcome your input via Github Issues, or by attending the weekly [HL7 Europe API Workgroup Meetings](https://confluence.hl7.org/spaces/HEU/pages/345086021/EU+Health+Data+API+Edition+1).

---

### Issue 1: Document Search and Priority Category Differentiation

[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues/11) | **Priority:** High

How should systems differentiate documents by EHDS Priority Category? Patient Summary, Imaging Results, Medical Test Results, and Hospital Discharge Reports are all FHIR Documents exposed via DocumentReference and MHD.

**Current Approach (going to ballot)**

DocumentReference `.type` with LOINC codes is the primary search parameter for document differentiation. Providers also support `category` search, while population of the repeating `.category` element remains unconstrained. A ConceptMap maps EHDS priority categories to LOINC codes used in `.type`.

**Seeking Input On**

- Is `.type` with LOINC the right search parameter for priority category differentiation, or should `.category` or `format` play a role?
- Does the ConceptMap approach work for your implementation context?
- What search patterns do Member States currently use for document discovery?

---

---

### Issue 9: Core Resource Set Validation

[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues/19) | **Priority:** Medium

The following resources are proposed as the core set for resource access (e.g. resource search entry points specifically, not all included resources). This needs validation from Priority Category owners.

Shared
- Patient
- Practitioner
- Organization

Patient Summary
- Condition
- AllergyIntolerance
- MedicationRequest
- MedicationStatement
- Immunization

ePrescription/eDispensation
- MedicationRequest
- MedicationDispense

Medical Test Results
- Observation
- DiagnosticReport

Imaging Results
- DiagnosticReport
- ImagingStudy

Discharge Reports
- Encounter


**Seeking Input On**

- Is this resource set appropriate for the priority categories?
- Are any resources missing that should be included?
- Should Encounter be required?

---

### Issue 12: MADO Dual-Encoding for Imaging Manifests

[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues/50) | **Priority:** High

Imaging manifests (MADO — Manifest of DICOM Objects) may exist in both FHIR and DICOM formats. This IG specifies a dual-DocumentReference pattern: two DocumentReferences linked via `relatesTo` with code `transforms`, one pointing to the FHIR ImagingStudy representation and one to the DICOM KOS object. This enables content negotiation — consumers retrieve the format they support.

This approach was agreed by the API working group. However, alternative approaches have been proposed, including a single-DocumentReference model preferred by some in the DICOM community.

**Seeking Input On**

- Does the dual-DocumentReference pattern work for your imaging infrastructure?
- Would a single-DocumentReference with multiple `content` entries be preferable?
- How does your system currently handle FHIR/DICOM content negotiation for imaging manifests?

---

### Issue 13: Advanced Search Capabilities for Resource Access

<!-- TODO: create the GitHub issue and replace the link below -->
[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues) | **Priority:** Medium

[Resource Access](resource-access.html) defines the minimum search parameters and combinations that Resource Access Providers support, following IPA. It does not currently define support for more advanced FHIR search features: the `:not` modifier, `_include`/`_revinclude`, and chained parameters.

**Current Approach (going to ballot)**

Not defined by this IG. Servers MAY support these features. Clients SHOULD check the server's CapabilityStatement before relying on them.

**Seeking Input On**

- Should support for the `:not` modifier be required on some token parameters (e.g. `status:not=entered-in-error`)?
- Should `_include` be required for resolving referenced resources (e.g. `MedicationRequest?patient=123&_include=MedicationRequest:requester`), or `_revinclude` for Provenance (e.g. `_revinclude=Provenance:target`)?
- Should chained search be required (e.g. `Condition?patient.identifier=http://example.org/nid|123`)? The German ISiK Basismodul implementation guide <!-- TODO: add link to ISiK Basis Module IG --> is one example of an IG that defines chaining requirements.
- Which of these features do your existing systems support today?

---

### Issue XX: Article 5 Patient-Provided Data Marking

[GitHub Issues](https://github.com/euridice-org/eu-health-data-api/issues) | **Priority:** High

This IG specifies the document-based path for the EHDS Article 5 patient insertion right: ITI-105 submission marked with `securityLabel` `PATRPT` (a v3-ObservationValue provenance code), actual document authorship retained in `DocumentReference.author`, and `meta.source` identifying the originating system. Existing MHD/XDS relationship semantics apply: a new patient-provided addendum or transformation may link to an existing document without changing its content or status. Replacement (including transformation with replacement), update, and removal require authorization for all affected prior patient-channel submissions for the same subject; `PATRPT` and a matching subject alone are insufficient. Checks include propagated lifecycle effects so professionally inserted documents and related metadata remain unchanged. These requirements originate in this IG — Xt-EHR D5.1 contains no Article 5 requirement. See [Patient-Provided Data](patient-provided-data.html).

**Current Approach (going to ballot)**

Access to write data is governed by the authorization of the submitting service (system-to-system, SMART Backend Services) together with the receiving service. `PATRPT` classifies the Article 5 submission channel and does not identify the underlying document author or impose an access-control obligation. The Access Provider trusts the health data access service or linked application to have authenticated the person and captured consent.

**Seeking Input On**

- Is `PATRPT` the right single classification for all documents submitted through the Article 5 channel, including submissions by representatives and externally authored documents? Should the IG define a formal ValueSet?
- Should the label also be REQUIRED (not SHOULD) inside the document (`Bundle.meta.security`), given documents circulate detached from their DocumentReference?
- Should a constrained DocumentReference profile (on MHD SimplifiedPublish) be published for testability, or do narrative requirements suffice given this IG defines no EU DocumentReference profile?
- Representative (Art. 4(2)) handling: is optional `Provenance` attribution sufficient when the representative is not the document author, while user-level/proxy authorization remains out of scope, or is a token-level mechanism needed in a future edition?
- Is the trust delegation (Access Provider trusts the access service/app for person authentication and consent) acceptable to Member State deployments, or is a token-level patient-context binding needed sooner?
