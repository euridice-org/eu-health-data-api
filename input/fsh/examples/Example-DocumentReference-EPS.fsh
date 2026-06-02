// Example DocumentReference for European Patient Summary
// Identified by type (60591-5) alone — no .category.
// See: https://github.com/euridice-org/eu-health-data-api/issues/49

Instance: ExampleDocumentReferenceEPS
InstanceOf: EehrxfMhdDocumentReference
Title: "Example - European Patient Summary DocumentReference"
Description: """
Example DocumentReference for an EPS document.

The Patient Summary is identified by `type` alone — `60591-5` (LOINC document type). It carries no `.category`: the summary is a single fixed type, not a coarse class to filter on.

**Example query to find this document by type:**
```
GET [base]/DocumentReference?patient=Patient/example-patient&type=http://loinc.org|60591-5
```
"""
Usage: #example

* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.9" // OID 2.999 is reserved for examples
* masterIdentifier.value = "urn:uuid:7d5bb8ac-68ee-4926-85e7-b8aac8e1f09d"
* status = #current

// No .category: the Patient Summary is identified by type alone.

// Type: LOINC document type (clinical precision)
* type = $loinc#60591-5 "Patient summary Document"

// Subject: Reference to patient (required 1..1)
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"

// Date: When the document was created (required 1..1)
* date = "2026-01-15T10:30:00+01:00"

// Author: Who created the document
* author.reference = "http://example.org/fhir/Practitioner/example-practitioner"
* author.display = "Dr. Maria Schmidt"

// Custodian: Organization responsible for the document (required 1..1)
* custodian.reference = "http://example.org/fhir/Organization/example-hospital"
* custodian.display = "Amsterdam University Medical Center"

// Description: Human-readable description
* description = "International Patient Summary for Jan Jansen"

// Content: The actual document reference
* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #en
* content.attachment.url = "http://example.org/fhir/Bundle/eps-jan-jansen"
* content.attachment.title = "European Patient Summary"
* content.attachment.creation = "2026-01-15T10:30:00+01:00"
* content.format = urn:ietf:rfc:3986#http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips
