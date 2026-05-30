// Example DocumentReference for Laboratory Report

Instance: ExampleDocumentReferenceLaboratory
InstanceOf: EehrxfMhdDocumentReference
Title: "Example - Laboratory Report DocumentReference"
Description: """
Example DocumentReference for a laboratory report.

**Example query:**
```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|11502-2
```
"""
Usage: #example

* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.9"
* masterIdentifier.value = "urn:uuid:c3d4e5f6-a7b8-9012-cdef-123456789012"
* status = #current
// Multi-scheme categorization: two codings in one category element
// (EHDS priority LOINC + XDS classCode), per multi-coding within 0..1.
* category.coding[+] = $loinc#26436-6 "Laboratory studies (set)"
* category.coding[+] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#LAB "Laboratory"
* type = $loinc#11502-2 "Laboratory report"
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"
* date = "2026-03-01T09:15:00+01:00"
* custodian.reference = "http://example.org/fhir/Organization/example-hospital"
* custodian.display = "Amsterdam University Medical Center"
* content.attachment.contentType = #application/fhir+json
* content.attachment.url = "http://example.org/fhir/Bundle/lab-report-jan-jansen"
* content.attachment.creation = "2026-03-01T09:15:00+01:00"
* content.format = urn:ietf:rfc:3986#http://hl7.eu/fhir/laboratory/StructureDefinition/Bundle-eu-lab
