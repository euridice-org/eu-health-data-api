// Example DocumentReferences for patient-provided documents (EHDS Article 5)
// Demonstrates the distinguishability marking specified on the Patient-Provided Data page:
// author = actual document author(s), securityLabel = PATRPT, meta.source = originating system

Instance: example-documentreference-patient-provided
InstanceOf: DocumentReference
Title: "Example - Patient-Provided DocumentReference (Article 5)"
Description: """
Example DocumentReference for a document inserted by the natural person under EHDS Article 5,
as submitted via ITI-105 Simplified Publish and persisted by a Document Access Provider
implementing the Document Submission Option.

The distinguishability marking (see [Patient-Provided Data](patient-provided-data.html#distinguishing-patient-provided-documents)):
- `author` references the **Patient** because the natural person authored this example document
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

In this example, `author` references a **RelatedPerson** because the representative authored
the document. The `PATRPT` label is the same for all documents submitted through the Article 5
channel. If the representative submitted a document authored by somebody else, the original
author would remain in `author` and an accompanying Provenance could identify the representative
as the submitting agent.

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

// Security label: submitted through the Article 5 patient insertion channel
* securityLabel = $v3-ObservationValue#PATRPT "patient reported"

* description = "Health information provided by Maria Jansen on behalf of Jan Jansen via the national health data access service"

* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #en
* content.attachment.url = "http://example.org/fhir/Bundle/representative-provided-jan-jansen"
* content.attachment.title = "Representative-provided health information"
* content.attachment.creation = "2026-08-01T10:40:00+02:00"


Instance: example-documentreference-patient-appended-notes
InstanceOf: DocumentReference
Title: "Example - Patient Notes Appended to a Professional Document (Article 5)"
Description: """
Example of a new patient-provided document that adds personal notes to an existing professional
document. The `appends` relationship preserves the link between the documents without replacing,
superseding, or otherwise altering the professional document.
"""
Usage: #example

* meta.source = "http://example.org/hdas/national-health-portal"
* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.12" // OID 2.999 is reserved for examples
* masterIdentifier.value = "urn:uuid:2a4d6f80-1357-49bd-8ace-2468ace13579"
* status = #current
* type = $loinc#51855-5 "Patient Note"
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"
* date = "2026-08-01T11:05:00+02:00"
* author.reference = "http://example.org/fhir/Patient/example-patient"
* author.display = "Jan Jansen"
* securityLabel = $v3-ObservationValue#PATRPT "patient reported"
* relatesTo.code = #appends
* relatesTo.target.reference = "http://example.org/fhir/DocumentReference/professional-care-plan"
* relatesTo.target.display = "Professional care plan"
* description = "Personal notes appended to the professional care plan"
* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #en
* content.attachment.url = "http://example.org/fhir/Bundle/patient-appended-notes-jan-jansen"
* content.attachment.title = "Patient notes on professional care plan"
* content.attachment.creation = "2026-08-01T11:05:00+02:00"
