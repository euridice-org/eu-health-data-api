// Example CapabilityStatement showing a realistic Document Access Provider deployment
// that declares actor conformance and priority category support

Instance: example-capabilitystatement-document-access-provider
InstanceOf: EuApiDeploymentCapabilityStatement
Title: "Example: Document Access Provider Supporting EPS and Laboratory"
Usage: #example
Description: """
**Example** CapabilityStatement for a Document Access Provider that supports
European Patient Summaries and Laboratory Reports.

Shows how a deployment declares actor conformance via `instantiates` and
content IG support via `implementationGuide`. This concrete deployment selects
SMART Backend Services and therefore advertises only `SMART-on-FHIR`.

See [Capability Discovery](capability-discovery.html) for guidance.
"""

* name = "ExampleDocumentAccessProviderEPSLab"
* title = "Example: Document Access Provider Supporting EPS and Laboratory"
* status = #draft
* experimental = true
* date = "2026-03-10"
* publisher = "Example Organization"
* kind = #instance
* implementation.description = "Example hospital document access provider"
* implementation.url = "https://example.org/fhir"
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml

// Actor conformance — this server implements the EEHRxF Document Access Provider
* instantiates[+] = Canonical(document-access-provider-eu-api)
// NOTE: instantiates was considered for priority category support, but requires
// each content IG to publish a CapabilityStatement — none currently do.
// implementationGuide needs only the IG canonical URL.

// Content IG support — declares which priority categories this server can produce
* implementationGuide[+] = "http://hl7.eu/fhir/eps"
* implementationGuide[+] = "http://hl7.eu/fhir/laboratory"

* rest[+].mode = #server
* rest[=].documentation = """
This server provides document exchange for European Patient Summaries and
Laboratory Reports. It supports MHD ITI-67 (Find Document References),
ITI-68 (Retrieve Document), and PDQm ITI-78 (Patient Demographics Query).
It implements the SMART FHIR Resource Server role for a pre-authorized
system-to-system deployment; its Authorization Server is a separate participant.
"""

* rest[=].security.cors = false
* rest[=].security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#SMART-on-FHIR
* rest[=].security.description = """
This deployment selects SMART Backend Services, validates access tokens, and enforces its granted
`system/DocumentReference.rs`, `system/Binary.r`, `system/Bundle.r`, and `system/Patient.rs` scopes.
Its SMART metadata advertises `client_credentials` and asymmetric client authentication. CORS is not
required for this server-side client architecture. See [Authorization](authorization.html#smart-app-launch).
"""

// ============================================================================
// DocumentReference — ITI-67 returns base FHIR DocumentReference resources
// ============================================================================
* rest[=].resource[+].type = #DocumentReference
* rest[=].resource[=].documentation = """
DocumentReference resources are served via ITI-67. The response uses base FHIR
DocumentReference resources without a required return profile.
"""

* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

* insert DocumentReferenceProviderSearchParameters

// ============================================================================
// Patient — advertise EU Core Patient profile
// ============================================================================
* rest[=].resource[+].type = #Patient
* rest[=].resource[=].supportedProfile = "http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core"
* rest[=].resource[=].documentation = "Patient lookup via PDQm ITI-78."

* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[+].name = "_id"
* rest[=].resource[=].searchParam[=].type = #token
