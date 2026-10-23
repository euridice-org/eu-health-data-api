# EEHRxF MHD DocumentReference ConceptMap - EU Health Data API v1.0.0-ballot

## ConceptMap: EEHRxF MHD DocumentReference ConceptMap 

This ConceptMap is intended to guide implementers in understanding how the coarse-grained priority categories defined in the EHDS regulation relate to specific document types identified by LOINC codes, and it may evolve over time as clinical practice changes and new document types become relevant for cross-border exchange.

This ValueSet groups the priority category specific ValueSets:

* `Patient-Summaries` codes are found in [EEHRxFDocumentTypePatientSummaryVS](ValueSet-document-type-patient-summary-eu-api.md)
* `Discharge-Reports` codes are found in [EEHRxFDocumentTypeDischargeReportVS](ValueSet-document-type-discharge-report-eu-api.md)
* `Laboratory-Reports` codes are found in [EEHRxFDocumentTypeLaboratoryReportVS](ValueSet-document-type-laboratory-report-eu-api.md)
* `Medical-Imaging` codes are found in [EEHRxFDocumentTypeMedicalImagingVS](ValueSet-document-type-medical-imaging-eu-api.md)

No Document Types are assigned to #Electronic-Prescriptions or #Electronic-Dispensations; as these are not considered appropriate use-cases for Documents.

**This Concept Map is Informative.** The codes mapped here are the known document type codes for the indicated priority category. This ConceptMap is expected to evolve over time as clinical practice changes and new document types become relevant for cross-border exchange.



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "document-reference-category-type-eu-api",
  "url" : "http://hl7.eu/fhir/health-data-api/ConceptMap/document-reference-category-type-eu-api",
  "version" : "1.0.0-ballot",
  "name" : "DocumentReferenceCategoryTypeEuApi",
  "title" : "EEHRxF MHD DocumentReference ConceptMap",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-10-23T14:38:45+02:00",
  "publisher" : "HL7 Europe",
  "contact" : [{
    "name" : "HL7 Europe",
    "telecom" : [{
      "system" : "url",
      "value" : "http://hl7.eu"
    }]
  }],
  "description" : "mapping from the EHDS regulatory priority categories to the LOINC document category codes for clinical precision in document identification.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "purpose" : "Guide implementers in understanding how the coarse-grained priority categories defined in the EHDS regulation relate to specific document categories identified by LOINC codes, and it may evolve over time as clinical practice changes and new document categories become relevant for cross-border exchange.",
  "copyright" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0).",
  "group" : [{
    "source" : "http://hl7.eu/fhir/health-data-api/CodeSystem/document-priority-category-eu-api",
    "target" : "http://loinc.org",
    "element" : [{
      "code" : "Patient-Summaries",
      "target" : [{
        "code" : "60591-5",
        "display" : "Patient summary Document",
        "equivalence" : "specializes"
      }]
    },
    {
      "code" : "Discharge-Reports",
      "target" : [{
        "code" : "18842-5",
        "display" : "Discharge summary",
        "equivalence" : "specializes"
      },
      {
        "code" : "100719-4",
        "display" : "Surgical oncology Discharge summary",
        "equivalence" : "specializes"
      }]
    },
    {
      "code" : "Laboratory-Reports",
      "target" : [{
        "code" : "11502-2",
        "display" : "Laboratory report",
        "equivalence" : "specializes"
      }]
    },
    {
      "code" : "Medical-Imaging",
      "target" : [{
        "code" : "85430-7",
        "display" : "Diagnostic imaging report",
        "equivalence" : "specializes"
      },
      {
        "code" : "18748-4",
        "display" : "Diagnostic imaging study",
        "equivalence" : "specializes"
      }]
    }]
  }]
}

```
