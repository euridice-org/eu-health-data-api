### Overview

A **wellness or personal health application** enables a patient to access their own health data from EHR systems, using the same API transactions defined in this IG.

This use case describes the **wellness app perspective**: a patient-facing application that reads health data, using this IG's document and resource access patterns as the data retrieval layer.

### Scope

This IG specifies the **API transactions** a wellness app uses to retrieve data — document query/retrieval (ITI-67, ITI-68) and resource access (IPA-aligned search/read). It does **not** specify:

- The patient authentication and identity-proofing flow (eIDAS, EU Digital Identity Wallet) — this is access service / Member State infrastructure
- SMART App Launch mechanics — governed by the access service, not the EHR system
- Patient data submission (Article 5 right to insert data) — out of scope for this IG; governed by access service infrastructure

### Regulatory Context

Under EHDS:
- **Wellness app developers** voluntarily claim interoperability by self-attesting against EHDS Annex II + Article 36 common specifications (Arts 47–48). The claim is about the app, not a requirement on EHR systems.
- **EHR systems** have no wellness-app-specific obligations. The generic obligations (Annex II §2.1 — provide access; §2.5 — do not block authorized access) apply.
- **Member States** establish Electronic Health Data Access Services (EHDAS, Art 4) through which patients exercise access rights (Art 3). Patient authentication and app authorization originate at the EHDAS, not the EHR.
- **Article 5** (patient right to insert data) is exercised "through electronic health data access services or applications linked to those services" — routed via the EHDAS, not directly to the EHR API. Data submission is out of scope for this IG.

### Actors

- **Wellness application** acts as [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer) — consuming this IG's API
- **EHR system** acts as [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider) — the conformance target of this IG
- **Electronic Health Data Access Service (EHDAS)** — authenticates the patient, establishes authorization context, brokers app access to EHR systems (Member State infrastructure, not specified here)

### Workflow

1. Patient authenticates to the EHDAS (national patient portal) using their national eID or EU Digital Identity Wallet
2. Patient launches the wellness app from the EHDAS, or the EHDAS brokers the app's access request
3. EHDAS establishes an authorization context (access token) for the wellness app — credentials derived from or delegated by the EHDAS infrastructure
4. Wellness app uses this IG's API to query the EHR: [patient lookup](patient-match.html), [document query](document-exchange.html), [resource access](resource-access.html)
5. EHR responds to authorized requests per Annex II §2.5 — the EHR does not need to know that the caller is a wellness app

### Technical Flow

The wellness app implements Consumer actors using credentials established at the EHDAS layer:

- [Authorization](authorization.html) — access token originates at national EHDAS authorization infrastructure; the EHR validates it
- [Patient Lookup](patient-match.html) — wellness app identifies the patient (national identifier established via EHDAS authentication)
- [Document Exchange](document-exchange.html) — queries for available documents; retrieves FHIR Document Bundles
- [Resource Access](resource-access.html) — queries for individual clinical resources (Observation, Condition, MedicationStatement, etc.)

The patient-context authentication chain (eIDAS identity proofing, EU wallet, national identity provider, SMART App Launch token issuance) is EHDAS infrastructure. The EHR sees an authorized request with a patient-scoped token; how that token was established is not specified by this IG.

### Wellness App Conformance

A wellness app developer who builds a client conforming to this IG's API may self-attest EHDS interoperability under Art 47–48. The app developer is responsible for meeting Annex II + Art 36 common specifications on the application side.

EHR systems conforming to this IG are not required to take any additional steps to support wellness apps — a conformant EHR Access Provider already satisfies §2.5 (do not block authorized access).

### What Is Out of Scope

The following are not specified by this IG and are not EHR obligations:

| Topic | Handled by |
|---|---|
| Patient authentication (eIDAS, EU wallet, national eID) | Member State / EHDAS infrastructure |
| SMART App Launch / patient-context token issuance | EHDAS authorization server |
| Consent and restriction management | EHDAS / Member State (Art 8) |
| Patient data submission (Art 5 write) | EHDAS-routed; separate IG scope |
| Audit logging of patient-initiated access | EHR local log (Annex II §3); transport to HDAS is MS infrastructure |

### Relationship to Other Use Cases

| Use Case | Relationship |
|---|---|
| [Health Data Access Service](usecase-health-data-portal.html) | HDAS is the access service / portal the patient uses before launching the wellness app |
| [Cross-Organization via National Infrastructure](usecase-cross-org.html) | The same EHR API endpoint serves both HCP and wellness app consumers |
