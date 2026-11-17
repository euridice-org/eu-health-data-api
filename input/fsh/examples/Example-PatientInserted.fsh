// Informative EHDS Article 5 examples: a practitioner-authored document inserted by the patient.
// The PATRPT security label marks the patient insertion; the practitioner remains the author.
// See patient-provided-data.md.

Instance: example-patient-inserted-document
InstanceOf: Bundle
Title: "Example - Patient-Inserted Document (Article 5)"
Description: """
A practitioner-authored FHIR document that the patient inserted into their record, for example
after downloading it through a health data access service. `PATRPT` (patient reported) in
`Bundle.meta.security` and `Composition.meta.security` marks the insertion. The original
practitioner remains the Composition author. Clinical content is illustrative and governed by
the applicable content IG.
"""
Usage: #example
* meta.security = $v3-ObservationValue#PATRPT "patient reported"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:3f1c2a6e-5b7d-4e8a-9c1f-2d6b8e4a7c10"
* type = #document
* timestamp = "2026-01-15T10:30:00+01:00"
* entry[0].fullUrl = "urn:uuid:5a9e7c3b-1d2f-4b6a-8e0c-7f3d9b1a2c45"
* entry[0].resource = example-patient-inserted-composition
* entry[1].fullUrl = "urn:uuid:8c2d4f6a-0b1e-4c3d-9a5f-6e7b8c9d0a12"
* entry[1].resource = example-patient-inserted-patient
* entry[2].fullUrl = "urn:uuid:1b3d5f7a-9c2e-4a6b-8d0f-3e5a7c9b1d24"
* entry[2].resource = example-patient-inserted-practitioner

Instance: example-patient-inserted-composition
InstanceOf: Composition
Usage: #inline
* meta.security = $v3-ObservationValue#PATRPT "patient reported"
* status = #final
* type = $loinc#60591-5 "Patient summary Document"
* subject.reference = "urn:uuid:8c2d4f6a-0b1e-4c3d-9a5f-6e7b8c9d0a12"
* date = "2026-01-15T10:30:00+01:00"
* author.reference = "urn:uuid:1b3d5f7a-9c2e-4a6b-8d0f-3e5a7c9b1d24"
* title = "Patient Summary"

Instance: example-patient-inserted-patient
InstanceOf: Patient
Usage: #inline
* name.family = "Jansen"
* name.given = "Jan"

Instance: example-patient-inserted-practitioner
InstanceOf: Practitioner
Usage: #inline
* name.family = "Schmidt"
* name.given = "Maria"
* name.prefix = "Dr."

Instance: example-patient-inserted-iti105
InstanceOf: DocumentReference
Title: "Example - ITI-105 Simplified Publish of a Patient-Inserted Document (Article 5)"
Description: """
The DocumentReference a health data access service, acting as Document Publisher, submits with
ITI-105 Simplified Publish for the [patient-inserted document](Bundle-example-patient-inserted-document.html).
The document is embedded in `content.attachment.data`. `author` is the original practitioner;
`securityLabel` mirrors the document's `PATRPT` label.

```
POST [base]/DocumentReference
Content-Type: application/fhir+json
```
"""
Usage: #example
* meta.profile = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.SimplifiedPublish.DocumentReference"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:3f1c2a6e-5b7d-4e8a-9c1f-2d6b8e4a7c10"
* status = #current
* type = $loinc#60591-5 "Patient summary Document"
* category = DocumentPriorityCategoryEuApiCS#Patient-Summaries "patient summaries"
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"
* date = "2026-03-02T09:00:00+01:00"
* author.reference = "http://example.org/fhir/Practitioner/example-practitioner"
* author.display = "Dr. Maria Schmidt"
* securityLabel = $v3-ObservationValue#PATRPT "patient reported"
* content.attachment.contentType = #application/fhir+json
* content.attachment.data = "eyJyZXNvdXJjZVR5cGUiOiJCdW5kbGUiLCJpZCI6ImV4YW1wbGUtcGF0aWVudC1pbnNlcnRlZC1kb2N1bWVudCIsIm1ldGEiOnsic2VjdXJpdHkiOlt7ImNvZGUiOiJQQVRSUFQiLCJzeXN0ZW0iOiJodHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL3YzLU9ic2VydmF0aW9uVmFsdWUiLCJkaXNwbGF5IjoicGF0aWVudCByZXBvcnRlZCJ9XX0sImlkZW50aWZpZXIiOnsic3lzdGVtIjoidXJuOmlldGY6cmZjOjM5ODYiLCJ2YWx1ZSI6InVybjp1dWlkOjNmMWMyYTZlLTViN2QtNGU4YS05YzFmLTJkNmI4ZTRhN2MxMCJ9LCJlbnRyeSI6W3siZnVsbFVybCI6InVybjp1dWlkOjVhOWU3YzNiLTFkMmYtNGI2YS04ZTBjLTdmM2Q5YjFhMmM0NSIsInJlc291cmNlIjp7InJlc291cmNlVHlwZSI6IkNvbXBvc2l0aW9uIiwiaWQiOiJleGFtcGxlLXBhdGllbnQtaW5zZXJ0ZWQtY29tcG9zaXRpb24iLCJtZXRhIjp7InNlY3VyaXR5IjpbeyJjb2RlIjoiUEFUUlBUIiwic3lzdGVtIjoiaHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS92My1PYnNlcnZhdGlvblZhbHVlIiwiZGlzcGxheSI6InBhdGllbnQgcmVwb3J0ZWQifV19LCJzdWJqZWN0Ijp7InJlZmVyZW5jZSI6InVybjp1dWlkOjhjMmQ0ZjZhLTBiMWUtNGMzZC05YTVmLTZlN2I4YzlkMGExMiJ9LCJhdXRob3IiOlt7InJlZmVyZW5jZSI6InVybjp1dWlkOjFiM2Q1ZjdhLTljMmUtNGE2Yi04ZDBmLTNlNWE3YzliMWQyNCJ9XSwic3RhdHVzIjoiZmluYWwiLCJ0eXBlIjp7ImNvZGluZyI6W3siY29kZSI6IjYwNTkxLTUiLCJzeXN0ZW0iOiJodHRwOi8vbG9pbmMub3JnIiwiZGlzcGxheSI6IlBhdGllbnQgc3VtbWFyeSBEb2N1bWVudCJ9XX0sImRhdGUiOiIyMDI2LTAxLTE1VDEwOjMwOjAwKzAxOjAwIiwidGl0bGUiOiJQYXRpZW50IFN1bW1hcnkifX0seyJmdWxsVXJsIjoidXJuOnV1aWQ6OGMyZDRmNmEtMGIxZS00YzNkLTlhNWYtNmU3YjhjOWQwYTEyIiwicmVzb3VyY2UiOnsicmVzb3VyY2VUeXBlIjoiUGF0aWVudCIsImlkIjoiZXhhbXBsZS1wYXRpZW50LWluc2VydGVkLXBhdGllbnQiLCJuYW1lIjpbeyJnaXZlbiI6WyJKYW4iXSwiZmFtaWx5IjoiSmFuc2VuIn1dfX0seyJmdWxsVXJsIjoidXJuOnV1aWQ6MWIzZDVmN2EtOWMyZS00YTZiLThkMGYtM2U1YTdjOWIxZDI0IiwicmVzb3VyY2UiOnsicmVzb3VyY2VUeXBlIjoiUHJhY3RpdGlvbmVyIiwiaWQiOiJleGFtcGxlLXBhdGllbnQtaW5zZXJ0ZWQtcHJhY3RpdGlvbmVyIiwibmFtZSI6W3siZ2l2ZW4iOlsiTWFyaWEiXSwicHJlZml4IjpbIkRyLiJdLCJmYW1pbHkiOiJTY2htaWR0In1dfX1dLCJ0eXBlIjoiZG9jdW1lbnQiLCJ0aW1lc3RhbXAiOiIyMDI2LTAxLTE1VDEwOjMwOjAwKzAxOjAwIn0="
* content.attachment.title = "Patient Summary"
* content.attachment.creation = "2026-01-15T10:30:00+01:00"

Instance: example-patient-inserted-persisted
InstanceOf: DocumentReference
Title: "Example - Persisted Patient-Inserted DocumentReference (Article 5)"
Description: """
The DocumentReference a Document Access Provider holds after receiving the
[ITI-105 request](DocumentReference-example-patient-inserted-iti105.html). The `PATRPT` label is
retained so Document Consumers can recognize the patient insertion.
"""
Usage: #example
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:3f1c2a6e-5b7d-4e8a-9c1f-2d6b8e4a7c10"
* status = #current
* type = $loinc#60591-5 "Patient summary Document"
* category = DocumentPriorityCategoryEuApiCS#Patient-Summaries "patient summaries"
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"
* date = "2026-03-02T09:00:00+01:00"
* author.reference = "http://example.org/fhir/Practitioner/example-practitioner"
* author.display = "Dr. Maria Schmidt"
* securityLabel = $v3-ObservationValue#PATRPT "patient reported"
* content.attachment.contentType = #application/fhir+json
* content.attachment.url = "http://example.org/fhir/Binary/patient-inserted-summary-jan-jansen"
* content.attachment.title = "Patient Summary"
* content.attachment.creation = "2026-01-15T10:30:00+01:00"

Instance: example-patient-inserted-searchset
InstanceOf: Bundle
Title: "Example - ITI-67 Query Result with a Patient-Inserted Document (Article 5)"
Description: """
An ITI-67 Find Document References result for the patient. It contains the
[patient-inserted document](DocumentReference-example-patient-inserted-persisted.html), labeled
`PATRPT`, and a [clinician-published Patient Summary](DocumentReference-example-documentreference-eps.html)
without that label. A Document Consumer can use `securityLabel` to tell them apart.

```
GET [base]/DocumentReference?patient=Patient/example-patient&category=https://euridice.ec.europa.eu/fhir/eehrxf/CodeSystem/document-priority-category-eu-api|Patient-Summaries
```
"""
Usage: #example
* type = #searchset
* total = 2
* link[0].relation = "self"
* link[0].url = "http://example.org/fhir/DocumentReference?patient=Patient/example-patient&category=https://euridice.ec.europa.eu/fhir/eehrxf/CodeSystem/document-priority-category-eu-api|Patient-Summaries"
* entry[0].fullUrl = "http://example.org/fhir/DocumentReference/example-patient-inserted-persisted"
* entry[0].resource = example-patient-inserted-persisted
* entry[0].search.mode = #match
* entry[1].fullUrl = "http://example.org/fhir/DocumentReference/example-documentreference-eps"
* entry[1].resource = example-documentreference-eps
* entry[1].search.mode = #match
