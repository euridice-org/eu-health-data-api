// ===========================================================================
// Document Exchange Actors
// ===========================================================================

Instance: EehrxfDocumentPublisherActor
InstanceOf: ActorDefinition
Title: "EEHRxF Document Publisher"
Usage: #definition
Description: """
The Document Publisher actor produces EEHRxF FHIR Documents and publishes them to a
Document Access Provider. This composite actor groups MHD Document Source, PDQm
Patient Demographics Consumer, and IUA Authorization Client.

See [Document Publisher CapabilityStatement](CapabilityStatement-EehrxfDocumentPublisher.html)
for technical requirements.
"""
* name = "EehrxfDocumentPublisherActor"
* title = "EEHRxF Document Publisher"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EehrxfDocumentPublisher)

Instance: EehrxfDocumentAccessProviderActor
InstanceOf: ActorDefinition
Title: "EEHRxF Document Access Provider"
Usage: #definition
Description: """
The Document Access Provider actor provides access to EEHRxF FHIR Documents by receiving
documents from Document Publishers and serving them to Document Consumers. This composite
actor groups MHD Document Recipient, MHD Document Responder, PDQm Patient Demographics
Supplier, and IUA Authorization Server/Resource Server.

See [Document Access Provider CapabilityStatement](CapabilityStatement-EehrxfDocumentAccessProvider.html)
for technical requirements.
"""
* name = "EehrxfDocumentAccessProviderActor"
* title = "EEHRxF Document Access Provider"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EehrxfDocumentAccessProvider)

Instance: EehrxfDocumentConsumerActor
InstanceOf: ActorDefinition
Title: "EEHRxF Document Consumer"
Usage: #definition
Description: """
The Document Consumer actor consumes EEHRxF FHIR Documents by querying a Document Access
Provider. This composite actor groups MHD Document Consumer, PDQm Patient Demographics
Consumer, and IUA Authorization Client.

See [Document Consumer CapabilityStatement](CapabilityStatement-EehrxfDocumentConsumer.html)
for technical requirements.
"""
* name = "EehrxfDocumentConsumerActor"
* title = "EEHRxF Document Consumer"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EehrxfDocumentConsumer)

Instance: EehrxfDocumentPublisherAccessProviderActor
InstanceOf: ActorDefinition
Title: "EEHRxF Grouped Document Publisher/Access Provider"
Usage: #definition
Description: """
The grouped Document Publisher/Access Provider actor represents a deployment where document
production and access provision are co-located in the same system. In this configuration,
document submission (ITI-105) is internal and only document query/retrieval (ITI-67, ITI-68)
is exposed externally.

This is common for hospital EHR systems that produce and serve their own documents.

See [Grouped Document Publisher/Access Provider CapabilityStatement](CapabilityStatement-EehrxfDocumentPublisherAccessProvider.html)
for technical requirements.
"""
* name = "EehrxfDocumentPublisherAccessProviderActor"
* title = "EEHRxF Grouped Document Publisher/Access Provider"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EehrxfDocumentPublisherAccessProvider)

// ===========================================================================
// Resource Exchange Actors
// ===========================================================================

Instance: EehrxfResourceAccessProviderActor
InstanceOf: ActorDefinition
Title: "EEHRxF Resource Access Provider"
Usage: #definition
Description: """
The Resource Access Provider actor provides access to FHIR resources following IPA patterns.
This enables direct resource access complementing document-based exchange.
This composite actor groups IPA Server, PDQm Patient Demographics
Supplier, and IUA Authorization Server/Resource Server.

See [Resource Access Provider CapabilityStatement](CapabilityStatement-EehrxfResourceAccessProvider.html)
for technical requirements.
"""
* name = "EehrxfResourceAccessProviderActor"
* title = "EEHRxF Resource Access Provider"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EehrxfResourceAccessProvider)

Instance: EehrxfResourceConsumerActor
InstanceOf: ActorDefinition
Title: "EEHRxF Resource Consumer"
Usage: #definition
Description: """
The Resource Consumer actor queries for clinical data resources from a Resource Access
Provider following IPA patterns. This composite actor groups IPA Client,
PDQm Patient Demographics Consumer, and IUA Authorization Client.

See [Resource Consumer CapabilityStatement](CapabilityStatement-EehrxfResourceConsumer.html)
for technical requirements.
"""
* name = "EehrxfResourceConsumerActor"
* title = "EEHRxF Resource Consumer"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EehrxfResourceConsumer)
