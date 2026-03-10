// Example CapabilityStatement showing a realistic Document Access Provider deployment
// that declares actor conformance and priority category support

Instance: EEHRxF-DocumentAccessProvider-Example
InstanceOf: CapabilityStatement
Title: "Example: Document Access Provider Supporting EPS and Laboratory"
Usage: #example
Description: """
**Example** CapabilityStatement for a Document Access Provider that supports
European Patient Summaries and Laboratory Reports.

Shows how a deployment declares actor conformance via `instantiates`,
content IG support via `implementationGuide`, and profile support via `supportedProfile`.

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
* instantiates[+] = Canonical(EEHRxF-DocumentAccessProvider)
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
"""

* rest[=].security.service = http://hl7.org/fhir/restful-security-service#SMART-on-FHIR
* rest[=].security.description = "SMART Backend Services authorization required."

// ============================================================================
// DocumentReference — advertise EEHRxF and MHD profiles
// ============================================================================
* rest[=].resource[+].type = #DocumentReference
* rest[=].resource[=].supportedProfile[+] = Canonical(EehrxfMhdDocumentReference)
* rest[=].resource[=].supportedProfile[+] = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference"
* rest[=].resource[=].documentation = """
DocumentReference resources are served via ITI-67. This server indexes Patient
Summaries (LOINC 60591-5) and Laboratory Reports (LOINC 11502-2).
"""

* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[+].name = "type"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[+].name = "date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[+].name = "_id"
* rest[=].resource[=].searchParam[=].type = #token

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
