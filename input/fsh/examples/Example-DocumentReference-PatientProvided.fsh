// Example DocumentReferences for patient-provided documents (EHDS Article 5)
// Demonstrates the distinguishability marking specified on the Patient-Provided Data page:
// author = Patient/RelatedPerson, securityLabel = PATRPT/SDMRPT, meta.source = originating system

Instance: example-documentreference-patient-provided
InstanceOf: DocumentReference
Title: "Example - Patient-Provided DocumentReference (Article 5)"
Description: """
Example DocumentReference for a document inserted by the natural person under EHDS Article 5,
as submitted via ITI-105 Simplified Publish and persisted by a Document Access Provider
implementing the Document Submission Option.

The distinguishability marking (see [Patient-Provided Data](patient-provided-data.html#distinguishing-patient-provided-documents)):
- `author` references the **Patient** (the natural person who inserted the information)
- `securityLabel` carries `PATRPT` (patient reported) from v3-ObservationValue
- `meta.source` identifies the originating system (here, a health data access service)

To correct or withdraw this submission, the person submits a new document with
`relatesTo.code = replaces` targeting this DocumentReference; the Access Provider marks
this one `superseded`. Replacement of documents that are not themselves patient-provided
is rejected (see [Non-Alteration](patient-provided-data.html#non-alteration-of-professional-data)).
"""
Usage: #example

* meta.source = "http://example.org/hdas/national-health-portal"
* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.10" // OID 2.999 is reserved for examples
* masterIdentifier.value = "urn:uuid:0b6f5a1e-2c34-4c6f-9f5d-1a2b3c4d5e6f"
* status = #current

// Type: LOINC code (clinical precision); the applicable content IG governs the document content
* type = $loinc#60591-5 "Patient summary Document"

// Subject: the natural person the record belongs to
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"

// Date: when the DocumentReference was created
* date = "2026-08-01T09:15:00+02:00"

// Author: the natural person who inserted the information (Article 5 distinguishability)
* author.reference = "http://example.org/fhir/Patient/example-patient"
* author.display = "Jan Jansen"

// Security label: patient reported (v3-ObservationValue provenance code)
* securityLabel = $v3-ObservationValue#PATRPT "patient reported"

* description = "Patient-provided health information submitted by Jan Jansen via the national health data access service"

// Content: the actual document reference
* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #en
* content.attachment.url = "http://example.org/fhir/Bundle/patient-provided-jan-jansen"
* content.attachment.title = "Patient-provided health information"
* content.attachment.creation = "2026-08-01T09:15:00+02:00"


Instance: example-documentreference-representative-provided
InstanceOf: DocumentReference
Title: "Example - Representative-Provided DocumentReference (Article 5)"
Description: """
Example DocumentReference for a document inserted by a representative referred to in
EHDS Article 4(2) — for example a parent, guardian, or authorized proxy — on behalf of
the natural person.

The distinguishability marking differs from the patient-provided case in two elements:
- `author` references a **RelatedPerson** (the representative), not the Patient
- `securityLabel` carries `SDMRPT` (substitute decision maker reported) instead of `PATRPT`

Verifying the representative's authority is a Member State proxy-service and user-level
authorization concern, out of scope for this IG (see
[Representatives](patient-provided-data.html#representatives)).
"""
Usage: #example

* meta.source = "http://example.org/hdas/national-health-portal"
* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.11" // OID 2.999 is reserved for examples
* masterIdentifier.value = "urn:uuid:9d8c7b6a-5f4e-4d3c-8b2a-1f0e9d8c7b6a"
* status = #current

* type = $loinc#60591-5 "Patient summary Document"

// Subject: the natural person the record belongs to
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"

* date = "2026-08-01T10:40:00+02:00"

// Author: the Article 4(2) representative (RelatedPerson)
* author.reference = "http://example.org/fhir/RelatedPerson/example-relatedperson"
* author.display = "Maria Jansen (mother)"

// Security label: substitute decision maker reported (v3-ObservationValue provenance code)
* securityLabel = $v3-ObservationValue#SDMRPT "substitute decision maker reported"

* description = "Health information provided by Maria Jansen on behalf of Jan Jansen via the national health data access service"

* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #en
* content.attachment.url = "http://example.org/fhir/Bundle/representative-provided-jan-jansen"
* content.attachment.title = "Representative-provided health information"
* content.attachment.creation = "2026-08-01T10:40:00+02:00"
