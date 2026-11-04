### Overview

Cross-border health-data exchange routes through National Contact Points for eHealth (NCPeHs), called NCPs below, over the MyHealth@EU infrastructure ([Art. 23(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)). When a patient from Country A receives care in Country B, the requesting EHR in Country B queries its national infrastructure. The request passes through the two countries' NCPs to Country A's national infrastructure, which obtains the data from the holding EHR and returns it along the chain.

National infrastructure connects EHR systems with their NCP in each country. It represents a logical grouping of services, such as gateways, registries and repositories, rather than a single system. Its organization and routing vary by Member State; see [Member State Architectures](member-state-architectures.html) and [Cross-Organization via National Infrastructure](usecase-cross-org.html).

### Cross-Border Query

{% include img.html img="cross-border-ncp.svg" caption="This implementation guide targets the EHR-facing queries." %}

The diagram illustrates the query and response path. National infrastructure is simplified on both sides; deployments may combine components or connect an EHR directly to its NCP. Formats and protocols may differ between interfaces, with translation performed by national services or gateways.

### Scope

This implementation guide targets the EHR-facing queries highlighted in the diagram:

- **Requesting side:** the EHR acts as a [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer), querying an access provider in its national infrastructure.
- **Data-holding side:** national infrastructure acts as a consumer of the EHR's [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider).

NCP-to-NCP exchange follows the [NCPeH API specification](https://fhir.ehdsi.eu/ncp-api/). Interfaces within national infrastructure are defined by Member States.

This example illustrates query and retrieve; other interaction patterns, such as push-based exchange, are not shown.

### Authorization

Cross-border patient consent, health-professional authentication in the requesting country, and authorization at the NCP and national-infrastructure layers are governed by MyHealth@EU and Member State infrastructure — not by this IG. At the highlighted API boundaries, the consumer is an authorized EHR system or national-infrastructure component; how that authorization was established is out of scope here.

At those API boundaries, the consumer is the [Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.html), and the protected EHR endpoint is the [Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.html). The [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.html) is a distinct participant.

The final infrastructure-to-EHR hop is separate from NCP-to-NCP exchange. For MyHealth@EU, authorization remains outside this IG; [Authorization](authorization.html#myhealth-eu) recommends alignment with [IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html). This use case does not select an authorization flow for MyHealth@EU; applicable MyHealth@EU and deployment requirements govern its participants and prerequisites. For a separate National Interoperability Infrastructure hop, [IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html) is recommended only under the conditions in [Authorization](authorization.html#national-interoperability-infrastructure). If selected, the generic roles are realized by the [IHE IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.html), [IHE IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.html), and a distinct [IHE IUA Authorization Server](ActorDefinition-iua-authorization-server-eu-api.html); the client obtains a token with [ITI-71](https://profiles.ihe.net/ITI/TF/Volume2/ITI-71.html) and presents it with [ITI-72](https://profiles.ihe.net/ITI/TF/Volume2/ITI-72.html). Any MHD transaction scope depends on the supported interaction and deployment. This use case does not select an IUA transaction or flow for a particular endpoint. The NCPeH API remains the specification for NCP-to-NCP exchange.
Cross-border patient consent, health-professional authentication in the requesting country, and authorization at the NCP and national-infrastructure layers are governed by MyHealth@EU and Member State infrastructure. At the EHR-facing API boundaries, the consumer is an authorized EHR system or national-infrastructure component; how that authorization was established is outside the scope of this example.
