# EEHRxF Document Type ValueSet for Medical Imaging - EU Health Data API v1.0.0-ballot

## ValueSet: EEHRxF Document Type ValueSet for Medical Imaging 

 **References** 

* Included into [EEHRxF Document Type ValueSet](ValueSet-document-type-eu-api.md)

This ValueSet contains LOINC codes for specific document types that fall under the Medical Imaging category as defined in the EHDS regulation. This ValueSet is intended for informational purposes to guide implementers on which specific document types are relevant for the Medical Imaging category, and it may evolve over time as clinical practice changes and new document types become relevant for cross-border exchange.

This ValueSet is identified using `useContext` with the code `focus` and the priority category code `Medical-Imaging` from the `EEHRxFDocumentPriorityCategoryCS` CodeSystem, which is the code system for the priority categories defined in the EHDS regulation. This allows implementers to easily identify which specific document types are relevant for the Medical Imaging priority category when querying for documents in that category.

When querying for the Medical Imaging category, the document type codes in this ValueSet are used with the search parameter `type`.

**This Value Set is Informative.** The codes defined here are the known document type codes for the Medical Imaging category. This ValueSet is expected to evolve over time as clinical practice changes and new document types become relevant for cross-border exchange. Implementers should refer to the content profile for the Medical Imaging priority category for the specific data elements and structures that need to be supported for this category.

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "document-type-medical-imaging-eu-api",
  "url" : "http://hl7.eu/fhir/health-data-api/ValueSet/document-type-medical-imaging-eu-api",
  "version" : "1.0.0-ballot",
  "name" : "DocumentTypeMedicalImagingEuApiVS",
  "title" : "EEHRxF Document Type ValueSet for Medical Imaging",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-10-23T12:01:58+02:00",
  "publisher" : "HL7 Europe",
  "contact" : [{
    "name" : "HL7 Europe",
    "telecom" : [{
      "system" : "url",
      "value" : "http://hl7.eu"
    }]
  }],
  "description" : "ValueSet for specific document types within the Medical Imaging priority category.",
  "useContext" : [{
    "code" : {
      "system" : "http://terminology.hl7.org/CodeSystem/usage-context-type",
      "code" : "focus"
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.eu/fhir/health-data-api/CodeSystem/document-priority-category-eu-api",
        "code" : "Medical-Imaging"
      }]
    }
  }],
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "copyright" : "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "85430-7",
        "display" : "Diagnostic imaging report"
      },
      {
        "code" : "18748-4",
        "display" : "Diagnostic imaging study"
      }]
    }]
  }
}

```
