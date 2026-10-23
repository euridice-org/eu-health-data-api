# Example - Imaging Report DocumentReference - EU Health Data API v1.0.0-ballot

## Example DocumentReference: Example - Imaging Report DocumentReference

**masterIdentifier**: `urn:oid:2.999.3.4.5.6.7.8.9`/urn:uuid:e5f6a7b8-c9d0-1234-ef01-345678901234

**status**: Current

**type**: Diagnostic imaging report

**category**: medical imaging studies and related imaging reports

**subject**: [Jan Jansen](http://example.org/fhir/Patient/example-patient)

**date**: 2026-02-20 15:30:00+0100

**custodian**: [Amsterdam University Medical Center](http://example.org/fhir/Organization/example-hospital)

> **content**

### Attachments

| | | | |
| :--- | :--- | :--- | :--- |
| - | **ContentType** | **Url** | **Creation** |
| * | application/fhir+json | [http://example.org/fhir/Bundle/imaging-report-jan-jansen](http://example.org/fhir/Bundle/imaging-report-jan-jansen) | 2026-02-20 15:30:00+0100 |

**format**: unknown: http://hl7.eu/fhir/imaging-r5/StructureDefinition/BundleReportEuImaging (http://hl7.eu/fhir/imaging-r5/StructureDefinition/BundleReportEuImaging)



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-documentreference-imaging-report",
  "masterIdentifier" : {
    "system" : "urn:oid:2.999.3.4.5.6.7.8.9",
    "value" : "urn:uuid:e5f6a7b8-c9d0-1234-ef01-345678901234"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "85430-7",
      "display" : "Diagnostic imaging report"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://hl7.eu/fhir/health-data-api/CodeSystem/document-priority-category-eu-api",
      "code" : "Medical-Imaging",
      "display" : "medical imaging studies and related imaging reports"
    }]
  }],
  "subject" : {
    "reference" : "http://example.org/fhir/Patient/example-patient",
    "display" : "Jan Jansen"
  },
  "date" : "2026-02-20T15:30:00+01:00",
  "custodian" : {
    "reference" : "http://example.org/fhir/Organization/example-hospital",
    "display" : "Amsterdam University Medical Center"
  },
  "content" : [{
    "attachment" : {
      "contentType" : "application/fhir+json",
      "url" : "http://example.org/fhir/Bundle/imaging-report-jan-jansen",
      "creation" : "2026-02-20T15:30:00+01:00"
    },
    "format" : {
      "system" : "urn:ietf:rfc:3986",
      "code" : "http://hl7.eu/fhir/imaging-r5/StructureDefinition/BundleReportEuImaging"
    }
  }]
}

```
