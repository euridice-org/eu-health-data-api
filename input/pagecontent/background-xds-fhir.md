### Overview

EHR systems and national health infrastructures across the EU operate a variety of document-sharing backends — from modern FHIR-native servers to legacy XDS/XCA repositories. This IG accommodates both without requiring migration.

This page describes how the two primary deployment patterns differ technically, how they declare conformance, and how they coexist within the same actor model.

See [Member State Architectures](member-state-architectures.html) for how these patterns fit into national infrastructure, and [Document Exchange](document-exchange.html) for transaction details.

---

### Two Document Access Patterns

Both patterns implement the same [Document Access Provider](actors.html#document-access-provider) actor and respond to the same MHD transactions (ITI-67 Find Document References, ITI-68 Retrieve Document). The difference is how documents are *backed and materialized*.

#### Pattern 1 — FHIR-Native On-Demand

The EHR holds clinical data as discrete FHIR resources (Observation, Condition, MedicationStatement, Encounter, etc.) and **assembles FHIR Document Bundles at retrieval time**. Documents are views synthesized from the resource store — they are never persisted as static artifacts.

**How it works:**

- ITI-67 returns `DocumentReference` resources with **absent `content.attachment.hash` and `content.attachment.size`** — the MHD signal for an on-demand document. No option declaration is required; this is signaled structurally.
- At ITI-68 retrieval, the server synthesizes the Bundle. Consumers requesting `Accept: application/fhir+json` receive a `Bundle.type=document` assembled from current resource state.
- Backing operations include `Patient/[id]/$summary` (IPS) and `Composition/[id]/$document` (FHIR core). The materialization mechanism behind `attachment.url` is implementation-private.
- **ITI-105 (Simplified Publish) does not apply** — there is no separate Document Publisher role. The server's resource store *is* the data source; no inbound publication step is needed.

**Conformance declaration:**

The server's CapabilityStatement declares `supportedProfile: EehrxfMhdDocumentReference` only. The absent hash/size behavior is documented in the CapabilityStatement narrative.

**Typical deployment:** FHIR-native EHR (Epic, etc.), EHR exposing resources assembled from its clinical database, organizational facade over FHIR-resource-based systems.

#### Pattern 2 — Persisted / XDS-Bridge

The server holds **persisted DocumentReferences** (and associated Binary or document store entries). Documents are stored artifacts, not assembled on demand. This pattern encompasses both native FHIR document stores and MHD facades over legacy XDS/XCA repositories.

**How it works:**

- ITI-67 returns `DocumentReference` resources with **populated `content.attachment.hash` and `content.attachment.size`** — indicating a stored document.
- At ITI-68 retrieval, the server returns the stored artifact directly.
- Document Publishers submit documents via **ITI-105 (Simplified Publish)** or ITI-65 (Provide Document Bundle). The Document Access Provider accepts submissions via the [Document Submission Option](actors.html#document-submission-option).
- For XDS-bridge deployments: the MHD layer translates FHIR API calls to XDS/XCA queries against the underlying repository. `DocumentReference` elements map to XDS `DocumentEntry` attributes per MHD's normative mapping.

**Conformance declaration:**

The server's CapabilityStatement declares `supportedProfile: EehrxfMhdDocumentReference`. XDS-bridge servers that wish to assert full XDS-grade metadata additionally declare `supportedProfile: IHE.MHD.Comprehensive.DocumentReference` (MHD's Comprehensive profile directly — no EU-specific variant needed).

**Typical deployment:** National document repository, regional XDS infrastructure exposed via MHD facade, hospital document archive, central IHE-MHDS community.

---

### Coexistence

The two patterns use the same query workflow (ITI-67 + ITI-68) and the same EU profile (`EehrxfMhdDocumentReference`). A consumer cannot tell which pattern is in use from the transaction flow — only from the presence or absence of hash/size in the returned `DocumentReference`.

| | FHIR-native on-demand | Persisted / XDS-bridge |
|---|---|---|
| `attachment.hash` / `attachment.size` | **Absent** | Present |
| Documents persisted? | No | Yes |
| ITI-105 publish used? | No | Optional (Submission Option) |
| XDS/XCA backend? | No | Optional |
| CapStmt `supportedProfile` | `EehrxfMhdDocumentReference` | `EehrxfMhdDocumentReference` + optionally `IHE.MHD.Comprehensive.DocumentReference` |

#### Pattern 3 — Registry (Metadata Only)

A Document Access Provider may hold only `DocumentReference` metadata. `content.attachment.url` points to documents hosted elsewhere — at the originating EHR or a separate repository. Consumers follow that URL directly at ITI-68. No additional conformance requirements apply; `attachment.url` is opaque in MHD.

**Typical deployment:** A national metadata index that EHRs publish to via ITI-105. Discoverability is centralized; retrieval goes back to the source.

---

### MHD as the Bridge

[IHE MHD](https://profiles.ihe.net/ITI/MHD/) serves as the bridge between FHIR-native and XDS worlds. `DocumentReference` maps directly to XDS `DocumentEntry` per MHD's normative `DocumentEntry-Mapping`. This means:

- Existing national investments in XDS/XCA remain valid — no replacement required.
- New FHIR-native systems do not need XDS infrastructure.
- A Member State can operate both simultaneously, presenting a unified MHD API layer above a mixed backend.

For national infrastructure considerations, see [Member State Architectures](member-state-architectures.html).
