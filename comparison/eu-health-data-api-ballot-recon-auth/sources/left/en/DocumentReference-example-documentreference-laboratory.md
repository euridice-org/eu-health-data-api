# Example - Laboratory Report DocumentReference - EU Health Data API v1.0.0-ballot

## Example DocumentReference: Example - Laboratory Report DocumentReference

**masterIdentifier**: `urn:oid:2.999.3.4.5.6.7.8.9`/urn:uuid:c3d4e5f6-a7b8-9012-cdef-123456789012

**status**: Current

**type**: Laboratory report

**category**: medical test results, including laboratory and other diagnostic results and related reports

**subject**: [Jan Jansen](http://example.org/fhir/Patient/example-patient)

**date**: 2026-03-01 09:15:00+0100

**custodian**: [Amsterdam University Medical Center](http://example.org/fhir/Organization/example-hospital)

> **content**

### Attachments

| | | | |
| :--- | :--- | :--- | :--- |
| - | **ContentType** | **Url** | **Creation** |
| * | application/fhir+json | [http://example.org/fhir/Bundle/lab-report-jan-jansen](http://example.org/fhir/Bundle/lab-report-jan-jansen) | 2026-03-01 09:15:00+0100 |

**format**: unknown: http://hl7.eu/fhir/laboratory/StructureDefinition/Bundle-eu-lab (http://hl7.eu/fhir/laboratory/StructureDefinition/Bundle-eu-lab)



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-documentreference-laboratory",
  "masterIdentifier" : {
    "system" : "urn:oid:2.999.3.4.5.6.7.8.9",
    "value" : "urn:uuid:c3d4e5f6-a7b8-9012-cdef-123456789012"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "11502-2",
      "display" : "Laboratory report"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://hl7.eu/fhir/health-data-api/CodeSystem/document-priority-category-eu-api",
      "code" : "Laboratory-Reports",
      "display" : "medical test results, including laboratory and other diagnostic results and related reports"
    }]
  }],
  "subject" : {
    "reference" : "http://example.org/fhir/Patient/example-patient",
    "display" : "Jan Jansen"
  },
  "date" : "2026-03-01T09:15:00+01:00",
  "custodian" : {
    "reference" : "http://example.org/fhir/Organization/example-hospital",
    "display" : "Amsterdam University Medical Center"
  },
  "content" : [{
    "attachment" : {
      "contentType" : "application/fhir+json",
      "url" : "http://example.org/fhir/Bundle/lab-report-jan-jansen",
      "creation" : "2026-03-01T09:15:00+01:00"
    },
    "format" : {
      "system" : "urn:ietf:rfc:3986",
      "code" : "http://hl7.eu/fhir/laboratory/StructureDefinition/Bundle-eu-lab"
    }
  }]
}

```
