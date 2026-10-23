# Resource smart-fhir-resource-server-eu-api



## Resource Content

```json
{
  "resourceType" : "Basic",
  "id" : "smart-fhir-resource-server-eu-api",
  "extension" : [{
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.url",
    "valueUri" : "http://hl7.eu/fhir/health-data-api/ActorDefinition/smart-fhir-resource-server-eu-api"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.version",
    "valueString" : "1.0.0-ballot"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.name",
    "valueString" : "SmartFhirResourceServerEuApi"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.title",
    "valueString" : "SMART FHIR Resource Server"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.status",
    "valueCode" : "active"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.experimental",
    "valueBoolean" : false
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.date",
    "valueDateTime" : "2026-10-23T12:01:58+02:00"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.publisher",
    "valueString" : "HL7 Europe"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.contact",
    "valueContactDetail" : {
      "name" : "HL7 Europe",
      "telecom" : [{
        "system" : "url",
        "value" : "http://hl7.eu"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.description",
    "valueMarkdown" : "The SMART FHIR Resource Server hosts protected FHIR resources, validates access tokens,\nand enforces granted SMART scopes. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/)\nand [Authorization](authorization.html#smart-app-launch). This IG recommends CT Time Client grouping\nfor this server role in both interactive and Backend Services modes; see\n[SMART Server Time Synchronization](authorization.html#smart-server-time-synchronization)\nand the shared [Time Synchronization](authorization.html#time-synchronization) deployment guidance."
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.jurisdiction",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
        "code" : "150",
        "display" : "Europe"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.copyright",
    "valueMarkdown" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0)."
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.type",
    "valueCode" : "system"
  }],
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/fhir-types",
      "code" : "ActorDefinition"
    }]
  }
}

```
