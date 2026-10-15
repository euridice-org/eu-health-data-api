# EHDS Requirements: Security, Authorisation, Login & the eIDAS / European Digital Identity Wallet

Source: Regulation (EU) 2025/327 (European Health Data Space). Grounded in the enacted text and Annex II. This is a factual summary of what the Regulation states, not legal advice or interpretation. Many specifics are delegated to Commission implementing acts (several due by 26 March 2027) and are not yet fully in force.

## Identification & login (electronic identification / "login")

- **Article 16 – Identification management.** Natural persons using the electronic health data access services (Article 4) have the right to identify themselves electronically using any electronic identification means recognised under Article 6 of Regulation (EU) No 910/2014 (eIDAS). Member States may add complementary mechanisms for identity matching in cross-border situations.
- **Article 16(2)–(4).** The Commission must, by implementing acts, set the requirements for an interoperable, cross-border identification and authentication mechanism for natural persons and health professionals, in line with eIDAS; the Commission and Member States implement it at Union and national level as part of the MyHealth@EU cross-border infrastructure (Article 23).
- **Article 12 – Health professional access services.** Accessible only to health professionals holding electronic identification means recognised under Article 6 of eIDAS, or other eID means compliant with the common specifications in Article 36.
- **Annex II, §3.1.** An EHR system used by health professionals must provide reliable mechanisms for the identification and authentication of health professionals.
- **Article 36(3)(f).** Common specifications may cover identification management and the use of electronic identification.

## eIDAS / European Digital Identity Wallet

- The EHDS anchors electronic identification on Regulation (EU) No 910/2014 (eIDAS) throughout (Articles 12, 16; Article 2 imports the eIDAS definitions of "electronic identification" and "electronic identification means").
- **Recital 7** states that digital/proxy solutions "should be aligned with Regulation (EU) No 910/2014 … and the technical specifications of the European Digital Identity Wallet." The Wallet is not given separate operative articles; it functions as an eID means recognised under Article 6 of eIDAS, which Articles 12 and 16 rely on. Detailed alignment is left to the implementing acts under Article 16(2).

## Authorisation (proxy / representation)

- **Article 4(2)–(3).** Member States must provide proxy services as a function of the access services, letting a natural person authorise other persons to access their data (for a limited/unlimited period, and if needed for a specific purpose) and manage those authorisations, and letting legal representatives act for those whose affairs they administer. Authorisations must be provided transparently, free of charge, with an easy complaint mechanism.
- **Recital 21** provides the rationale for these authorisations and proxy solutions.
- **Article 73(1)(a)/(d)** (secondary use) — access is restricted to authorised persons listed in the data permit, enforced through individual and unique user identities and confidential access modes only.

## Security of EHR systems (products placed on the market)

- **Annex II, §3 – "Requirements for security and logging."** EHR systems must meet essential requirements for security and logging (identification/authentication of health professionals; logging; review/analysis of logs; retention and access-rights controls).
- **Article 36(3)(e).** Common specifications may set requirements and principles for patient safety and the security, confidentiality, integrity and protection of electronic health data.
- **Article 30** – manufacturers' obligations (design/conformity of EHR systems to the essential requirements, including security and logging).
- **Recital 112 / Article 27 context.** EHDS complements and requires compliance with the essential cybersecurity requirements of Regulation (EU) 2024/2847 (Cyber Resilience Act).

## Logging (audit trails)

- **Article 2 definitions** – the "European logging software component for EHR systems" provides logging of access by health professionals or other individuals to priority-category data.
- **Annex II, §3.2.** The logging component must record, for every access event, at least: (a) identification of the accessing provider/individual; (b) identification of the natural person concerned; (c) categories of data accessed; (d) time and date; (e) origin(s) of the data. §3.3 requires tools to review/analyse the logs.
- **Article 73(1)(e)** (secondary use) – identifiable logs of access and activity in the secure processing environment must be kept for at least one year.

## Security for secondary use (secure processing environment)

- **Article 73 – Secure processing environment.** Access under a data permit is only through an environment meeting, in particular: (a) access restricted to authorised persons in the permit; (b) minimisation of unauthorised reading/copying/modification/removal via state-of-the-art measures; (c) input/modification/deletion limited to a few identifiable authorised individuals; (d) individual, unique user identities and confidential access modes; (e) identifiable access/activity logs kept ≥ 1 year; (f) ongoing security monitoring. Regular audits (incl. third-party) are required, and only non-personal/anonymised data may be downloaded. Detailed technical/information-security requirements come via implementing acts (due 26 March 2027).
- **Article 66** – data minimisation and purpose limitation for secondary use.

## Scope caveats

- Many specifics (the cross-border identification/authentication mechanism, secure-processing-environment security requirements, common specifications, and the exact Wallet alignment) are delegated to Commission implementing acts, several with a 26 March 2027 deadline, so the operative detail is not yet fully in force.
