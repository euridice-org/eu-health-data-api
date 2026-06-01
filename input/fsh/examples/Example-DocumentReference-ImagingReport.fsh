// Example DocumentReference for Imaging Report
// Based on HL7 EU Imaging IG DocumentReferenceImagingReport profile

Instance: ExampleDocumentReferenceImagingReport
InstanceOf: EehrxfMhdDocumentReference
Title: "Example - Imaging Report DocumentReference"
Description: """
Example DocumentReference for a diagnostic imaging report.

**Example query:**
```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|85430-7
```
"""
Usage: #example

* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.9"
* masterIdentifier.value = "urn:uuid:e5f6a7b8-c9d0-1234-ef01-345678901234"
* status = #current
* category = EEHRxFDocumentPriorityCategoryCS#Medical-Imaging "medical imaging studies and related imaging reports"
* type = $loinc#85430-7 "Diagnostic imaging report"
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"
* date = "2026-02-20T15:30:00+01:00"
* custodian.reference = "http://example.org/fhir/Organization/example-hospital"
* custodian.display = "Amsterdam University Medical Center"
* content.attachment.contentType = #application/fhir+json
* content.attachment.url = "http://example.org/fhir/Bundle/imaging-report-jan-jansen"
* content.attachment.creation = "2026-02-20T15:30:00+01:00"
* content.format = urn:ietf:rfc:3986#http://hl7.eu/fhir/imaging-r5/StructureDefinition/BundleReportEuImaging
