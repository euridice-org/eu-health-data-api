// ===========================================================================
// Document Exchange Actors
// ===========================================================================

Instance: EEHRxF-DocumentPublisher-Actor
InstanceOf: ActorDefinition
Title: "EEHRxF Document Publisher"
Usage: #definition
Description: """
The Document Publisher actor produces EEHRxF FHIR Documents and publishes them to a
Document Access Provider. This composite actor groups MHD Document Source, PDQm
Patient Demographics Consumer, and IUA Authorization Client.

See [Document Publisher CapabilityStatement](CapabilityStatement-EEHRxF-DocumentPublisher.html)
for technical requirements.
"""
* name = "EEHRxF_DocumentPublisher"
* title = "EEHRxF Document Publisher"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EEHRxF-DocumentPublisher)

Instance: EEHRxF-DocumentAccessProvider-Actor
InstanceOf: ActorDefinition
Title: "EEHRxF Document Access Provider"
Usage: #definition
Description: """
The Document Access Provider actor provides access to EEHRxF FHIR Documents by receiving
documents from Document Publishers and serving them to Document Consumers. This composite
actor groups MHD Document Recipient, MHD Document Responder, PDQm Patient Demographics
Supplier, and IUA Authorization Server/Resource Server.

See [Document Access Provider CapabilityStatement](CapabilityStatement-EEHRxF-DocumentAccessProvider.html)
for technical requirements.
"""
* name = "EEHRxF_DocumentAccessProvider"
* title = "EEHRxF Document Access Provider"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EEHRxF-DocumentAccessProvider)

Instance: EEHRxF-DocumentConsumer-Actor
InstanceOf: ActorDefinition
Title: "EEHRxF Document Consumer"
Usage: #definition
Description: """
The Document Consumer actor consumes EEHRxF FHIR Documents by querying a Document Access
Provider. This composite actor groups MHD Document Consumer, PDQm Patient Demographics
Consumer, and IUA Authorization Client.

See [Document Consumer CapabilityStatement](CapabilityStatement-EEHRxF-DocumentConsumer.html)
for technical requirements.
"""
* name = "EEHRxF_DocumentConsumer"
* title = "EEHRxF Document Consumer"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EEHRxF-DocumentConsumer)

Instance: EEHRxF-DocumentPublisherAccessProvider-Actor
InstanceOf: ActorDefinition
Title: "EEHRxF Document Publisher/Access Provider"
Usage: #definition
Description: """
A separately-defined actor for systems that produce documents and serve them to Document
Consumers from the same product (e.g. a hospital EHR that publishes to itself). It exposes
only the access-provision transactions (ITI-67, ITI-68); internal publishing is
implementation-private.

This actor is not a grouping of Document Publisher and Document Access Provider. Per
[IHE General Introduction §6.3](https://profiles.ihe.net/GeneralIntro/ch-6.html), claiming
both grouped actors would require externally exposing each actor's required transactions,
including ITI-105 publishing to an external Recipient. Co-located systems that do not publish
externally claim this actor instead, and combine constituent actors by means other than IHE
transactions.

Required Actor Groupings: MHD Document Responder, PDQm Patient Demographics Supplier, IUA
Authorization Server / Resource Server. MHD Document Source is not required.

See [Document Publisher/Access Provider CapabilityStatement](CapabilityStatement-EEHRxF-DocumentPublisherAccessProvider.html)
for technical requirements.
"""
* name = "EEHRxF_DocumentPublisherAccessProvider"
* title = "EEHRxF Document Publisher/Access Provider"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EEHRxF-DocumentPublisherAccessProvider)

// ===========================================================================
// Resource Exchange Actors
// ===========================================================================

Instance: EEHRxF-ResourceAccessProvider-Actor
InstanceOf: ActorDefinition
Title: "EEHRxF Resource Access Provider"
Usage: #definition
Description: """
The Resource Access Provider actor provides access to FHIR resources following IPA (primary)
and QEDm patterns. This enables direct resource access complementing document-based exchange.
This composite actor groups IPA Server, QEDm Clinical Data Source, PDQm Patient Demographics
Supplier, and IUA Authorization Server/Resource Server.

See [Resource Access Provider CapabilityStatement](CapabilityStatement-EEHRxF-ResourceAccessProvider.html)
for technical requirements.
"""
* name = "EEHRxF_ResourceAccessProvider"
* title = "EEHRxF Resource Access Provider"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EEHRxF-ResourceAccessProvider)

Instance: EEHRxF-ResourceConsumer-Actor
InstanceOf: ActorDefinition
Title: "EEHRxF Resource Consumer"
Usage: #definition
Description: """
The Resource Consumer actor queries for clinical data resources from a Resource Access
Provider following IPA (primary) and QEDm patterns. This composite actor groups IPA Client,
QEDm Clinical Data Consumer, PDQm Patient Demographics Consumer, and IUA Authorization Client.

See [Resource Consumer CapabilityStatement](CapabilityStatement-EEHRxF-ResourceConsumer.html)
for technical requirements.
"""
* name = "EEHRxF_ResourceConsumer"
* title = "EEHRxF Resource Consumer"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(EEHRxF-ResourceConsumer)
