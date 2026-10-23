# Example - European Patient Summary DocumentReference - EU Health Data API v1.0.0-ballot

## Example DocumentReference: Example - European Patient Summary DocumentReference

**masterIdentifier**: `urn:oid:2.999.3.4.5.6.7.8.9`/urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d

**status**: Current

**type**: Patient summary Document

**category**: patient summaries

**subject**: [Jan Jansen](http://example.org/fhir/Patient/example-patient)

**date**: 2026-01-15 10:30:00+0100

**author**: [Dr. Maria Schmidt](http://example.org/fhir/Practitioner/example-practitioner)

**custodian**: [Amsterdam University Medical Center](http://example.org/fhir/Organization/example-hospital)

**description**: International Patient Summary for Jan Jansen

> **content**

### Attachments

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| - | **ContentType** | **Language** | **Url** | **Title** | **Creation** |
| * | application/fhir+json | English | [http://example.org/fhir/Bundle/eps-jan-jansen](http://example.org/fhir/Bundle/eps-jan-jansen) | European Patient Summary | 2026-01-15 10:30:00+0100 |

**format**: unknown: http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips (http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips)



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-documentreference-eps",
  "masterIdentifier" : {
    "system" : "urn:oid:2.999.3.4.5.6.7.8.9",
    "value" : "urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "60591-5",
      "display" : "Patient summary Document"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://hl7.eu/fhir/health-data-api/CodeSystem/document-priority-category-eu-api",
      "code" : "Patient-Summaries",
      "display" : "patient summaries"
    }]
  }],
  "subject" : {
    "reference" : "http://example.org/fhir/Patient/example-patient",
    "display" : "Jan Jansen"
  },
  "date" : "2026-01-15T10:30:00+01:00",
  "author" : [{
    "reference" : "http://example.org/fhir/Practitioner/example-practitioner",
    "display" : "Dr. Maria Schmidt"
  }],
  "custodian" : {
    "reference" : "http://example.org/fhir/Organization/example-hospital",
    "display" : "Amsterdam University Medical Center"
  },
  "description" : "International Patient Summary for Jan Jansen",
  "content" : [{
    "attachment" : {
      "contentType" : "application/fhir+json",
      "language" : "en",
      "url" : "http://example.org/fhir/Bundle/eps-jan-jansen",
      "title" : "European Patient Summary",
      "creation" : "2026-01-15T10:30:00+01:00"
    },
    "format" : {
      "system" : "urn:ietf:rfc:3986",
      "code" : "http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips"
    }
  }]
}

```
