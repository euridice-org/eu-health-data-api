Profile: EehrxfMhdDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Title: "EEHRxF MHD DocumentReference Profile"
Description: """
Profile for DocumentReference resources used in the EEHRxF context, based on the IHE MHD Minimal DocumentReference profile.

**Search Strategy**:
- `type`: Search by LOINC document type for precise document discovery. See [Document Exchange](document-exchange.html) for type codes per EHDS priority category.
- `category`: This IG does not constrain category. Usage is determined by content IGs and implementation needs.

See [Document Exchange](document-exchange.html) for query examples.
"""
* insert SetFmmAndStatusRule( 1, draft )
* category MS
* type MS
* type from EEHRxFDocumentTypeVS (preferred)
* subject 1..1
* subject only Reference( http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core )
* date 1..1
* custodian 1..1