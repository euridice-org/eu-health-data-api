// CapabilityStatement for EEHRxF Document Access Provider - Document Submission Option
// Extends base Document Access Provider with ITI-105 Simplified Publish capability

Instance: document-access-provider-submission-option-eu-api
InstanceOf: CapabilityStatement
Title: "EEHRxF Document Access Provider - Document Submission Option"
Usage: #definition
Description: """
Requirements for the Document Submission Option on an EEHRxF Document Access Provider.
"""

* name = "DocumentAccessProviderSubmissionOptionEuApi"
* title = "EEHRxF Document Access Provider - Document Submission Option"
* status = #active
* experimental = false
* date = "2026-01-26"
* publisher = "HL7 Europe"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml

// Reference to base capability
* imports = Canonical(document-access-provider-eu-api)

* rest[+].mode = #server
* rest[=].documentation = """
The Document Submission Option adds ITI-105 Simplified Publish capability.
Document Publishers POST a DocumentReference with embedded document content.
The server extracts and persists both the DocumentReference metadata and the
embedded document, making them available via ITI-67 and ITI-68.
"""

* rest[=].security.description = """
This abstract requirements option does not advertise a fixed security service. A concrete deployment
inherits the protocol selected for the base Document Access Provider and advertises only that service.

For SMART Backend Services, the additional scope is `system/DocumentReference.c`. For interactive
SMART, use the corresponding `patient/DocumentReference.c` or `user/DocumentReference.c` scope when
that mode and context apply. ITI-105 has no IUA-defined transaction scope; an IUA deployment applies
the authorization policy defined for its environment without inventing an ITI-105 scope.

The Document Publisher must be authorized to submit documents on behalf of the
patient's care team. See [Authorization](authorization.html#environment-specific-requirements).
"""

// ============================================================================
// DocumentReference resource - ITI-105 Simplified Publish (create)
// ============================================================================
* rest[=].resource[+].type = #DocumentReference
* rest[=].resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].documentation = """
DocumentReference resources with embedded document content are accepted via
ITI-105 Simplified Publish. The server:
1. Validates the DocumentReference against the MHD Simplified Publish profile
2. Extracts the embedded document from content.attachment.data
3. Persists both the DocumentReference and the document
4. Returns the created DocumentReference with server-assigned IDs
"""

* rest[=].resource[=].interaction[+].code = #create
* rest[=].resource[=].interaction[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].interaction[=].extension[=].valueCode = #SHALL
* rest[=].resource[=].interaction[=].documentation = """
Accept DocumentReference with embedded document (ITI-105 Simplified Publish).

The DocumentReference SHALL include:
- status (required)
- type (required - LOINC document type)
- subject (required - Patient reference)
- content.attachment.contentType (required)
- content.attachment.data (required - base64-encoded document content)

The server SHALL:
- Validate against the MHD Simplified Publish DocumentReference profile
- Extract and persist the document
- For FHIR Documents, ensure the content is retrievable as a native FHIR Document Bundle (not wrapped in Binary)
- Assign server-generated IDs
- Return 201 Created with the persisted DocumentReference
"""

// Supported profiles - MHD SimplifiedPublish (requires .data) and MHD Minimal
* rest[=].resource[=].supportedProfile[+] = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.SimplifiedPublish.DocumentReference"
* rest[=].resource[=].supportedProfile[+] = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference"

// Operation outcome for validation errors
* rest[=].resource[=].operation[+].name = "validate"
* rest[=].resource[=].operation[=].definition = "http://hl7.org/fhir/OperationDefinition/Resource-validate"
* rest[=].resource[=].operation[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].operation[=].extension[=].valueCode = #MAY
* rest[=].resource[=].operation[=].documentation = "Pre-validation of DocumentReference before submission"
