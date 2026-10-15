# Rationale: Requiring eIDAS on the Patient and Health Professional Access Services Only

Source: Regulation (EU) 2025/327 (European Health Data Space), [full text on EUR-Lex](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327). This note records the reasoning behind constraining eIDAS-based electronic identification to the access services addressed to end users. It is a factual analysis of the enacted text, not legal advice.

## Argument

EHDS names [Regulation (EU) No 910/2014 (eIDAS)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910) in eight provisions, but only two of them attach an eIDAS obligation to a service that authenticates an end user. [Article 12](https://www.ringholm.com/ehds/article-12.htm) makes possession of eIDAS-recognised electronic identification means a condition of access to health professional access services, and [Article 16(1)](https://www.ringholm.com/ehds/article-16.htm) obliges the electronic health data access services under [Article 4](https://www.ringholm.com/ehds/article-4.htm) to accept such means so that the natural person's right to use them can be exercised. The remaining references — [Article 2(1)(f)](https://www.ringholm.com/ehds/article-2.htm), Article 16(2) to 16(4), Article 19(2)(m) and Article 96(1)(a) — bind the Commission, the Member States or the digital health authorities to define infrastructure, adopt implementing acts or cooperate with supervisory bodies, rather than requiring any particular system to authenticate a user by eIDAS means. No eIDAS obligation attaches to secondary use, to HealthData@EU or to authorised participants. Constraining eIDAS to the patient and health professional access services therefore reflects the scope of the enacted text exactly, and avoids importing an identity-assurance requirement into components that the Regulation does not subject to one.

## Evidence

### Health professional access service — access condition

[Article 12](https://www.ringholm.com/ehds/article-12.htm), second paragraph:

> The services referred to in the first paragraph of this Article shall be accessible only to health professionals who are in possession of electronic identification means which are recognised pursuant to Article 6 of [Regulation (EU) No 910/2014](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32014R0910) or other electronic identification means compliant with common specifications referred to in [Article 36](https://www.ringholm.com/ehds/article-36.htm) of this Regulation.

The wording `shall be accessible only` makes this a restriction on the service. It also provides an explicit alternative route through Article 36 common specifications, so eIDAS is one of two admissible mechanisms rather than the sole one.

### Patient access service — right of the natural person

[Article 16(1)](https://www.ringholm.com/ehds/article-16.htm):

> Where natural persons use electronic health data access services referred to in [Article 4](https://www.ringholm.com/ehds/article-4.htm), those natural persons shall have the right to identify themselves electronically using any electronic identification means which are recognised pursuant to Article 6 of Regulation (EU) No 910/2014. Member States may provide complementary mechanisms to ensure appropriate identity matching in cross-border situations.

This is framed as a right of the individual, not as a restriction on the service. The service must therefore support eIDAS-recognised means, but is not required to reject other means. Complementary cross-border identity matching is optional and left to Member States.

### The remaining eIDAS references do not bind an access service

| Provision | Addressee | Nature |
|---|---|---|
| [Article 2(1)(f)](https://www.ringholm.com/ehds/article-2.htm) | Whole Regulation | Imports the eIDAS definitions of electronic identification and electronic identification means |
| [Article 16(2)](https://www.ringholm.com/ehds/article-16.htm) | Commission | Implementing acts for the cross-border identification and authentication mechanism, in accordance with Regulation (EU) No 910/2014 |
| [Article 16(3)](https://www.ringholm.com/ehds/article-16.htm) | Commission and Member States | Implement those services at Union level as part of the cross-border infrastructure in [Article 23](https://www.ringholm.com/ehds/article-23.htm) |
| [Article 16(4)](https://www.ringholm.com/ehds/article-16.htm) | Member State competent authorities and Commission | Implement the mechanism at national and Union level |
| Article 19(2)(m) | Digital health authorities | Cooperate with eIDAS supervisory authorities |
| Article 96(1)(a) | Commission | Develop, host and operate the mechanism in accordance with Article 16(3) and (4) |

### Negative findings

- Articles 55 to 81, including Article 73 on the secure processing environment and Article 75 on HealthData@EU and authorised participants, require identity, authorisation and logging but contain no reference to Regulation (EU) No 910/2014.
- The European Digital Identity Wallet is not required by any article. It appears only in Recital 21, as an alignment aspiration for proxy solutions.
- [Annex II](https://www.ringholm.com/ehds/annex-ii.htm), point 3.1 requires reliable identification and authentication of health professionals in EHR systems, but does not name eIDAS.
- [Article 23](https://www.ringholm.com/ehds/article-23.htm) does not name eIDAS; MyHealth@EU is reached only through Article 16(3).

## Dates of application

Per [Article 105](https://www.ringholm.com/ehds/article-105.htm):

| Provision | Applies from |
|---|---|
| [Article 16](https://www.ringholm.com/ehds/article-16.htm), [Article 2](https://www.ringholm.com/ehds/article-2.htm), Article 19(2)(m), Article 96(1)(a) | 26 March 2027 |
| [Article 12](https://www.ringholm.com/ehds/article-12.htm) for patient summaries, ePrescriptions and eDispensations | 26 March 2029 |
| [Article 12](https://www.ringholm.com/ehds/article-12.htm) for medical imaging, test results and discharge reports | 26 March 2031 |

Article 16(2) carries no implementing-act deadline in the enacted text.

## Conclusion

This guide requires eIDAS-recognised electronic identification only for the patient access service and the health professional access service, because those are the only two services on which EHDS places such an obligation.

Two qualifications are carried through into the specification text:

1. For the health professional access service, the Article 36 common-specification alternative is preserved. eIDAS is not stated as the only admissible mechanism.
2. For the patient access service, the requirement is expressed as an obligation to accept eIDAS-recognised means, not an obligation to reject other means, matching the right-based wording of Article 16(1).

No eIDAS requirement is placed on secondary use, on HealthData@EU, on authorised participants, or on system-to-system exchange between EHR systems, since the Regulation imposes none.
