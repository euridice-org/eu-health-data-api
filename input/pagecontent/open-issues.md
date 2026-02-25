Open issues under discussion in this IG. Each has a corresponding [GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues) where you can add input to existing issues, or create your own. 

We welcome your input via Github Issues, or by attending the weekly [HL7 Europe API Workgroup Meetings](https://confluence.hl7.org/spaces/HEU/pages/345086021/EU+Health+Data+API+Edition+1).

---

### Issue 1: Document Search and Priority Category Differentiation

[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues/11) | **Priority:** High

How do we differentiate documents by EHDS Priority Category? Patient Summary, Imaging Results, Medical Test Results, and Hospital Discharge Reports are all FHIR Documents exposed via DocumentReference and MHD. How do we differentiate one from the other for systems that support multiple categories?

This is particularly complex for Medical Test Results and Imaging Results, which are families of many different types (cardiology studies, radiology reports, various lab panels, etc.).

**Current Approach**

| Parameter | Purpose | Coding System |
|-----------|---------|---------------|
| `category` | Coarse search | EHDS Document Priority Category CodeSystem |
| `type` | Clinical precision | LOINC codes |
| `practiceSetting` | Differentiate within category | Healthcare setting codes |

**Open Questions**

1. **Value Sets**: Should we define local value sets for category/type, or inherit directly from IHE class codes and LOINC? What benefit does local definition provide?

2. **Priority Category Alignment**: Current LOINC codes may be one step too specific for some categories (e.g., labs have many sub-types). How should we handle this terminology gap?

3. **DocumentReference Profiles**: Should there be one shared DocumentReference profile for all priority categories, or separate profiles per priority area? (Recommendation: one shared profile with example instances)

**Seeking Input On**

- Does the category/type/practiceSetting approach align with implementer expectations?
- What search patterns do Member States currently use for document discovery?
- Should we create a priority-category-specific value set, or rely on existing XDS/LOINC codes?

---

### Issue 4: Resource Access and Inheritance

[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues/14) | **Priority:** Medium

Resource access (granular RESTful FHIR resource queries) could inherit from multiple specifications (IPA, QEDm). This issue tracks the inheritance approach.

**Current Approach**

- **Data Models**: Inherit from EU Core profiles
- **Search Parameters**: From IPA (required parameters listed in [Resource Access](resource-access.html))
- **CapabilityStatements**: Instantiate IPA Server/Client
- **QEDm**: Referenced where compatible with IPA. QEDm has a stated goal of aligning with IPA.

A separate issue ([Issue 9](#issue-9-core-resource-set-validation)) tracks validation of the core resource set.

**Seeking Input On**
- Do the implemented IPA search parameters work for Europe's needs?
- What are the differences compared to QEDm, and how should those be handled?

---

### Issue 5: CapabilityStatement and Priority Category Declaration

[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues/15) | **Priority:** Medium

Should servers declare which EHDS Priority Categories they support? How? Should this be in CapabilityStatement?

**Options**

1. **CapabilityStatement.instantiates** - Reference priority-category-specific CapabilityStatements (these would be example instances)
2. **CapabilityStatement extensions** - Custom extensions declaring supported categories
3. **Supported document type ValueSets** - Declare via supported DocumentReference.type bindings

**Seeking Input On**

- Is priority category declaration needed at the CapabilityStatement level?
- Which approach best balances expressiveness with implementation simplicity?

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

### Issue 10: FHIR Documents vs Resources Guidance

[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues/20) | **Priority:** Low

The IG supports both document exchange (FHIR Documents via MHD) and resource access (granular FHIR resources). A documentation page explaining when to use each pattern would be helpful.

**Seeking Input On**

- What use cases require document exchange vs resource access in your context?
- Would you be interested in contributing this documentation?

---

### Issue 11: MPD Workflow vs MedicationRequest Resource Access

[GitHub Issue](https://github.com/euridice-org/eu-health-data-api/issues/21) | **Priority:** Medium

The IG needs to clearly distinguish between medication resource access (in scope) and prescription workflow orchestration (out of scope, handled by MPD). Also this scope line should be reviewed with MPD Priority Category owners.

**In Scope (This IG)**

Resource access queries like "which medications is this patient taking?" - reading MedicationRequest, MedicationStatement, and MedicationDispense resources.

**Out of Scope (MPD)**

Prescription workflow orchestration like "transfer prescription authorization for dispense" - the workflow transactions for ePrescription and eDispensation are handled by [IHE MPD](https://profiles.ihe.net/PHARM/MPD/index.html)

**Seeking Input On**

- Is this distinction clear in the current IG?
- Are there medication-related use cases that fall between these two categories?
- Should we handle it differently?
