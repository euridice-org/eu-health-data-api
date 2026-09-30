This CapabilityStatement defines the Document Submission Option for the EEHRxF Document Access Provider. The option enables the Access Provider to receive documents from external Publishers through [ITI-105 Simplified Publish](https://profiles.ihe.net/ITI/MHD/ITI-105.html).

Systems implementing this option:

- SHALL also implement the base [Document Access Provider](CapabilityStatement-document-access-provider-eu-api.html) capabilities
- SHALL accept ITI-105 transactions from authorized Document Publishers
- SHALL make received documents available via ITI-67 and ITI-68
- SHALL validate documents against EEHRxF content profiles

This option is REQUIRED when acting as a delegated access provider for external Document Publishers, such as integration engines or national infrastructure.

### Actor Grouping

Adds to the base Document Access Provider:

- [MHD Document Recipient](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html) with the Simplified Publish Option ([CapabilityStatement](https://profiles.ihe.net/ITI/MHD/CapabilityStatement-IHE.MHD.DocumentRecipient.html))

### Transaction

| Transaction | Description | Optionality |
|-------------|-------------|-------------|
| ITI-105 Simplified Publish | Accept document publication from Document Publishers | R |

### Security

This option inherits the environment-selected IUA or SMART security profile from the base Document Access Provider. ITI-105 has no IUA-defined transaction scope; see [Authorization](authorization.html#tokens-scopes-enforcement-and-errors).