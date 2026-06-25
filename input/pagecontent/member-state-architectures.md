**This page is informative.** It illustrates how national infrastructures can use the interoperability component API surface defined in this IG; it defines no conformance requirements of its own.

Member States across the European Union have diverse healthcare system architectures and health information exchange infrastructures. This IG accommodates that diversity by defining the **interoperability component API surface** without prescribing national infrastructure design.

This page describes the two primary national architectural patterns and how EHR systems fit within each. For how EHR systems are deployed internally within healthcare organizations, see [Use Case — Provider-Internal Exchange](usecase-provider-internal-exchange.html). For how EHR systems connect externally, see [Use Case — Cross-Organization via National Infrastructure](usecase-cross-org.html).

### National Infrastructure is Out of Scope

The EHDS Regulation places the obligation to build and operate national health data interoperability infrastructure on **Member States** (Arts 4, 12, 23). This IG defines the API surface at the EHR system boundary and provides informative examples of how it can be used across Member States. How Member States structure their national infrastructure is their decision; this IG does not prescribe it.

The two patterns below are **informative examples** of how national infrastructure can use the interoperability component API surface.

---

### Pattern 1: Centralized Repository

EHR systems publish documents to a national (or regional) repository. Consumers query the repository rather than individual EHR systems.

```
EHR System A ──[ITI-105 publish]──▶ National Repository ──[ITI-67/68 query]──▶ HPAS / NCP
EHR System B ──[ITI-105 publish]──▶         ▲
EHR System C ──[ITI-105 publish]─────────────┘
```

**EHR system role:** [Document Publisher](actors.html#document-publisher), submitting documents via ITI-105. The national repository acts as the [Document Access Provider](actors.html#document-access-provider); EHR systems do not need to host a query API.

**Common in:** Existing national XDS/XCA deployments. Repository may be FHIR-native or XDS-backed behind an MHD facade. See [Relationship to XDS/FHIR Document Sharing](background-xds-fhir.html) for how these backends differ technically.

---

### Pattern 2: Federated Query

Data stays at the EHR system. A national record locator routes queries to the relevant EHR systems; responses may be aggregated by the national layer.

```
HPAS / NCP ──▶ Record Locator ──[ITI-67/68]──▶ EHR System A  (this IG)
                               ──[ITI-67/68]──▶ EHR System B  (this IG)
                               ──[ITI-67/68]──▶ EHR System C  (this IG)
```

**EHR system role:** [Document Access Provider](actors.html#document-access-provider), hosting a query and retrieval endpoint. The national record locator is a [Document Consumer](actors.html#document-consumer) of each EHR system's API surface.

**Common in:** Netherlands, Sweden (national record locator with patient identifier resolution at the national layer). EHR systems expose a conformant API endpoint; the national layer handles routing and aggregation.

---

### Existing XDS/XCA Infrastructure

This IG does not require migration from existing document-sharing infrastructure. [IHE MHD](https://profiles.ihe.net/ITI/MHD/) bridges FHIR API calls to XDS/XCA backends, allowing existing national investments to remain valid.

See [Relationship to XDS/FHIR Document Sharing](background-xds-fhir.html) for technical detail on FHIR server and XDS deployment patterns.
