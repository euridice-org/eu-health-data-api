# Hospital Discharge Report - EU Health Data API v1.0.0-ballot

## Hospital Discharge Report

This section defines the API requirements for EHR systems that provide EEHRxF data that conforms to the [HL7 EU Hospital Discharge Report](https://hl7.eu/fhir/hdr/index.html) content profile.

### Actors

Hospital Discharge Reports can be accessed via document exchange.

| | | |
| :--- | :--- | :--- |
| Document Consumer | Retrieves HDR documents | [EEHRxF Document Consumer](CapabilityStatement-document-consumer-eu-api.md) |
| Document Access Provider | Serves HDR documents | [EEHRxF Document Access Provider](CapabilityStatement-document-access-provider-eu-api.md) |

### Document Exchange

For document-based access, use the [Document Exchange](document-exchange.md) transactions.

The Hospital Discharge Report is differentiated via the following DocumentReference fields:

* **type**: `18842-5` (Discharge summary)
* **category**: `Discharge-Reports` ([EHDS Priority Category](CodeSystem-document-priority-category-eu-api.md))

### Example Query

```
GET /DocumentReference?patient=123&type=http://loinc.org|18842-5&status=current

```

See [Example: Retrieve A European Patient Summary](example-patient-summary.md) for a complete workflow example (the pattern is identical).

