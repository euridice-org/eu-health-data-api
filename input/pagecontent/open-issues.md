Open issues under discussion in this IG. Each has a corresponding [GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues) where you can add input to existing issues, or create your own. 

We welcome your input via Github Issues, or by attending the weekly [HL7 Europe API Workgroup Meetings](https://confluence.hl7.org/spaces/HEU/pages/345086021/EU+Health+Data+API+Edition+1).

---

### Issue 1: Document Search and Priority Category Differentiation

[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues/11) | **Priority:** High

How should systems differentiate documents by EHDS Priority Category? Patient Summary, Imaging Results, Medical Test Results, and Hospital Discharge Reports are all FHIR Documents exposed via DocumentReference and MHD.

**Current Approach**

Two axes: `.type` (precise LOINC document type, preferred binding) for clinically specific discovery, and `.category` (broad EHDS priority category over LOINC Document Class, extensible binding) for coarse, category-only discovery. `.category` is capped at 0..1 by the MHD Minimal parent; multi-scheme classification belongs on the content. A ConceptMap maps each category to its LOINC `.type` codes. See [Document Search Strategy](document-exchange.html#document-search-strategy).

**Seeking Input On**

- Does the two-axis `.type` / `.category` split work for your implementation context?
- Are the four EHDS priority category LOINC codes the right coarse axis, or do you need additional codings (SNOMED, XDS classCode, national)?
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
