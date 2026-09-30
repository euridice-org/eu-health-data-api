This CapabilityStatement defines the requirements for the EEHRxF Document Access Provider actor. The actor provides access to EEHRxF FHIR Documents by serving them to Document Consumers through query APIs.

### Actor Grouping

This composite actor groups the applicable protected-server role:

- [IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.html) or [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.html), selected by environment and use case
- [PDQm Patient Demographics Supplier](https://profiles.ihe.net/ITI/PDQm/volume-1.html)
- [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html)

### Transactions

| Transaction | Description | Optionality |
|-------------|-------------|-------------|
| ITI-67 Find Document References | Respond to document metadata queries from Document Consumers | R |
| ITI-68 Retrieve Document | Serve document content to Document Consumers | R |
| ITI-78 Patient Demographics Query | Respond to patient demographics queries | O |

### Security

Systems SHALL support the IUA or SMART authorization profile selected for their environment and use case.

### Document Submission Option

To accept document publication from external Document Publishers, implement the [Document Submission Option](CapabilityStatement-document-access-provider-submission-option-eu-api.html).

### Deployment

The Document Access Provider may be grouped with Document Publisher, in which case document publication is internal. See the [grouped Document Publisher/Access Provider CapabilityStatement](CapabilityStatement-document-publisher-access-provider-eu-api.html) for this deployment pattern.