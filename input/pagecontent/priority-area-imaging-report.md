{% include variable-definitions.md %}
This section defines the API requirements for EHR systems that provide diagnostic imaging reports conforming to the [EU Imaging Report IG](https://build.fhir.org/ig/hl7-eu/imaging-r5/).

### Actors

Imaging Reports can be accessed via document exchange.

| Actor | Description | CapabilityStatement |
|-------|-------------|---------------------|
| Document Consumer | Retrieves imaging reports | [EEHRxF Document Consumer](CapabilityStatement-EEHRxF-DocumentConsumer.html) |
| Document Access Provider | Serves imaging reports | [EEHRxF Document Responder](CapabilityStatement-EEHRxF-DocumentAccessProvider.html) |

### Document Exchange

For document-based access, use the [Document Exchange](document-exchange.html) transactions.

The Imaging Report is differentiated via the following DocumentReference fields:
- **type**: `85430-7` (Diagnostic imaging report)
- **category**: `Medical-Imaging` ([EHDS Priority Category](CodeSystem-eehrxf-document-priority-category-cs.html))

### Example Query

```
GET /DocumentReference?patient=123&type=http://loinc.org|85430-7&status=current
```

See [Example: Retrieve A European Patient Summary](example-patient-summary.html) for a complete workflow example (the pattern is identical).

### Related

For imaging study manifests (DICOM image references), see [Imaging Manifest](priority-area-imaging-manifest.html).
