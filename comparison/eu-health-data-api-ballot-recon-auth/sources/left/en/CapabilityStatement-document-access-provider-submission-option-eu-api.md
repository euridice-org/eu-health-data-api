# EEHRxF Document Access Provider - Document Submission Option - EU Health Data API v1.0.0-ballot

## CapabilityStatement: EEHRxF Document Access Provider - Document Submission Option 

 [Raw OpenAPI-Swagger Definition file](../document-access-provider-submission-option-eu-api.openapi.json) | [Download](../document-access-provider-submission-option-eu-api.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "document-access-provider-submission-option-eu-api",
  "url" : "http://hl7.eu/fhir/health-data-api/CapabilityStatement/document-access-provider-submission-option-eu-api",
  "version" : "1.0.0-ballot",
  "name" : "DocumentAccessProviderSubmissionOptionEuApi",
  "title" : "EEHRxF Document Access Provider - Document Submission Option",
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
  "description" : "CapabilityStatement for the Document Submission Option on the EEHRxF Document Access Provider.\n\nThis option enables the Access Provider to receive documents from external Document\nPublishers via [ITI-105 Simplified Publish](https://profiles.ihe.net/ITI/MHD/ITI-105.html).\n\nSystems implementing this option:\n- SHALL also implement the base [Document Access Provider](CapabilityStatement-document-access-provider-eu-api.html) capabilities\n- SHALL accept ITI-105 transactions from authorized Document Publishers\n- SHALL make received documents available via ITI-67 and ITI-68\n- SHALL validate documents against EEHRxF content profiles\n\nThis option is REQUIRED when acting as a delegated access provider for external\nDocument Publishers (e.g., integration engines, national infrastructure).\n\n### Actor Grouping\n\nAdds to base Document Access Provider:\n- [MHD Document Recipient](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html) - Simplified Publish Option ([CapabilityStatement](https://profiles.ihe.net/ITI/MHD/CapabilityStatement-IHE.MHD.DocumentRecipient.html))\n\n### Transaction\n\n| Transaction | Description | Optionality |\n|-------------|-------------|-------------|\n| ITI-105 Simplified Publish | Accept document publication from Document Publishers | R |\n\n### Security\nSystems SHALL support SMART Backend Services authorization for document submission.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "copyright" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0).",
  "kind" : "requirements",
  "imports" : ["http://hl7.eu/fhir/health-data-api/CapabilityStatement/document-access-provider-eu-api"],
  "fhirVersion" : "4.0.1",
  "format" : ["json", "xml"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "The Document Submission Option adds ITI-105 Simplified Publish capability.\nDocument Publishers POST a DocumentReference with embedded document content.\nThe server extracts and persists both the DocumentReference metadata and the\nembedded document, making them available via ITI-67 and ITI-68.",
    "security" : {
      "service" : [{
        "coding" : [{
          "system" : "http://hl7.org/fhir/restful-security-service",
          "code" : "SMART-on-FHIR"
        }]
      }],
      "description" : "Additional scope required for document submission:\n- system/DocumentReference.c (create DocumentReference via ITI-105)\n\nThe Document Publisher must be authorized to submit documents on behalf of the\npatient's care team."
    },
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "DocumentReference",
      "supportedProfile" : ["https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.SimplifiedPublish.DocumentReference",
      "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference"],
      "documentation" : "DocumentReference resources with embedded document content are accepted via\nITI-105 Simplified Publish. The server:\n1. Validates the DocumentReference against the MHD Simplified Publish profile\n2. Extracts the embedded document from content.attachment.data\n3. Persists both the DocumentReference and the document\n4. Returns the created DocumentReference with server-assigned IDs",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "create",
        "documentation" : "Accept DocumentReference with embedded document (ITI-105 Simplified Publish).\n\nThe DocumentReference SHALL include:\n- status (required)\n- type (required - LOINC document type)\n- subject (required - Patient reference)\n- content.attachment.contentType (required)\n- content.attachment.data (required - base64-encoded document content)\n\nThe server SHALL:\n- Validate against the MHD Simplified Publish DocumentReference profile\n- Extract and persist the document\n- For FHIR Documents, ensure the content is retrievable as a native FHIR Document Bundle (not wrapped in Binary)\n- Assign server-generated IDs\n- Return 201 Created with the persisted DocumentReference"
      }],
      "operation" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "MAY"
        }],
        "name" : "validate",
        "definition" : "http://hl7.org/fhir/OperationDefinition/Resource-validate",
        "documentation" : "Pre-validation of DocumentReference before submission"
      }]
    }]
  }]
}

```
