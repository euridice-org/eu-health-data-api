Profile: EehrxfMhdDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Title: "EEHRxF MHD DocumentReference Profile"
Description: """
Profile for DocumentReference resources used in the EEHRxF context, based on the IHE MHD Minimal DocumentReference profile.

**`category` vs `type`** — two axes, two purposes:
- `category`: the coarse **document class** (XDS `classCode`), for server-side query filtering ("all the lab documents"). Bound (example) to the LOINC-based FHIR [Document Class value set](https://hl7.org/fhir/R4/valueset-document-classcodes.html); additional codings (SNOMED, XDS) and codes MAY be used. The EHDS regulatory priority categories map to these class codes via the [EehrxfMhdDocumentReferenceCM](ConceptMap-EehrxfMhdDocumentReferenceCM.html) ConceptMap. `category` stays 0..1 — a document has one class; other classification axes use `setting`/`facility`/`event`.
- `type`: the clinically precise **LOINC document type**, for the consumer to select among returned documents. Bound (preferred) to a non-exhaustive starter set (`EEHRxFDocumentTypeVS`); the full LOINC document-type richness (50–500 codes per area) remains available — preferred is a SHOULD, not a ceiling.

See [Document Exchange](document-exchange.html) for query examples.
"""
* insert SetFmmAndStatusRule( 1, draft )
* category MS
* category from $document-classcodes (example)
* type MS
* type from EEHRxFDocumentTypeVS (preferred)
* subject 1..1
* subject only Reference( http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core )
// `date` and `custodian` intentionally inherit MHD Minimal cardinality (0..1);
// the IG previously constrained both to 1..1 without justification. FHIR-56711, FHIR-56700.