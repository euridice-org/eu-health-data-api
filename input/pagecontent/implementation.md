This IG defines the API contract for EHR systems under EHDS. Each layer of the EHDS data exchange chain carries distinct regulatory obligations. This page describes where the EHR system API fits, who is responsible for what, and how the use cases below map to that chain.

### The EHDS Data Exchange Chain

EHDS data flows through several layers, from individual EHR systems up to cross-border exchange between Member States. The layers are:

---

**EHR System** — *This IG*

EHR systems store and serve patient health data in EEHRxF format. EHDS [Annex II §2.1–2.6](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327#anx_II) requires EHR systems to provide an API for access to and receipt of priority-category data. This IG specifies that API. EHR vendors demonstrate conformance via CE-marking self-declaration ([Arts. 25, 30, 39–41](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327)).

**Healthcare Organization** — *Described; not specified*

Healthcare providers deploy one or more EHR systems. They connect those systems to national infrastructure. How they connect — directly, through an organizational gateway, or through a vendor-supplied facade — is an organizational decision. This IG describes common patterns but does not mandate a specific approach.

**National Interoperability Infrastructure** — *Out of scope — Member State obligation*

Each Member State operates infrastructure that connects healthcare organizations to access services and to cross-border networks. This infrastructure may include document repositories, federated query layers, master patient indexes (MPIs), and authorization services. The design varies by Member State. [Art. 23](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327) places this obligation on Member States, not on EHR vendors. National infrastructure acts as a *consumer* of this IG's API; its own requirements are not specified here.

**Access Services (EHDAS / HPAS)** — *Out of scope — Member State obligation*

Member States must establish an Electronic Health Data Access Service ([Art. 4](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327)) for patient access and a Health Professional Access Service ([Art. 12](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327)) for clinician access. Access services act as consumers of this IG's API. Wellness applications and patient apps connect through access service infrastructure, not directly to EHR systems. Access service requirements are out of scope for this IG.

**EHR System Implementation Approach** — *See [Relationship to XDS/FHIR Document Sharing](background-xds-fhir.html)*

EHR systems may implement this IG using a FHIR server (documents assembled on demand from clinical resources) or a document-centric system (documents persisted, optionally backed by XDS/XCA). Both approaches share the same API contract. This choice is orthogonal to organizational deployment topology.

---

**Cross-Border Exchange (MyHealth@EU / NCP)** — *Out of scope — separate specification*

National Contact Points exchange data across borders via the MyHealth@EU network ([Art. 23](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327)). NCP-to-NCP exchange is governed by the [NCPeH API specification](https://build-fhir.ehdsi.eu/ncp-api/), not this IG. The national infrastructure layer connects EHR systems to the NCP; the EHR system API is the entry point at the bottom of that chain.

---

### Use Cases

The following pages describe how this IG's API is used in specific deployment contexts. Each covers actors, workflow, technical flow, and scope boundaries.

#### EHR System Deployment

- [**Organization-Internal Exchange**](usecase-ehr-internal.html) — EHR systems within a healthcare provider: direct deployment, gateway, and multi-product facade patterns.

- [**Cross-Organization via National Infrastructure**](usecase-cross-org.html) — EHR systems as nodes in national health data infrastructure; federated and central-repository patterns.

- [**Cross-Border via NCP**](usecase-cross-border-ncp.html) — EU cross-border exchange via National Contact Points and MyHealth@EU.

#### Access Service Contexts

- [**Health Professional Access Service**](usecase-health-professional-portal.html) — Healthcare professionals accessing EEHRxF data through a professional portal.

- [**Health Data Access Service**](usecase-health-data-portal.html) — Patients accessing their health data through a national access service.

- [**Wellness App Access**](usecase-wellness-app.html) — Patient-facing applications reading health data; authentication brokered by access service infrastructure.

#### Walkthrough

- [**Retrieve a European Patient Summary**](example-patient-summary.html) — Step-by-step walkthrough of the complete document access flow.

### Actor Summary

All use cases use the actors defined in [Actors and Transactions](actors.html):

| Actor | Role |
|---|---|
| [Document Publisher](actors.html#document-publisher) | Produces and submits EEHRxF documents |
| [Document Access Provider](actors.html#document-access-provider) | Serves document query and retrieval |
| [Document Consumer](actors.html#document-consumer) | Queries and retrieves documents |
| [Resource Access Provider](actors.html#resource-access-provider) | Serves individual FHIR resource queries |
| [Resource Consumer](actors.html#resource-consumer) | Queries individual FHIR resources |
