### Overview

An **EHR system** acts as a node in a Member State's national health data infrastructure, making patient health data available to authorized consumers: healthcare professional access services, cross-border national contact points, and other authorized systems.

This use case describes the **cross-organization perspective**: an EHR system that connects to national infrastructure to fulfill the EHDS interoperability obligations of its healthcare provider organization.

### Scope

This IG defines the **API contract at the EHR system boundary**. It does not define national infrastructure requirements — those vary by Member State and are governed by national implementation acts and EHDS Article 23. What varies across deployments is described below as informative context; only the EHR API surface is normative.

### Regulatory Context

Under EHDS:
- **EHR systems** must implement the interoperability component (Annex II §2.1–§2.6) — this is what this IG specifies
- **Member States** must establish health professional access services (Art 12), connect healthcare providers to national contact points (Art 23(5)), and ensure national infrastructure
- **National infrastructure** (repositories, federated query layers, MPIs, authorization services) is Member State responsibility

The EHR API surface defined here is where these two layers meet: national infrastructure calls this API to retrieve data from EHR systems.

### Actors

- **EHR system** acts as [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider) — the conformance target of this IG
- **National infrastructure** acts as [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer) — consumer of this IG's API, not specified here
- **Health Professional Access Service (HPAS)** queries national infrastructure or EHR systems directly — see [Use Case — Health Professional Access Service](usecase-health-professional-portal.html)
- **National Contact Point (NCP)** queries national infrastructure for cross-border exchange — see [Use Case — Cross-Border via NCP](usecase-cross-border-ncp.html)

### Workflow

1. A healthcare professional initiates a data access request through an HPAS (or NCP for cross-border)
2. The HPAS / national infrastructure authenticates the professional and determines which EHR systems hold relevant patient data
3. National infrastructure (or the HPAS directly) performs [patient lookup](patient-match.html) against the EHR system
4. National infrastructure queries the EHR for [documents](document-exchange.html) and/or [resources](resource-access.html)
5. Data is returned to the requesting consumer; the HPAS or NCP aggregates and presents it

### Patient Lookup in Cross-Organization Context

Patient identification across organizations is a national infrastructure concern. The EHR system's role:

- **SHALL** support identifier-based patient lookup (PDQm ITI-78) — every system must support a patient identifier floor
- **MAY** support demographic-based matching (`$match`) as a composable capability — member states may mandate this via procurement

Cross-border identification uses national identifiers routed through the NCP layer (EHDS Art 16, Identity IA). Demographic-based identity resolution for cross-border scenarios is a national infrastructure and NCP responsibility, not an EHR API requirement.

See [Patient Lookup](patient-match.html) for details.

### National Infrastructure Patterns

Member States implement national infrastructure in different ways. This IG accommodates all of these patterns — the EHR API surface is the same regardless of the national pattern in use. The following are informative examples.

#### Federated Query Model

EHR systems hold data locally. Queries are routed to relevant EHR systems by a national record locator or query broker. Examples: Netherlands, Sweden (national record locator with synthetic identifier minting for foreign patients).

```
HPAS → Record Locator → EHR System A  (this IG's API)
                      → EHR System B  (this IG's API)
                      → EHR System C  (this IG's API)
```

EHR responsibilities: expose a conformant [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider) endpoint that the record locator can query.

#### Central Repository Model

EHR systems publish documents to a national repository. Consumers query the repository. Examples: many national XDS deployments.

```
EHR System → [ITI-105 publish] → National Repository → HPAS / NCP
```

EHR responsibilities: act as [Document Publisher](actors.html#document-publisher), submitting documents to the national repository via ITI-105. The national repository acts as the Document Access Provider (not the EHR directly).

#### Hybrid Model

Some EHR systems expose a direct query API; others publish to a national repository; a national gateway aggregates both. The EHR API contract (this IG) applies at the EHR system boundary regardless of which pattern the national layer uses.

### Authorization in Cross-Organization Context

Cross-organization authorization is handled at the national infrastructure layer. The EHR system:

- **SHALL** support [SMART Backend Services](authorization.html) for system-to-system authorization
- Authenticates requests from national infrastructure or HPAS using credentials established at the national authorization layer
- Does not need to implement patient-context authorization or EU wallet integration — those are access-service layer concerns

National authorization infrastructure (IUA Authorization Servers, national identity providers, eIDAS-based identity) is out of scope for this IG.

### Relationship to Other Use Cases

| Use Case | Relationship |
|---|---|
| [Organization-Internal](usecase-ehr-internal.html) | Internal EHR systems feed data to the outward-facing EHR or gateway described here |
| [Health Professional Access Service](usecase-health-professional-portal.html) | HPAS is a consumer of this IG's API; its requirements are not specified here |
| [Health Data Access Service](usecase-health-data-portal.html) | HDAS is a consumer of this IG's API for patient-initiated access |
| [Cross-Border via NCP](usecase-cross-border-ncp.html) | NCP is a consumer of this IG's API at the national infrastructure layer |
| [Wellness App Access](usecase-wellness-app.html) | Wellness apps access data via access service infrastructure, using this IG's API transactions |
