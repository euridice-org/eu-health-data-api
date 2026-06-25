{% include variable-definitions.md %}
This section defines the API requirements for EHR systems that provide EEHRxF data that conforms to the {{hl7EuEps}} content profile.

### Actors

The European Patient Summary document can be accessed via document exchange 

| Actor | Description | CapabilityStatement |
|-------|-------------|---------------------|
| Document Consumer | Retrieves EPS documents | [EEHRxF Document Consumer](CapabilityStatement-EEHRxF-DocumentConsumer.html) |
| Document Access Provider | Serves EPS documents | [EEHRxF Document Access Provider](CapabilityStatement-EEHRxF-DocumentAccessProvider.html) |

### Document Exchange

For document-based access, use the [Document Exchange](document-exchange.html) transactions:

The Patient Summary is differentiated via the following DocumentReference fields:
- **type**: `60591-5` (Patient summary Document)
- **category**: `Patient-Summaries` ([EHDS Priority Category](CodeSystem-eehrxf-document-priority-category-cs.html))


### Example Query

```
GET /DocumentReference?patient=123&type=http://loinc.org|60591-5&status=current
```

See [Example: Retrieve A European Patient Summary](example-patient-summary.html) for a complete workflow example


### Resource Exchange

For resource-based access, use the [Resource Access](resource-access.html) transactions to query individual clinical resources referenced in the Patient Summary.

### On-Demand Patient Summary Assembly

FHIR servers can assemble Patient Summary documents on demand from clinical resources. When supported, the [IPS $summary operation](https://build.fhir.org/ig/HL7/fhir-ips/en/OperationDefinition-summary.html) returns a Patient Summary Bundle directly:

```
GET /Patient/[id]/$summary
```

A server can also expose the same on-demand Patient Summary through MHD. In that pattern, ITI-67 returns an on-demand DocumentReference whose `content.attachment.url` points to `Patient/[id]/$summary`. Per MHD on-demand semantics, the DocumentReference omits `content.attachment.hash` and `content.attachment.size`.
