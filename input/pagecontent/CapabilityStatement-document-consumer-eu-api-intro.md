This CapabilityStatement defines the requirements for the EEHRxF Document Consumer actor. The actor consumes EEHRxF FHIR Documents by querying a Document Access Provider.

### Actor Grouping

This composite actor groups the following roles:

- The IUA Authorization Client, SMART App, or SMART Backend Service selected by the environment and use case
- [PDQm Patient Demographics Consumer](https://profiles.ihe.net/ITI/PDQm/volume-1.html)
- [MHD Document Consumer](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html)

### Transactions

| Transaction | Description | Optionality |
|-------------|-------------|-------------|
| ITI-67 Find Document References | Query for document metadata from Document Access Provider | R |
| ITI-68 Retrieve Document | Retrieve document content from Document Access Provider | R |
| ITI-78 Patient Demographics Query | Query for patient demographics to establish patient context | R |
| Get Access Token | Obtain authorization token for API access | R |

### Security

Systems SHALL support the IUA or SMART authorization profile selected for their environment and use case.