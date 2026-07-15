// ===========================================================================
// Document Exchange Actors
// ===========================================================================

Instance: document-publisher-actor-eu-api
InstanceOf: ActorDefinition
Title: "EEHRxF Document Publisher"
Usage: #definition
Description: """
The Document Publisher actor produces EEHRxF FHIR Documents and publishes them to a
Document Access Provider. This composite actor groups MHD Document Source, PDQm
Patient Demographics Consumer, and IUA Authorization Client.

See [Document Publisher CapabilityStatement](CapabilityStatement-document-publisher-eu-api.html)
for technical requirements.
"""
* name = "DocumentPublisherEuApi"
* title = "EEHRxF Document Publisher"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(document-publisher-eu-api)

Instance: document-access-provider-actor-eu-api
InstanceOf: ActorDefinition
Title: "EEHRxF Document Access Provider"
Usage: #definition
Description: """
The Document Access Provider actor provides access to EEHRxF FHIR Documents by receiving
documents from Document Publishers and serving them to Document Consumers. This composite
actor groups MHD Document Recipient, MHD Document Responder, PDQm Patient Demographics
Supplier, and IUA Authorization Server/Resource Server.

See [Document Access Provider CapabilityStatement](CapabilityStatement-document-access-provider-eu-api.html)
for technical requirements.
"""
* name = "DocumentAccessProviderEuApi"
* title = "EEHRxF Document Access Provider"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(document-access-provider-eu-api)

Instance: document-consumer-actor-eu-api
InstanceOf: ActorDefinition
Title: "EEHRxF Document Consumer"
Usage: #definition
Description: """
The Document Consumer actor consumes EEHRxF FHIR Documents by querying a Document Access
Provider. This composite actor groups MHD Document Consumer, PDQm Patient Demographics
Consumer, and IUA Authorization Client.

See [Document Consumer CapabilityStatement](CapabilityStatement-document-consumer-eu-api.html)
for technical requirements.
"""
* name = "DocumentConsumerEuApi"
* title = "EEHRxF Document Consumer"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(document-consumer-eu-api)

Instance: document-publisher-access-provider-actor-eu-api
InstanceOf: ActorDefinition
Title: "EEHRxF Grouped Document Publisher/Access Provider"
Usage: #definition
Description: """
The grouped Document Publisher/Access Provider actor represents a deployment where document
production and access provision are co-located in the same system. In this configuration,
document submission (ITI-105) is internal and only document query/retrieval (ITI-67, ITI-68)
is exposed externally.

This is common for hospital EHR systems that produce and serve their own documents.

See [Grouped Document Publisher/Access Provider CapabilityStatement](CapabilityStatement-document-publisher-access-provider-eu-api.html)
for technical requirements.
"""
* name = "DocumentPublisherAccessProviderEuApi"
* title = "EEHRxF Grouped Document Publisher/Access Provider"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(document-publisher-access-provider-eu-api)

// ===========================================================================
// Resource Exchange Actors
// ===========================================================================

Instance: resource-access-provider-actor-eu-api
InstanceOf: ActorDefinition
Title: "EEHRxF Resource Access Provider"
Usage: #definition
Description: """
The Resource Access Provider actor provides access to FHIR resources following IPA patterns.
This enables direct resource access complementing document-based exchange.
This composite actor groups IPA Server, PDQm Patient Demographics
Supplier, and IUA Authorization Server/Resource Server.

See [Resource Access Provider CapabilityStatement](CapabilityStatement-resource-access-provider-eu-api.html)
for technical requirements.
"""
* name = "ResourceAccessProviderEuApi"
* title = "EEHRxF Resource Access Provider"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(resource-access-provider-eu-api)

Instance: resource-consumer-actor-eu-api
InstanceOf: ActorDefinition
Title: "EEHRxF Resource Consumer"
Usage: #definition
Description: """
The Resource Consumer actor queries for clinical data resources from a Resource Access
Provider following IPA patterns. This composite actor groups IPA Client,
PDQm Patient Demographics Consumer, and IUA Authorization Client.

See [Resource Consumer CapabilityStatement](CapabilityStatement-resource-consumer-eu-api.html)
for technical requirements.
"""
* name = "ResourceConsumerEuApi"
* title = "EEHRxF Resource Consumer"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(resource-consumer-eu-api)
