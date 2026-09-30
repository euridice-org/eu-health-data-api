This CapabilityStatement defines a deployment where the EEHRxF Document Publisher and Document Access Provider are co-located in one system.

### Deployment Pattern

This CapabilityStatement applies when:

- An EHR system both produces documents and provides access to them
- Document publication is handled internally
- External clients only need to query and retrieve documents

In this grouped deployment, document publication is internal to the system and not exposed externally. The external API provides document discovery (ITI-67) and retrieval (ITI-68) capabilities.

### Actor Grouping

This grouped actor combines:

- **Document Publisher** (internal): produces and stores documents internally
- **Document Access Provider** (external-facing): serves documents to Document Consumers

The external-facing protected-server role is the selected [IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.html) or [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.html). The Authorization Server is independent and may be optionally co-located.

- [PDQm Patient Demographics Supplier](https://profiles.ihe.net/ITI/PDQm/volume-1.html)
- [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html)

MHD Document Recipient is not listed because publication is internal.

### External Transactions

| Transaction | Description | Optionality |
|-------------|-------------|-------------|
| ITI-67 Find Document References | Respond to document metadata queries from Document Consumers | R |
| ITI-68 Retrieve Document | Serve document content to Document Consumers | R |
| ITI-78 Patient Demographics Query | Respond to patient demographics queries | O |

### Security

Systems SHALL support the IUA or SMART authorization profile selected for their environment and use case.

### When to Use This CapabilityStatement

Use this CapabilityStatement for hospital EHR systems that produce and serve their own documents, regional health information exchanges with integrated document repositories, and other systems where document creation and access are tightly coupled.

For systems that receive documents from external sources, use the [Document Access Provider with Document Submission Option](CapabilityStatement-document-access-provider-submission-option-eu-api.html).