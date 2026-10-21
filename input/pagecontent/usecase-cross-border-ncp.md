### Overview

Cross-border exchange routes through National Contact Points for eHealth (NCPeHs), called NCPs below, over the MyHealth@EU infrastructure ([Art. 23(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)). When a patient from Country A receives care in Country B, Country B's NCP requests the patient's data from Country A's NCP, which then queries national infrastructure to retrieve it.

This IG defines the Interoperability Component API surface used at the **final step** — how national infrastructure (or the NCP itself) queries EHR systems for the patient's data.

### Scope

NCP-to-NCP exchange over MyHealth@EU is governed by the [NCPeH API specification](https://fhir.ehdsi.eu/ncp-api/), not by this IG. National infrastructure design — how a Member State routes an NCP query to the holding EHR systems — is a Member State choice (see [Cross-Organization via National Infrastructure](usecase-cross-org.html)).

This example illustrates the Document Query and Retrieve interaction pattern within MyHealth@EU. Other patterns, such as push-based exchange, are not illustrated here.

### Participants

- **Requesting EHR system** — requests patient data through its national NCP, as shown for context in the example
- **NCP or national infrastructure component** — acts as [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer) of the Interoperability Component API surface
- **Data-holding EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider); the conformance target of this IG

### National Infrastructure

National infrastructure is a logical grouping of systems, including EHR systems and national services such as registries and gateways. Its gateway or coordination components interface with one or more underlying EHR systems; the grouping does not imply a single monolithic system or replace those EHR systems.

### Architecture

{% include img.html img="cross-border-ncp.svg" caption="Illustrative cross-border query and response. The highlighted EHR-facing exchange can use the API defined by this IG." %}

The diagram shows a general query and response through the chain; it does not prescribe the transactions used by each intermediary. The highlighted exchange between a national infrastructure component and the data-holding EHR can use the API defined by this IG. National infrastructure is simplified to its gateway or coordination component. Member States may use other routing arrangements, including direct access from the NCP to an EHR system. These arrangements use the same EHR API boundary.

All layers exchange EEHRxF-formatted data.

### Authorization

Cross-border patient consent, health-professional authentication in the requesting country, and authorization at the NCP and national-infrastructure layers are governed by MyHealth@EU and Member State infrastructure — not by this IG. At the Interoperability Component API surface, the consumer is an authorized national-infrastructure component; how that authorization was established is out of scope here.
