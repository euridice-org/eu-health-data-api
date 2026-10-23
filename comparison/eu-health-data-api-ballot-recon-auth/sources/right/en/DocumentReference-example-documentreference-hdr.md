# Example - Hospital Discharge Report DocumentReference - EU Health Data API v1.0.0-ballot

## Example DocumentReference: Example - Hospital Discharge Report DocumentReference

**masterIdentifier**: `urn:oid:2.999.3.4.5.6.7.8.9`/urn:uuid:d4e5f6a7-b8c9-0123-def0-234567890123

**status**: Current

**type**: Discharge summary

**category**: discharge reports

**subject**: [Jan Jansen](http://example.org/fhir/Patient/example-patient)

**date**: 2026-02-28 16:00:00+0100

**custodian**: [Amsterdam University Medical Center](http://example.org/fhir/Organization/example-hospital)

> **content**

### Attachments

| | | | |
| :--- | :--- | :--- | :--- |
| - | **ContentType** | **Url** | **Creation** |
| * | application/fhir+json | [http://example.org/fhir/Bundle/hdr-jan-jansen](http://example.org/fhir/Bundle/hdr-jan-jansen) | 2026-02-28 16:00:00+0100 |

**format**: unknown: http://hl7.eu/fhir/hdr/StructureDefinition/bundle-eu-hdr (http://hl7.eu/fhir/hdr/StructureDefinition/bundle-eu-hdr)



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-documentreference-hdr",
  "masterIdentifier" : {
    "system" : "urn:oid:2.999.3.4.5.6.7.8.9",
    "value" : "urn:uuid:d4e5f6a7-b8c9-0123-def0-234567890123"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "18842-5",
      "display" : "Discharge summary"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://hl7.eu/fhir/health-data-api/CodeSystem/document-priority-category-eu-api",
      "code" : "Discharge-Reports",
      "display" : "discharge reports"
    }]
  }],
  "subject" : {
    "reference" : "http://example.org/fhir/Patient/example-patient",
    "display" : "Jan Jansen"
  },
  "date" : "2026-02-28T16:00:00+01:00",
  "custodian" : {
    "reference" : "http://example.org/fhir/Organization/example-hospital",
    "display" : "Amsterdam University Medical Center"
  },
  "content" : [{
    "attachment" : {
      "contentType" : "application/fhir+json",
      "url" : "http://example.org/fhir/Bundle/hdr-jan-jansen",
      "creation" : "2026-02-28T16:00:00+01:00"
    },
    "format" : {
      "system" : "urn:ietf:rfc:3986",
      "code" : "http://hl7.eu/fhir/hdr/StructureDefinition/bundle-eu-hdr"
    }
  }]
}

```
