### Overview

An EHR system acts as a participant in a Member State's national interoperability infrastructure, enabling cross-organization data exchange. 

### Scope

National infrastructure design is a Member State choice and is not prescribed by EHDS or this IG. This IG defines the EHR interoperability component API surface at the EHR system boundary, and this deployment scenario shows how EHR systems conforming to this IG can support data exchange in different Member State architectures.

### Participants

- **EHR system** — [Document Publisher](actors.html#document-publisher), [Document Access Provider](actors.html#document-access-provider), and/or [Resource Access Provider](actors.html#resource-access-provider); the conformance target of this IG
- **National interoperability infrastructure** — [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer); informative, not specified here

### Example Deployment Patterns

#### Federated

A national "record location" service holds references to where patient data resides. A consumer queries the record locator to identify which EHR systems hold data for a patient, then uses this information to queries those systems directly or through a proxy. 

```
Consumer → Record Locator ──→ EHR System A
                          └──→ EHR System B
```

In this scenario, data-holidng EHR(s) acting as Document/Resource Access Providers offer query access to their data to destination EHR's acting as Document/Resource Consumers; the record locator is national infrastructure outside the scope of this IG.

#### Central Repository

In this model, source EHR systems publish documents to a central national repository (or repositories), which enable acccess to this data by offering query access to consuming systems. 

```
EHR System (source) ──[publish]──→ National Repository ──→ Consumer
```

The source EHR acts as [Document Publisher](actors.html#document-publisher) towards the central repository (Document Access Provider), which enables EHRs acting as Docuemnt Consumers to query.

Both patterns use the same EHR interoperability component API surface defined in this IG. See [Member State Architectures](member-state-architectures.html) for more detail.

### Patient Lookup

In both patterns, a consumer needs to identify which patient data to retrieve. One approach is a national patient identity service that resolves a set of identity attributes to a national patient identifier, which the consumer then uses to query EHR systems. 

### Authorization

Authorization methods to secure cross-organization exchange is a national architecture choice outside the scope of this IG. Member states choosing to align with the SMART Backend Client Credentials functionality would benefit from EHR system support as defined in the authorization page (link) within this IG.
