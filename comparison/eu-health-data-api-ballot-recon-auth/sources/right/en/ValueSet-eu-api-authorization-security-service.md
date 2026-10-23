# EU Health Data API Authorization Security Service ValueSet - EU Health Data API v1.0.0-ballot

## ValueSet: EU Health Data API Authorization Security Service ValueSet 

 **References** 

* [EU Health Data API Deployment CapabilityStatement](StructureDefinition-eu-api-deployment-capabilitystatement.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (Unknown Code System)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "eu-api-authorization-security-service",
  "url" : "http://hl7.eu/fhir/health-data-api/ValueSet/eu-api-authorization-security-service",
  "version" : "1.0.0-ballot",
  "name" : "EuApiAuthorizationSecurityServiceVS",
  "title" : "EU Health Data API Authorization Security Service ValueSet",
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
  "description" : "Security services that a concrete EU Health Data API deployment may select for its protected FHIR interface.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "copyright" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0).",
  "compose" : {
    "include" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/restful-security-service",
      "concept" : [{
        "code" : "SMART-on-FHIR"
      }]
    },
    {
      "system" : "http://profiles.ihe.net/fhir/ihe.securityTypes/CodeSystem/securityTypes",
      "concept" : [{
        "code" : "IUA"
      }]
    }]
  }
}

```
