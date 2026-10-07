This page describes common patterns for constructing an EHR system boundary that exposes the Interoperability Component API surface defined in this IG. These are implementation patterns, not separate conformance targets.

The exposed protected API has the [EU Authorization Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.html) role and uses the protocol-specific IUA or SMART Resource Server role selected for its environment. Its clients use the [EU Authorization Client](ActorDefinition-eu-authorization-client-eu-api.html) role; the [EU Authorization Server](ActorDefinition-eu-authorization-server-eu-api.html) remains distinct and MAY be co-located as a deployment choice. See [Authorization](authorization.html) for protocol details.

### Direct implementation

In a direct implementation, the EHR system exposes the API surface without relying on another component.

{% include img.html img="deployment-options-straight.drawio.svg" caption="Direct implementation" width="40%" %}

Functionally this is equivalent to the options below, although the internal implementation differs.

### Facade

A facade can expose the API surface in front of a base EHR system.

{% include img.html img="deployment-options-facade.drawio.svg" caption="Facade implementation" width="50%" %}

In this approach, the base EHR system is not updated. The facade uses proprietary APIs or internal integration points to provide the Interoperability Component API surface. The boundary of the EHR system is still the grey box, so the facade is treated as part of the deployed EHR system.

### Aggregator

An aggregator can provide the API surface for multiple underlying systems.

{% include img.html img="deployment-options-aggregator.drawio.svg" caption="Aggregator implementation" width="70%" %}

In this approach, the exposed EHR system boundary is the combination of the underlying systems. Testing and conformance are assessed at that combined boundary, not separately for each underlying system.

### Registry

A registry-style deployment publishes documents to a registry or repository component.

{% include img.html img="deployment-options-registry.drawio.svg" caption="Registry-style implementation" width="70%" %}

In this approach, source EHR systems publish documents, and the registry or repository component provides access to that content. This can make the registry or repository a separate system boundary.
