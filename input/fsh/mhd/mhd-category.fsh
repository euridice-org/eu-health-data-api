// =============================================================================
// EHDS Priority Category ValueSet (DocumentReference.category)
// =============================================================================
// Broad classification axis. Built over LOINC Document Class "(set)" codes for
// the four EHDS priority categories that travel under document-exchange rails.
// ePrescription and eDispensation are excluded — they are not document-exchange
// content. Extensible binding so SNOMED, XDS classCode, or national codings may
// appear as additional codings alongside the LOINC category code.

ValueSet: EHDSPriorityCategoryVS
Id: ehds-priority-category-vs
Title: "EHDS Priority Category ValueSet"
Description: "Broad document classification for the four EHDS priority categories carried as documents, over LOINC Document Class codes. Extensible: implementations MAY add SNOMED, XDS classCode, or national codings."
* ^status = #draft
* ^experimental = false
* insert LOINCCopyrightForVS
* $loinc#34133-9 "Summary of episode note"
* $loinc#18842-5 "Discharge summary"
* $loinc#26436-6 "Laboratory studies (set)"
* $loinc#18726-0 "Radiology studies (set)"


// =============================================================================
// DocumentReference Type ValueSet per priority category
// =============================================================================
// LOINC codes for specific document types within each priority category.
// These ValueSets are draft (informative) examples, not exhaustive — specific
// document types evolve. Content IGs are the authoritative source.

ValueSet: EEHRxFDocumentTypePatientSummaryVS
Id: eehrxf-document-type-patient-summary-vs
Title: "EEHRxF Document Type ValueSet for Patient Summaries"
Description: "Example LOINC document types within the Patient Summary priority category. Illustrative, not exhaustive."
* ^status = #draft
* ^experimental = false
* ^useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* ^useContext[=].valueCodeableConcept = $loinc#34133-9
* insert LOINCCopyrightForVS
* $loinc#60591-5 "Patient summary Document"

ValueSet: EEHRxFDocumentTypeDischargeReportVS
Id: eehrxf-document-type-discharge-report-vs
Title: "EEHRxF Document Type ValueSet for Discharge Reports"
Description: "Example LOINC document types within the Discharge Report priority category. Illustrative, not exhaustive."
* ^status = #draft
* ^experimental = false
* ^useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* ^useContext[=].valueCodeableConcept = $loinc#18842-5
* insert LOINCCopyrightForVS
* $loinc#18842-5 "Discharge summary"
* $loinc#100719-4 "Surgical oncology Discharge summary"

ValueSet: EEHRxFDocumentTypeLaboratoryReportVS
Id: eehrxf-document-type-laboratory-report-vs
Title: "EEHRxF Document Type ValueSet for Laboratory Reports"
Description: "Example LOINC document types within the Laboratory Report priority category. Illustrative, not exhaustive."
* ^status = #draft
* ^experimental = false
* ^useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* ^useContext[=].valueCodeableConcept = $loinc#26436-6
* insert LOINCCopyrightForVS
* $loinc#11502-2 "Laboratory report"

ValueSet: EEHRxFDocumentTypeMedicalImagingVS
Id: eehrxf-document-type-medical-imaging-vs
Title: "EEHRxF Document Type ValueSet for Medical Imaging"
Description: "Example LOINC document types within the Medical Imaging priority category. Illustrative, not exhaustive."
* ^status = #draft
* ^experimental = false
* ^useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* ^useContext[=].valueCodeableConcept = $loinc#18726-0
* insert LOINCCopyrightForVS
* $loinc#85430-7 "Diagnostic imaging report"
* $loinc#18748-4 "Diagnostic imaging study"


// =============================================================================
// DocumentReference Type ValueSet (aggregate, bound to DocumentReference.type)
// =============================================================================
// LOINC codes for specific document types — used for precise clinical discovery.

ValueSet: EEHRxFDocumentTypeVS
Id: eehrxf-document-type-vs
Title: "EEHRxF Document Type ValueSet"
Description: "Example LOINC document type codes for precise document discovery. Illustrative, not exhaustive."
* ^status = #draft
* ^experimental = false
* insert LOINCCopyrightForVS
* include codes from valueset EEHRxFDocumentTypePatientSummaryVS
* include codes from valueset EEHRxFDocumentTypeDischargeReportVS
* include codes from valueset EEHRxFDocumentTypeLaboratoryReportVS
* include codes from valueset EEHRxFDocumentTypeMedicalImagingVS


// =============================================================================
// ConceptMap: priority category (LOINC Document Class) -> document type (LOINC)
// =============================================================================

Instance: EehrxfMhdDocumentReferenceCM
InstanceOf: ConceptMap
Title: "EEHRxF MHD DocumentReference ConceptMap"
Description: """
Maps each EHDS priority category (LOINC Document Class code, used on `category`) to the LOINC document type codes (used on `type`) for precise discovery.
"""
Usage: #example
* url = "http://hl7.eu/fhir/health-data-api/ConceptMap/EehrxfMhdDocumentReferenceCM"
* name = "EehrxfMhdDocumentReferenceCM"
* title = "EEHRxF MHD DocumentReference ConceptMap"
* description = "Maps each EHDS priority category (LOINC Document Class code, used on category) to the LOINC document type codes (used on type) for precise discovery."
* experimental = false
* status = #draft
* purpose = "Guide implementers from a broad priority category to the specific LOINC document type codes used for discovery. Illustrative, not exhaustive; expected to evolve."
* group.source = $loinc
* group.target = $loinc
* group.element[+].code = #34133-9
* group.element[=].display = "Summary of episode note"
* group.element[=].target[+].code = #60591-5
* group.element[=].target[=].display = "Patient summary Document"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #18842-5
* group.element[=].display = "Discharge summary"
* group.element[=].target[+].code = #18842-5
* group.element[=].target[=].display = "Discharge summary"
* group.element[=].target[=].equivalence = #equivalent
* group.element[=].target[+].code = #100719-4
* group.element[=].target[=].display = "Surgical oncology Discharge summary"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #26436-6
* group.element[=].display = "Laboratory studies (set)"
* group.element[=].target[+].code = #11502-2
* group.element[=].target[=].display = "Laboratory report"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #18726-0
* group.element[=].display = "Radiology studies (set)"
* group.element[=].target[+].code = #85430-7
* group.element[=].target[=].display = "Diagnostic imaging report"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #18748-4
* group.element[=].target[=].display = "Diagnostic imaging study"
* group.element[=].target[=].equivalence = #specializes
