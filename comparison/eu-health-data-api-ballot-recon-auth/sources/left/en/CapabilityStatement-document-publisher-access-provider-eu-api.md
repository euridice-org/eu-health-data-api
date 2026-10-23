# EEHRxF Grouped Document Publisher/Access Provider CapabilityStatement - EU Health Data API v1.0.0-ballot

## CapabilityStatement: EEHRxF Grouped Document Publisher/Access Provider CapabilityStatement 

 [Raw OpenAPI-Swagger Definition file](../document-publisher-access-provider-eu-api.openapi.json) | [Download](../document-publisher-access-provider-eu-api.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "document-publisher-access-provider-eu-api",
  "url" : "http://hl7.eu/fhir/health-data-api/CapabilityStatement/document-publisher-access-provider-eu-api",
  "version" : "1.0.0-ballot",
  "name" : "DocumentPublisherAccessProviderEuApi",
  "title" : "EEHRxF Grouped Document Publisher/Access Provider CapabilityStatement",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-01-26",
  "publisher" : "HL7 Europe",
  "contact" : [{
    "name" : "HL7 Europe",
    "telecom" : [{
      "system" : "url",
      "value" : "http://hl7.eu"
    }]
  }],
  "description" : "CapabilityStatement for the grouped EEHRxF Document Publisher and Document Access Provider\nactors. This represents a deployment where document production and access provision are\nco-located in the same system.\n\n### Deployment Pattern\n\nThis CapabilityStatement applies when:\n- An EHR system both produces documents AND provides access to them\n- Document publication is handled internally\n- External clients only need to query and retrieve documents\n\nIn this grouped deployment, document publication is internal to the system and not exposed\nexternally. The external API provides only document discovery (ITI-67) and retrieval (ITI-68)\ncapabilities.\n\n### Actor Grouping\n\nThis grouped actor combines:\n- **Document Publisher** (internal) - Produces and stores documents internally\n- **Document Access Provider** (external-facing) - Serves documents to Document Consumers\n\nThe underlying IHE actors are:\n- [IUA Authorization Server](https://profiles.ihe.net/ITI/IUA/index.html#34112-authorization-server)\n- [IUA Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#34113-resource-server)\n- [PDQm Patient Demographics Supplier](https://profiles.ihe.net/ITI/PDQm/volume-1.html)\n- [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html)\n\nNote: MHD Document Recipient is not listed because publication is internal.\n\n### External Transactions\n\n| Transaction | Description | Optionality |\n|-------------|-------------|-------------|\n| ITI-67 Find Document References | Respond to document metadata queries from Document Consumers | R |\n| ITI-68 Retrieve Document | Serve document content to Document Consumers | R |\n| ITI-78 Patient Demographics Query | Respond to patient demographics queries | O |\n| Get Access Token | Issue authorization tokens to clients | R |\n\n### Security\nSystems SHALL support SMART Backend Services authorization for all transactions.\n\n### When to Use This CapabilityStatement\n\nUse this CapabilityStatement when implementing:\n- Hospital EHR systems that produce and serve their own documents\n- Regional health information exchanges with integrated document repositories\n- Any system where document creation and access are tightly coupled\n\nFor systems that need to receive documents from external sources, use the\n[Document Access Provider with Document Submission Option](CapabilityStatement-document-access-provider-submission-option-eu-api.html).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "copyright" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0).",
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["json", "xml"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "This grouped actor provides document access to external Document Consumers.\nDocument publication is internal and not exposed. The external API\nsupports document discovery (ITI-67), retrieval (ITI-68), and optional patient lookup (ITI-78).\n\nAll transactions require SMART Backend Services authorization.",
    "security" : {
      "cors" : false,
      "service" : [{
        "coding" : [{
          "system" : "http://hl7.org/fhir/restful-security-service",
          "code" : "SMART-on-FHIR"
        }]
      }],
      "description" : "SMART Backend Services authorization is REQUIRED for all transactions.\nSystems SHALL:\n- Validate JWT client credentials (RFC 7523)\n- Verify appropriate scopes for document access\n- Use TLS 1.2 or higher for all communications\n\nRequired scopes to accept:\n- system/DocumentReference.rs (read + search DocumentReference - ITI-67)\n- system/Binary.r (read Binary - ITI-68)\n- system/Bundle.r (read Bundle - ITI-68 for FHIR Documents)\n- system/Patient.rs (read + search Patient - ITI-78)"
    },
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "DocumentReference",
      "documentation" : "DocumentReference resources are returned as base FHIR resources. No EU or MHD return profile is required. Document creation is internal.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read DocumentReference by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for DocumentReference resources (ITI-67)"
      }],
      "updateCreate" : false,
      "conditionalCreate" : false,
      "conditionalUpdate" : false,
      "conditionalDelete" : "not-supported",
      "referencePolicy" : ["resolves"],
      "searchRevInclude" : ["Provenance:target"],
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
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Binary",
      "documentation" : "Binary resources contain the actual document content and are served via ITI-68\nRetrieve Document. Document content is created internally; no external create\noperation is supported.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Retrieve document content (ITI-68)"
      }],
      "updateCreate" : false,
      "conditionalCreate" : false,
      "conditionalUpdate" : false,
      "conditionalDelete" : "not-supported"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "Patient",
      "supportedProfile" : ["http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core"],
      "documentation" : "Patient resources support patient context lookup per PDQm [ITI-78]. The identifier\nsearch parameter is required; additional demographics parameters are optional.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read Patient by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for patients (PDQm ITI-78)"
      }],
      "updateCreate" : false,
      "conditionalCreate" : false,
      "conditionalUpdate" : false,
      "conditionalDelete" : "not-supported",
      "referencePolicy" : ["resolves"],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/Patient-identifier",
        "type" : "token",
        "documentation" : "Patient identifier (e.g., national ID, MRN) - required for patient lookup"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "Patient logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "active",
        "definition" : "http://hl7.org/fhir/SearchParameter/Patient-active",
        "type" : "token",
        "documentation" : "Whether the patient record is active"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "family",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-family",
        "type" : "string",
        "documentation" : "Patient family name"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "given",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-given",
        "type" : "string",
        "documentation" : "Patient given name"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "telecom",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-telecom",
        "type" : "token",
        "documentation" : "Telecom details of the patient"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "birthdate",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-birthdate",
        "type" : "date",
        "documentation" : "Patient date of birth"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "address",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address",
        "type" : "string",
        "documentation" : "A server defined search that may match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "address-city",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-city",
        "type" : "string",
        "documentation" : "A city specified in an address"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "address-country",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-country",
        "type" : "string",
        "documentation" : "A country specified in an address"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "address-postalcode",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-postalcode",
        "type" : "string",
        "documentation" : "A postal code specified in an address"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "address-state",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-state",
        "type" : "string",
        "documentation" : "A state specified in an address"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "gender",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-gender",
        "type" : "token",
        "documentation" : "Administrative gender of the patient"
      }]
    }],
    "interaction" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "MAY"
      }],
      "code" : "search-system",
      "documentation" : "System-wide search support"
    }]
  }]
}

```
