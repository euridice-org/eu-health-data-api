EHDS defines priority categories of health data for interoperability. Each has a content profile defining the data model, maintained in separate Content IGs.

This API IG defines interoperability *behavior* - the transactions and exchange patterns that systems use to share data. It does not prescribe internal system architecture or design. Systems implement this behavior alongside one or more Content IGs to satisfy [EHDS Annex II §2.1 and §2.2](regulatoryAnchors.html), and declare their capabilities in a [CapabilityStatement](capability-discovery.html).

### Priority Categories and Exchange Patterns

Each priority category pairs a data specification (Content IG) with an exchange pattern (this IG). Systems claiming conformance for a category implement both.

| Priority Category | Content IG | Exchange Pattern | API Guidance |
|---|---|---|---|
| Patient Summary | [HL7 Europe Patient Summary](https://build.fhir.org/ig/hl7-eu/eps/) | [Document exchange](document-exchange.html) (MHD) | [Patient Summary](priority-area-eps.html) |
| Hospital Discharge Report | [HL7 Europe Hospital Discharge Report](https://build.fhir.org/ig/hl7-eu/hdr/) | [Document exchange](document-exchange.html) (MHD) | [Discharge Report](priority-area-hdr.html) |
| Medical Test Results | [HL7 Europe Laboratory Report](https://hl7.eu/fhir/laboratory/) | [Document exchange](document-exchange.html) (MHD) | [Laboratory](priority-area-laboratory.html) |
| Medical Imaging — Report | [HL7 Europe Imaging Reports](https://build.fhir.org/ig/hl7-eu/imaging-r5/) | [Document exchange](document-exchange.html) (MHD) | [Imaging Report](priority-area-imaging-report.html) |
| Medical Imaging — Manifest | [HL7 Europe Imaging Reports](https://build.fhir.org/ig/hl7-eu/imaging-r5/) | [Document exchange](document-exchange.html) (MHD) | [Imaging Manifest](priority-area-imaging-manifest.html) |
| Individual clinical resources | [HL7 Europe Core](https://build.fhir.org/ig/hl7-eu/base/) | [Resource access](resource-access.html) (IPA) | [Resource Access](resource-access.html) |

See the [HL7 Europe Implementation Guides registry](https://confluence.hl7.org/spaces/HEU/pages/358255737/Implementation+Guides) for the canonical list of Content IGs and their current publication URLs.

For document search and differentiation by priority category, see [Document Exchange](document-exchange.html).

> **Medication data and ePrescription/eDispensation:** Reading medication resources (MedicationRequest, MedicationStatement) is resource access, handled by this IG. The ePrescription and eDispensation workflow transactions (prescribing, dispensing) are out of scope and handled by [IHE MPD](https://profiles.ihe.net/PHARM/MPD/index.html).

