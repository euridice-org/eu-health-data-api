# EHR System Composition Patterns - EU Health Data API v1.0.0-ballot

## EHR System Composition Patterns

This page describes common patterns for constructing an EHR system boundary that exposes the Interoperability Component API surface defined in this IG. These are implementation patterns, not separate conformance targets.

### Direct implementation

In a direct implementation, the EHR system exposes the API surface without relying on another component.

**Figure: Direct implementation**

Functionally this is equivalent to the options below, although the internal implementation differs.

### Facade

A facade can expose the API surface in front of a base EHR system.

**Figure: Facade implementation**

In this approach, the base EHR system is not updated. The facade uses proprietary APIs or internal integration points to provide the Interoperability Component API surface. The boundary of the EHR system is still the grey box, so the facade is treated as part of the deployed EHR system.

### Aggregator

An aggregator can provide the API surface for multiple underlying systems.

**Figure: Aggregator implementation**

In this approach, the exposed EHR system boundary is the combination of the underlying systems. Testing and conformance are assessed at that combined boundary, not separately for each underlying system.

### Registry

A registry-style deployment publishes documents to a registry or repository component.

**Figure: Registry-style implementation**

In this approach, source EHR systems publish documents, and the registry or repository component provides access to that content. This can make the registry or repository a separate system boundary.

