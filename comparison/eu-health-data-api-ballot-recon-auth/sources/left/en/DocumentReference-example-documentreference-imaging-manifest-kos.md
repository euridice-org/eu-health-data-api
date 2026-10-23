# Example - Imaging Study Manifest (DICOM KOS) - EU Health Data API v1.0.0-ballot

## Example DocumentReference: Example - Imaging Study Manifest (DICOM KOS)

**masterIdentifier**: `urn:oid:2.999.3.4.5.6.7.8.9`/urn:uuid:b2c3d4e5-f6a7-8901-bcde-f12345678901

**status**: Current

**type**: Diagnostic imaging study

**category**: medical imaging studies and related imaging reports

**subject**: [Jan Jansen](http://example.org/fhir/Patient/example-patient)

**date**: 2026-02-20 14:00:00+0100

**author**: [Radiology Department, Amsterdam UMC](http://example.org/fhir/Organization/example-radiology-dept)

**custodian**: [Amsterdam University Medical Center](http://example.org/fhir/Organization/example-hospital)

### RelatesTos

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Target** |
| * | Transforms | [DocumentReference: masterIdentifier = urn:oid:2.999.3.4.5.6.7.8.9#urn:uuid:a1b2c3d4-e5f6-7890-abcd-ef1234567890; status = current; type = Diagnostic imaging study; category = medical imaging studies and related imaging reports; date = 2026-02-20 14:00:00+0100; description = FHIR ImagingStudy manifest for CT Chest study](DocumentReference-example-documentreference-imaging-manifest-fhir.md) |

**description**: DICOM KOS manifest for CT Chest study

> **content**

### Attachments

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **ContentType** | **Url** | **Title** | **Creation** |
| * | application/dicom | [http://example.org/wado-rs/studies/1.2.840.113619.2.55.3.604688119.969.1234567890.123/series/1.2.840.113619.2.55.3.604688119.969.1234567890.124/instances/1.2.840.113619.2.55.3.604688119.969.1234567890.125](http://example.org/wado-rs/studies/1.2.840.113619.2.55.3.604688119.969.1234567890.123/series/1.2.840.113619.2.55.3.604688119.969.1234567890.124/instances/1.2.840.113619.2.55.3.604688119.969.1234567890.125) | CT Chest - DICOM KOS | 2026-02-20 14:00:00+0100 |

**format**: DCMUID: 1.2.840.10008.5.1.4.1.1.88.59 (Key Object Selection Document)



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-documentreference-imaging-manifest-kos",
  "masterIdentifier" : {
    "system" : "urn:oid:2.999.3.4.5.6.7.8.9",
    "value" : "urn:uuid:b2c3d4e5-f6a7-8901-bcde-f12345678901"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "18748-4",
      "display" : "Diagnostic imaging study"
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
  "date" : "2026-02-20T14:00:00+01:00",
  "author" : [{
    "reference" : "http://example.org/fhir/Organization/example-radiology-dept",
    "display" : "Radiology Department, Amsterdam UMC"
  }],
  "custodian" : {
    "reference" : "http://example.org/fhir/Organization/example-hospital",
    "display" : "Amsterdam University Medical Center"
  },
  "relatesTo" : [{
    "code" : "transforms",
    "target" : {
      "reference" : "DocumentReference/example-documentreference-imaging-manifest-fhir"
    }
  }],
  "description" : "DICOM KOS manifest for CT Chest study",
  "content" : [{
    "attachment" : {
      "contentType" : "application/dicom",
      "url" : "http://example.org/wado-rs/studies/1.2.840.113619.2.55.3.604688119.969.1234567890.123/series/1.2.840.113619.2.55.3.604688119.969.1234567890.124/instances/1.2.840.113619.2.55.3.604688119.969.1234567890.125",
      "title" : "CT Chest - DICOM KOS",
      "creation" : "2026-02-20T14:00:00+01:00"
    },
    "format" : {
      "system" : "http://dicom.nema.org/resources/ontology/DCMUID",
      "code" : "1.2.840.10008.5.1.4.1.1.88.59",
      "display" : "Key Object Selection Document"
    }
  }]
}

```
