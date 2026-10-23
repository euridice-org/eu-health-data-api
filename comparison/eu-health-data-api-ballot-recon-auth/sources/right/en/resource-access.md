# Resource Access - EU Health Data API v1.0.0-ballot

## Resource Access

### Overview

Resource access provides query and read access to individual clinical FHIR resources. This is a parallel path to [FHIR Document Exchange](document-exchange.md).

A vaccination registry that serves Immunization resources, or a medication system that serves MedicationStatement resources, uses resource access without necessarily producing complete priority documents. Systems declare which resources they support.

Resource access for resources that also appear within FHIR Documents (e.g., Conditions referenced in a Patient Summary) is permitted but not required.

Data models for resource access inherit from [HL7 Europe Core](https://build.fhir.org/ig/hl7-eu/base/). This path corresponds to [Resource Interoperability Profiles](regulatoryAnchors.md#xt-ehr-deliverable-81-data-model-and-conformance-framework) in the Xt-EHR D8.1 conformance framework, aligned with the Xt-EHR Logical Models.

### Actors

* **Resource Access Provider** (server): Provides resource query capabilities
* **Resource Consumer** (client): Queries resources

See [Actors and Transactions](actors.md) for detailed actor groupings.

This version of the IG defines resource search and read access. How resources are supplied to a Resource Access Provider is outside its scope. See [Resource Exchange Patterns](resourceExchange.md) for background and possible future approaches.

### Specifications

This IG aligns with:

* [HL7 International Patient Access (IPA)](https://hl7.org/fhir/uv/ipa/STU1.1/), version 1.1.0 - Primary reference for resource access patterns and CapabilityStatements
* [IHE-QEDm](https://profiles.ihe.net/PCC/QEDm/) - Search parameters for resources not covered by IPA (e.g., DiagnosticReport, Encounter)

Data type-specific implementation guides MAY extend the required search patterns and search parameters for the resources in their domain. For example, the [MADO](https://hl7.eu/fhir/imaging-manifest/) implementation guide may define additional search requirements for ImagingStudy and DiagnosticReport in the Imaging Results priority category.

### Sequence Diagram

```
sequenceDiagram
    participant Consumer as Resource Consumer
    participant Provider as Resource Access Provider

    Consumer->>Provider: GET /Condition?patient=123
    Provider-->>Consumer: Bundle of Conditions

    Consumer->>Provider: GET /Observation?patient=123&category=vital-signs
    Provider-->>Consumer: Bundle of Observations

```

### Supported Resources

Following [International Patient Access (IPA)](https://hl7.org/fhir/uv/ipa/STU1.1/CapabilityStatement-ipa-server.html), Resource Access Providers are **not required to support all clinical resources**. Servers MAY choose which resources to implement based on their capabilities, use cases, and the regulatory context.

Servers declare which resources they support in their CapabilityStatement (see [Capability Discovery](capability-discovery.md)). Clients MAY check the server's CapabilityStatement to discover available resources before making requests.

See the [Resource Access Provider CapabilityStatement](CapabilityStatement-resource-access-provider-eu-api.md) and [Resource Consumer CapabilityStatement](CapabilityStatement-resource-consumer-eu-api.md) for detailed capability declarations.

#### Core Resources

Resource Access uses SMART App Launch 2.2 FHIR resource scopes selected for the endpoint's authorization flow: interactive Patient or Clinician Access uses the applicable `patient/` or `user/` scopes, and Backend Services uses applicable `system/` scopes. These are SMART scopes, not generic FHIR scopes or IUA transaction scopes. Core IUA defines no API-specific scope vocabulary; the IPA and PDQm interactions on this page are not IUA MHD transactions and have no IUA MHD transaction scopes. IUA deployments apply their selected authorization policy to these interactions. See [Authorization](authorization.md#tokens-scopes-enforcement-and-errors).

In the regulatory context of EHDS, the following resources represent individual data entries included in the priority data categories, so should be made available for read/search access if the system claims support for the corresponding priority data category. Data models inherit from [HL7 Europe Core](https://build.fhir.org/ig/hl7-eu/base/). Required search parameters are from [HL7 International Patient Access (IPA)](https://hl7.org/fhir/uv/ipa/STU1.1/) version 1.1.0, supplemented by [IHE-QEDm](https://profiles.ihe.net/PCC/QEDm/) where IPA does not define them.

**Resources by priority data category**

* **All priority data categories**: [Patient](#patient), [DocumentReference](#documentreference), [Practitioner](#practitioner), [Organization](#organization)
* **Patient Summary**: [Condition](#condition), [AllergyIntolerance](#allergyintolerance), [MedicationRequest](#medicationrequest), [MedicationStatement](#medicationstatement), [Immunization](#immunization)
* **ePrescription and eDispensation**: [MedicationRequest](#medicationrequest), [MedicationDispense](#medicationdispense)
* **Medical Test Results**: [Observation](#observation), [DiagnosticReport](#diagnosticreport)
* **Imaging Results**: [DiagnosticReport](#diagnosticreport), [ImagingStudy](#imagingstudy)
* **Discharge Reports**: [Encounter](#encounter)

The definitions below summarize each resource's data model and required search parameters. The normative requirements are in the [Resource Access Provider CapabilityStatement](CapabilityStatement-resource-access-provider-eu-api.md).

#### Patient

* Priority data categories: All
* Data model: [Patient (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-patient-eu-core.html)
* Search parameters: As described in the [Patient Matching](patient-match.md) page of this IG.

#### DocumentReference

* Priority data categories: All
* Data model: [MHD DocumentReference Comprehensive](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Comprehensive.DocumentReference.html)
* Search parameters: As described in the [Document Exchange](document-exchange.md) page of this IG.

#### Practitioner

* Priority data categories: All
* Data model: [Practitioner (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-practitioner-eu-core.html)
* Search parameters: This is not a patient-scoped resource, so there is no requirement for Resource Access Providers to support Search, only Read.

#### Organization

* Priority data categories: All
* Data model: [Organization (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-organization-eu-core.html)
* Search parameters: This is not a patient-scoped resource, so there is no requirement for Resource Access Providers to support Search, only Read.

#### Condition

* Priority data categories: Patient Summary
* Data model: [Condition (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-condition-eu-core.html)
* Search parameters: As described at [IPA CapabilityStatement: Condition](https://hl7.org/fhir/uv/ipa/STU1.1/CapabilityStatement-ipa-server.html#Condition1-2) and [QEDm 2:3.44](https://profiles.ihe.net/PCC/QEDm/PCC-44.html#234441213-conditions-option-search-parameters). Resource Access Providers are required to support searching by patient, as long as the Resource Consumer provides at least an id value for the Patient resource.

#### AllergyIntolerance

* Priority data categories: Patient Summary
* Data model: [AllergyIntolerance (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-allergyIntolerance-eu-core.html)
* Search parameters: As described at [IPA CapabilityStatement: AllergyIntolerance](https://hl7.org/fhir/uv/ipa/STU1.1/CapabilityStatement-ipa-server.html#AllergyIntolerance1-1) and [QEDm 2:3.44](https://profiles.ihe.net/PCC/QEDm/PCC-44.html#234441212-allergies-and-intolerances-option-search-parameters). Resource Access Providers are required to support searching by patient, as long as the Resource Consumer provides at least an id value for the Patient resource.

#### MedicationRequest

* Priority data categories: Patient Summary; ePrescription and eDispensation
* Data model: [MedicationRequest (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-medicationRequest-eu-core.html)
* Search parameters: As described at [IPA CapabilityStatement: MedicationRequest](https://hl7.org/fhir/uv/ipa/STU1.1/CapabilityStatement-ipa-server.html#MedicationRequest1-6) and [QEDm 2:3.44](https://profiles.ihe.net/PCC/QEDm/PCC-44.html#234441215-medications-option-search-parameters). Resource Access Providers are required to support searching by patient, as long as the Resource Consumer provides at least an id value for the Patient resource.

#### MedicationStatement

* Priority data categories: Patient Summary
* Data model: [MedicationStatement (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-medicationStatement-eu-core.html)
* Search parameters: As described at [IPA CapabilityStatement: MedicationStatement](https://hl7.org/fhir/uv/ipa/STU1.1/CapabilityStatement-ipa-server.html#MedicationStatement1-7) and [QEDm 2:3.44](https://profiles.ihe.net/PCC/QEDm/PCC-44.html#234441215-medications-option-search-parameters). Resource Access Providers are required to support searching by patient, as long as the Resource Consumer provides at least an id value for the Patient resource.

#### Immunization

* Priority data categories: Patient Summary
* Data model: [Immunization (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-immunization-eu-core.html)
* Search parameters: As described at [IPA CapabilityStatement: Immunization](https://hl7.org/fhir/uv/ipa/STU1.1/CapabilityStatement-ipa-server.html#Immunization1-4) and [QEDm 2:3.44](https://profiles.ihe.net/PCC/QEDm/PCC-44.html#234441216-immunizations-option-search-parameters). Resource Access Providers are required to support searching by patient, as long as the Resource Consumer provides at least an id value for the Patient resource.

#### MedicationDispense

* Priority data categories: ePrescription and eDispensation
* Data model: Not included in EU Core. Refer to [MedicationDispense: MPD](https://hl7.eu/fhir/mpd/StructureDefinition-MedicationDispense-eu-mpd.html)
* Search parameters: Not included in IPA or QEDm. As this is a patient-scoped resource, Resource Access Providers are required to support searching by patient, as long as the Resource Consumer provides at least an id value for the Patient resource.

#### Observation

* Priority data categories: Medical Test Results
* Data model: [Observation: Medical Test Result (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-medicalTestResult-eu-core.html)
* Search parameters: As described at [IPA CapabilityStatement: Observation](https://hl7.org/fhir/uv/ipa/STU1.1/CapabilityStatement-ipa-server.html#Observation1-8) and [QEDm 2:3.44](https://profiles.ihe.net/PCC/QEDm/PCC-44.html#234441211-simple-observations-option-search-parameters). Resource access providers are required to support Search requests that include both patient and category, both patient and code, all of patient, category, and code, or all of patient, category, and date.

#### DiagnosticReport

* Priority data categories: Medical Test Results; Imaging Results
* Data model: [DiagnosticReport (EU Core)](https://hl7.eu/fhir/base/StructureDefinition-diagnosticReport-eu-core.html)
* Search parameters: As described at [QEDm 2:3.44](https://profiles.ihe.net/PCC/QEDm/PCC-44.html#234441214-diagnostic-reports-option-search-parameters) (not included in IPA). Resource Access Providers are required to support searching by patient and category, all of patient, category, and code, or all of patient, category, and date. For imaging reports, the [MADO](https://hl7.eu/fhir/imaging-manifest/) implementation guide may define additional search requirements.

#### ImagingStudy

* Priority data categories: Imaging Results
* Data model: Not included in EU Core. Refer to [ImagingStudy: General](https://hl7.eu/fhir/imaging/en/StructureDefinition-ImagingStudyEuImaging.html) from HL7 Europe Imaging Report
* Search parameters: Not included in IPA or QEDm. As this is a patient-scoped resource, Resource Access Providers are required to support searching by patient, as long as the Resource Consumer provides at least an id value for the Patient resource. The [MADO](https://hl7.eu/fhir/imaging-manifest/) implementation guide may define additional search requirements.

#### Encounter

* Priority data categories: Discharge Reports
* Data model: Not included in EU Core. Refer to [Encounter (HDR)](https://hl7.eu/fhir/hdr/StructureDefinition-encounter-eu-hdr.html)
* Search parameters: As described in [QEDm 2:3.44](https://profiles.ihe.net/PCC/QEDm/PCC-44.html#234441218-encounters-option-search-parameters). Resource Access Providers are required to support searching by patient or patient and date.

This is a core subset of resources for ballot. Ballot feedback is requested on whether this set is appropriate. See [Open Issue #9](open-issues.md#issue-9-core-resource-set-validation).

This IG does not currently define requirements for advanced search features such as the `:not` modifier, `_include`/`_revinclude`, or chained parameters. Ballot feedback is requested. See [Open Issue #13](open-issues.md#issue-13-advanced-search-capabilities-for-resource-access).

### Example Queries

These examples use search combinations that providers support when they support the corresponding resource type. Additional filters depend on the capabilities declared by the server.

```
GET /AllergyIntolerance?patient=123
GET /Condition?patient=123
GET /Observation?patient=123&category=vital-signs&date=ge2024-01-01
GET /DiagnosticReport?patient=123&category=LAB
GET /MedicationRequest?patient=123

```

### Derived Resources

Derived resources SHOULD include a reference to their source, which may be a DocumentReference or a FHIR Document Bundle (Bundle.type = 'document').

```
{
  "resourceType": "Provenance",
  "target": [{"reference": "Observation/123"}],
  "entity": [{
    "role": "source",
    "what": {"reference": "DocumentReference/abc"}
  }]
}

```

```
{
  "resourceType": "Provenance",
  "target": [{"reference": "Observation/123"}],
  "entity": [{
    "role": "source",
    "what": {"reference": "Bundle/abc"}
  }]
}

```

The [IHE mXDE](https://profiles.ihe.net/ITI/mXDE/index.html) profile is an informative reference for extracting resources from documents while maintaining provenance. This IG does not require conformance to mXDE.

### References

* [HL7 International Patient Access (IPA)](https://hl7.org/fhir/uv/ipa/STU1.1/)
* [IHE mXDE](https://profiles.ihe.net/ITI/mXDE/index.html) (informative)
* [Actors and Transactions](actors.md)

