This IG describes a FHIR API surface for EHR systems that targets the EHDS interoperability component requirements. EHR systems are one part of a broader interoperability landscape: Member States operate national and cross-border infrastructure, healthcare providers deploy EHR systems, and EHR systems expose interoperability component capabilities that national and access-service infrastructure can use.

This page provides *informative* guidance for how EHR systems supporting the interoperability component fit into the EHDS interoperability landscape and can **support** different actors in meeting their EHDS obligations. While EHDS does not dictate interoperability implementation details at the Member State or healthcare organization level, Member States and healthcare organizations can deploy these capabilities within their existing domains to support EHDS implementation. For example, the Member State obligation to connect all healthcare providers to their MyHealth@EU national contact point (NCP) ([Art. 23(5)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)) can be supported by a healthcare provider deploying an EHR system as a [Document Access Provider](actors.html#document-access-provider) to make the organization's priority-category data available to the NCP, which retrieves it by acting as a [Document Consumer](actors.html#document-consumer). 

### The EU Health Data API Interoperability Landscape

The diagram below shows the EHDS actors and the boundaries between them. The blue boxes represent use cases: contexts where the API surface of the interoperability component is deployed or consumed.

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
      <a href="usecase-health-professional-portal.html"><title>Health Professional Access Service</title><rect x="461" y="187" width="110" height="40" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-health-data-portal.html"><title>Health Data Access Service</title><rect x="470" y="284" width="93" height="40" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-health-data-portal.html"><title>Patient Access</title><rect x="540" y="249" width="71" height="30" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-wellness-app.html"><title>Wellness App Access</title><rect x="446" y="380" width="86" height="41" fill="transparent" pointer-events="all" /></a>
      <a href="usecase-provider-internal-exchange.html"><title>Provider-Internal Exchange</title><rect x="157" y="308" width="100" height="38" fill="transparent" pointer-events="all" /></a>
    </svg>
    <figcaption class="figure-caption"><em>Figure: EHDS Interoperability Landscape</em></figcaption>
  </figure>
  <p></p>
</div>

The figure shows different elements:
* **Environments** (white/grey boxes), different environments within the EHDS landscape with specific rules and deployment options.
* **System actors** (black boxes), systems in an environment.
* **Human actors** (user icons), key users in different environments that interact with the systems in that environment through a user interface. HP = Health Professional, Pat = Patient.
* **Use cases** (blue boxes), contexts where the API surface of the interoperability component is deployed or consumed.

This Implementation Guide describes the API surface of the EHDS interoperability component: document exchange, resource access, patient lookup, authorization, and document publication. The use cases outlined in this section show where the interoperability component can be deployed in the EHDS interoperability landscape. Some use cases directly involve data exchange with EHRs; others indirectly make use of data that has previously been consumed via data exchange with EHRs.

Each use case and environment might have its own rules and requirements, which are outside the scope of this Implementation Guide; here, we focus on how the interoperability component as described in this Implementation Guide can **support** actors across the use cases.

#### EHDS Environments and Actors

[**MyHealth@EU**](usecase-cross-border-ncp.html)

Cross-border exchange routes through National Contact Points (NCPs) over the MyHealth@EU network (Art. 23(2)). When a patient from Country A receives care in Country B, Country B's NCP requests the patient's data from Country A's NCP, which then queries national infrastructure to retrieve it.

**Member States**

Member States must operate the national and cross-border infrastructure that enables EHDS primary-use exchange. The following environments and actors are relevant:

- [**National interoperability infrastructure:**](usecase-cross-org.html) Member States define how health data is exchanged between healthcare providers in order to meet EHDS obligations and other national use cases. This IG does not prescribe national architecture choices, but shows how EHR systems conforming to this IG can *support* Member State interoperability infrastructure.

  - **MyHealth@EU and National Contact Points (NCPs):** Member States must operate NCPs that connect to the MyHealth@EU central platform ([Art. 23(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)) and must ensure healthcare providers are connected to that infrastructure ([Art. 23(5)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)). NCP-to-NCP exchange is governed by the [NCPeH API specification](https://build-fhir.ehdsi.eu/ncp-api/), not by this IG.

  - **Health data access service (HDAS):** Member States must operate a patient-facing health data access service ([Art. 4](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_4)). For the purposes of this Implementation Guide, this is modeled primarily as a user-facing interface that can act as a consumer of the interoperability component API surface; its service requirements are not specified here.

  - **Health professional access service (HPAS):** Member States must operate a health professional access service ([Art. 12](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_12)). For the purposes of this Implementation Guide, this is modeled primarily as a user-facing service that can act as a consumer of the interoperability component API surface; its service requirements are not specified here.


- [**Healthcare providers:**](usecase-provider-internal-exchange.html) Healthcare providers deploy one or more EHR systems to support care delivery, including EHR systems which support *internal* clinical workflows within an organization as well as EHR systems which support *cross-organization* exchange with national infrastructure, for example to meet the member state requirement [Art. 23(5)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23) to connect their data to the national NCP for cross-border exchange. This environment holds the following system actors:

  - **EHR systems**: EHR systems must conform to the interoperability component implemented in this IG. [Art. 25(1)](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327#art_25) requires EHR systems to include the European interoperability software component; [Annex II §2.1–2.4](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327#anx_II) requires that component to provide and receive priority-category data in EEHRxF format. An EHR system may expose the API surface directly, or the capability may be delivered by an associated gateway or facade treated as part of the deployed EHR ([**EHR System Composition Patterns**](ehr-system-composition.html)).

  - **Gateway EHR system**: A specific EHR system that connects to the national infrastructure to facilitate cross-organization exchange.

- **Wellness applications:** A wellness application is software, or a combination of hardware and software, intended for use by a natural person to process electronic health data for information on a person's health or for the delivery of care for purposes other than the provision of healthcare ([Art. 2(2)(ab)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_2_ab)). A wellness application may claim interoperability with an EHR system ([Art. 47-48](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_47)) by implementing the applicable interoperability component functionality. It may also be the mechanism by which the patient exercises their ([Art. 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5)) right to insert data into their own EHR through electronic health data access services or *applications linked to those services*. Article 48 frames wellness-app interoperability as patient-controlled sharing or transmission of data from the wellness application to the EHR - a wellness application may therefore exchange EEHRxF data through the health data access service, or via an EHR system directly depending on the needs of the implementation. This IG models that exchange using the same interoperability component transactions described here.

#### Use Cases

- [**Retrieve a European Patient Summary**](example-patient-summary.html) — A generic example showing how the components described in this IG (authorization, patient lookup, document retrieval) can be used to access a patient summary.

- [**Cross-Border Exchange via NCP**](usecase-cross-border-ncp.html) — How EHR systems support cross-border exchange of data via national interoperability infrastructure, National Contact Points, and MyHealth@EU.

- [**Health Professional Access Service**](usecase-health-professional-portal.html) — Health professionals accessing EEHRxF data through a member state access service.

- [**Health Data Access Service**](usecase-health-data-portal.html) — Patients accessing their own health data through a member state access service, and exercising their patient rights.

- [**Wellness Apps**](usecase-wellness-app.html) — How wellness applications can access patient data through an authorized service context and insert patient-provided data into an EHR under Articles 5 and 48.

- [**Cross-Organization via National Infrastructure**](usecase-cross-org.html) — How EHR systems act as participants in national interoperability infrastructure to exchange data across healthcare providers.

- [**Provider-Internal Exchange**](usecase-provider-internal-exchange.html) — How a healthcare provider using multiple EHR systems can use the same interoperability component capabilities for internal exchange or external aggregation.
