# Medical Imaging Report - EU Health Data API v1.0.0-ballot

## Medical Imaging Report

This section defines the API requirements for EHR systems that provide diagnostic imaging reports conforming to the [EU Imaging Report IG](https://build.fhir.org/ig/hl7-eu/imaging-r5/).

> **Note:** The referenced EU Imaging Report content IG is currently published on FHIR R5 as groundwork for future R6 content specifications. This API IG remains FHIR R4; production implementations should track the applicable R6 imaging content specification when available.

### Actors

Imaging Reports can be accessed via document exchange.

| | | |
| :--- | :--- | :--- |
| Document Consumer | Retrieves imaging reports | [EEHRxF Document Consumer](CapabilityStatement-document-consumer-eu-api.md) |
| Document Access Provider | Serves imaging reports | [EEHRxF Document Access Provider](CapabilityStatement-document-access-provider-eu-api.md) |

### Document Exchange

For document-based access, use the [Document Exchange](document-exchange.md) transactions.

The Imaging Report is differentiated via the following DocumentReference fields:

* **type**: `85430-7` (Diagnostic imaging report)
* **category**: `Medical-Imaging` ([EHDS Priority Category](CodeSystem-document-priority-category-eu-api.md))

### Example Query

```
GET /DocumentReference?patient=123&type=http://loinc.org|85430-7&status=current

```

See [Example: Retrieve A European Patient Summary](example-patient-summary.md) for a complete workflow example (the pattern is identical).

### Related

For imaging study manifests (DICOM image references), see [Imaging Manifest](priority-area-imaging-manifest.md).

