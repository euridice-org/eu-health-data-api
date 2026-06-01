Profile: EehrxfMhdDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Title: "EEHRxF MHD DocumentReference Profile"
Description: """
Profile for DocumentReference resources used in the EEHRxF context, based on the IHE MHD Minimal DocumentReference profile.

**`category` vs `type`** — two axes, two purposes:
- `category`: the coarse **document class** (XDS `classCode`), for server-side query filtering ("all the lab documents"). Bound (example) to the LOINC-based FHIR [Document Class value set](https://hl7.org/fhir/R4/valueset-document-classcodes.html); additional codings (SNOMED, XDS) and codes MAY be used. The EHDS regulatory priority categories map to these class codes via the [EehrxfMhdDocumentReferenceCM](ConceptMap-EehrxfMhdDocumentReferenceCM.html) ConceptMap. `category` stays 0..1 — a document has one class; other classification axes use `setting`/`facility`/`event`.
- `type`: the clinically precise **LOINC document type**, for the consumer to select among returned documents. **Inherits the MHD Minimal / base FHIR `type` binding** — this IG does not impose its own value set. Any LOINC document-type code is valid; the applicable content IG (Patient Summary, Laboratory, Imaging, etc.) is the authoritative source for the expected code. Illustrative per-category type codes are listed informatively in [EEHRxFDocumentTypeVS](ValueSet-eehrxf-document-type-vs.html) and on the priority-area pages, but are **not** a binding constraint.

See [Document Exchange](document-exchange.html) for query examples.
"""
* insert SetFmmAndStatusRule( 1, draft )
* category MS
* category from $document-classcodes (example)
* type MS
// type: no EU binding — inherits MHD/base FHIR; content IGs are authoritative. FHIR-56693/56622/56621/56631
* subject 1..1
* subject only Reference( http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core )
// `date` and `custodian` intentionally inherit MHD Minimal cardinality (0..1);
// the IG previously constrained both to 1..1 without justification. FHIR-56711, FHIR-56700.