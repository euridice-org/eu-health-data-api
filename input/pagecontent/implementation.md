This section describes how this IG is applied in practice — how EHR systems fit within the EHDS ecosystem, and how this specification relates to the different contexts in which EHR data is accessed.

### The EHDS Data Exchange Chain

EHDS creates a chain of obligations from EHR systems all the way to cross-border exchange. Each layer has its own regulatory obligations and its own actors. This IG defines the API at the **EHR system layer**.

```
MyHealth@EU Network
  │  Cross-border exchange between Member States via NCPs.
  │  Governed by MyHealth@EU / eHDSI. Out of scope for this IG.
  │
National Contact Points (NCPs)
  │  Each Member State operates an NCP that routes cross-border requests
  │  to national infrastructure. Out of scope for this IG.
  │
National Infrastructure
  │  Member State-operated: health professional access services (HPAS),
  │  health data access services (EHDAS), national document repositories,
  │  identity services, authorization infrastructure.
  │  Obligations: EHDS Arts 4, 12, 23. Out of scope for this IG.
  │  National infrastructure acts as a *consumer* of this IG's API.
  │
Healthcare Organization
  │  Healthcare providers connect to national infrastructure.
  │  May deploy organizational gateways or facades that aggregate
  │  internal EHR systems and expose a single conformant API surface.
  │
EHR System  ←── This IG defines this API surface
      EHDS Annex II §2.1–2.6 obligations.
      CE-marking self-declaration (Arts 25, 30, 39–41).
      Regulatory obligations on EHR *vendors*, not national infra.
```

**Regulatory line:** The EHDS Regulation places specific conformance obligations on EHR *systems* (Annex II, Art 25/30). It places separate obligations on *Member States* for access services and national infrastructure (Arts 4, 12, 23). This IG targets the EHR system layer. National infrastructure and access services are described as context; their requirements are not specified here.

### Use Cases

The following use case pages describe how EHR systems and surrounding infrastructure use the API defined in this IG. Each page covers actors, workflows, technical flow, and scope boundaries.

**EHR System Deployment Contexts**

- [**Organization-Internal**](usecase-ehr-internal.html) — EHR systems operating within a healthcare provider. Internal document exchange, on-demand document patterns, and the organizational gateway/facade pattern.
- [**Cross-Organization via National Infrastructure**](usecase-cross-org.html) — EHR systems as nodes in national health data infrastructure. Covers federated and central-repository national patterns. Draws the line between EHR API obligations and national infrastructure.

**Access Service and Consumer Contexts**

- [**Health Professional Access Service**](usecase-health-professional-portal.html) — Healthcare professionals accessing EEHRxF data through a professional portal.
- [**Health Data Access Service**](usecase-health-data-portal.html) — Patients accessing their own health data through a national access service.
- [**Wellness App Access**](usecase-wellness-app.html) — Patient-facing applications reading health data using the same API transactions. Patient authentication is brokered via national access service infrastructure.

**Cross-Border**

- [**Cross-Border Exchange via NCP**](usecase-cross-border-ncp.html) — Health data exchange across EU borders via National Contact Points and MyHealth@EU.

**Walkthrough Example**

- [**Retrieve a European Patient Summary**](example-patient-summary.html) — Step-by-step walkthrough of the complete document access flow.

### Actor Usage

All use cases use the composite actors defined in [Actors and Transactions](actors.html):

- [Document Publisher](actors.html#document-publisher)
- [Document Access Provider](actors.html#document-access-provider)
- [Document Consumer](actors.html#document-consumer)
- [Resource Access Provider](actors.html#resource-access-provider)
- [Resource Consumer](actors.html#resource-consumer)
