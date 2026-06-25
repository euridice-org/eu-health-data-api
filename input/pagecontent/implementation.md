This IG defines the API contract for EHR systems under EHDS, but EHR systems are one part of a broader interoperability landscape: Member States operate national and cross-border infrastructure, healthcare providers deploy EHR systems, and EHR systems expose interoperability component capabilities that national and access-service infrastructure can use.

This page describes informative guidance for how the EHR components described in this Implementation Guide fit into the EHDS interoperability landscape.

### The EHDS Interoperability Landscape

The diagram below shows the EHDS actors and the boundaries between them. The blue boxes represent use cases: contexts where the interoperability component API described in this Implementation Guide is deployed or consumed.

<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:100%; height:auto;" role="img" aria-labelledby="ehds-overview-title ehds-overview-desc">
      <title id="ehds-overview-title">EHDS Overview</title>
      <desc id="ehds-overview-desc">Overview diagram of EHDS deployment scenarios with links to related implementation pages.</desc>
      <image href="EHDS-overview.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
      <a href="usecase-cross-border-ncp.html"><title>Cross-Border via NCP</title><rect x="334" y="74" width="170" height="30" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-cross-border-ncp.html"><title>National Contact Point</title><rect x="77" y="118" width="100" height="58" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-cross-border-ncp.html"><title>National Contact Point</title><rect x="675" y="118" width="100" height="58" fill="transparent" pointer-events="all" /></a>
      <a href="member-state-architectures.html"><title>National Interoperability Infrastructure</title><rect x="35" y="140" width="542" height="100" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-cross-org.html"><title>Cross-Organization via National Infrastructure</title><rect x="229" y="182" width="120" height="30" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-health-professional-portal.html"><title>Health Professional Access Service</title><rect x="460" y="146" width="100" height="40" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-health-data-portal.html"><title>Health Data Access Service</title><rect x="460" y="196" width="100" height="40" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-health-data-portal.html"><title>Patient Access</title><rect x="464" y="261" width="96" height="30" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-wellness-app.html"><title>Wellness App Access</title><rect x="469" y="320" width="86" height="58" fill="transparent" pointer-events="all" /></a>
      <a href="environment-healthcare-provider.html"><title>Organization-Internal Exchange</title><rect x="177" y="349" width="75" height="40" fill="transparent" pointer-events="all" /></a>
    </svg>
    <figcaption class="figure-caption"><em>Figure: EHDS Interoperability Landscape</em></figcaption>
  </figure>
  <p></p>
</div>

The figure shows different elements:
* **Environments** (white/grey boxes), different environments within the EHDS landscape with specific rules and deployment options.
* **System actors** (black boxes), systems in an environment.
* **Human actors** (user icons), key users in different environments that interact with the systems in that environment through a user interface. HP = Health Professional, Pat = Patient.
* **Use cases** (blue boxes), contexts where the interoperability component API is deployed or consumed.

This Implementation Guide defines the functional components of the EHR system API, such as document exchange, patient lookup, and authorization. The use cases described here are deployments of those shared components. Some use cases are direct EHR-facing exchange paths; others are user-facing access services that consume those paths behind the scenes. Each use case and environment carries its own rules and requirements, which are not within the scope of this Implementation Guide; here, we focus on how the EHR system API defined in this IG can **support** actors across the different EHDS use cases.

#### EHDS Environments and Actors

[**MyHealth@EU**](usecase-cross-border-ncp.html)

Cross-border exchange routes through National Contact Points (NCPs) over the MyHealth@EU network (Art. 23(2)). When a patient from Country A receives care in Country B, Country B's NCP requests the patient's data from Country A's NCP, which then queries national infrastructure to retrieve it.

**Member States**

Member States must operate the national and cross-border infrastructure that enables EHDS primary-use exchange, the member state holds the following environments:

- [**National interoperability infrastructure:**](usecase-cross-org.html) Member States define how health data is exchanged between healthcare providers in order to meet the both the EHDS obligations below and other national use cases. This IG does not prescribe national architecture choices, but shows how EHR systems conforming to this IG can *support* member state interoperability holding the system actors:

  - **MyHealth@EU and National Contact Points (NCPs):** Member States must operate NCPs that connect to the MyHealth@EU central platform ([Art. 23(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)) and must ensure healthcare providers are connected to that infrastructure ([Art. 23(5)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)). NCP-to-NCP exchange is governed by the [NCPeH API specification](https://build-fhir.ehdsi.eu/ncp-api/), not by this IG.

  - **Health data access service (HDAS):** Member States must operate a patient-facing health data access service ([Art. 4](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4)). For the purposes of this Implementation Guide, this is modeled primarily as a user-facing interface that can act as a consumer of the EHR system API; its service requirements are not specified here.

  - **Health professional access service (HPAS):** Member States must operate a health professional access service ([Art. 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12)). For the purposes of this Implementation Guide, this is modeled primarily as a user-facing service which can act as a consumer of the EHR system API; its service requirements are not specified here.


- [**Healthcare providers:**](environment-healthcare-provider.html) Healthcare providers deploy one or more EHR systems to support care delivery, including EHR systems which support *internal* clinical workflows within an organization as well as EHR systems which support *cross-organization* exchange with national infrastructure, for example to meet the member state requirement [Art. 23(5)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23) to connect their data to the national NCP for cross-border exchange. This enviroment holds the following system actors:

  - **EHR systems**: EHR systems must conform to the Interoperability Component implemented in this IG. [Art. 25(1)](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327#art_25) requires EHR systems to include the European interoperability software component; [Annex II §2.1–2.4](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327#anx_II) requires that component to provide and receive priority-category data in EEHRxF format. An EHR system may implement the API directly, or the capability may be delivered by an associated gateway or facade that is treated as part of the deployed EHR system.

  - **Gateway EHR system**: An EHR system that connects to the national infrastructure.

- **Wellness applications** A Wellness Application ([Art. 2](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_2_ab)) may be used to, when the authorized, to share information with an EHR system. It may also optionally claim EHR interoperability component conformance ([Art. 47–48](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_47)); in which case they use the same API transactions defined here and are within the scope of this IG. Whether a wellness application connects to an EHR system directly or through the health data access service is not specified by the regulation and is left free to implementation. When connecting to the Patient API, Wellness Applications can potentially also be used to support the EHDS Patient right to insert data into their EHR ([Art. 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5), [Art. 48(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_48)).

#### Implementation Patterns

- [**EHR System Composition Patterns**](ehr-system-composition.html) — How an EHR system can implement the API directly, through a facade, through an aggregator, or through a registry-style deployment.

#### Use Cases

- [**Provider-Internal Exchange**](environment-healthcare-provider.html) — How a healthcare provider using multiple EHR systems can use the same interoperability component capabilities for internal exchange or external aggregation.

- [**Cross-Organization via National Infrastructure**](usecase-cross-org.html) — How EHR systems act as participants in national interoperability infrastructure to exchange data across healthcare providers.

- [**Cross-Border via NCP**](usecase-cross-border-ncp.html) — How EHR systems support cross-border exchange of data via national interoperability infrastructure, National Contact Points, and MyHealth@EU.

- [**Health Professional Access Service**](usecase-health-professional-portal.html) — Health professionals accessing EEHRxF data through a member state access service.

- [**Health Data Access Service**](usecase-health-data-portal.html) — Patients accessing their own health data through a member state access service.

- [**Wellness App Access**](usecase-wellness-app.html) — Patients accessing their own health data via Wellness Applications.

#### End-to-End Use Cases

- [**Retrieve a European Patient Summary**](example-patient-summary.html) — Step-by-step: authorization, patient lookup, document query, and document retrieval.
