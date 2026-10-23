# EHR System Composition Patterns - EU Health Data API v1.0.0-ballot

## EHR System Composition Patterns

This page describes common patterns for constructing an EHR system boundary that exposes the Interoperability Component API surface defined in this IG. These are implementation patterns, not separate conformance targets.

The exposed protected API has the [Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.md) role and uses the protocol-specific IUA or SMART Resource Server role selected for its environment. Its clients use the [Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.md) role; the [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.md) remains distinct and MAY be co-located as a deployment choice. See [Authorization](authorization.md) for protocol details.

The [Authentication Service](ActorDefinition-authentication-service-eu-api.md) may separately be grouped with the Authorization Server or independently deployed. That choice does not determine the EHR system boundary or require a central identity service; see [authentication and authorization groupings](actors.md#authentication-and-authorization-groupings).

### Direct implementation

In a direct implementation, the EHR system exposes the API surface without relying on another component.

**Direct implementation**

Functionally this is equivalent to the options below, although the internal implementation differs.

### Facade

A facade can expose the API surface in front of a base EHR system.

**Facade implementation**

In this approach, the base EHR system is not updated. The facade uses proprietary APIs or internal integration points to provide the Interoperability Component API surface. The boundary of the EHR system is still the grey box, so the facade is treated as part of the deployed EHR system.

### Aggregator

An aggregator can provide the API surface for multiple underlying systems.

**Aggregator implementation**

In this approach, the exposed EHR system boundary is the combination of the underlying systems. Testing and conformance are assessed at that combined boundary, not separately for each underlying system.

### Registry

A registry-style deployment publishes documents to a registry or repository component.

**Registry-style implementation**

In this approach, source EHR systems publish documents, and the registry or repository component provides access to that content. This can make the registry or repository a separate system boundary.

