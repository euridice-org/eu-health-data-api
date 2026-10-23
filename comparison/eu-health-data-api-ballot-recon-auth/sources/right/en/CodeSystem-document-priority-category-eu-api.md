# EEHRxF Document Priority Category CodeSystem - EU Health Data API v1.0.0-ballot

## CodeSystem: EEHRxF Document Priority Category CodeSystem 

The codes defined here are directly linked to the Priority Categories defined in the EHDS regulation. The meaning of these codes is directly linked to the meaning given to the concepts in the EHDS regulation. This direct linkage to the regulated meaning ensures that they are by definition perfectly aligned with the regulatory text. This in contract to finding LOINC codes that seem relevant. LOINC codes are used for the document type, so there is a need to map between the priority category code defined here, and the LOINC codes for the document types.

The EHDS Regulation initially defines six priority categories of electronic health data that all Member States must support first for cross-border primary use. These categories are explicitly listed in [Article 14](https://eur-lex.europa.eu/eli/reg/2025/327/oj#d1e2289-1-1) of Regulation (EU) 2025/327.

[Article 105](https://eur-lex.europa.eu/eli/reg/2025/327/oj#d1e6862-1-1) specifies the date when support for these priority categories is required: 26 March 2029 for categories (a), (b) and (c); 28 March 2031 for (d), (e) and (f).

EHDS empowers the EU Commission to make changes to the list of priority categories at any point in time by means of a Delegated Act (Article 14(2)). There will be a minimum 1-year lead time between the decision to add a new priority category and the initial date when support has to be implemented.

The definitions of the priority categories comes from [ANNEX I](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32025R0327#annex-I) of the EHDS Regulation.

**This Code System is Informative.** The codes defined here are not intended to be used as-is in implementations, but rather to provide a clear link between the technical specifications in this Implementation Guide and the concepts defined in the EHDS regulation. Implementers should refer to the content profiles for each priority category for the specific data elements and structures that need to be supported for each category.

This Code system is referenced in the definition of the following value sets:

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "document-priority-category-eu-api",
  "url" : "http://hl7.eu/fhir/health-data-api/CodeSystem/document-priority-category-eu-api",
  "version" : "1.0.0-ballot",
  "name" : "DocumentPriorityCategoryEuApiCS",
  "title" : "EEHRxF Document Priority Category CodeSystem",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-10-23T14:38:45+02:00",
  "publisher" : "HL7 Europe",
  "contact" : [{
    "name" : "HL7 Europe",
    "telecom" : [{
      "system" : "url",
      "value" : "http://hl7.eu"
    }]
  }],
  "description" : "CodeSystem for priority document categories in EEHRxF as the document categories as defined in the EHDS regulation.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "copyright" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0).",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
    "code" : "Patient-Summaries",
    "display" : "patient summaries",
    "definition" : "Electronic health data that include significant clinical facts related to an identified natural person and that are essential for the provision of safe and efficient healthcare to that person. The following information is part of a patient summary:\n\n1. Personal details.\n2. Contact information.\n3. Information on insurance.\n4. Allergies.\n5. Medical alerts.\n6. Vaccination/prophylaxis information, possibly in the form of a vaccination card.\n7. Current, resolved, closed or inactive problems, including in an international classification coding.\n8. Textual information related to medical history.\n9. Medical devices and implants.\n10. Medical or care procedures.\n11. Functional status.\n12. Current and relevant past medicines.\n13. Social history observations related to health.\n14. Pregnancy history.\n15. Patient-provided data.\n16. Observation results pertaining to the health condition.\n17. Plan of care.\n18. Information on a rare disease, such as details about the impact or characteristics of the disease."
  },
  {
    "code" : "Electronic-Prescriptions",
    "display" : "electronic prescriptions",
    "definition" : "Electronic health data constituting a prescription for a medicinal product as defined in Article 3, point (k), of Directive 2011/24/EU."
  },
  {
    "code" : "Electronic-Dispensations",
    "display" : "electronic dispensations",
    "definition" : "Information on the supply of a medicinal product to a natural person by a pharmacy based on an electronic prescription."
  },
  {
    "code" : "Medical-Imaging",
    "display" : "medical imaging studies and related imaging reports",
    "definition" : "Electronic health data related to the use of or produced by technologies that are used to view the human body in order to prevent, diagnose, monitor or treat medical conditions."
  },
  {
    "code" : "Laboratory-Reports",
    "display" : "medical test results, including laboratory and other diagnostic results and related reports",
    "definition" : "Electronic health data representing results of studies performed in particular through in vitro diagnostics such as clinical biochemistry, haematology, transfusion medicine, microbiology, immunology and others, and including, where relevant, reports supporting the interpretation of the results."
  },
  {
    "code" : "Discharge-Reports",
    "display" : "discharge reports",
    "definition" : "Electronic health data related to a healthcare encounter or episode of care and including essential information about admission, treatment and discharge of a natural person."
  }]
}

```
