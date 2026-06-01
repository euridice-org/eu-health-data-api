// =============================================================================
// EHDS Priority Category CodeSystem
// =============================================================================
// EHDS Regulation defined priority document categories for cross-border primary use

CodeSystem: EEHRxFDocumentPriorityCategoryCS
Id:         eehrxf-document-priority-category-cs
Title:      "EEHRxF Document Priority Category CodeSystem"
Description: """
CodeSystem for priority document categories in EEHRxF as the document categories as defined in the EHDS regulation.
"""
* ^experimental = false
* ^caseSensitive = true
* #Patient-Summaries "patient summaries" """
Electronic health data that include significant clinical facts related to an identified natural person and that are essential for the provision of safe and efficient healthcare to that person. The following information is part of a patient summary:

1. Personal details.
2. Contact information.
3. Information on insurance.
4. Allergies.
5. Medical alerts.
6. Vaccination/prophylaxis information, possibly in the form of a vaccination card.
7. Current, resolved, closed or inactive problems, including in an international classification coding.
8. Textual information related to medical history.
9. Medical devices and implants.
10. Medical or care procedures.
11. Functional status.
12. Current and relevant past medicines.
13. Social history observations related to health.
14. Pregnancy history.
15. Patient-provided data.
16. Observation results pertaining to the health condition.
17. Plan of care.
18. Information on a rare disease, such as details about the impact or characteristics of the disease.
"""
* #Electronic-Prescriptions "electronic prescriptions" "Electronic health data constituting a prescription for a medicinal product as defined in Article 3, point (k), of Directive 2011/24/EU."
* #Electronic-Dispensations "electronic dispensations" "Information on the supply of a medicinal product to a natural person by a pharmacy based on an electronic prescription."
* #Medical-Imaging "medical imaging studies and related imaging reports" "Electronic health data related to the use of or produced by technologies that are used to view the human body in order to prevent, diagnose, monitor or treat medical conditions."
* #Laboratory-Reports "medical test results, including laboratory and other diagnostic results and related reports" "Electronic health data representing results of studies performed in particular through in vitro diagnostics such as clinical biochemistry, haematology, transfusion medicine, microbiology, immunology and others, and including, where relevant, reports supporting the interpretation of the results."
* #Discharge-Reports "discharge reports" "Electronic health data related to a healthcare encounter or episode of care and including essential information about admission, treatment and discharge of a natural person."


// =============================================================================
// DocumentReference Type ValueSet per priority category
// =============================================================================
// Given the priority category EEHRxFDocumentPriorityCategoryCS,
// we define a ValueSet per priority category
// with the clinical codes (usually LOINC codes) for specific document types.
// These ValueSets are draft (informative), not normative, because the specific
// document types may evolve over time. Content IGs are the authoritative source.

ValueSet: EEHRxFDocumentTypePatientSummaryVS
Id: eehrxf-document-type-patient-summary-vs
Title: "EEHRxF Document Type ValueSet for Patient Summaries"
Description: "ValueSet for specific document types within the Patient Summary priority category."
* ^status = #draft
* ^experimental = false
* ^useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* ^useContext[=].valueCodeableConcept = http://hl7.eu/fhir/health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Patient-Summaries
* insert LOINCCopyrightForVS
* $loinc#60591-5 "Patient summary Document"

ValueSet: EEHRxFDocumentTypeDischargeReportVS
Id: eehrxf-document-type-discharge-report-vs
Title: "EEHRxF Document Type ValueSet for Discharge Reports"
Description: "ValueSet for specific document types within the Discharge Report priority category."
* ^status = #draft
* ^experimental = false
* ^useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* ^useContext[=].valueCodeableConcept = http://hl7.eu/fhir/health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Discharge-Reports
* insert LOINCCopyrightForVS
* $loinc#18842-5 "Discharge summary"
* $loinc#100719-4 "Surgical oncology Discharge summary"

ValueSet: EEHRxFDocumentTypeLaboratoryReportVS
Id: eehrxf-document-type-laboratory-report-vs
Title: "EEHRxF Document Type ValueSet for Laboratory Reports"
Description: "ValueSet for specific document types within the Laboratory Report priority category."
* ^status = #draft
* ^experimental = false
* ^useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* ^useContext[=].valueCodeableConcept = http://hl7.eu/fhir/health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Laboratory-Reports
* insert LOINCCopyrightForVS
* $loinc#11502-2 "Laboratory report"

ValueSet: EEHRxFDocumentTypeMedicalImagingVS
Id: eehrxf-document-type-medical-imaging-vs
Title: "EEHRxF Document Type ValueSet for Medical Imaging"
Description: "ValueSet for specific document types within the Medical Imaging priority category."
* ^status = #draft
* ^experimental = false
* ^useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* ^useContext[=].valueCodeableConcept = http://hl7.eu/fhir/health-data-api/CodeSystem/eehrxf-document-priority-category-cs#Medical-Imaging
* insert LOINCCopyrightForVS
* $loinc#85430-7 "Diagnostic imaging report"
* $loinc#18748-4 "Diagnostic imaging study"





// =============================================================================
// DocumentReference Type ValueSet (Clinical Precision) — INFORMATIVE ONLY
// =============================================================================
// Not bound to .type (which inherits MHD/base FHIR); illustrative only.

ValueSet: EEHRxFDocumentTypeVS
Id: eehrxf-document-type-vs
Title: "EEHRxF Document Type ValueSet"
Description: "Document type codes for clinical precision in document identification."
* ^status = #draft
* ^experimental = false
* insert LOINCCopyrightForVS
* include codes from valueset EEHRxFDocumentTypePatientSummaryVS
* include codes from valueset EEHRxFDocumentTypeDischargeReportVS
* include codes from valueset EEHRxFDocumentTypeLaboratoryReportVS
* include codes from valueset EEHRxFDocumentTypeMedicalImagingVS


Instance: EehrxfMhdDocumentReferenceCM
InstanceOf: ConceptMap
Title: "EEHRxF MHD DocumentReference ConceptMap"
Description: """
Correlation from the EHDS regulatory priority categories to the LOINC document **class** codes that go on the wire in `DocumentReference.category`. The regulatory category is policy grouping; the LOINC class code is the value a server filters on.
"""
Usage: #example
* url = "http://hl7.eu/fhir/health-data-api/ConceptMap/EehrxfMhdDocumentReferenceCM"
* name = "EehrxfMhdDocumentReferenceCM"
* title = "EEHRxF MHD DocumentReference ConceptMap"
* description = "Correlation from the EHDS regulatory priority categories to the LOINC document class codes used in DocumentReference.category."
* experimental = false
* status = #draft
* purpose = "Guide implementers in mapping the coarse-grained priority categories defined in the EHDS regulation to the LOINC document class code carried in DocumentReference.category. It may evolve as new document classes become relevant for cross-border exchange."
* group.source = Canonical(EEHRxFDocumentPriorityCategoryCS)
* group.target = $loinc
// Patient-Summaries intentionally has no class mapping: the summary is identified by
// type 60591-5 alone (no .category). EU PS IG defines no DocumentReference class either.
* group.element[+].code = #Discharge-Reports
* group.element[=].target[+].code = #18842-5
* group.element[=].target[=].display = "Discharge summary"
* group.element[=].target[=].equivalence = #relatedto
* group.element[+].code = #Laboratory-Reports
* group.element[=].target[+].code = #26436-6
* group.element[=].target[=].display = "Laboratory Studies (set)"
* group.element[=].target[=].equivalence = #relatedto
* group.element[+].code = #Medical-Imaging
* group.element[=].target[+].code = #18726-0
* group.element[=].target[=].display = "Radiology studies (set)"
* group.element[=].target[=].equivalence = #relatedto

