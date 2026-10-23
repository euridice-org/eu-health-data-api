# EEHRxF Resource Access Provider CapabilityStatement - EU Health Data API v1.0.0-ballot

## CapabilityStatement: EEHRxF Resource Access Provider CapabilityStatement 

This CapabilityStatement defines the requirements for the EEHRxF Resource Access Provider actor. The actor serves clinical data resources using [International Patient Access (IPA)](https://hl7.org/fhir/uv/ipa/) patterns for direct resource access beyond document exchange.

### Resource Flexibility

Following IPA's approach, servers are not required to support every clinical resource listed in this CapabilityStatement. Patient is required for lookup context; servers MAY choose other resources according to their capabilities and use cases.

Recommended resources, chosen according to capabilities, are:

* Practitioner and Organization for reference resolution
* Condition and AllergyIntolerance for patient safety data
* Observation and DiagnosticReport for clinical results
* MedicationRequest, MedicationDispense, and MedicationStatement for medication data
* Immunization for vaccination records
* ImagingStudy for imaging results
* Encounter for visit context

The server's CapabilityStatement declares which resources it actually supports.

### Security

This requirements CapabilityStatement supports the IUA or SMART Resource Server role selected by the environment and use case. A deployment instance advertises only its selected protocol; see [Authorization](authorization.md#environment-specific-requirements).

### Profile Inheritance

Resources SHOULD conform to EU Core profiles where available.

 [Raw OpenAPI-Swagger Definition file](../resource-access-provider-eu-api.openapi.json) | [Download](../resource-access-provider-eu-api.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "resource-access-provider-eu-api",
  "url" : "http://hl7.eu/fhir/health-data-api/CapabilityStatement/resource-access-provider-eu-api",
  "version" : "1.0.0-ballot",
  "name" : "ResourceAccessProviderEuApi",
  "title" : "EEHRxF Resource Access Provider CapabilityStatement",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-28",
  "publisher" : "HL7 Europe",
  "contact" : [{
    "name" : "HL7 Europe",
    "telecom" : [{
      "system" : "url",
      "value" : "http://hl7.eu"
    }]
  }],
  "description" : "Requirements for an EEHRxF Resource Access Provider that serves clinical FHIR resources using IPA patterns.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "copyright" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0).",
  "kind" : "requirements",
  "instantiates" : ["http://hl7.org/fhir/uv/ipa/CapabilityStatement/ipa-server"],
  "fhirVersion" : "4.0.1",
  "format" : ["json", "xml"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "The Resource Access Provider actor responds to queries for clinical data resources\nfollowing IPA patterns. This enables direct resource access complementing\ndocument-based exchange via MHD.\n\nThe protected API groups with the IUA Resource Server or SMART FHIR Resource Server selected by the\nenvironment and use case. Its Authorization Server remains an independent participant.",
    "security" : {
      "description" : "This abstract requirements statement does not advertise a fixed security service. A concrete\ndeployment SHALL declare exactly one security-service coding from the [EU Health Data API\nAuthorization Security Service ValueSet](ValueSet-eu-api-authorization-security-service.html),\nselected for its environment. It SHALL NOT advertise both services unless a future profile defines\ndual conformance.\nThe Resource Server validates access tokens and granted authorization; the independent Authorization\nServer performs token issuance and any client-assertion validation.\n\n### IHE IUA\n\nThe provider groups with the IUA Resource Server. The IPA and PDQm interactions in this statement\nhave no IUA MHD transaction scopes; the deployment applies the IUA authorization policy defined for\nits environment.\n\n### SMART Backend Services\n\nFor a pre-authorized system-to-system use case, the provider groups with the SMART FHIR Resource\nServer and accepts `system/` scopes for the resources it supports.\n\n### Interactive SMART\n\nWhere an interactive use case applies, the provider groups with the SMART FHIR Resource Server and\naccepts the corresponding `patient/` or `user/` scopes for the resources it supports.\n\nFor the IG-level CT grouping recommendation for SMART server roles, see\n[SMART Server Time Synchronization](authorization.html#smart-server-time-synchronization).\n\nAll modes use TLS 1.2 or higher and return errors according to the selected authorization specification.\n\n### Resource Flexibility\n\nFollowing IPA's approach, servers MAY choose which clinical resources to support based on their\ncapabilities and use cases. Patient is required for lookup context; other resources are recommended\nbut servers may implement a subset. The server's CapabilityStatement declares which resources are\nactually supported.\n\n### Scopes for Supported Resources\n\nFor SMART Backend Services, servers SHALL accept scopes for the resources they support:\n- system/Patient.rs (REQUIRED - read + search Patient)\n- system/Condition.rs (if Condition supported)\n- system/AllergyIntolerance.rs (if AllergyIntolerance supported)\n- system/Observation.rs (if Observation supported)\n- system/DiagnosticReport.rs (if DiagnosticReport supported)\n- system/ImagingStudy.rs (if ImagingStudy supported)\n- system/MedicationRequest.rs (if MedicationRequest supported)\n- system/MedicationDispense.rs (if MedicationDispense supported)\n- system/Immunization.rs (if Immunization supported)\n- system/MedicationStatement.rs (if MedicationStatement supported)\n- system/Encounter.rs (if Encounter supported)\n- system/Practitioner.r (if Practitioner supported)\n- system/Organization.r (if Organization supported)\n\nThese are **SMART App Launch 2.2 Backend Services FHIR Resource Scopes**, not IUA transaction scopes.\nInteractive SMART uses the corresponding `patient/` or `user/` forms. See\n[Authorization](authorization.html#tokens-scopes-enforcement-and-errors)."
    },
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Patient",
      "supportedProfile" : ["http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core"],
      "documentation" : "Patient resources support patient lookup per PDQm [ITI-78] with identifier as a\nrequired search parameter. Note: Patient is used for lookup context, not as a\nprimary clinical data resource in this actor.",
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
        "documentation" : "Search for patients for lookup purposes"
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
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "Practitioner",
      "documentation" : "Practitioner resources provide clinical context for referenced healthcare providers.\nRead-only access supports resolving practitioner references in clinical resources.\nServers SHOULD support this resource but MAY omit it based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read Practitioner by logical ID"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "Organization",
      "documentation" : "Organization resources provide context for referenced healthcare organizations.\nRead-only access supports resolving organization references in clinical resources.\nServers SHOULD support this resource but MAY omit it based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read Organization by logical ID"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "Condition",
      "documentation" : "Condition resources represent problems, diagnoses, and health concerns.\nIf supported, servers SHALL support search by patient and SHOULD support additional filters.\nServers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read Condition by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for Condition resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient who has the condition (SHALL support)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "clinical-status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-clinical-status",
        "type" : "token",
        "documentation" : "The clinical status of the condition"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "category",
        "definition" : "http://hl7.org/fhir/SearchParameter/Condition-category",
        "type" : "token",
        "documentation" : "The category of condition"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "code",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
        "type" : "token",
        "documentation" : "Code for the condition"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "AllergyIntolerance",
      "documentation" : "AllergyIntolerance resources represent patient allergies and intolerances.\nIf supported, servers SHALL support search by patient.\nServers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read AllergyIntolerance by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for AllergyIntolerance resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient who has the allergy or intolerance (SHALL support)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "clinical-status",
        "definition" : "http://hl7.org/fhir/SearchParameter/AllergyIntolerance-clinical-status",
        "type" : "token",
        "documentation" : "The clinical status of the allergy or intolerance"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      },
      {
        "extension" : [{
          "url" : "required",
          "valueString" : "patient"
        },
        {
          "url" : "required",
          "valueString" : "category"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
      },
      {
        "extension" : [{
          "url" : "required",
          "valueString" : "patient"
        },
        {
          "url" : "required",
          "valueString" : "code"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
      },
      {
        "extension" : [{
          "url" : "required",
          "valueString" : "patient"
        },
        {
          "url" : "required",
          "valueString" : "category"
        },
        {
          "url" : "required",
          "valueString" : "date"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
      },
      {
        "extension" : [{
          "url" : "required",
          "valueString" : "patient"
        },
        {
          "url" : "required",
          "valueString" : "category"
        },
        {
          "url" : "required",
          "valueString" : "code"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
      }],
      "type" : "Observation",
      "documentation" : "Observation resources represent clinical observations including vital signs,\nlaboratory results, and other measurements. If supported, servers SHALL support\nsearch by patient+category, patient+code, patient+category+date, and\npatient+category+code. Servers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read Observation by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for Observation resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient the observation is about (SHALL support)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "category",
        "definition" : "http://hl7.org/fhir/SearchParameter/Observation-category",
        "type" : "token",
        "documentation" : "Category of observation (e.g., vital-signs, laboratory)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "code",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
        "type" : "token",
        "documentation" : "The code of the observation type"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-date",
        "type" : "date",
        "documentation" : "Obtained date/time. Date modifiers ge, le, gt, lt SHOULD be supported."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Observation-status",
        "type" : "token",
        "documentation" : "The status of the observation"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      },
      {
        "extension" : [{
          "url" : "required",
          "valueString" : "patient"
        },
        {
          "url" : "required",
          "valueString" : "category"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
      },
      {
        "extension" : [{
          "url" : "required",
          "valueString" : "patient"
        },
        {
          "url" : "required",
          "valueString" : "category"
        },
        {
          "url" : "required",
          "valueString" : "code"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
      },
      {
        "extension" : [{
          "url" : "required",
          "valueString" : "patient"
        },
        {
          "url" : "required",
          "valueString" : "category"
        },
        {
          "url" : "required",
          "valueString" : "date"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
      }],
      "type" : "DiagnosticReport",
      "documentation" : "DiagnosticReport resources represent laboratory results and imaging reports.\nIf supported, servers SHALL support search by patient+category, patient+category+code,\nand patient+category+date (IHE QEDm; not defined by IPA). For imaging reports, the\nHL7 Europe Imaging and MADO implementation guides MAY define additional search requirements.\nServers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read DiagnosticReport by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for DiagnosticReport resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient the report is about (SHALL support)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "category",
        "definition" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-category",
        "type" : "token",
        "documentation" : "Category of report (e.g., LAB, RAD)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "code",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-code",
        "type" : "token",
        "documentation" : "The code for the report type"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-date",
        "type" : "date",
        "documentation" : "The clinically relevant time of the report"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/DiagnosticReport-status",
        "type" : "token",
        "documentation" : "The status of the report"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "ImagingStudy",
      "documentation" : "ImagingStudy resources represent imaging studies available for a patient. ImagingStudy is\nnot profiled in EU Core; resources SHOULD conform to the HL7 Europe Imaging ImagingStudy\nprofile (http://hl7.eu/fhir/imaging/StructureDefinition/ImagingStudyEuImaging).\nIf supported, servers SHALL support search by patient. The MADO implementation guide MAY\ndefine additional search requirements. Servers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read ImagingStudy by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for ImagingStudy resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient the imaging study is about (SHALL support)"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "MedicationRequest",
      "documentation" : "MedicationRequest resources represent medication orders and prescriptions.\nIf supported, servers SHALL support search by patient.\nServers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read MedicationRequest by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for MedicationRequest resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient for whom the medication was ordered (SHALL support)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/medications-status",
        "type" : "token",
        "documentation" : "Status of the prescription"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "intent",
        "definition" : "http://hl7.org/fhir/SearchParameter/MedicationRequest-intent",
        "type" : "token",
        "documentation" : "The intent of the medication request"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "authoredon",
        "definition" : "http://hl7.org/fhir/SearchParameter/MedicationRequest-authoredon",
        "type" : "date",
        "documentation" : "Return prescriptions written on this date"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "MedicationDispense",
      "documentation" : "MedicationDispense resources represent medication dispensing events.\nIf supported, servers SHALL support search by patient.\nServers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read MedicationDispense by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for MedicationDispense resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient for whom the medication was dispensed (SHALL support)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/medications-status",
        "type" : "token",
        "documentation" : "Status of the dispense"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "whenhandedover",
        "definition" : "http://hl7.org/fhir/SearchParameter/MedicationDispense-whenhandedover",
        "type" : "date",
        "documentation" : "When the medication was handed over"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "Immunization",
      "documentation" : "Immunization resources represent vaccination records.\nIf supported, servers SHALL support search by patient.\nServers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read Immunization by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for Immunization resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient for the vaccination record (SHALL support)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-date",
        "type" : "date",
        "documentation" : "Vaccination date"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Immunization-status",
        "type" : "token",
        "documentation" : "Status of the immunization"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      }],
      "type" : "MedicationStatement",
      "documentation" : "MedicationStatement resources represent a patient's medication usage, including\nself-reported medications. If supported, servers SHALL support search by patient.\nServers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read MedicationStatement by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for MedicationStatement resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient for the medication statement (SHALL support)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/medications-status",
        "type" : "token",
        "documentation" : "Status of the medication statement"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "effective",
        "definition" : "http://hl7.org/fhir/SearchParameter/MedicationStatement-effective",
        "type" : "date",
        "documentation" : "Date when patient was taking the medication"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHOULD"
      },
      {
        "extension" : [{
          "url" : "required",
          "valueString" : "patient"
        },
        {
          "url" : "required",
          "valueString" : "date"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
      }],
      "type" : "Encounter",
      "documentation" : "Encounter resources represent patient encounters (visits, admissions, etc.).\nIf supported, servers SHALL support search by patient and by patient+date (IHE QEDm).\nServers MAY omit this resource based on their capabilities.",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "read",
        "documentation" : "Read Encounter by logical ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "code" : "search-type",
        "documentation" : "Search for Encounter resources"
      }],
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "patient",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
        "type" : "reference",
        "documentation" : "The patient present at the encounter (SHALL support)"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/clinical-date",
        "type" : "date",
        "documentation" : "A date within the encounter period"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-status",
        "type" : "token",
        "documentation" : "Status of the encounter"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHOULD"
        }],
        "name" : "class",
        "definition" : "http://hl7.org/fhir/SearchParameter/Encounter-class",
        "type" : "token",
        "documentation" : "Classification of the encounter (e.g., inpatient, outpatient)"
      }]
    }]
  }]
}

```
