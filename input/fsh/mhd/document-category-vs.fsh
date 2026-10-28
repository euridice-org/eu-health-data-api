// =============================================================================
// DocumentReference Category ValueSet (LOINC Document Ontology parts)
// =============================================================================
// LOINC Document Ontology parts (LP codes) used to classify documents at a
// coarser level than the document type.

ValueSet: DocumentCategoryEuApiVS
Id: document-category-eu-api
Title: "EEHRxF Document Category ValueSet"
Description: "Document category codes based on LOINC Document Ontology parts (LP codes)."
* ^status = #draft
* ^experimental = false
* insert LOINCCopyrightForVS
* $loinc#LP183761-8 "Report"
* $loinc#LP74123-8 "Laboratory report"
* $loinc#LP72467-1 "Discharge summary note"
* $loinc#LP74392-9 "Imaging study"
* $loinc#LP116219-9 "Prescription"
* $loinc#LP97830-1 "Prescription for medication"
* $loinc#LP72929-0 "Medication dispensed"
* $loinc#LP182278-4 "Summary"
* $loinc#LP101599-1 "Patient summary"
* $loinc#LP220292-9 "Immunization summary report"
* $loinc#LP175754-3 "Plan"
* $loinc#LP116196-9 "Care plan"
* $loinc#LP73899-4 "Administrative note"
* $loinc#LP100037-3 "Consent"
* $loinc#LP74130-3 "Letter"
* $loinc#LP149091-3 "Certificate"


// =============================================================================
// DocumentReference Category hierarchy ConceptMap
// =============================================================================
// Parent (source) to child (target) relationships among the document category codes.

Instance: document-category-hierarchy-eu-api
InstanceOf: ConceptMap
Title: "EEHRxF Document Category Hierarchy ConceptMap"
Description: """
Hierarchical relationships among the LOINC Document Ontology parts used as document categories: each source concept is a parent category and each target concept is a more specific child category.
"""
Usage: #definition
* url = "http://hl7.eu/fhir/health-data-api/ConceptMap/document-category-hierarchy-eu-api"
* name = "DocumentCategoryHierarchyEuApi"
* title = "EEHRxF Document Category Hierarchy ConceptMap"
* description = "Hierarchical relationships among the LOINC Document Ontology parts used as document categories: each source concept is a parent category and each target concept is a more specific child category."
* experimental = false
* status = #draft
* copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* sourceCanonical = Canonical(DocumentCategoryEuApiVS)
* targetCanonical = Canonical(DocumentCategoryEuApiVS)
* group.source = $loinc
* group.target = $loinc
* group.element[+].code = #LP183761-8
* group.element[=].display = "Report"
* group.element[=].target[+].code = #LP74123-8
* group.element[=].target[=].display = "Laboratory report"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #LP72467-1
* group.element[=].target[=].display = "Discharge summary note"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #LP116219-9
* group.element[=].display = "Prescription"
* group.element[=].target[+].code = #LP97830-1
* group.element[=].target[=].display = "Prescription for medication"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #LP182278-4
* group.element[=].display = "Summary"
* group.element[=].target[+].code = #LP101599-1
* group.element[=].target[=].display = "Patient summary"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #LP220292-9
* group.element[=].target[=].display = "Immunization summary report"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #LP175754-3
* group.element[=].display = "Plan"
* group.element[=].target[+].code = #LP116196-9
* group.element[=].target[=].display = "Care plan"
* group.element[=].target[=].equivalence = #specializes
* group.element[+].code = #LP73899-4
* group.element[=].display = "Administrative note"
* group.element[=].target[+].code = #LP100037-3
* group.element[=].target[=].display = "Consent"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #LP74130-3
* group.element[=].target[=].display = "Letter"
* group.element[=].target[=].equivalence = #specializes
* group.element[=].target[+].code = #LP149091-3
* group.element[=].target[=].display = "Certificate"
* group.element[=].target[=].equivalence = #specializes
