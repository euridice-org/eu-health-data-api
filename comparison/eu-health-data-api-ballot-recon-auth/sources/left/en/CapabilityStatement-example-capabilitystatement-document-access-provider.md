# Example: Document Access Provider Supporting EPS and Laboratory - EU Health Data API v1.0.0-ballot

## CapabilityStatement: Example: Document Access Provider Supporting EPS and Laboratory (Experimental) 

 [Raw OpenAPI-Swagger Definition file](../example-capabilitystatement-document-access-provider.openapi.json) | [Download](../example-capabilitystatement-document-access-provider.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "example-capabilitystatement-document-access-provider",
  "url" : "http://hl7.eu/fhir/health-data-api/CapabilityStatement/example-capabilitystatement-document-access-provider",
  "version" : "1.0.0-ballot",
  "name" : "ExampleDocumentAccessProviderEPSLab",
  "title" : "Example: Document Access Provider Supporting EPS and Laboratory",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-03-10",
  "publisher" : "HL7 Europe",
  "contact" : [{
    "name" : "HL7 Europe",
    "telecom" : [{
      "system" : "url",
      "value" : "http://hl7.eu"
    }]
  }],
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "copyright" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0).",
  "kind" : "instance",
  "instantiates" : ["http://hl7.eu/fhir/health-data-api/CapabilityStatement/document-access-provider-eu-api"],
  "implementation" : {
    "description" : "Example hospital document access provider",
    "url" : "https://example.org/fhir"
  },
  "fhirVersion" : "4.0.1",
  "format" : ["json", "xml"],
  "implementationGuide" : ["http://hl7.eu/fhir/eps", "http://hl7.eu/fhir/laboratory"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "This server provides document exchange for European Patient Summaries and\nLaboratory Reports. It supports MHD ITI-67 (Find Document References),\nITI-68 (Retrieve Document), and PDQm ITI-78 (Patient Demographics Query).",
    "security" : {
      "service" : [{
        "coding" : [{
          "system" : "http://hl7.org/fhir/restful-security-service",
          "code" : "SMART-on-FHIR"
        }]
      }],
      "description" : "SMART Backend Services authorization required."
    },
    "resource" : [{
      "type" : "DocumentReference",
      "documentation" : "DocumentReference resources are served via ITI-67. The response uses base FHIR\nDocumentReference resources without a required return profile.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "Logical id"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "_lastUpdated",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
        "type" : "date",
        "documentation" : "Resource version last updated"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "author.given",
        "type" : "string",
        "documentation" : "Author given name"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "author.family",
        "type" : "string",
        "documentation" : "Author family name"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "category",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-category",
        "type" : "token",
        "documentation" : "Document category"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "creation",
        "definition" : "https://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation",
        "type" : "date",
        "documentation" : "Document creation time"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-date",
        "type" : "date",
        "documentation" : "Reference creation time"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "event",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-event",
        "type" : "token",
        "documentation" : "Main clinical acts documented"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "facility",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-facility",
        "type" : "token",
        "documentation" : "Facility kind"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "format",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-format",
        "type" : "token",
        "documentation" : "Document format"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-identifier",
        "type" : "token",
        "documentation" : "Document identifier"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "Patient reference"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient.identifier",
        "type" : "token",
        "documentation" : "Chained patient identifier"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "period",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-period",
        "type" : "date",
        "documentation" : "Documented service period"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "related",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-related",
        "type" : "reference",
        "documentation" : "Related identifier or resource"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "security-label",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-security-label",
        "type" : "token",
        "documentation" : "Document security label"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "setting",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-setting",
        "type" : "token",
        "documentation" : "Clinical setting"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/DocumentReference-status",
        "type" : "token",
        "documentation" : "Document reference status"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "type",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-type",
        "type" : "token",
        "documentation" : "Document type"
      }]
    },
    {
      "type" : "Patient",
      "supportedProfile" : ["http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core"],
      "documentation" : "Patient lookup via PDQm ITI-78.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      }],
      "searchParam" : [{
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_id",
        "type" : "token"
      }]
    }]
  }]
}

```
