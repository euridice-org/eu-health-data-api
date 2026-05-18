### Overview

A healthcare provider deploys one or more EHR systems to manage clinical data and support the organization's obligation to make that data accessible through national infrastructure.

### Actors

- **EHR systems** act as [Document Publisher](actors.html#document-publisher), [Document Access Provider](actors.html#document-access-provider), and/or [Resource Access Provider](actors.html#resource-access-provider)
- **A gateway** (when present) aggregates internal systems and presents a single conformant API surface outward

### Workflow

1. Clinicians document encounters; data is stored in EHR systems
2. EHR systems make data available for query (documents and/or resources)
3. When the organization connects outward, the gateway or EHR presents a conformant endpoint to national infrastructure or access services

### Deployment Options

**Direct** — EHR systems expose the API directly.

**Gateway** — An outward-facing gateway aggregates internal EHR systems and presents a single [Document Access Provider](actors.html#document-access-provider) endpoint to external consumers. Internal communication between the gateway and constituent systems is implementation-private per [IHE General Introduction §6.3](https://profiles.ihe.net/GeneralIntro/ch-6.html).

**Multi-product gateway** — A vendor may supply a gateway across multiple product lines (acute, ambulatory, laboratory). The gateway carries the conformance obligation; the constituent products are implementation-private.

See [Cross-Organization via National Infrastructure](usecase-cross-org.html) for how the organization connects outward.
