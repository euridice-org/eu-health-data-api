# Cross-Border Exchange via NCP - EU Health Data API v1.0.0-ballot

## Cross-Border Exchange via NCP

### Overview

Cross-border exchange routes through National Contact Points for eHealth (NCPeHs), called NCPs below, over the MyHealth@EU infrastructure ([Art. 23(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)). When a patient from Country A receives care in Country B, Country B's NCP requests the patient's data from Country A's NCP, which then queries national infrastructure to retrieve it.

This IG defines the API surface that can be used at both EHR-facing steps: the requesting EHR accessing its NCP, and national infrastructure (or the NCP itself) querying the data-holding EHR.

### Scope

NCP-to-NCP exchange over MyHealth@EU is governed by the [NCPeH API specification](https://fhir.ehdsi.eu/ncp-api/), not by this IG. National infrastructure design — how a Member State routes an NCP query to the holding EHR systems — is a Member State choice (see [Cross-Organization via National Infrastructure](usecase-cross-org.md)).

This example illustrates the Document Query and Retrieve interaction pattern within MyHealth@EU. Other patterns, such as push-based exchange, are not illustrated here.

### Participants

* **Requesting EHR system** — acts as a [Document Consumer](actors.md#document-consumer) and/or [Resource Consumer](actors.md#resource-consumer), requesting patient data through its national NCP
* **NCP or national infrastructure component** — provides access to the requesting EHR as a [Document Access Provider](actors.md#document-access-provider) and/or [Resource Access Provider](actors.md#resource-access-provider), and accesses the data-holding EHR as a [Document Consumer](actors.md#document-consumer) and/or [Resource Consumer](actors.md#resource-consumer)
* **Data-holding EHR system** — [Document Access Provider](actors.md#document-access-provider) and/or [Resource Access Provider](actors.md#resource-access-provider)

### National Infrastructure

National infrastructure is a logical grouping of systems, including EHR systems and national services such as registries and gateways. Its gateway or coordination components interface with one or more underlying EHR systems; the grouping does not imply a single monolithic system or replace those EHR systems.

### Architecture

**Illustrative cross-border query and response. The highlighted EHR-facing exchanges can use the API defined by this IG.**

The diagram shows a general query and response through the chain; it does not prescribe the transactions used by each intermediary. Both highlighted EHR-facing exchanges can use the API defined by this IG. National infrastructure is simplified to its gateway or coordination component. Member States may use other routing arrangements, including direct access from the NCP to an EHR system. These arrangements use the same EHR API boundary.

All layers exchange EEHRxF-formatted data.

### Authorization

Cross-border patient consent, health-professional authentication in the requesting country, and authorization at the NCP and national-infrastructure layers are governed by MyHealth@EU and Member State infrastructure — not by this IG. At the highlighted API boundaries, the consumer is an authorized EHR system or national-infrastructure component; how that authorization was established is out of scope here.

At those API boundaries, the consumer is the [Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.md), and the protected EHR endpoint is the [Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.md). The [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.md) is a distinct participant.

The final infrastructure-to-EHR hop is separate from NCP-to-NCP exchange. For MyHealth@EU, authorization remains outside this IG; [Authorization](authorization.md#myhealth-eu) recommends alignment with [IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html). This use case does not select an authorization flow for MyHealth@EU; applicable MyHealth@EU and deployment requirements govern its participants and prerequisites. For a separate National Interoperability Infrastructure hop, [IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html) is recommended only under the conditions in [Authorization](authorization.md#national-interoperability-infrastructure). If selected, the generic roles are realized by the [IHE IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.md), [IHE IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.md), and a distinct [IHE IUA Authorization Server](ActorDefinition-iua-authorization-server-eu-api.md); the client obtains a token with [ITI-71](https://profiles.ihe.net/ITI/TF/Volume2/ITI-71.html) and presents it with [ITI-72](https://profiles.ihe.net/ITI/TF/Volume2/ITI-72.html). Any MHD transaction scope depends on the supported interaction and deployment. This use case does not select an IUA transaction or flow for a particular endpoint. The NCPeH API remains the specification for NCP-to-NCP exchange.

