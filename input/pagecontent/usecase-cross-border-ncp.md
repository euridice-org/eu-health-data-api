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

Cross-border patient consent, health-professional authentication in the requesting country, and authorization at the NCP and national-infrastructure layers are governed by MyHealth@EU and Member State infrastructure. At the EHR-facing API boundaries, the consumer is an authorized EHR system or national-infrastructure component; how that authorization was established is outside the scope of this example.
