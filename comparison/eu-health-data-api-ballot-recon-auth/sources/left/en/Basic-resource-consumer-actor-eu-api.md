# Resource resource-consumer-actor-eu-api



## Resource Content

```json
{
  "resourceType" : "Basic",
  "id" : "resource-consumer-actor-eu-api",
  "extension" : [{
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.url",
    "valueUri" : "http://hl7.eu/fhir/health-data-api/ActorDefinition/resource-consumer-actor-eu-api"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.version",
    "valueString" : "1.0.0-ballot"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.name",
    "valueString" : "ResourceConsumerEuApi"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.title",
    "valueString" : "EEHRxF Resource Consumer"
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
    "valueDateTime" : "2026-10-23T12:03:51+02:00"
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
    "valueMarkdown" : "The Resource Consumer actor queries for clinical data resources from a Resource Access\nProvider following IPA patterns. This composite actor groups IPA Client,\nPDQm Patient Demographics Consumer, and IUA Authorization Client.\n\nSee [Resource Consumer CapabilityStatement](CapabilityStatement-resource-consumer-eu-api.html)\nfor technical requirements."
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
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-ActorDefinition.capabilities",
    "valueCanonical" : "http://hl7.eu/fhir/health-data-api/CapabilityStatement/resource-consumer-eu-api"
  }],
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/fhir-types",
      "code" : "ActorDefinition"
    }]
  }
}

```
