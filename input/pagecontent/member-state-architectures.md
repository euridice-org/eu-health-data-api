Member States across the European Union have diverse healthcare system architectures and health information exchange infrastructures. This Implementation Guide is designed to accommodate different architectural approaches while maintaining interoperability.

### Common Architectural Patterns

#### Centralized Repository

Some Member States operate centralized national repositories where health data is stored and accessed:
- EHR systems publish documents/resources to a central registry
- Consumers query the central registry for patient information
- National infrastructure manages authorization and access control

#### Federated Model

Other Member States use federated architectures where data remains at the source:
- EHR systems retain data locally
- Queries are federated across multiple systems
- National infrastructure routes queries to appropriate sources
- Some national infrastructures mimic a virtual national EHR by broadcasting the inbound request to all systems that have records to share for the patient and requested resource (using a record locator service) and aggregates a concatenated response on the fly

### Fitting This Specification to Different Architectures

This IG supports multiple deployment models by defining actors and transactions that can be implemented:

- **At the EHR system level** - Direct implementation of the API
- **At the organizational level** - Hospital or regional aggregation layer
- **At the national level** - National infrastructure exposing the API
- **Via façade** - Adaptation layer in front of existing systems

The specification focuses on the API contract, allowing flexibility in where and how it is implemented within Member State infrastructure.

### Compatibility with Existing Document Sharing Infrastructure

This specification accommodates existing document-sharing architectures (IHE XDS, XCA) without imposing those dependencies on new environments. [IHE MHD](https://profiles.ihe.net/ITI/MHD/) serves as the bridge: implementers MAY deploy it as a native FHIR document-sharing system or as a facade over XDS/XCA infrastructure. Because MHD's DocumentReference maps directly to XDS DocumentEntry, existing national investments remain valid.

Member States select the deployment model that fits their infrastructure:

- **FHIR-native**: A RESTful API with no XDS dependencies, suitable for new deployments.
- **MHD facade over XDS/XCA**: Existing XDS/XCA infrastructure exposes a FHIR API without replacement of underlying systems.
- **Hybrid**: Some facilities operate FHIR-native while others connect through a facade; a national-level gateway unifies access.

See [Actor Groupings](actors.html#example-groupings) for concrete combinations of these deployment models.

**Example — centralized national repository:** A national repository acts as the [Document Access Provider](actors.html#document-access-provider) with the [Document Submission Option](actors.html#document-submission-option), serving queries from consumers (other Member States, patient portals, care providers). EHR systems across the country act as [Document Publishers](actors.html#document-publisher), submitting FHIR Documents (Patient Summaries, Laboratory Reports, Discharge Reports) to the repository via [ITI-105](document-exchange.html). The repository aggregates and serves documents on their behalf — EHR systems publish data but do not need to host APIs themselves.

When every system in a Member State conforms to this specification, the national infrastructure presents a single API layer for health data access, whether the underlying systems are XDS-based, FHIR-native, or a mixture of both.
