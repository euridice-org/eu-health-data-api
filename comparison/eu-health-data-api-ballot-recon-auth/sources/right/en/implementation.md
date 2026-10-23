# Implementation - EU Health Data API v1.0.0-ballot

## Implementation

This IG describes a FHIR API surface for EHR systems that supports implementation of the EHDS Interoperability Component requirements. EHR systems are one part of a broader European interoperability landscape: Member States operate national and cross-border infrastructure, healthcare providers deploy EHR systems, and EHR systems expose Interoperability Component capabilities that national and access-service infrastructure can use. The same capabilities can also support national and provider use cases beyond EHDS.

This page provides **informative** guidance for how EHR systems supporting the Interoperability Component fit into the European interoperability landscape and can **support** different actors in meeting their EHDS obligations. While EHDS does not dictate interoperability implementation details at the Member State or healthcare organization level, Member States and healthcare organizations can deploy these capabilities within their existing domains to support EHDS implementation. For example, the Member State obligation to connect all healthcare providers to their MyHealth@EU national contact point for eHealth (NCPeH, shortened to NCP in this guide) ([Art. 23(5)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)) can be supported by a healthcare provider deploying an EHR system as a [Document Access Provider](actors.md#document-access-provider) to make the organization's priority-category data available to the NCP, which retrieves it by acting as a [Document Consumer](actors.md#document-consumer).

### The European Interoperability Landscape

The diagram below shows the EHDS actors and the boundaries between them. The blue boxes represent use cases: contexts where the API surface of the Interoperability Component is deployed or consumed.

**European Interoperability Landscape**

The figure shows different elements:

* **Environments** (white/grey boxes), different environments within the European interoperability landscape with specific rules and deployment options.
* **System actors** (black boxes), systems in an environment.
* **Human actors** (user icons), key users in different environments that interact with the systems in that environment through a user interface. HP = Health Professional, Pat = Patient.
* **Use cases** (blue boxes), contexts where the API surface of the Interoperability Component is deployed or consumed.

This Implementation Guide describes the API surface of the EHDS Interoperability Component: document exchange, resource access, patient lookup, authorization, and document publication. The use cases outlined in this section show where the Interoperability Component can be deployed in the European interoperability landscape. Some use cases directly involve data exchange with EHRs; others indirectly make use of data that has previously been consumed via data exchange with EHRs.

Authorization in these use cases is described using the generic [Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.md), [Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.md), and [Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.md) roles. Each flow's selected SMART or IHE IUA roles and detailed requirements are described in [Authorization](authorization.md).

Where end-user authentication is required, the [Authentication Service](ActorDefinition-authentication-service-eu-api.md) supplies that responsibility and may be grouped with the Authorization Server or separately deployed. These logical roles do not prescribe central EU-operated services or common hosting; see [actor groupings](actors.md#authentication-and-authorization-groupings).

Each use case and environment might have its own rules and requirements, which are outside the scope of this Implementation Guide; here, we focus on how the Interoperability Component as described in this Implementation Guide can **support** actors across the use cases.

#### EHDS Environments and Actors

[**MyHealth@EU**](usecase-cross-border-ncp.md)

Cross-border exchange routes through National Contact Points (NCPs) over the MyHealth@EU infrastructure (Art. 23(2)). When a patient from Country A receives care in Country B, Country B's NCP requests the patient's data from Country A's NCP, which then queries national infrastructure to retrieve it.

**Member States**

Member States must operate the national and cross-border infrastructure that enables EHDS primary-use exchange. The following environments and actors are relevant:

* [**National interoperability infrastructure:**](usecase-cross-org.md) Member States define how health data is exchanged between healthcare providers in order to meet EHDS obligations and other national use cases. This IG does not prescribe national architecture choices, but shows how EHR systems conforming to this IG can **support** Member State interoperability infrastructure.
* [**Healthcare providers:**](usecase-provider-internal-exchange.md) Healthcare providers deploy one or more EHR systems to support care delivery, including EHR systems which support **internal** clinical workflows within an organization as well as EHR systems which support **cross-organization** exchange with national infrastructure, for example to meet the member state requirement [Art. 23(5)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23) to connect their data to the national NCP for cross-border exchange. This environment holds the following system actors:
* **Wellness applications:** A wellness application is software, or a combination of hardware and software, intended for use by a natural person to process electronic health data for information on a person's health or for the delivery of care for purposes other than the provision of healthcare ([Art. 2(2)(ab)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_2_ab)). A wellness application may claim interoperability with an EHR system ([Art. 47-48](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_47)) by implementing the applicable Interoperability Component functionality. It may also be the mechanism by which the patient exercises their ([Art. 5](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_5)) right to insert data into their own EHR through electronic health data access services or **applications linked to those services**. Article 48 frames wellness-app interoperability as patient-controlled sharing or transmission of data from the wellness application to the EHR - a wellness application may therefore exchange EEHRxF data through the health data access service, or via an EHR system directly depending on the needs of the implementation. This IG models that exchange using the same Interoperability Component transactions described here.

#### Use Cases

* [**Retrieve a European Patient Summary**](example-patient-summary.md) — A generic example showing how the components described in this IG (authorization, patient lookup, document retrieval) can be used to access a patient summary.
* [**Cross-Border Exchange via NCP**](usecase-cross-border-ncp.md) — How EHR systems support cross-border exchange of data via national interoperability infrastructure, National Contact Points, and MyHealth@EU.
* [**Health Professional Access Service**](usecase-health-professional-portal.md) — Health professionals accessing EEHRxF data through a member state access service.
* [**Health Data Access Service**](usecase-health-data-portal.md) — Patients accessing their own health data through a member state access service, and exercising their patient rights.
* [**Wellness Apps**](usecase-wellness-app.md) — How wellness applications can access patient data through an authorized service context and insert patient-provided data into an EHR under Articles 5 and 48.
* [**Cross-Organization via National Infrastructure**](usecase-cross-org.md) — How EHR systems act as participants in national interoperability infrastructure to exchange data across healthcare providers.
* [**Provider-Internal Exchange**](usecase-provider-internal-exchange.md) — How a healthcare provider using multiple EHR systems can use the same Interoperability Component capabilities for internal exchange or external aggregation.

