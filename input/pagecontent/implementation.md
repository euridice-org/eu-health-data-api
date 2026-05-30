This IG defines the API contract for EHR systems under EHDS. The EHR system API is one part of a broader interoperability landscape: Member States operate national and cross-border infrastructure, healthcare providers deploy EHR systems, and EHR systems expose interoperability component capabilities that national and access-service infrastructure can use.

### The EHDS Interoperability Landscape

The diagram below shows the main EHDS actors and the API boundaries between them. The blue boxes represent deployment scenarios where the functionality described in this Implementation Guide can be used.

<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:100%; height:auto;" role="img" aria-labelledby="ehds-overview-title ehds-overview-desc">
      <title id="ehds-overview-title">EHDS Overview</title>
      <desc id="ehds-overview-desc">Overview diagram of EHDS deployment scenarios with links to related implementation pages.</desc>
      <image href="EHDS-overview.drawio.png" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
      <a href="usecase-cross-border-ncp.html"><title>Cross-Border via NCP</title><rect x="334" y="74" width="170" height="30" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-cross-border-ncp.html"><title>National Contact Point</title><rect x="77" y="118" width="100" height="58" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-cross-border-ncp.html"><title>National Contact Point</title><rect x="675" y="118" width="100" height="58" fill="transparent" pointer-events="all" /></a>
      <a href="member-state-architectures.html"><title>National Interoperability Infrastructure</title><rect x="35" y="140" width="542" height="100" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-cross-org.html"><title>Cross-Organization via National Infrastructure</title><rect x="229" y="182" width="120" height="30" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-health-professional-portal.html"><title>Health Professional Access Service</title><rect x="460" y="146" width="100" height="40" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-health-data-portal.html"><title>Health Data Access Service</title><rect x="460" y="196" width="100" height="40" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-health-data-portal.html"><title>Patient Access</title><rect x="464" y="261" width="96" height="30" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-wellness-app.html"><title>Wellness App Access</title><rect x="469" y="320" width="86" height="58" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-ehr-internal.html"><title>Organization-Internal Exchange</title><rect x="177" y="349" width="75" height="40" fill="transparent" pointer-events="all" /></a>
    </svg>
    <figcaption class="figure-caption"><em>Figure: EHDS Overview</em></figcaption>
  </figure>
  <p></p>
</div>

### EHDS Actors

**Member States**

Member States must operate the national and cross-border infrastructure that enables EHDS primary-use exchange:

- **National interoperability infrastructure:** Member States define how health data is exchanged between healthcare providers in order to meet the both the EHDS obligations below and other national use cases. This IG does not prescribe national architecture choices, but shows how EHR systems conforming to this IG can *support* member state interoperability.

- **MyHealth@EU and National Contact Points (NCPs):** Member States must operate NCPs that connect to the MyHealth@EU central platform ([Art. 23(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)) and must ensure healthcare providers are connected to that infrastructure ([Art. 23(5)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)). NCP-to-NCP exchange is governed by the [NCPeH API specification](https://build-fhir.ehdsi.eu/ncp-api/), not by this IG.

- **Access services:** Member States must operate a patient-facing health data access service ([Art. 4](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4)) and a health professional access service ([Art. 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12)). Either can act as a consumer of the EHR system API; their service requirements are not specified here.

**Healthcare providers**

Healthcare providers deploy one or more EHR systems to support care delivery, including EHR systems which support *internal* clinical workflows within an organization as well as EHR systems which support *cross-organization* exchange with national infrastructure, for example to meet the member state requirement [Art. 23(5)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23) to connect their data to the national NCP for cross-border exchange.

**EHR systems**

EHR systems must conform to the Interoperability Component implemented in this IG. [Art. 25(1)](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327#art_25) requires EHR systems to include the European interoperability software component; [Annex II §2.1–2.4](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327#anx_II) requires that component to provide and receive priority-category data in EEHRxF format.

An EHR system may implement the API directly, or the capability may be delivered by an associated gateway or facade that is treated as part of the deployed EHR system. 

**Patient Wellness applications** — 

Wellness applications may optionally claim EHR interoperability component conformance ([Art. 47–48](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_47)); in which case they use the same API transactions defined here and are within the scope of this IG. 

Wellness applications can also be used to support the EHDS Patient right to insert data into their EHR ([Art. 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5), [Art. 48(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_48)). This use case is not defined in this IG, but is considered for future work. 

Whether a wellness application connects to an EHR system directly or through the health data access service is not specified by the regulation and is left free to implementation.


### Deployment Scenarios

- [**Organization-Internal Exchange**](usecase-ehr-internal.html) — How a healthcare provider using multiple EHR systems can connect them together, to serve internal workflows or aggregate data for external exchange

- [**Cross-Organization via National Infrastructure**](usecase-cross-org.html) — How EHR systems act as participants in national interoperability infrastructure to exchange data cross-organization.

- [**Cross-Border via NCP**](usecase-cross-border-ncp.html) — How EHR systems support cross-border exchange of data via national interoperability infrastructure, National Contact Points, and MyHealth@EU.

- [**Health Professional Access Service**](usecase-health-professional-portal.html) — Health professionals accessing EEHRxF data through a member state access service.

- [**Health Data Access Service**](usecase-health-data-portal.html) — Patients accessing their own health data through a member state access service.

- [**Wellness App Access**](usecase-wellness-app.html) — Patients accessing their own health data via Wellness Applications.

#### Actors and Transactions by Scenario

Each scenario maps to the [actors](actors.html) an EHR system plays and the transactions exchanged:

| Scenario | EHR system actor | Counterparty actor | Transactions |
|----------|------------------|--------------------|--------------|
| [Organization-Internal Exchange](usecase-ehr-internal.html) | Document/Resource Access Provider | Document/Resource Consumer | ITI-67, ITI-68, IPA query |
| [Cross-Organization via National Infrastructure](usecase-cross-org.html) | Document Access Provider | Document Consumer (national infrastructure) | ITI-78, ITI-67, ITI-68 |
| [Cross-Border via NCP](usecase-cross-border-ncp.html) | Document Access Provider | Document Consumer (NCPeH) | ITI-78, ITI-67, ITI-68 |
| [Health Professional Access Service](usecase-health-professional-portal.html) | Document/Resource Access Provider | Document/Resource Consumer (HPAS) | ITI-78, ITI-67, ITI-68, IPA query |
| [Health Data Access Service](usecase-health-data-portal.html) | Document/Resource Access Provider | Document/Resource Consumer (HDAS) | ITI-78, ITI-67, ITI-68, IPA query |
| [Wellness App Access](usecase-wellness-app.html) | Document/Resource Access Provider | Document/Resource Consumer (wellness app) | ITI-78, ITI-67, ITI-68, IPA query |

All scenarios authorize via SMART Backend Services (IUA Get Access Token, ITI-71).

#### Concrete Examples

Two scenarios illustrate how the deployment scenarios compose in practice (drawn from CapacityHD interoperability-testing workshops):

**Patient self-access via HDAS (AHD_NP_HDAS)** — A patient wants to retrieve their radiology report from an EHR in their country of affiliation. The patient authenticates to the national Health Data Access Service. The HDAS, acting as [Document Consumer](actors.html#document-consumer), queries the EHR system using ITI-67 and retrieves the document using ITI-68. The patient receives the report in EEHRxF format.

**Cross-border health professional access (PORT_HP_HPAS)** — A patient treated abroad needs their records reviewed by their family doctor at home. The family doctor authenticates to their country's Health Professional Access Service. The HPAS routes the query through national infrastructure (and, for cross-border requests, through the NCPeH/MyHealth@EU layer) to the foreign EHR system. The EHR system returns documents via the API defined in this IG.

The full CapacityHD use-case catalogue (including cross-border push scenarios and Article 5 patient-insert workflows) is being consolidated by the eHealth Network task force. This IG addresses the EHR system API surface; use-case catalogue alignment is considered for future work.

#### End-to-End Use Cases

- [**Retrieve a European Patient Summary**](example-patient-summary.html) — Step-by-step: authorization, patient lookup, document query, and document retrieval.
