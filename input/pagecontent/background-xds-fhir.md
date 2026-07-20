### Overview

EHR systems across the EU use different approaches to manage health documents — from FHIR servers that generate documents from clinical resources, to document-centric systems backed by XDS/XCA repositories. This IG defines an Interoperability Component API surface that both approaches can expose.

The choice of approach is **orthogonal to organizational deployment topology**. A FHIR server and an XDS system can each be deployed directly, behind a facade, or as part of a national infrastructure. Both expose the same ITI-67 and ITI-68 API surface.

See [Document Exchange](document-exchange.html) for transaction details and [Member State Architectures](member-state-architectures.html) for national infrastructure patterns.

---

### FHIR Server

The server holds clinical data as FHIR resources (Observation, Condition, MedicationStatement, Encounter, etc.) and assembles FHIR Document Bundles at retrieval time. Documents are views generated from the resource store — never persisted as static artifacts.

- ITI-67 returns `DocumentReference` resources with **absent `hash` and `size`** — MHD's signal for an on-demand document.
- At ITI-68, the server synthesizes the Bundle from current resource state. `attachment.url` is implementation-private; the materialization mechanism (e.g., `Patient/$summary`, `Composition/$document`) is not constrained.
- ITI-105 does not apply — no inbound publication is needed; the resource store is the data source.
- A FHIR server MAY also expose the same clinical resources directly via [Resource Access](resource-access.html). Documents and resources are complementary views of the same underlying data.

**CapabilityStatement:** declares DocumentReference search support and the required search parameters. ITI-67 results use base FHIR DocumentReference resources.

---

### Document-Centric System

Documents are stored artifacts. This covers two common implementations:

**FHIR Document Store** — a FHIR server that persists `DocumentReference` resources and associated content (Binary or Bundle). Publishers submit via ITI-105 (Simplified Publish) or ITI-65 (Provide Document Bundle). ITI-67 queries the stored metadata; ITI-68 retrieves the stored content.

**XDS Proxy** — an MHD translation layer over a XDS/XCA repository. FHIR API calls are translated to XDS transactions against the underlying registry and repository. MHD defines mappings between FHIR `DocumentReference` and XDS `DocumentEntry` metadata; this allows existing national XDS investments to remain in place.

Both expose base FHIR DocumentReference resources. XDS-backed systems that need richer XDS/XCA metadata should also use the metadata capabilities and mappings defined by MHD; this IG does not scope full XDS metadata conformance.

**`attachment.hash` and `size` are present** in both — indicating stored documents.

**Variant — Metadata Registry:** A document-centric system MAY hold only `DocumentReference` metadata, with `attachment.url` pointing to documents hosted at source systems. Consumers follow that URL at ITI-68. No additional conformance requirements apply.

---

### The Shared API Contract

A consumer using ITI-67 and ITI-68 cannot tell which approach the server uses — only whether hash/size is present or absent. Both approaches return base FHIR DocumentReference resources through the same transactions.

| | FHIR Server | Document-Centric System |
|---|---|---|
| `attachment.hash` / `size` | **Absent** | Present |
| Documents persisted? | No | Yes |
| Resources exposed via IPA? | MAY | No |
| ITI-105 publish used? | No | Optional |
| XDS/XCA backend? | No | Optional |

[IHE MHD](https://profiles.ihe.net/ITI/MHD/) enables this interoperability by defining mappings between FHIR `DocumentReference` and XDS `DocumentEntry` metadata, allowing FHIR servers and XDS systems to participate in the same document exchange network.
