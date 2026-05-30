Profile: EehrxfMhdDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Title: "EEHRxF MHD DocumentReference Profile"
Description: """
Profile for DocumentReference resources used in the EEHRxF context. Derived from the IHE MHD Minimal DocumentReference profile; element requirements are expressed structurally in this StructureDefinition, not as narrative-only conformance statements.

Minimal is the profile the MHD Document Responder (ITI-67) declares, so it is the correct query-side baseline. This profile cherry-picks selected Comprehensive constraints and excludes `securityLabel`, following the IHE MADO pattern.

**Search Strategy**:
- `type`: precise document type for discovery. `EEHRxFDocumentTypeVS` (LOINC) is **preferred**, so broader LOINC or other type codings stay conformant. See [Document Exchange](document-exchange.html) for type codes per EHDS priority category.
- `category`: broad classification for coarse discovery. Bound **extensible** to `EHDSPriorityCategoryVS` (LOINC Document Class) for the EHDS context; broader codings remain conformant.

`category` is one element (`0..1`, MHD Minimal cap), but a CodeableConcept whose `coding` is `0..*`. Multiple category codings — EHDS priority LOINC plus XDS classCode, SNOMED, or national — ride in the one element for multi-scheme categorization.

See [Document Exchange](document-exchange.html) for query examples.
"""
* insert SetFmmAndStatusRule( 1, draft )
* category 0..1
* category MS
* category from EHDSPriorityCategoryVS (extensible)
* type MS
* type from EEHRxFDocumentTypeVS (preferred)
* subject 1..1
* subject only Reference( http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core )
* date 0..1
* custodian 0..1