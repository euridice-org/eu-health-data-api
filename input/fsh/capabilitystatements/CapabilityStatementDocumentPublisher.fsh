// CapabilityStatement for EEHRxF Document Publisher Actor
// Composite actor grouping MHD Document Source + PDQm Consumer + selected authorization client

Instance: document-publisher-eu-api
InstanceOf: CapabilityStatement
Title: "EEHRxF Document Publisher CapabilityStatement"
Usage: #definition
Description: """
Requirements for an EEHRxF Document Publisher that submits FHIR Documents to a Document Access Provider.
"""

* name = "DocumentPublisherEuApi"
* title = "EEHRxF Document Publisher CapabilityStatement"
* status = #active
* experimental = false
* date = "2026-01-26"
* publisher = "HL7 Europe"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml

// Security requirements - protocol selected by environment and use case
* rest[+].mode = #client
* rest[=].documentation = """
The Document Publisher actor initiates transactions to publish documents and query for
patient context. It groups with the selected IUA Authorization Client, SMART App, or SMART
Backend Service role. The Authorization Server is a separate participant.
"""

* rest[=].security.description = """
This abstract requirements statement does not advertise a fixed security service. A concrete
deployment SHALL declare exactly one security-service coding from the [EU Health Data API
Authorization Security Service ValueSet](ValueSet-eu-api-authorization-security-service.html),
selected for its environment. It SHALL NOT advertise both services unless a future profile defines
dual conformance.

### IHE IUA

The publisher groups with the IUA Authorization Client. ITI-105 and PDQm ITI-78 have no IUA MHD
transaction scope; the deployment applies the IUA authorization policy defined for its environment.

### SMART Backend Services

For a pre-authorized system-to-system use case, the publisher groups with the SMART Backend Service,
uses `client_credentials` and `private_key_jwt`, and requests:
- system/DocumentReference.c (create DocumentReference - ITI-105)
- system/Patient.rs (read + search Patient - ITI-78)

### Interactive SMART

Where an interactive use case applies, the publisher groups with the SMART App, uses authorization
code with PKCE, and replaces the `system/` prefix above with the applicable `patient/` or `user/`
scope prefix. Browser CORS requirements apply only to deployments supporting browser-based clients.

All modes use TLS 1.2 or higher. See [Authorization](authorization.html#smart-app-launch) for the
selected capability set, discovery, token, scope, and CORS rules.
"""

// ============================================================================
// DocumentReference resource - for ITI-105 Simplified Publish
// ============================================================================
* rest[=].resource[+].type = #DocumentReference
* rest[=].resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].supportedProfile[+] = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.SimplifiedPublish.DocumentReference"
* rest[=].resource[=].supportedProfile[+] = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference"
* rest[=].resource[=].documentation = """
DocumentReference resources are submitted via ITI-105 Simplified Publish with embedded
document content in the attachment to publish documents to the Document Access Provider.
The SimplifiedPublish profile requires content.attachment.data to be populated.
"""
* rest[=].resource[=].interaction[+].code = #create
* rest[=].resource[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = "Create DocumentReference with embedded document (ITI-105 Simplified Publish)"

// ============================================================================
// Patient resource - PDQm ITI-78 patient lookup
// ============================================================================
* rest[=].resource[+].type = #Patient
* rest[=].resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].supportedProfile = "http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core"
* rest[=].resource[=].documentation = """
Patient resources are queried using PDQm [ITI-78] to establish patient context
before submitting documents. The identifier search parameter is required.
"""

* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = "Read Patient by logical ID"

* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = "Search for patients (PDQm ITI-78)"

* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].searchParam[=].documentation = "Patient identifier (e.g., national ID, MRN) - required for patient lookup"

* rest[=].resource[=].searchParam[+].name = "_id"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Patient logical ID"

* rest[=].resource[=].searchParam[+].name = "active"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-active"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Whether the patient record is active"

* rest[=].resource[=].searchParam[+].name = "family"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-family"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Patient family name"

* rest[=].resource[=].searchParam[+].name = "given"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-given"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Patient given name"

* rest[=].resource[=].searchParam[+].name = "telecom"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-telecom"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Telecom details of the patient"

* rest[=].resource[=].searchParam[+].name = "birthdate"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Patient date of birth"

* rest[=].resource[=].searchParam[+].name = "address"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-address"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "A server defined search that may match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text"

* rest[=].resource[=].searchParam[+].name = "address-city"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-address-city"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "A city specified in an address"

* rest[=].resource[=].searchParam[+].name = "address-country"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-address-country"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "A country specified in an address"

* rest[=].resource[=].searchParam[+].name = "address-postalcode"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-address-postalcode"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "A postal code specified in an address"

* rest[=].resource[=].searchParam[+].name = "address-state"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-address-state"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "A state specified in an address"

* rest[=].resource[=].searchParam[+].name = "gender"
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest[=].resource[=].searchParam[=].documentation = "Administrative gender of the patient"
