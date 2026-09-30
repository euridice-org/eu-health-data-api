This CapabilityStatement defines the requirements for the EEHRxF Resource Consumer actor. The actor queries clinical data resources using [International Patient Access (IPA)](https://hl7.org/fhir/uv/ipa/) patterns for direct resource access beyond document exchange.

### Resource Flexibility

Following IPA's approach, clients are not required to consume every clinical resource listed in this CapabilityStatement. Patient lookup is required; clients MAY choose other resources according to their needs and the server's declared capabilities.

Optional resources, requested according to need and server support, are:

- Practitioner and Organization for reference resolution
- Condition and AllergyIntolerance for patient safety data
- Observation and DiagnosticReport for clinical results
- MedicationRequest, MedicationDispense, and MedicationStatement for medication data
- Immunization for vaccination records
- Encounter for visit context

Clients should check the server's CapabilityStatement to discover available resources.

### Security

This requirements CapabilityStatement supports the IUA or SMART client role selected by the environment and use case. A deployment instance advertises only its selected protocol; see [Authorization](authorization.html#environment-specific-requirements).

### Profile Inheritance

Consumers SHOULD expect resources conforming to EU Core profiles where available.