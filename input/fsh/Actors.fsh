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
Patient Demographics Consumer, and the IUA Authorization Client or SMART Backend
Service role selected by the environment and use case. The Authorization Server is a
separate participant. See [Authorization](authorization.html#environment-specific-requirements)
for the selected protocol and flow.

See [Document Publisher CapabilityStatement](CapabilityStatement-document-publisher-eu-api.html)
for technical requirements.
"""
* name = "DocumentPublisherEuApi"
* title = "EEHRxF Document Publisher"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(document-publisher-eu-api)

Instance: eu-authorization-client-eu-api
InstanceOf: ActorDefinition
Title: "EU Authorization Client"
Usage: #definition
Description: """
The EU Authorization Client obtains an access token from the selected Authorization Server
and presents it to a protected API. Client authentication, grants, scopes, discovery, and
launch context depend on the selected environment and protocol; public SMART interactive
clients do not authenticate at the token endpoint. This generic role does not by itself
claim IHE IUA or SMART conformance. See the applicable [IHE IUA Authorization Client](https://profiles.ihe.net/ITI/IUA/index.html#34111-authorization-client),
[SMART App](ActorDefinition-smart-app-eu-api.html), or [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.html)
definition and the relevant [Authorization](authorization.html) requirements.
"""
* name = "EuAuthorizationClientEuApi"
* title = "EU Authorization Client"
* status = #active
* experimental = false
* type = #system

Instance: eu-authorization-server-eu-api
InstanceOf: ActorDefinition
Title: "EU Authorization Server"
Usage: #definition
Description: """
The EU Authorization Server issues access tokens after applying the authentication and
authorization requirements of the selected environment and protocol. Client assertion
validation applies only when the selected flow uses asymmetric client authentication. The
Authorization Server remains responsibility-distinct from a Resource Server, including when
the two are co-located. This generic role does not by itself claim IHE IUA or SMART conformance.
See the applicable [IHE IUA Authorization Server](https://profiles.ihe.net/ITI/IUA/index.html#34112-authorization-server)
or [SMART Authorization Server](ActorDefinition-smart-authorization-server-eu-api.html)
definition and the relevant [Authorization](authorization.html) requirements.
"""
* name = "EuAuthorizationServerEuApi"
* title = "EU Authorization Server"
* status = #active
* experimental = false
* type = #system

Instance: eu-authorization-resource-server-eu-api
InstanceOf: ActorDefinition
Title: "EU Authorization Resource Server"
Usage: #definition
Description: """
The EU Authorization Resource Server hosts a protected API, validates or introspects access
tokens as applicable, and enforces granted authorization and local policy. It does not issue
access tokens or validate client assertions for an independent Authorization Server. This
generic role does not by itself claim IHE IUA or SMART conformance. See the applicable
[IHE IUA Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#34113-resource-server)
or [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.html)
definition and the relevant [Authorization](authorization.html) requirements.
"""
* name = "EuAuthorizationResourceServerEuApi"
* title = "EU Authorization Resource Server"
* status = #active
* experimental = false
* type = #system

Instance: document-access-provider-actor-eu-api
InstanceOf: ActorDefinition
Title: "EEHRxF Document Access Provider"
Usage: #definition
Description: """
The Document Access Provider actor provides access to EEHRxF FHIR Documents by receiving
documents from Document Publishers and serving them to Document Consumers. This composite
actor groups MHD Document Recipient, MHD Document Responder, PDQm Patient Demographics
Supplier, and the applicable IUA Resource Server or SMART FHIR Resource Server role.
An Authorization Server is independent; it may be co-located only as an optional deployment.
See [Authorization](authorization.html#environment-specific-requirements) for the selected role.

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
Consumer, and the IUA Authorization Client, SMART App, or SMART Backend Service role selected
by the environment and use case. The Authorization Server is a separate participant. See
[Authorization](authorization.html#environment-specific-requirements) for the selected role.

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
is exposed externally. The external protected endpoint groups with the applicable IUA Resource
Server or SMART FHIR Resource Server role. Internal publication does not create another externally
advertised authorization role. An Authorization Server remains a separate participant and may be
co-located only as an optional deployment. See
[Authorization](authorization.html#environment-specific-requirements) for the selected role.

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
Supplier, and the applicable IUA Resource Server or SMART FHIR Resource Server role.
An Authorization Server is independent; it may be co-located only as an optional deployment.
See [Authorization](authorization.html#environment-specific-requirements) for the selected role.

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
PDQm Patient Demographics Consumer, and the IUA Authorization Client or SMART
App or SMART Backend Service role selected by the environment and use case. The Authorization
Server is a separate participant. See
[Authorization](authorization.html#environment-specific-requirements) for the selected role.

See [Resource Consumer CapabilityStatement](CapabilityStatement-resource-consumer-eu-api.html)
for technical requirements.
"""
* name = "ResourceConsumerEuApi"
* title = "EEHRxF Resource Consumer"
* status = #active
* experimental = false
* type = #system
* capabilities = Canonical(resource-consumer-eu-api)

// ===========================================================================
// Authorization Protocol Roles
// ===========================================================================

Instance: iua-authorization-client-eu-api
InstanceOf: ActorDefinition
Title: "IHE IUA Authorization Client"
Usage: #definition
Description: """
The IHE IUA Authorization Client authenticates to the Authorization Server, requests
least-privilege scopes, and presents the resulting bearer token to the Resource Server.
It implements the applicable IUA transactions. See the
[IHE IUA Authorization Client](https://profiles.ihe.net/ITI/IUA/index.html#34111-authorization-client)
and [Authorization](authorization.html#ihe-iua).
"""
* name = "IuaAuthorizationClientEuApi"
* title = "IHE IUA Authorization Client"
* status = #active
* experimental = false
* type = #system

Instance: iua-authorization-server-eu-api
InstanceOf: ActorDefinition
Title: "IHE IUA Authorization Server"
Usage: #definition
Description: """
The independent IHE IUA Authorization Server authenticates clients, validates client
assertions when selected, applies issuance policy, prevents replay, and issues tokens.
It does not provide protected-resource enforcement. See the
[IHE IUA Authorization Server](https://profiles.ihe.net/ITI/IUA/index.html#34112-authorization-server)
and [Authorization](authorization.html#ihe-iua).
"""
* name = "IuaAuthorizationServerEuApi"
* title = "IHE IUA Authorization Server"
* status = #active
* experimental = false
* type = #system

Instance: iua-resource-server-eu-api
InstanceOf: ActorDefinition
Title: "IHE IUA Resource Server"
Usage: #definition
Description: """
The IHE IUA Resource Server validates or introspects access tokens and enforces granted
authorization and local policy for protected resources. It does not validate client
assertions for an independent Authorization Server. See the
[IHE IUA Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#34113-resource-server)
and [Authorization](authorization.html#ihe-iua).
"""
* name = "IuaResourceServerEuApi"
* title = "IHE IUA Resource Server"
* status = #active
* experimental = false
* type = #system

Instance: smart-app-eu-api
InstanceOf: ActorDefinition
Title: "SMART App"
Usage: #definition
Description: """
The SMART App is an interactive client using authorization code and PKCE in standalone
or EHR-launch mode. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html)
and [Authorization](authorization.html#smart-app-launch).
"""
* name = "SmartAppEuApi"
* title = "SMART App"
* status = #active
* experimental = false
* type = #system

Instance: smart-backend-service-eu-api
InstanceOf: ActorDefinition
Title: "SMART Backend Service"
Usage: #definition
Description: """
The SMART Backend Service is a pre-authorized confidential server-side client using
client credentials, asymmetric client authentication, and applicable system scopes.
See [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html)
and [Authorization](authorization.html#smart-app-launch).
"""
* name = "SmartBackendServiceEuApi"
* title = "SMART Backend Service"
* status = #active
* experimental = false
* type = #system

Instance: smart-fhir-resource-server-eu-api
InstanceOf: ActorDefinition
Title: "SMART FHIR Resource Server"
Usage: #definition
Description: """
The SMART FHIR Resource Server hosts protected FHIR resources, validates access tokens,
and enforces granted SMART scopes. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/)
and [Authorization](authorization.html#smart-app-launch).
"""
* name = "SmartFhirResourceServerEuApi"
* title = "SMART FHIR Resource Server"
* status = #active
* experimental = false
* type = #system

Instance: smart-authorization-server-eu-api
InstanceOf: ActorDefinition
Title: "SMART Authorization Server"
Usage: #definition
Description: """
The SMART Authorization Server authenticates clients as applicable, authorizes requests,
and issues tokens. It remains a distinct participant from the protected FHIR Resource Server.
See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/)
and [Authorization](authorization.html#smart-app-launch).
"""
* name = "SmartAuthorizationServerEuApi"
* title = "SMART Authorization Server"
* status = #active
* experimental = false
* type = #system

Instance: smart-launching-system-eu-api
InstanceOf: ActorDefinition
Title: "SMART Launching System"
Usage: #definition
Description: """
The SMART Launching System initiates an EHR launch and supplies the launch context for
an interactive SMART App. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html)
and [Authorization](authorization.html#smart-app-launch).
"""
* name = "SmartLaunchingSystemEuApi"
* title = "SMART Launching System"
* status = #active
* experimental = false
* type = #system
