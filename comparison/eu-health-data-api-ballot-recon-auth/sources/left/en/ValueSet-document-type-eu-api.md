# EEHRxF Document Type ValueSet - EU Health Data API v1.0.0-ballot

## ValueSet: EEHRxF Document Type ValueSet 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "document-type-eu-api",
  "url" : "http://hl7.eu/fhir/health-data-api/ValueSet/document-type-eu-api",
  "version" : "1.0.0-ballot",
  "name" : "DocumentTypeEuApiVS",
  "title" : "EEHRxF Document Type ValueSet",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-10-23T14:37:38+02:00",
  "publisher" : "HL7 Europe",
  "contact" : [{
    "name" : "HL7 Europe",
    "telecom" : [{
      "system" : "url",
      "value" : "http://hl7.eu"
    }]
  }],
  "description" : "Document type codes for clinical precision in document identification.",
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
      "valueSet" : ["http://hl7.eu/fhir/health-data-api/ValueSet/document-type-patient-summary-eu-api"]
    },
    {
      "valueSet" : ["http://hl7.eu/fhir/health-data-api/ValueSet/document-type-discharge-report-eu-api"]
    },
    {
      "valueSet" : ["http://hl7.eu/fhir/health-data-api/ValueSet/document-type-laboratory-report-eu-api"]
    },
    {
      "valueSet" : ["http://hl7.eu/fhir/health-data-api/ValueSet/document-type-medical-imaging-eu-api"]
    }]
  }
}

```
