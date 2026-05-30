Profile: EehrxfMhdDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Title: "EEHRxF MHD DocumentReference Profile"
Description: """
Profile for DocumentReference resources used in the EEHRxF context. Derived from the IHE MHD Minimal DocumentReference profile; element requirements are expressed structurally in this StructureDefinition, not as narrative-only conformance statements.

Minimal is the profile the MHD Document Responder (ITI-67) declares, so it is the correct query-side baseline. This profile cherry-picks selected Comprehensive constraints and excludes `securityLabel`, following the IHE MADO pattern.

**Search Strategy**:
- `type`: precise document type for discovery. LOINC is the illustrative direction; `EEHRxFDocumentTypeVS` is preferred (non-required), so broader LOINC or other type codings are conformant. See [Document Exchange](document-exchange.html) for type codes per EHDS priority category.
- `category`: broad classification for coarse discovery, 0..1 (MHD Minimal cap), so one coding applies. Open coding — LOINC, SNOMED, XDS classCode, or national codes are all conformant. `EHDSPriorityCategoryVS` is illustrative, not required.

See [Document Exchange](document-exchange.html) for query examples.
"""
* insert SetFmmAndStatusRule( 1, draft )
* category 0..1
* category MS
* category from EHDSPriorityCategoryVS (example)
* type MS
* type from EEHRxFDocumentTypeVS (preferred)
* subject 1..1
* subject only Reference( http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core )
* date 0..1
* custodian 0..1