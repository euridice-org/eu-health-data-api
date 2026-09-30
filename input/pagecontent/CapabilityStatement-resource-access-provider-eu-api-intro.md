This CapabilityStatement defines the requirements for the EEHRxF Resource Access Provider actor. The actor serves clinical data resources using [International Patient Access (IPA)](https://hl7.org/fhir/uv/ipa/) patterns for direct resource access beyond document exchange.

### Resource Flexibility

Following IPA's approach, servers are not required to support every clinical resource listed in this CapabilityStatement. Patient is required for lookup context; servers MAY choose other resources according to their capabilities and use cases.

Recommended resources, chosen according to capabilities, are:

- Practitioner and Organization for reference resolution
- Condition and AllergyIntolerance for patient safety data
- Observation and DiagnosticReport for clinical results
- MedicationRequest, MedicationDispense, and MedicationStatement for medication data
- Immunization for vaccination records
- Encounter for visit context

The server's CapabilityStatement declares which resources it actually supports.

### Security

This requirements CapabilityStatement supports the IUA or SMART Resource Server role selected by the environment and use case. A deployment instance advertises only its selected protocol; see [Authorization](authorization.html#environment-specific-requirements).

### Profile Inheritance

Resources SHOULD conform to EU Core profiles where available.