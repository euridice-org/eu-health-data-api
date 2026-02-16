// =============================================================================
// DocumentReference Category ValueSet (Coarse Search)
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

ValueSet:  EEHRxFDocumentPriorityCategoryVS
Id:        eehrxf-document-priority-category-vs
Title:     "EEHRxF Document Priority Category ValueSet"
Description: """
ValueSet for priority document categories in EEHRxF as the document categories as defined in the EHDS regulation. See [EEHRxFDocumentPriorityCategoryCS](CodeSystem-eehrxf-document-priority-category-cs.html) for the complete list and background.
"""
* ^experimental = false
* codes from system EEHRxFDocumentPriorityCategoryCS


// =============================================================================
// DocumentReference Type ValueSet per priority category 
// =============================================================================
/*
 Given the priority category EEHRxFDocumentPriorityCategoryCS, 
 We define a ValueSet per priority category
 with the clinical codes (usually LOINC codes) for specific document types
 The ValueSets are promoted as Informational, not Normative. This because the specific document types may evolve over time, and the ValueSets may need to be updated more frequently than the profiles. The priority categories themselves are normative, but the specific document types within each category are informational and subject to change as clinical practice evolves and as new document types become relevant for cross-border exchange.
*/
Instance: EEHRxFDocumentTypePatientSummaryVS
InstanceOf: ValueSet
Title: "EEHRxF Document Type ValueSet for Patient Summaries"
Description: """
ValueSet for specific document types within the Patient Summary priority category. 
"""
Usage: #example
* experimental = false // also flags them as informative
* status = #draft
* version = "0.1.0"
* name = "EEHRxFDocumentTypePatientSummaryVS"
* url = "http://hl7.eu/fhir/ValueSet/eehrxf-document-type-patient-summary-vs"
* title = "EEHRxF Document Type ValueSet for Patient Summaries"
* description = "ValueSet for specific document types within the Patient Summary priority category."
* useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[=].valueCodeableConcept = EEHRxFDocumentPriorityCategoryCS#Patient-Summaries
* compose.include[+].system = "http://loinc.org"
* compose.include[=].concept[+].code = #60591-5
* compose.include[=].concept[=].display = "Patient summary Document"


Instance: EEHRxFDocumentTypeDischargeReportVS
InstanceOf: ValueSet
Title: "EEHRxF Document Type ValueSet for Discharge Reports"
Description: """
ValueSet for specific document types within the Discharge Report priority category.
"""
Usage: #example
* experimental = false // also flags them as informative
* status = #draft
* version = "0.1.0"
* name = "EEHRxFDocumentTypeDischargeReportVS"
* url = "http://hl7.eu/fhir/ValueSet/eehrxf-document-type-discharge-report-vs"
* title = "EEHRxF Document Type ValueSet for Discharge Reports"
* description = "ValueSet for specific document types within the Discharge Report priority category."
* useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[=].valueCodeableConcept = EEHRxFDocumentPriorityCategoryCS#Discharge-Reports
* compose.include[+].system = "http://loinc.org"
* compose.include[=].concept[+].code = #18842-5
* compose.include[=].concept[=].display = "Discharge summary"
* compose.include[=].concept[+].code = #100719-4
* compose.include[=].concept[=].display = "Surgical oncology Discharge summary"

Instance: EEHRxFDocumentTypeLaboratoryReportVS
InstanceOf: ValueSet
Title: "EEHRxF Document Type ValueSet for Laboratory Reports"
Description: """
ValueSet for specific document types within the Laboratory Report priority category.
"""
Usage: #example
* experimental = false // also flags them as informative
* status = #draft
* version = "0.1.0"
* name = "EEHRxFDocumentTypeLaboratoryReportVS"
* url = "http://hl7.eu/fhir/ValueSet/eehrxf-document-type-laboratory-report-vs"
* title = "EEHRxF Document Type ValueSet for Laboratory Reports"
* description = "ValueSet for specific document types within the Laboratory Report priority category."
* useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[=].valueCodeableConcept = EEHRxFDocumentPriorityCategoryCS#Laboratory-Reports
* compose.include[+].system = "http://loinc.org"
* compose.include[=].concept[+].code = #11502-2
* compose.include[=].concept[=].display = "Laboratory report"

Instance: EEHRxFDocumentTypeMedicalImagingVS
InstanceOf: ValueSet
Title: "EEHRxF Document Type ValueSet for Medical Imaging"
Description: """
ValueSet for specific document types within the Medical Imaging priority category.
"""
Usage: #example
* experimental = false // also flags them as informative
* status = #draft
* version = "0.1.0"
* name = "EEHRxFDocumentTypeMedicalImagingVS"
* url = "http://hl7.eu/fhir/ValueSet/eehrxf-document-type-medical-imaging-vs"
* title = "EEHRxF Document Type ValueSet for Medical Imaging"
* description = "ValueSet for specific document types within the Medical Imaging priority category."
* useContext[+].code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext[=].valueCodeableConcept = EEHRxFDocumentPriorityCategoryCS#Medical-Imaging
* compose.include[+].system = "http://loinc.org"
* compose.include[=].concept[+].code = #68604-8
* compose.include[=].concept[=].display = "Radiology Diagnostic study note"
* compose.include[=].concept[+].code = #18748-4
* compose.include[=].concept[=].display = "Diagnostic imaging study"
* compose.include[=].concept[+].code = #103233-3
* compose.include[=].concept[=].display = "XR Pelvis and Hip - right View AP and Views 2 or 3"
* compose.include[=].concept[+].code = #103234-1
* compose.include[=].concept[=].display = "XR Pelvis and Hip - right 2 or 3 Views"
* compose.include[=].concept[+].code = #103235-8
* compose.include[=].concept[=].display = "XR Pelvis and Hip - left 2 or 3 Views"
* compose.include[=].concept[+].code = #103236-6
* compose.include[=].concept[=].display = "XR Toes - right GE 2 Views"
* compose.include[=].concept[+].code = #103237-4
* compose.include[=].concept[=].display = "XR Toes - left GE 2 Views"
* compose.include[=].concept[+].code = #103238-2
* compose.include[=].concept[=].display = "XR Hip - right 2 or 3 Views"
* compose.include[=].concept[+].code = #103239-0
* compose.include[=].concept[=].display = "XR Humerus - right GE 2 Views"
* compose.include[=].concept[+].code = #103240-8
* compose.include[=].concept[=].display = "XR Humerus - left GE 2 Views"




// =============================================================================
// DocumentReference Type ValueSet (Clinical Precision)
// =============================================================================
// LOINC codes for specific document types - used for precise clinical identification
// This is NOT intended as a primary search parameter, but for client-side filtering

Instance:   EEHRxFDocumentTypeVS
InstanceOf: ValueSet
Title:      "EEHRxF Document Type ValueSet"
Description: """
Document type codes for clinical precision in document identification.
"""
Usage: #example
* experimental = false // also flags them as informative
* status = #draft
* version = "0.1.0"
* name = "EEHRxFDocumentTypeVS"
* url = "http://hl7.eu/fhir/ValueSet/eehrxf-document-type-vs"
* title = "EEHRxF Document Type ValueSet"
* description = """
Document type codes for clinical precision in document identification.
"""
* compose.include[+].valueSet = "http://hl7.eu/fhir/ValueSet/eehrxf-document-type-discharge-report-vs"
* compose.include[+].valueSet = "http://hl7.eu/fhir/ValueSet/eehrxf-document-type-laboratory-report-vs"
* compose.include[+].valueSet = "http://hl7.eu/fhir/ValueSet/eehrxf-document-type-medical-imaging-vs"
* compose.include[+].valueSet = "http://hl7.eu/fhir/ValueSet/eehrxf-document-type-patient-summary-vs"


Instance: EehrxfMhdDocumentReferenceCM
InstanceOf: ConceptMap
Title: "EEHRxF MHD DocumentReference ConceptMap"
Description: """
mapping from the EHDS regulatory priority categories to the LOINC document category codes for clinical precision in document identification. 
"""
Usage: #example
* url = "http://hl7.eu/fhir/ConceptMap/eehrxf-mhd-documentreference-cm"
* name = "EehrxfMhdDocumentReferenceCM"
* title = "EEHRxF MHD DocumentReference ConceptMap"
* description = "mapping from the EHDS regulatory priority categories to the LOINC document category codes for clinical precision in document identification."
* experimental = false
* status = #draft
* purpose = "Guide implementers in understanding how the coarse-grained priority categories defined in the EHDS regulation relate to specific document categories identified by LOINC codes, and it may evolve over time as clinical practice changes and new document categories become relevant for cross-border exchange."
* group.source = Canonical(EEHRxFDocumentPriorityCategoryCS)
* group.target = $loinc
* group.element[+].code = #Patient-Summaries
* group.element[=].target[+].code = #60591-5
* group.element[=].target[=].display = "Patient summary Document"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #Discharge-Reports
* group.element[=].target[+].code = #18842-5
* group.element[=].target[=].display = "Discharge summary"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #100719-4
* group.element[=].target[=].display = "Surgical oncology Discharge summary"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #Laboratory-Reports
* group.element[=].target[+].code = #11502-2
* group.element[=].target[=].display = "Laboratory report"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #Medical-Imaging
* group.element[=].target[+].code = #68604-8
* group.element[=].target[=].display = "Radiology Diagnostic study note"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #18748-4
* group.element[=].target[=].display = "Diagnostic imaging study"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #103233-3
* group.element[=].target[=].display = "XR Pelvis and Hip - right View AP and Views 2 or 3"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #103234-1
* group.element[=].target[=].display = "XR Pelvis and Hip - right 2 or 3 Views"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #103235-8
* group.element[=].target[=].display = "XR Pelvis and Hip - left 2 or 3 Views"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #103236-6
* group.element[=].target[=].display = "XR Toes - right GE 2 Views"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #103237-4
* group.element[=].target[=].display = "XR Toes - left GE 2 Views"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #103238-2
* group.element[=].target[=].display = "XR Hip - right 2 or 3 Views"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #103239-0
* group.element[=].target[=].display = "XR Humerus - right GE 2 Views"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #103240-8
* group.element[=].target[=].display = "XR Humerus - left GE 2 Views"
* group.element[=].target[=].equivalence = #specializes

