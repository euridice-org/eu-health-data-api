# EU Health Data API Deployment CapabilityStatement - EU Health Data API v1.0.0-ballot

## Resource Profile: EU Health Data API Deployment CapabilityStatement 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.eu.health-data-api|current/StructureDefinition/StructureDefinition-eu-api-deployment-capabilitystatement.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-eu-api-deployment-capabilitystatement.csv), [Excel](../StructureDefinition-eu-api-deployment-capabilitystatement.xlsx), [Schematron](../StructureDefinition-eu-api-deployment-capabilitystatement.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eu-api-deployment-capabilitystatement",
  "url" : "http://hl7.eu/fhir/health-data-api/StructureDefinition/eu-api-deployment-capabilitystatement",
  "version" : "1.0.0-ballot",
  "name" : "EuApiDeploymentCapabilityStatement",
  "title" : "EU Health Data API Deployment CapabilityStatement",
  "status" : "draft",
  "date" : "2026-10-23T14:38:45+02:00",
  "publisher" : "HL7 Europe",
  "contact" : [{
    "name" : "HL7 Europe",
    "telecom" : [{
      "system" : "url",
      "value" : "http://hl7.eu"
    }]
  }],
  "description" : "A concrete EU Health Data API deployment CapabilityStatement declaring one selected authorization security service.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "copyright" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0).",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "objimpl",
    "uri" : "http://hl7.org/fhir/object-implementation",
    "name" : "Object Implementation Information"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "CapabilityStatement",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/CapabilityStatement",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "CapabilityStatement",
      "path" : "CapabilityStatement"
    },
    {
      "id" : "CapabilityStatement.kind",
      "path" : "CapabilityStatement.kind",
      "patternCode" : "instance"
    },
    {
      "id" : "CapabilityStatement.rest.security",
      "path" : "CapabilityStatement.rest.security",
      "min" : 1
    },
    {
      "id" : "CapabilityStatement.rest.security.service",
      "path" : "CapabilityStatement.rest.security.service",
      "min" : 1,
      "max" : "1",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.eu/fhir/health-data-api/ValueSet/eu-api-authorization-security-service"
      }
    },
    {
      "id" : "CapabilityStatement.rest.security.service.coding",
      "path" : "CapabilityStatement.rest.security.service.coding",
      "min" : 1,
      "max" : "1"
    }]
  }
}

```
