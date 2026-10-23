# ePrescription / eDispensation (MPD) - EU Health Data API v1.0.0-ballot

## ePrescription / eDispensation (MPD)

This section defines the API consideration for ePrescription and eDispensation exchange.

The content is defined by the [HL7 EU Medication Prescription and Dispense](https://hl7.eu/fhir/mpd/) profile.

### Resource Access (this IG)

Reading medication data as individual resources — MedicationRequest, MedicationDispense, MedicationStatement — is [resource access](resource-access.md), handled by this IG. This covers queries like "what medications is this patient taking?"

### ePrescription/eDispensation Workflow (out of scope)

The ePrescription and eDispensation workflow transactions (prescribing, dispensing) are out of scope for this IG. These are coordinated multi-step transactions defined by [IHE MPD](https://profiles.ihe.net/PHARM/MPD/).

