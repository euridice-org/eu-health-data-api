Profile: EehrxfMhdDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Title: "EEHRxF MHD DocumentReference Profile"
Description: """
Profile for DocumentReference resources used in the EEHRxF context. Derived from the IHE MHD Minimal DocumentReference profile; element requirements are expressed structurally in this StructureDefinition, not as narrative-only conformance statements.

Minimal is the profile the MHD Document Responder (ITI-67) declares, so it is the correct query-side baseline. This profile cherry-picks selected Comprehensive constraints and excludes `securityLabel`, following the IHE MADO pattern.

**Search Strategy**:
- `type`: Search by LOINC document type for precise document discovery. See [Document Exchange](document-exchange.html) for type codes per EHDS priority category.
- `category`: EHDS priority category (broad classification) for coarse discovery. Bound extensibly to LOINC Document Class codes; implementations MAY add SNOMED, XDS classCode, or national codings. MHD Minimal caps `category` at 0..1, so a single category code applies; multi-scheme classification belongs on the content, not this DocumentReference.

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