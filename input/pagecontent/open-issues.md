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

This IG provides informative examples of existing exchange paths for patient-provided data. A shared, machine-readable convention is needed to distinguish information inserted by a natural person or representative across those paths. This version does not select an encoding or introduce Article 5-specific conformance requirements. See [Patient-Provided Data](patient-provided-data.html).

**Coordination Needed**

The convention can be defined through cross-IG content-standardization work or another appropriate specification. Its definition is a dependency for interoperable implementations, wherever that work is owned. It needs to distinguish submission provenance from actual document authorship, support representatives, and preserve the distinction when documents circulate separately from their metadata.

**Seeking Input On**

- Which specification or cross-IG activity will define the shared convention, and how will this IG reference it?
- How will the convention identify patient and representative submissions, including externally authored documents, without conflating authorship and submission?
- How will the marking remain available with both document metadata and retrieved document content, and across other exchange paths?
- How will submission attribution relate to trusted authentication, consent, and representative-authority arrangements without treating a provenance marking as authorization?
