// Example DocumentReferences for patient-provided documents (EHDS Article 5)
// Demonstrates the distinguishability marking specified on the Patient-Provided Data page:
// author = actual document author(s), securityLabel = PATRPT, meta.source = originating system

Instance: example-documentreference-patient-provided
InstanceOf: DocumentReference
Title: "Example - Patient-Authored DocumentReference (Article 5)"
Description: """
Example DocumentReference for a document authored and submitted by the natural person under EHDS Article 5,
as submitted via ITI-105 Simplified Publish and persisted by a Document Access Provider
implementing the Document Submission Option.

The distinguishability marking (see [Patient-Provided Data](patient-provided-data.html#distinguishing-patient-provided-documents)):
- `author` references the **Patient** because the natural person authored this example document
- `securityLabel` carries `PATRPT` (patient reported) from v3-ObservationValue
- `meta.source` identifies the originating system (here, a health data access service)

To correct this submission, an authorized person submits a new document with
`relatesTo.code = replaces` targeting this DocumentReference; the Access Provider marks
this one `superseded`. Authorization is established from the trusted submission context,
not the label and subject alone. Replacement is rejected if any affected document is not
an authorized prior patient-channel submission, including documents affected by propagated
lifecycle effects (see [Non-Alteration](patient-provided-data.html#non-alteration-of-professional-data)).
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

// Author: the patient who authored this document; submission is classified separately by PATRPT
* author.reference = "http://example.org/fhir/Patient/example-patient"
* author.display = "Jan Jansen"

// Security label: patient reported (v3-ObservationValue provenance code)
* securityLabel = $v3-ObservationValue#PATRPT "patient reported"

* description = "Health information authored and submitted by Jan Jansen via the national health data access service"

// Content: the actual document reference
* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #en
* content.attachment.url = "http://example.org/fhir/Bundle/patient-provided-jan-jansen"
* content.attachment.title = "Patient-authored health information"
* content.attachment.creation = "2026-08-01T09:15:00+02:00"


Instance: example-documentreference-patient-submitted
InstanceOf: DocumentReference
Title: "Example - Practitioner-Authored, Patient-Submitted DocumentReference (Article 5)"
Description: """
Example of an existing practitioner-authored patient summary obtained outside the EHDS realm
and submitted unchanged by the patient through the Article 5 insertion channel. The document
conforms to the applicable EEHRxF content IG. This example illustrates the persisted
DocumentReference; the document content is not included.

- `author` references the **Practitioner** who authored the document; the Patient is not added
  as an author merely because they submitted it
- `securityLabel` carries `PATRPT` because the patient submitted the document through the
  Article 5 channel, independently of its clinical authorship
- `meta.source` identifies the submitting health data access service

The Patient in `subject` identifies whose health record the document concerns, not who
submitted it. Optional Provenance may identify the Patient as the submitting agent.
The document creation time predates this submission's DocumentReference creation time.
"""
Usage: #example

* meta.source = "http://example.org/hdas/national-health-portal"
* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.14"
* masterIdentifier.value = "urn:uuid:45ec2173-29f4-46f7-983f-e2c0b8c571d6"
* status = #current
* type = $loinc#60591-5 "Patient summary Document"
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"
* date = "2026-08-01T09:45:00+02:00"

// Author: the practitioner who authored the document, independently of its submission by the patient
* author.reference = "http://example.org/fhir/Practitioner/example-practitioner"
* author.display = "Original clinical author"

// Security label: submitted through the Article 5 patient insertion channel
* securityLabel = $v3-ObservationValue#PATRPT "patient reported"
* description = "Practitioner-authored patient summary submitted unchanged by Jan Jansen via the national health data access service"
* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #en
* content.attachment.url = "http://example.org/fhir/Bundle/practitioner-authored-summary-jan-jansen"
* content.attachment.title = "Practitioner-authored patient summary"
* content.attachment.creation = "2026-07-20T14:00:00+02:00"


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


Instance: example-documentreference-patient-transformed
InstanceOf: DocumentReference
Title: "Example - Patient-Submitted Transformation of a Professional Document (Article 5)"
Description: """
Example of a patient-submitted alternative representation of an existing professional patient
summary, converted from CDA to a FHIR document conforming to the applicable EEHRxF content IG.
The `transforms` relationship links the new representation to the original document without
replacing, superseding, or changing the original document's content or status. This example
illustrates the persisted DocumentReference; the document content is not included.

The new DocumentReference carries `PATRPT` because it was submitted through the Article 5
channel. The known original clinical author remains in `author`; optional Provenance can
record the conversion activity and the submitting person. The transformation adds no patient
commentary; additional notes would use `appends` instead.

A transformation that also replaces the source is subject to the replacement restrictions
and cannot supersede this professionally inserted source document.
"""
Usage: #example

* meta.source = "http://example.org/hdas/national-health-portal"
* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.13"
* masterIdentifier.value = "urn:uuid:76db6351-89de-4f7e-a521-924c85702d34"
* status = #current
* type = $loinc#60591-5 "Patient summary Document"
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"
* date = "2026-08-01T11:30:00+02:00"
* author.reference = "http://example.org/fhir/Practitioner/example-practitioner"
* author.display = "Original clinical author"
* securityLabel = $v3-ObservationValue#PATRPT "patient reported"
* relatesTo.code = #transforms
* relatesTo.target.reference = "http://example.org/fhir/DocumentReference/professional-patient-summary-cda"
* relatesTo.target.display = "Original professional patient summary (CDA)"
* description = "Patient-submitted FHIR representation of a professional patient summary"
* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #en
* content.attachment.url = "http://example.org/fhir/Bundle/patient-transformed-summary-jan-jansen"
* content.attachment.title = "Patient-submitted patient summary (FHIR)"
* content.attachment.creation = "2026-08-01T11:30:00+02:00"
