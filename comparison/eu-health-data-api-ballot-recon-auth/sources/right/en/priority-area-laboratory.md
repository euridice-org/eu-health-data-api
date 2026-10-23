# Medical Test Results (Laboratory) - EU Health Data API v1.0.0-ballot

## Medical Test Results (Laboratory)

This section defines the API requirements for EHR systems that provide laboratory reports conforming to the [HL7 EU Laboratory Reports](https://build.fhir.org/ig/hl7-eu/laboratory/branches/master/index.html) content profile.

### Actors

Laboratory Reports can be accessed via document exchange.

| | | |
| :--- | :--- | :--- |
| Document Consumer | Retrieves laboratory reports | [EEHRxF Document Consumer](CapabilityStatement-document-consumer-eu-api.md) |
| Document Access Provider | Serves laboratory reports | [EEHRxF Document Access Provider](CapabilityStatement-document-access-provider-eu-api.md) |

### Document Exchange

For document-based access, use the [Document Exchange](document-exchange.md) transactions.

The Laboratory Report is differentiated via the following DocumentReference fields:

* **type**: `11502-2` (Laboratory report)
* **category**: `Laboratory-Reports` ([EHDS Priority Category](CodeSystem-document-priority-category-eu-api.md))

### Example Query

```
GET /DocumentReference?patient=123&type=http://loinc.org|11502-2&status=current

```

See [Example: Retrieve A European Patient Summary](example-patient-summary.md) for a complete workflow example (the pattern is identical).

