# EEHRxF Document Publisher CapabilityStatement - EU Health Data API v1.0.0-ballot

## CapabilityStatement: EEHRxF Document Publisher CapabilityStatement 

This CapabilityStatement defines the requirements for the EEHRxF Document Publisher actor. The actor produces EEHRxF FHIR Documents and publishes them to a Document Access Provider.

### Actor Grouping

This composite actor groups the following roles:

* The IUA Authorization Client, SMART App, or SMART Backend Service selected by the environment and use case
* [PDQm Patient Demographics Consumer](https://profiles.ihe.net/ITI/PDQm/volume-1.html)
* [MHD Document Source](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html)

### Transactions

| | | |
| :--- | :--- | :--- |
| ITI-105 Simplified Publish | Submit document with embedded content to a Document Access Provider | R |
| ITI-78 Patient Demographics Query | Query for patient demographics to establish patient context | R |
| Get Access Token | Obtain authorization token for API access | R |

### Security

This requirements CapabilityStatement supports the IUA or SMART client role selected by the environment and use case. A deployment instance advertises only its selected protocol; see [Authorization](authorization.md#environment-specific-requirements).

### Deployment

The Document Publisher may be grouped with Document Access Provider, in which case the ITI-105 transaction becomes internal and is not exposed externally. See the [grouped Document Publisher/Access Provider CapabilityStatement](CapabilityStatement-document-publisher-access-provider-eu-api.md) for this deployment pattern.

 [Raw OpenAPI-Swagger Definition file](../document-publisher-eu-api.openapi.json) | [Download](../document-publisher-eu-api.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "document-publisher-eu-api",
  "url" : "http://hl7.eu/fhir/health-data-api/CapabilityStatement/document-publisher-eu-api",
  "version" : "1.0.0-ballot",
  "name" : "DocumentPublisherEuApi",
  "title" : "EEHRxF Document Publisher CapabilityStatement",
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
  "description" : "Requirements for an EEHRxF Document Publisher that submits FHIR Documents to a Document Access Provider.",
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
    "mode" : "client",
    "documentation" : "The Document Publisher actor initiates transactions to publish documents and query for\npatient context. It groups with the selected IUA Authorization Client, SMART App, or SMART\nBackend Service role. The Authorization Server is a separate participant.",
    "security" : {
      "description" : "This abstract requirements statement does not advertise a fixed security service. A concrete\ndeployment SHALL declare exactly one security-service coding from the [EU Health Data API\nAuthorization Security Service ValueSet](ValueSet-eu-api-authorization-security-service.html),\nselected for its environment. It SHALL NOT advertise both services unless a future profile defines\ndual conformance.\n\n### IHE IUA\n\nThe publisher groups with the IUA Authorization Client. ITI-105 and PDQm ITI-78 have no IUA MHD\ntransaction scope; the deployment applies the IUA authorization policy defined for its environment.\n\n### SMART Backend Services\n\nFor a pre-authorized system-to-system use case, the publisher groups with the SMART Backend Service,\nuses `client_credentials` and `private_key_jwt`, and requests:\n- system/DocumentReference.c (create DocumentReference - ITI-105)\n- system/Patient.rs (read + search Patient - ITI-78)\n\n### Interactive SMART\n\nWhere an interactive use case applies, the publisher groups with the SMART App, uses authorization\ncode with PKCE, and replaces the `system/` prefix above with the applicable `patient/` or `user/`\nscope prefix.\n\nAll modes use TLS 1.2 or higher. See [Authorization](authorization.html#smart-app-launch) for the\nselected capability set, discovery, token, and scope rules."
    },
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "DocumentReference",
      "supportedProfile" : ["https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.SimplifiedPublish.DocumentReference",
      "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference"],
      "documentation" : "DocumentReference resources are submitted via ITI-105 Simplified Publish with embedded\ndocument content in the attachment to publish documents to the Document Access Provider.\nThe SimplifiedPublish profile requires content.attachment.data to be populated.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "create",
        "documentation" : "Create DocumentReference with embedded document (ITI-105 Simplified Publish)"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Patient",
      "supportedProfile" : ["http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core"],
      "documentation" : "Patient resources are queried using PDQm [ITI-78] to establish patient context\nbefore submitting documents. The identifier search parameter is required.",
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
          "valueCode" : "SHOULD"
        }],
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "Patient logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "active",
        "definition" : "http://hl7.org/fhir/SearchParameter/Patient-active",
        "type" : "token",
        "documentation" : "Whether the patient record is active"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "family",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-family",
        "type" : "string",
        "documentation" : "Patient family name"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "given",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-given",
        "type" : "string",
        "documentation" : "Patient given name"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "telecom",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-telecom",
        "type" : "token",
        "documentation" : "Telecom details of the patient"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "birthdate",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-birthdate",
        "type" : "date",
        "documentation" : "Patient date of birth"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "address",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address",
        "type" : "string",
        "documentation" : "A server defined search that may match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "address-city",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-city",
        "type" : "string",
        "documentation" : "A city specified in an address"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "address-country",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-country",
        "type" : "string",
        "documentation" : "A country specified in an address"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "address-postalcode",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-postalcode",
        "type" : "string",
        "documentation" : "A postal code specified in an address"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "address-state",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-address-state",
        "type" : "string",
        "documentation" : "A state specified in an address"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "gender",
        "definition" : "http://hl7.org/fhir/SearchParameter/individual-gender",
        "type" : "token",
        "documentation" : "Administrative gender of the patient"
      }]
    }]
  }]
}

```
