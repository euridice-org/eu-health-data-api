# Functional Requirements - EU Health Data API v1.0.0-ballot

## Functional Requirements

This section describes the functional capabilities and technical requirements for implementing the EU Health Data API.

### Actor Model

The specification defines composite actors that inherit from existing IHE and HL7 specifications. See [Actors and Transactions](actors.md) for detailed actor definitions, groupings, and transaction requirements.

### Core Functional Areas

#### Capability Discovery

Systems use FHIR CapabilityStatement to discover what priority categories and exchange patterns a provider supports. See [Capability Discovery](capability-discovery.md).

#### Authorization

Authorization using SMART or IHE IUA, with the applicable flow. Required for all transactions. See [Authorization](authorization.md).

#### Patient Identification

Patient demographics query using IHE PDQm to locate the correct patient before accessing health information. See [Patient Lookup](patient-match.md).

#### Document Exchange

Exchange of FHIR Documents (Patient Summaries, Lab Reports, Discharge Reports, etc.) using IHE MHD transactions. See [Document Exchange](document-exchange.md).

#### Resource Access

Query individual FHIR resources (Observations, Conditions, Medications, etc.) using IPA patterns. See [Resource Access](resource-access.md).

### Relationship Between Functional Areas

All exchange patterns follow a common flow:

1. **Discover**capabilities via CapabilityStatement
1. **Authorize**using SMART or IHE IUA, with the applicable flow
1. **Identify**the patient using PDQm
1. **Access**data via Document Exchange or Resource Access

The specification allows implementations to support document exchange only, resource access only, or both patterns depending on their use case and architecture.

