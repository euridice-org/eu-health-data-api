# Patient Summary (EPS) - EU Health Data API v1.0.0-ballot

## Patient Summary (EPS)

This section defines the API requirements for EHR systems that provide EEHRxF data that conforms to the [HL7 Europe Patient Summary](https://build.fhir.org/ig/hl7-eu/eps/) content profile.

### Actors

The European Patient Summary document can be accessed via document exchange

| | | |
| :--- | :--- | :--- |
| Document Consumer | Retrieves EPS documents | [EEHRxF Document Consumer](CapabilityStatement-document-consumer-eu-api.md) |
| Document Access Provider | Serves EPS documents | [EEHRxF Document Access Provider](CapabilityStatement-document-access-provider-eu-api.md) |

### Document Exchange

For document-based access, use the [Document Exchange](document-exchange.md) transactions:

The Patient Summary is differentiated via the following DocumentReference fields:

* **type**: `60591-5` (Patient summary Document)
* **category**: `Patient-Summaries` ([EHDS Priority Category](CodeSystem-document-priority-category-eu-api.md))

### Example Query

```
GET /DocumentReference?patient=123&type=http://loinc.org|60591-5&status=current

```

See [Example: Retrieve A European Patient Summary](example-patient-summary.md) for a complete workflow example

### Resource Exchange

For resource-based access, use the [Resource Access](resource-access.md) transactions to query individual clinical resources referenced in the Patient Summary.

### On-Demand Patient Summary Assembly

FHIR servers can assemble Patient Summary documents on demand from clinical resources. When supported, the [IPS $summary operation](https://build.fhir.org/ig/HL7/fhir-ips/en/OperationDefinition-summary.html) returns a Patient Summary Bundle directly:

```
GET /Patient/[id]/$summary

```

A server can also expose the same on-demand Patient Summary through MHD. In that pattern, ITI-67 returns an on-demand DocumentReference whose `content.attachment.url` points to `Patient/[id]/$summary`. Per MHD on-demand semantics, the DocumentReference omits `content.attachment.hash` and `content.attachment.size`.

