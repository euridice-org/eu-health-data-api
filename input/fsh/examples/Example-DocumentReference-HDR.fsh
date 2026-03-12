// Example DocumentReference for Hospital Discharge Report

Instance: ExampleDocumentReferenceHDR
InstanceOf: EehrxfMhdDocumentReference
Title: "Example - Hospital Discharge Report DocumentReference"
Description: """
Example DocumentReference for a hospital discharge report.

**Example query:**
```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|18842-5
```
"""
Usage: #example

* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.9"
* masterIdentifier.value = "urn:uuid:d4e5f6a7-b8c9-0123-def0-234567890123"
* status = #current
* category = EEHRxFDocumentPriorityCategoryCS#Discharge-Reports "discharge reports"
* type = $loinc#18842-5 "Discharge summary"
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"
* date = "2026-02-28T16:00:00+01:00"
* custodian.reference = "http://example.org/fhir/Organization/example-hospital"
* custodian.display = "Amsterdam University Medical Center"
* content.attachment.contentType = #application/fhir+json
* content.attachment.url = "http://example.org/fhir/Bundle/hdr-jan-jansen"
* content.attachment.creation = "2026-02-28T16:00:00+01:00"
* content.format = urn:ietf:rfc:3986#http://hl7.eu/fhir/hdr/StructureDefinition/bundle-eu-hdr
