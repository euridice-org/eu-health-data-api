### Overview

An EHR system acts as a node in a Member State's national health data infrastructure, making patient data available to authorized consumers — health professional access services, national contact points, and other authorized systems.

### Scope

This IG defines the API at the EHR system boundary. National infrastructure varies by Member State and is governed by [Art. 23](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327). The patterns below are informative.

### Participants

- **EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider); the conformance target of this IG
- **National infrastructure** — [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer); not specified here
- **Health Professional Access Service** — see [Health Professional Access Service](usecase-health-professional-portal.html)
- **National Contact Point** — see [Cross-Border via NCP](usecase-cross-border-ncp.html)

### National Infrastructure Patterns

**Federated** — A record locator routes queries to individual EHR systems. The EHR exposes a query API.

```
Record Locator → EHR System A  (this IG)
              → EHR System B  (this IG)
```

**Central repository** — EHRs publish documents to a national repository, which serves queries. The EHR acts as [Document Publisher](actors.html#document-publisher); the repository is the Access Provider.

```
EHR → [ITI-105] → National Repository → Consumers
```

Both patterns use the same EHR API surface. See [Member State Architectures](member-state-architectures.html) for more detail.

### Patient Lookup

Every EHR SHALL support identifier-based patient lookup (PDQm ITI-78). Demographic matching and cross-border identification are national infrastructure concerns; EHRs MAY support `$match` as a composable capability. See [Patient Lookup](patient-match.html).

### Authorization

EHRs authenticate requests using credentials established at the national authorization layer. The details of that authorization infrastructure — identity providers, authorization servers, eIDAS — are out of scope for this IG.
