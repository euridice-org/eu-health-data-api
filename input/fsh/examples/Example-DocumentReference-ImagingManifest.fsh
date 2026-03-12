// Example DocumentReferences for Imaging Study Manifest (dual-DocumentReference pattern)
// Demonstrates Option 2 from #50: two DocumentReferences linked via relatesTo.transforms
// One for the FHIR ImagingStudy manifest, one for the DICOM KOS manifest.
// See: https://github.com/euridice-org/eu-health-data-api/issues/50

Instance: ExampleDocumentReferenceImagingManifestFHIR
InstanceOf: EehrxfMhdDocumentReference
Title: "Example - Imaging Study Manifest (FHIR)"
Description: """
Example DocumentReference for a FHIR-encoded imaging study manifest.

This is one half of the dual-DocumentReference pattern for imaging manifests.
The FHIR manifest DocumentReference is linked to its DICOM KOS counterpart
via `relatesTo.code = transforms`.

**Example query to find imaging manifests by type:**
```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|18748-4&status=current
```
"""
Usage: #example

* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.9"
* masterIdentifier.value = "urn:uuid:a1b2c3d4-e5f6-7890-abcd-ef1234567890"
* status = #current

// Category: EHDS Priority Category (informative)
* category = EEHRxFDocumentPriorityCategoryCS#Medical-Imaging "medical imaging studies and related imaging reports"

// Type: LOINC code for imaging study manifest
* type = $loinc#18748-4 "Diagnostic imaging study"

// Subject
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"

// Date
* date = "2026-02-20T14:00:00+01:00"

// Author
* author.reference = "http://example.org/fhir/Organization/example-radiology-dept"
* author.display = "Radiology Department, Amsterdam UMC"

// Custodian
* custodian.reference = "http://example.org/fhir/Organization/example-hospital"
* custodian.display = "Amsterdam University Medical Center"

// Description
* description = "FHIR ImagingStudy manifest for CT Chest study"

// Link to DICOM KOS counterpart
* relatesTo.code = #transforms
* relatesTo.target = Reference(ExampleDocumentReferenceImagingManifestKOS)

// Content: FHIR ImagingStudy manifest
* content.attachment.contentType = #application/fhir+json
* content.attachment.url = "http://example.org/fhir/ImagingStudy/ct-chest-study"
* content.attachment.title = "CT Chest - FHIR Manifest"
* content.attachment.creation = "2026-02-20T14:00:00+01:00"
* content.format = urn:ietf:rfc:3986#http://hl7.eu/fhir/imaging-r5/StructureDefinition/ImagingStudyEu


Instance: ExampleDocumentReferenceImagingManifestKOS
InstanceOf: EehrxfMhdDocumentReference
Title: "Example - Imaging Study Manifest (DICOM KOS)"
Description: """
Example DocumentReference for a DICOM KOS-encoded imaging study manifest.

This is one half of the dual-DocumentReference pattern for imaging manifests.
The DICOM KOS DocumentReference is linked to its FHIR manifest counterpart
via `relatesTo.code = transforms`.
"""
Usage: #example

* masterIdentifier.system = "urn:oid:2.999.3.4.5.6.7.8.9"
* masterIdentifier.value = "urn:uuid:b2c3d4e5-f6a7-8901-bcde-f12345678901"
* status = #current

// Category: EHDS Priority Category (informative)
* category = EEHRxFDocumentPriorityCategoryCS#Medical-Imaging "medical imaging studies and related imaging reports"

// Type: LOINC code for imaging study manifest
* type = $loinc#18748-4 "Diagnostic imaging study"

// Subject
* subject.reference = "http://example.org/fhir/Patient/example-patient"
* subject.display = "Jan Jansen"

// Date
* date = "2026-02-20T14:00:00+01:00"

// Author
* author.reference = "http://example.org/fhir/Organization/example-radiology-dept"
* author.display = "Radiology Department, Amsterdam UMC"

// Custodian
* custodian.reference = "http://example.org/fhir/Organization/example-hospital"
* custodian.display = "Amsterdam University Medical Center"

// Description
* description = "DICOM KOS manifest for CT Chest study"

// Link to FHIR manifest counterpart
* relatesTo.code = #transforms
* relatesTo.target = Reference(ExampleDocumentReferenceImagingManifestFHIR)

// Content: DICOM KOS
* content.attachment.contentType = #application/dicom
* content.attachment.url = "http://example.org/wado-rs/studies/1.2.840.113619.2.55.3.604688119.969.1234567890.123/series/1.2.840.113619.2.55.3.604688119.969.1234567890.124/instances/1.2.840.113619.2.55.3.604688119.969.1234567890.125"
* content.attachment.title = "CT Chest - DICOM KOS"
* content.attachment.creation = "2026-02-20T14:00:00+01:00"
* content.format = http://dicom.nema.org/resources/ontology/DCMUID#1.2.840.10008.5.1.4.1.1.88.59 "Key Object Selection Document"
