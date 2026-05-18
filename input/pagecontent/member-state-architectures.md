Member States across the European Union have diverse healthcare system architectures and health information exchange infrastructures. This IG accommodates that diversity by defining the **EHR system API surface** without prescribing national infrastructure design.

This page describes the two primary national architectural patterns and how EHR systems fit within each. For how EHR systems are deployed internally within healthcare organizations, see [Use Case — Organization-Internal Exchange](usecase-ehr-internal.html). For how EHR systems connect externally, see [Use Case — Cross-Organization via National Infrastructure](usecase-cross-org.html).

### National Infrastructure is Out of Scope

The EHDS Regulation places the obligation to build and operate national health data infrastructure on **Member States** (Arts 4, 12, 23) — not on EHR vendors. This IG defines the API contract at the EHR system boundary. How Member States structure their national infrastructure is their decision; this IG does not prescribe it.

The two patterns below are **informative examples** of how national infrastructure can use this IG's API.

---

### Pattern 1 — Centralized Repository

EHR systems publish documents to a national (or regional) repository. Consumers query the repository rather than individual EHR systems.

```
EHR System A ──[ITI-105 publish]──▶ National Repository ──[ITI-67/68 query]──▶ HPAS / NCP
EHR System B ──[ITI-105 publish]──▶         ▲
EHR System C ──[ITI-105 publish]──┘
```

**EHR system role:** [Document Publisher](actors.html#document-publisher) — submits documents via ITI-105. The national repository acts as the [Document Access Provider](actors.html#document-access-provider); EHR systems do not need to host a query API.

**Common in:** Many existing national XDS deployments. Repository may be FHIR-native or XDS-backed behind an MHD facade. See [Relationship to XDS and FHIR Document Sharing](background-xds-fhir.html) for how these backends differ technically.

---

### Pattern 2 — Federated Query

Data stays at the EHR system. A national record locator routes queries to the relevant EHR systems; responses are aggregated by the national layer.

```
HPAS / NCP ──▶ Record Locator ──[ITI-67/68]──▶ EHR System A  (this IG's API)
                               ──[ITI-67/68]──▶ EHR System B  (this IG's API)
                               ──[ITI-67/68]──▶ EHR System C  (this IG's API)
```

**EHR system role:** [Document Access Provider](actors.html#document-access-provider) — hosts a query and retrieval API. The national record locator is a [Document Consumer](actors.html#document-consumer) of each EHR's API.

**Common in:** Netherlands, Sweden (national record locator with patient identifier resolution at the national layer). EHR systems expose a conformant API endpoint; the national layer handles routing and aggregation.

---

### Hybrid

Some Member States operate both patterns simultaneously — some EHR systems publish to a central repository while others are queried directly. A national gateway unifies access behind a single query surface. The EHR API contract (this IG) applies at each EHR system boundary regardless of the national pattern.

---

### Existing XDS/XCA Infrastructure

This IG does not require migration from existing document-sharing infrastructure. [IHE MHD](https://profiles.ihe.net/ITI/MHD/) bridges FHIR API calls to XDS/XCA backends, allowing existing national investments to remain valid.

See [Relationship to XDS/FHIR Document Sharing](background-xds-fhir.html) for technical detail on FHIR server and XDS deployment patterns.
