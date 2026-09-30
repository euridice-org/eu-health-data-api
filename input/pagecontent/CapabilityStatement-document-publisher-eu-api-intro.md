This CapabilityStatement defines the requirements for the EEHRxF Document Publisher actor. The actor produces EEHRxF FHIR Documents and publishes them to a Document Access Provider.

### Actor Grouping

This composite actor groups the following roles:

- The IUA Authorization Client, SMART App, or SMART Backend Service selected by the environment and use case
- [PDQm Patient Demographics Consumer](https://profiles.ihe.net/ITI/PDQm/volume-1.html)
- [MHD Document Source](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html)

### Transactions

| Transaction | Description | Optionality |
|-------------|-------------|-------------|
| ITI-105 Simplified Publish | Submit document with embedded content to a Document Access Provider | R |
| ITI-78 Patient Demographics Query | Query for patient demographics to establish patient context | R |
| Get Access Token | Obtain authorization token for API access | R |

### Security

This requirements CapabilityStatement supports the IUA or SMART client role selected by the environment and use case. A deployment instance advertises only its selected protocol; see [Authorization](authorization.html#environment-specific-requirements).

### Deployment

The Document Publisher may be grouped with Document Access Provider, in which case the ITI-105 transaction becomes internal and is not exposed externally. See the [grouped Document Publisher/Access Provider CapabilityStatement](CapabilityStatement-document-publisher-access-provider-eu-api.html) for this deployment pattern.