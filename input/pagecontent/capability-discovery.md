### Overview

Systems discover capabilities via FHIR CapabilityStatement (`GET /metadata`). Consumers inspect a provider's functionality before attempting transactions.

### Transaction

Capability discovery uses the standard FHIR capabilities interaction:

```
GET [base]/metadata
```

The server returns a CapabilityStatement resource that declares:
- Supported FHIR version
- Supported resource types and profiles
- Supported interactions (read, search, create, etc.)
- Supported search parameters
- Actor conformance and priority category support (see below)

### Provider Actors

Different provider actors advertise different capabilities:

- **Document Access Provider**: Advertises document exchange capabilities (MHD ITI-67, ITI-68 transactions; ITI-105 with Document Submission Option)
- **Resource Access Provider**: Advertises resource query capabilities (IPA patterns)

A system may implement one or both.

### Actor Conformance via `instantiates`

Servers declare actor conformance using `CapabilityStatement.instantiates`, referencing the normative CapabilityStatements in this IG:

- [Document Access Provider](CapabilityStatement-EEHRxF-DocumentAccessProvider.html)
- [Document Access Provider — Document Submission Option](CapabilityStatement-EEHRxF-DocumentAccessProvider-SubmissionOption.html)
- [Grouped Document Publisher/Access Provider](CapabilityStatement-EEHRxF-DocumentPublisherAccessProvider.html)
- [Resource Access Provider](CapabilityStatement-EEHRxF-ResourceAccessProvider.html)

Consumers inspect `instantiates` to determine which actor roles and exchange patterns a server supports.

### Priority Category Support

The EHDS ANNEX II priority categories are:

- European Patient Summary (EPS)
- Medication Prescription & Dispense (MPD)
- Laboratory Results
- Hospital Discharge Reports (HDR)
- Imaging Reports
- Imaging Manifests

Servers declare which priority categories they support by listing content IG canonical URLs in `CapabilityStatement.implementationGuide`. Consumers inspect `implementationGuide` to discover supported categories, then query by `DocumentReference.type` (LOINC) for specific document types. See [Document Exchange](document-exchange.html) for the type codes per priority category.

### Profile Declarations

The normative CapabilityStatements in this IG declare `supportedProfile` on:

- **DocumentReference** — the [EEHRxF MHD DocumentReference](StructureDefinition-EehrxfMhdDocumentReference.html) profile and the base [MHD DocumentReference](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Minimal.DocumentReference.html) profiles
- **Patient** — the [EU Core Patient](http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core) profile

These tell consumers which resource profiles to expect.

### Example Capability Discovery Flow

```mermaid
sequenceDiagram
    participant Consumer
    participant Provider

    Consumer ->> Provider: GET [base]/metadata
    Provider -->> Consumer: CapabilityStatement

    Note over Consumer: Consumer inspects:<br/>- instantiates (actor conformance)<br/>- implementationGuide (content IGs)<br/>- rest.resource.supportedProfile (profiles)<br/>- rest.resource (supported resources)
```

### Example: Server Supporting Multiple Priority Categories

See the [example CapabilityStatement](CapabilityStatement-EEHRxF-DocumentAccessProvider-Example.html) for a Document Access Provider serving Patient Summaries and Laboratory Reports.

The key elements a consumer looks for:

```json
{
  "instantiates": [
    "...CapabilityStatement/EEHRxF-DocumentAccessProvider"
  ],
  "implementationGuide": [
    "http://hl7.eu/fhir/eps",
    "http://hl7.eu/fhir/laboratory"
  ],
  "rest": [{
    "resource": [{
      "type": "DocumentReference",
      "supportedProfile": [
        "...EehrxfMhdDocumentReference",
        "...IHE.MHD.Minimal.DocumentReference"
      ]
    }, {
      "type": "Patient",
      "supportedProfile": [
        "...patient-eu-core"
      ]
    }]
  }]
}
```

### See Also
- [FHIR CapabilityStatement](https://hl7.org/fhir/R4/capabilitystatement.html)
- [Actors and Transactions](actors.html)
- [IHE MHD](https://profiles.ihe.net/ITI/MHD/)
- [Document Exchange](document-exchange.html)
