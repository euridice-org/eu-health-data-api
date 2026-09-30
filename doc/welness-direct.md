# EHDS Articles: Wellness Applications Communicating with EHR Systems

Source: Regulation (EU) 2025/327 (European Health Data Space). This note identifies the provisions relevant to a wellness application communicating with an electronic health record (EHR) system. It is a factual summary of the enacted text, not legal advice.

## Directly relevant provisions

### Article 2 - Definitions

Article 2 defines the terms that establish the legal and technical context:

- **Electronic health data** includes personal and non-personal electronic health data.
- **Registration of electronic health data** includes recording data manually, collecting it through a device, or converting non-electronic data into electronic form for processing in an EHR system or a wellness application.
- **Interoperability** includes the ability of software applications or devices to interact and exchange information without changing the content of the data.
- An **EHR system** is a system whose software and hardware can store, intermediate, export, import, convert, edit, or view personal electronic health data in the priority categories established by the EHDS Regulation.

These definitions cover the collection of data by a wellness application and its exchange with an EHR system.

### Article 5 - Right to insert information in a natural person's own EHR

Natural persons, or their representatives under Article 4(2), have the right to insert information in their own EHR through electronic health data access services or applications linked to those services.

Information inserted by the natural person or representative must be clearly distinguishable from information inserted by health professionals. The natural person or representative may not directly alter health data or related information inserted by health professionals.

This is the provision expressly referred to by Article 48 for wellness-application data transmitted to an EHR system.

### Article 47 - Labelling of wellness applications

A wellness application manufacturer that claims interoperability with an EHR system in relation to the harmonised software components of EHR systems must provide a label showing compliance with the relevant common specifications under Article 36 and essential requirements in Annex II.

The label must indicate, among other things:

- the categories of electronic health data for which compliance with Annex II requirements has been confirmed;
- the common specifications used to demonstrate compliance; and
- the label's validity period.

The label is issued by the wellness application manufacturer. Its validity may not exceed three years.

### Article 48 - Interoperability of wellness applications with EHR systems

Article 48 is the central provision for Wellness App to EHR communication:

1. A manufacturer may claim interoperability with an EHR system only when the relevant Article 36 common specifications and Annex II essential requirements are met. Users must be informed about the interoperability and its effects.
2. Interoperability does **not** automatically share or transmit all or part of the wellness application's health data to the EHR system.
3. Sharing or transmission is possible only when it complies with Article 5 and after consent from the natural person concerned.
4. Interoperability must be limited exclusively to the purposes for which the consent and Article 5 insertion apply.
5. The manufacturer must ensure that the natural person can choose which categories of health data are inserted into the EHR system and the circumstances in which those categories are shared or transmitted.

Article 48 therefore establishes a consent-based, user-controlled, purpose-limited transfer. It does not itself prescribe SMART on FHIR, IUA, OAuth 2.0, or another authorization protocol.

### Article 49 - EU registration database

The Commission must establish a publicly available EU database containing, among other entries, wellness applications for which an Article 47 label has been issued.

Before placing such a wellness application on the market or putting it into service, the manufacturer or authorised representative must enter the required data into the database. This makes Article 49 relevant to a wellness application that claims the Article 47 interoperability status.

## Supporting provisions

### Article 4 - Electronic health data access services and representatives

Member States must establish electronic health data access services that enable natural persons to access their personal electronic health data and exercise the rights in Articles 3 and 5 to 10. These services may be portals or applications for mobile devices.

Article 4 also requires proxy services so that a natural person can authorise another person to access data on their behalf, and so that legal representatives can act under national law. This is relevant when a Wellness App participates in an access flow on behalf of a patient or representative, but Article 4 does not by itself define the Wellness App to EHR authorization protocol.

### Article 15 - European electronic health record exchange format

Article 15 requires the Commission to establish technical specifications for the European electronic health record exchange format for priority categories of personal electronic health data. The format is intended to be commonly used, machine-readable, and capable of transmitting data between software applications, devices, and healthcare providers.

This is the principal EHDS format provision supporting interoperable exchange. The article does not state that every Wellness App must exchange every priority category, nor does it define a specific API protocol.

### Article 17 - Technical implementation

Article 17 requires the Commission to determine, through implementing acts, requirements for the technical implementation of the rights in the primary-use section, including the Article 5 insertion right.

The detailed technical behavior for an Article 5-based Wellness App insertion flow may therefore depend on future implementing acts.

### Article 25 - Harmonised software components of EHR systems

Article 25 establishes harmonised software components of EHR systems, including the European interoperability software component. The interoperability component provides and receives personal electronic health data in the European electronic health record exchange format and is independent of the European logging component.

This provision primarily governs EHR systems, but it is relevant to the EHR endpoint with which an interoperable Wellness App communicates.

### Article 36 - Common specifications

Article 36 allows the Commission to establish common specifications for the harmonised software components of EHR systems. These may cover, among other matters, technical requirements for interoperability, security, confidentiality, integrity, protection of electronic health data, identification management, and electronic identification.

Article 36 is a compliance reference in Articles 47 and 48; it is not an authorization protocol specification.

## Practical legal-technical boundary

For the specific use case of a Wellness App sending data to an EHR system, the explicit EHDS chain is:

1. The Wellness App manufacturer claims interoperability under **Article 48(1)** and meets the applicable Article 36 and Annex II requirements.
2. The user is informed about the interoperability and its effects.
3. The data is not automatically transmitted under **Article 48(2)**.
4. The natural person gives consent, and the transfer complies with the **Article 5** insertion right.
5. The person chooses the data categories and sharing circumstances under **Article 48(2)**.
6. The receiving EHR system uses the applicable harmonised interoperability and exchange-format requirements, including **Articles 15, 25, and 36**.
7. A Wellness App claiming the interoperability status is labelled and registered under **Articles 47 and 49**.

The EHDS articles do not specify the concrete OAuth, SMART on FHIR, IUA, or token-exchange profile for this flow. Those details may be supplied by common specifications, implementing acts, or an applicable technical implementation guide.
