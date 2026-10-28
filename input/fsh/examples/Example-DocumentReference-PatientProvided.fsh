// Example DocumentReferences for patient-provided documents (EHDS Article 5)
// Illustrates actual authorship, submission metadata, and existing document relationships.
// meta.source and the PATRPT security label are illustrative choices, not requirements.
// The shared patient/representative-submission convention remains to be defined.

Instance: example-documentreference-patient-provided
InstanceOf: DocumentReference
Title: "Example - Patient-Authored DocumentReference (Article 5)"
Description: """
Informative example of a persisted DocumentReference for a document authored and submitted
by the natural person. The referenced content is assumed to conform to the applicable
EEHRxF content IG; the document payload is not included. This is not a complete ITI-105 request.

The `author` references the Patient because that person authored this document.
An authorized correction can use the established replacement lifecycle, retaining the
original submission as historical material. Authorization and propagated lifecycle effects
need to be checked to protect professionally inserted data; see
[Non-Alteration](patient-provided-data.html#non-alteration-of-professional-data).

In this example, `meta.source` identifies the submitting health data access service and
`securityLabel` uses `PATRPT` to illustrate patient- or representative-provided submission,
independently of actual authorship. These are illustrative choices, not a convention mandated
by this IG; they do not establish the submitting person's identity or authority. A shared
machine-readable convention remains to be agreed. See
[Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents).
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

// Author: the patient who authored this document
* author.reference = "http://example.org/fhir/Patient/example-patient"
* author.display = "Jan Jansen"
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
Informative example of a persisted DocumentReference for a practitioner-authored patient
summary obtained outside the EHDS realm and submitted unchanged by the patient. The referenced
content is assumed to conform to the applicable EEHRxF content IG; the payload is not included.
This is not a complete ITI-105 request.

The `author` references the Practitioner who authored the document. Submitting a document
does not make the Patient its author. The Patient in `subject` identifies whose health record
the document concerns, not who submitted it. The document creation time predates this
submission's DocumentReference creation time.

In this example, `meta.source` identifies the submitting health data access service and
`securityLabel` uses `PATRPT` to illustrate patient- or representative-provided submission,
independently of actual authorship. These are illustrative choices, not a convention mandated
by this IG; they do not establish the submitting person's identity or authority. A shared
machine-readable convention remains to be agreed. See
[Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents).
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
Informative example of a persisted DocumentReference for information authored and submitted
by a representative on behalf of the natural person. The `author` references a RelatedPerson
solely to illustrate actual authorship in this example; it does not encode representative
authority or establish a general representative-submission model.

Implementations need to verify representative authority through the applicable proxy-service
and user-level authorization arrangements; see [Representatives](patient-provided-data.html#representatives).
The referenced content is assumed to conform to the applicable content IG; the payload is not
included. This is not a complete ITI-105 request.

In this example, `meta.source` identifies the submitting health data access service and
`securityLabel` uses `PATRPT` to illustrate patient- or representative-provided submission,
independently of actual authorship. These are illustrative choices, not a convention mandated
by this IG; they do not establish the submitting person's identity or authority. A shared
machine-readable convention remains to be agreed. See
[Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents).
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

// Author: the person who authored this document, independently of representative authority
* author.reference = "http://example.org/fhir/RelatedPerson/example-relatedperson"
* author.display = "Maria Jansen (mother)"
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
Informative illustration of the existing `appends` relationship: a new document containing
personal notes is linked to an existing professional document without replacing, superseding,
or rewriting that document. This example illustrates persisted relationship metadata only;
it does not define a content model for patient notes or include a clinical payload or complete
ITI-105 request. Content standardization for such notes remains future work.

In this example, `meta.source` identifies the submitting health data access service and
`securityLabel` uses `PATRPT` to illustrate patient- or representative-provided submission,
independently of actual authorship. These are illustrative choices, not a convention mandated
by this IG; they do not establish the submitting person's identity or authority. A shared
machine-readable convention remains to be agreed. See
[Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents).
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
Informative illustration of the existing `transforms` relationship: a patient submits a
separate FHIR representation of a professional patient summary originally represented in CDA.
The referenced FHIR content is assumed to conform to the applicable EEHRxF content IG.
This example shows persisted metadata, not the payload or a complete ITI-105 request.

The relationship links the new representation to its source without replacing, superseding,
or rewriting the source document. It does not authorize the receiver to convert or overwrite
the submission. The original clinical author remains identified; submission and conversion
attribution are separate concerns. The transformation adds no patient commentary.

A transformation with replacement cannot be used by the patient submission path to supersede
this professionally inserted source document; see [Non-Alteration](patient-provided-data.html#non-alteration-of-professional-data).

In this example, `meta.source` identifies the submitting health data access service and
`securityLabel` uses `PATRPT` to illustrate patient- or representative-provided submission,
independently of actual authorship. These are illustrative choices, not a convention mandated
by this IG; they do not establish the submitting person's identity or authority. A shared
machine-readable convention remains to be agreed. See
[Distinguishing Patient-Provided Documents](patient-provided-data.html#distinguishing-patient-provided-documents).
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
