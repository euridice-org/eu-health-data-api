# Resource EU Health Data API



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "hl7.fhir.eu.health-data-api",
  "language" : "en",
  "url" : "http://hl7.eu/fhir/health-data-api/ImplementationGuide/hl7.fhir.eu.health-data-api",
  "version" : "1.0.0-ballot",
  "name" : "EuHealthDataApi",
  "title" : "EU Health Data API",
  "status" : "draft",
  "date" : "2026-10-23T12:01:58+02:00",
  "publisher" : "HL7 Europe",
  "contact" : [{
    "name" : "HL7 Europe",
    "telecom" : [{
      "system" : "url",
      "value" : "http://hl7.eu"
    }]
  }],
  "description" : "This Implementation Guide defines FHIR-based APIs for accessing and exchanging health data in the European Health Data Space (EHDS). It composes existing IHE and HL7 specifications — MHD for document exchange, SMART App Launch and IHE IUA for environment-specific authorization, PDQm for patient matching, and IPA for resource access — into a unified conformance target for EHR systems across Europe.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "150",
      "display" : "Europe"
    }]
  }],
  "copyright" : "Copyright HL7 Europe. Licensed under Creative Commons public domain (CC0 1.0).",
  "packageId" : "hl7.fhir.eu.health-data-api",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.4.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.3.0"
  },
  {
    "id" : "hl7_fhir_eu_base",
    "uri" : "http://hl7.eu/fhir/base/ImplementationGuide/hl7.fhir.eu.base",
    "packageId" : "hl7.fhir.eu.base",
    "version" : "2.0.0-ballot"
  },
  {
    "id" : "ihe_iti_pdqm",
    "uri" : "https://profiles.ihe.net/ITI/PDQm/ImplementationGuide/ihe.iti.pdqm",
    "packageId" : "ihe.iti.pdqm",
    "version" : "3.2.x"
  },
  {
    "id" : "ihe_iti_mhd",
    "uri" : "https://profiles.ihe.net/ITI/MHD/ImplementationGuide/ihe.iti.mhd",
    "packageId" : "ihe.iti.mhd",
    "version" : "4.2.x"
  },
  {
    "id" : "hl7_fhir_uv_ipa",
    "uri" : "http://hl7.org/fhir/uv/ipa/ImplementationGuide/hl7.fhir.uv.ipa",
    "packageId" : "hl7.fhir.uv.ipa",
    "version" : "1.1.x"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2025+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ballot"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "default-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "default-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "default-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "default-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "show-inherited-invariants"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "usage-stats-opt-out"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "0.1.0-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "shownav"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "pin-canonicals"
      },
      {
        "url" : "value",
        "valueString" : "pin-multiples"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid-template"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid-template"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.eu/fhir/health-data-api/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2025+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ballot"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "default-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "default-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "default-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "default-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "show-inherited-invariants"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "usage-stats-opt-out"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "0.1.0-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "shownav"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "pin-canonicals"
      },
      {
        "url" : "value",
        "valueString" : "pin-multiples"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid-template"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid-template"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.eu/fhir/health-data-api/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-authentication-service-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/authentication-service-eu-api"
      },
      "name" : "Authentication Service",
      "description" : "The Authentication Service authenticates an end user, directly or through a Wallet or upstream\nidentity provider, and supplies an authentication result trusted by the Health Data API Authorization Server.\nIt does not grant API access or issue API access tokens in this role. This IG-defined role is not\na formal IHE IUA or SMART actor. It MAY be grouped with the\n[Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.html) in one implementation;\nthe interface between separate implementations is deployment-defined, not an interoperable\ntransaction specified by this IG. No ID token or token exchange is required by the actor split.\nSee [authentication and authorization groupings](actors.html#authentication-and-authorization-groupings)\nand [Authorization](authorization.html#authentication-and-api-authorization).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-document-access-provider-actor-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/document-access-provider-actor-eu-api"
      },
      "name" : "EEHRxF Document Access Provider",
      "description" : "The Document Access Provider actor provides access to EEHRxF FHIR Documents by receiving\ndocuments from Document Publishers and serving them to Document Consumers. This composite\nactor groups MHD Document Recipient, MHD Document Responder, PDQm Patient Demographics\nSupplier, and the applicable IUA Resource Server or SMART FHIR Resource Server role.\nAn Authorization Server is independent; it may be co-located only as an optional deployment.\nSee [Authorization](authorization.html#environment-specific-requirements) for the selected role.\n\nSee [Document Access Provider CapabilityStatement](CapabilityStatement-document-access-provider-eu-api.html)\nfor technical requirements.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-document-access-provider-submission-option-eu-api.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/document-access-provider-submission-option-eu-api"
      },
      "name" : "EEHRxF Document Access Provider - Document Submission Option",
      "description" : "Requirements for the Document Submission Option on an EEHRxF Document Access Provider.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-document-access-provider-eu-api.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/document-access-provider-eu-api"
      },
      "name" : "EEHRxF Document Access Provider CapabilityStatement",
      "description" : "Requirements for an EEHRxF Document Access Provider serving FHIR Documents to Document Consumers.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-document-consumer-actor-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/document-consumer-actor-eu-api"
      },
      "name" : "EEHRxF Document Consumer",
      "description" : "The Document Consumer actor consumes EEHRxF FHIR Documents by querying a Document Access\nProvider. This composite actor groups MHD Document Consumer, PDQm Patient Demographics\nConsumer, and the IUA Authorization Client, SMART App, or SMART Backend Service role selected\nby the environment and use case. The Authorization Server is a separate participant. See\n[Authorization](authorization.html#environment-specific-requirements) for the selected role.\n\nSee [Document Consumer CapabilityStatement](CapabilityStatement-document-consumer-eu-api.html)\nfor technical requirements.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-document-consumer-eu-api.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/document-consumer-eu-api"
      },
      "name" : "EEHRxF Document Consumer CapabilityStatement",
      "description" : "Requirements for an EEHRxF Document Consumer that queries and retrieves FHIR Documents.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-document-priority-category-eu-api.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/document-priority-category-eu-api"
      },
      "name" : "EEHRxF Document Priority Category CodeSystem",
      "description" : "CodeSystem for priority document categories in EEHRxF as the document categories as defined in the EHDS regulation.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-document-publisher-actor-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/document-publisher-actor-eu-api"
      },
      "name" : "EEHRxF Document Publisher",
      "description" : "The Document Publisher actor produces EEHRxF FHIR Documents and publishes them to a\nDocument Access Provider. This composite actor groups MHD Document Source, PDQm\nPatient Demographics Consumer, and the IUA Authorization Client or SMART Backend\nService role selected by the environment and use case. The Authorization Server is a\nseparate participant. See [Authorization](authorization.html#environment-specific-requirements)\nfor the selected protocol and flow.\n\nSee [Document Publisher CapabilityStatement](CapabilityStatement-document-publisher-eu-api.html)\nfor technical requirements.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-document-publisher-eu-api.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/document-publisher-eu-api"
      },
      "name" : "EEHRxF Document Publisher CapabilityStatement",
      "description" : "Requirements for an EEHRxF Document Publisher that submits FHIR Documents to a Document Access Provider.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-document-type-eu-api.html"
      }],
      "reference" : {
        "reference" : "ValueSet/document-type-eu-api"
      },
      "name" : "EEHRxF Document Type ValueSet",
      "description" : "Document type codes for clinical precision in document identification.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-document-type-discharge-report-eu-api.html"
      }],
      "reference" : {
        "reference" : "ValueSet/document-type-discharge-report-eu-api"
      },
      "name" : "EEHRxF Document Type ValueSet for Discharge Reports",
      "description" : "ValueSet for specific document types within the Discharge Report priority category.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-document-type-laboratory-report-eu-api.html"
      }],
      "reference" : {
        "reference" : "ValueSet/document-type-laboratory-report-eu-api"
      },
      "name" : "EEHRxF Document Type ValueSet for Laboratory Reports",
      "description" : "ValueSet for specific document types within the Laboratory Report priority category.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-document-type-medical-imaging-eu-api.html"
      }],
      "reference" : {
        "reference" : "ValueSet/document-type-medical-imaging-eu-api"
      },
      "name" : "EEHRxF Document Type ValueSet for Medical Imaging",
      "description" : "ValueSet for specific document types within the Medical Imaging priority category.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-document-type-patient-summary-eu-api.html"
      }],
      "reference" : {
        "reference" : "ValueSet/document-type-patient-summary-eu-api"
      },
      "name" : "EEHRxF Document Type ValueSet for Patient Summaries",
      "description" : "ValueSet for specific document types within the Patient Summary priority category.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-document-publisher-access-provider-actor-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/document-publisher-access-provider-actor-eu-api"
      },
      "name" : "EEHRxF Grouped Document Publisher/Access Provider",
      "description" : "The grouped Document Publisher/Access Provider actor represents a deployment where document\nproduction and access provision are co-located in the same system. In this configuration,\ndocument submission (ITI-105) is internal and only document query/retrieval (ITI-67, ITI-68)\nis exposed externally. The external protected endpoint groups with the applicable IUA Resource\nServer or SMART FHIR Resource Server role. Internal publication does not create another externally\nadvertised authorization role. An Authorization Server remains a separate participant and may be\nco-located only as an optional deployment. See\n[Authorization](authorization.html#environment-specific-requirements) for the selected role.\n\nThis is common for hospital EHR systems that produce and serve their own documents.\n\nSee [Grouped Document Publisher/Access Provider CapabilityStatement](CapabilityStatement-document-publisher-access-provider-eu-api.html)\nfor technical requirements.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-document-publisher-access-provider-eu-api.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/document-publisher-access-provider-eu-api"
      },
      "name" : "EEHRxF Grouped Document Publisher/Access Provider CapabilityStatement",
      "description" : "Requirements for a deployment that combines an internal Document Publisher with an external-facing Document Access Provider.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ConceptMap"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ConceptMap-document-reference-category-type-eu-api.html"
      }],
      "reference" : {
        "reference" : "ConceptMap/document-reference-category-type-eu-api"
      },
      "name" : "EEHRxF MHD DocumentReference ConceptMap",
      "description" : "mapping from the EHDS regulatory priority categories to the LOINC document category codes for clinical precision in document identification.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-resource-access-provider-actor-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/resource-access-provider-actor-eu-api"
      },
      "name" : "EEHRxF Resource Access Provider",
      "description" : "The Resource Access Provider actor provides access to FHIR resources following IPA patterns.\nThis enables direct resource access complementing document-based exchange.\nThis composite actor groups IPA Server, PDQm Patient Demographics\nSupplier, and the applicable IUA Resource Server or SMART FHIR Resource Server role.\nAn Authorization Server is independent; it may be co-located only as an optional deployment.\nSee [Authorization](authorization.html#environment-specific-requirements) for the selected role.\n\nSee [Resource Access Provider CapabilityStatement](CapabilityStatement-resource-access-provider-eu-api.html)\nfor technical requirements.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-resource-access-provider-eu-api.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/resource-access-provider-eu-api"
      },
      "name" : "EEHRxF Resource Access Provider CapabilityStatement",
      "description" : "Requirements for an EEHRxF Resource Access Provider that serves clinical FHIR resources using IPA patterns.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-resource-consumer-actor-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/resource-consumer-actor-eu-api"
      },
      "name" : "EEHRxF Resource Consumer",
      "description" : "The Resource Consumer actor queries for clinical data resources from a Resource Access\nProvider following IPA patterns. This composite actor groups IPA Client,\nPDQm Patient Demographics Consumer, and the IUA Authorization Client or SMART\nApp or SMART Backend Service role selected by the environment and use case. The Authorization\nServer is a separate participant. See\n[Authorization](authorization.html#environment-specific-requirements) for the selected role.\n\nSee [Resource Consumer CapabilityStatement](CapabilityStatement-resource-consumer-eu-api.html)\nfor technical requirements.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-resource-consumer-eu-api.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/resource-consumer-eu-api"
      },
      "name" : "EEHRxF Resource Consumer CapabilityStatement",
      "description" : "Requirements for an EEHRxF Resource Consumer that queries clinical FHIR resources using IPA patterns.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-eu-api-authorization-security-service.html"
      }],
      "reference" : {
        "reference" : "ValueSet/eu-api-authorization-security-service"
      },
      "name" : "EU Health Data API Authorization Security Service ValueSet",
      "description" : "Security services that a concrete EU Health Data API deployment may select for its protected FHIR interface.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-eu-api-deployment-capabilitystatement.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/eu-api-deployment-capabilitystatement"
      },
      "name" : "EU Health Data API Deployment CapabilityStatement",
      "description" : "A concrete EU Health Data API deployment CapabilityStatement declaring one selected authorization security service.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DocumentReference"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DocumentReference-example-documentreference-eps.html"
      }],
      "reference" : {
        "reference" : "DocumentReference/example-documentreference-eps"
      },
      "name" : "Example - European Patient Summary DocumentReference",
      "description" : "Example DocumentReference showing an EPS document with EEHRxF category coding.\n\nThis example demonstrates the recommended search strategy:\n- `category` = Patient-Summaries (EHDS priority category for coarse filtering)\n- `type` = 60591-5 (LOINC code for clinical precision)\n\n**Example query to find this document by priority category:**\n```\nGET [base]/DocumentReference?patient=Patient/example-patient&category=https://euridice.ec.europa.eu/fhir/eehrxf/CodeSystem/document-priority-category-eu-api|Patient-Summaries\n```\n\n**Example query to find this document by type:**\n```\nGET [base]/DocumentReference?patient=Patient/example-patient&type=http://loinc.org|60591-5\n```",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DocumentReference"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DocumentReference-example-documentreference-hdr.html"
      }],
      "reference" : {
        "reference" : "DocumentReference/example-documentreference-hdr"
      },
      "name" : "Example - Hospital Discharge Report DocumentReference",
      "description" : "Example DocumentReference for a hospital discharge report.\n\n**Example query:**\n```\nGET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|18842-5\n```",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DocumentReference"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DocumentReference-example-documentreference-imaging-report.html"
      }],
      "reference" : {
        "reference" : "DocumentReference/example-documentreference-imaging-report"
      },
      "name" : "Example - Imaging Report DocumentReference",
      "description" : "Example DocumentReference for a diagnostic imaging report.\n\n**Example query:**\n```\nGET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|85430-7\n```",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DocumentReference"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DocumentReference-example-documentreference-imaging-manifest-kos.html"
      }],
      "reference" : {
        "reference" : "DocumentReference/example-documentreference-imaging-manifest-kos"
      },
      "name" : "Example - Imaging Study Manifest (DICOM KOS)",
      "description" : "Example DocumentReference for a DICOM KOS-encoded imaging study manifest.\n\nThis is one half of the dual-DocumentReference pattern for imaging manifests.\nThe DICOM KOS DocumentReference is linked to its FHIR manifest counterpart\nvia `relatesTo.code = transforms`.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DocumentReference"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DocumentReference-example-documentreference-imaging-manifest-fhir.html"
      }],
      "reference" : {
        "reference" : "DocumentReference/example-documentreference-imaging-manifest-fhir"
      },
      "name" : "Example - Imaging Study Manifest (FHIR)",
      "description" : "Example DocumentReference for a FHIR-encoded imaging study manifest.\n\nThis is one half of the dual-DocumentReference pattern for imaging manifests.\nThe FHIR manifest DocumentReference is linked to its DICOM KOS counterpart\nvia `relatesTo.code = transforms`.\n\n**Example query to find imaging manifests by type:**\n```\nGET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|18748-4&status=current\n```",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DocumentReference"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DocumentReference-example-documentreference-laboratory.html"
      }],
      "reference" : {
        "reference" : "DocumentReference/example-documentreference-laboratory"
      },
      "name" : "Example - Laboratory Report DocumentReference",
      "description" : "Example DocumentReference for a laboratory report.\n\n**Example query:**\n```\nGET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|11502-2\n```",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-example-capabilitystatement-document-access-provider.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/example-capabilitystatement-document-access-provider"
      },
      "name" : "Example: Document Access Provider Supporting EPS and Laboratory",
      "description" : "**Example** CapabilityStatement for a Document Access Provider that supports\nEuropean Patient Summaries and Laboratory Reports.\n\nShows how a deployment declares actor conformance via `instantiates` and\ncontent IG support via `implementationGuide`. This concrete deployment selects\nSMART Backend Services and therefore advertises only `SMART-on-FHIR`.\n\nSee [Capability Discovery](capability-discovery.html) for guidance.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-eu-authorization-client-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/eu-authorization-client-eu-api"
      },
      "name" : "Health Data API Authorization Client",
      "description" : "The Health Data API Authorization Client obtains an access token from the selected Authorization Server\nand presents it to a protected API. Client authentication, grants, scopes, discovery, and\nlaunch context depend on the selected environment and protocol; public SMART interactive\nclients do not authenticate at the token endpoint. This generic role does not by itself\nclaim IHE IUA or SMART conformance. See the applicable [IHE IUA Authorization Client](https://profiles.ihe.net/ITI/IUA/index.html#34111-authorization-client),\n[SMART App](ActorDefinition-smart-app-eu-api.html), or [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.html)\ndefinition and the relevant [Authorization](authorization.html) requirements.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-eu-authorization-server-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/eu-authorization-server-eu-api"
      },
      "name" : "Health Data API Authorization Server",
      "description" : "The Health Data API Authorization Server issues access tokens after applying the authentication and\nauthorization requirements of the selected environment and protocol. When user authentication\nis required, it relies on an acceptable result from the\n[Authentication Service](ActorDefinition-authentication-service-eu-api.html), with which it MAY\nbe grouped. Authentication alone does not establish API access entitlement. Client assertion\nvalidation applies only when the selected flow uses asymmetric client authentication. The\nAuthorization Server remains responsibility-distinct from a Resource Server, including when\nthe two are co-located. This generic role does not by itself claim IHE IUA or SMART conformance.\nThe Health Data API qualifier identifies this IG's role, not a central EU-operated service.\nSee the applicable [IHE IUA Authorization Server](https://profiles.ihe.net/ITI/IUA/index.html#34112-authorization-server)\nor [SMART Authorization Server](ActorDefinition-smart-authorization-server-eu-api.html)\ndefinition and the relevant [Authorization](authorization.html) requirements.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-eu-authorization-resource-server-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/eu-authorization-resource-server-eu-api"
      },
      "name" : "Health Data API Resource Server",
      "description" : "The Health Data API Resource Server hosts a protected API, validates or introspects access\ntokens as applicable, and enforces granted authorization and local policy. It does not issue\naccess tokens or validate client assertions for an independent Authorization Server. This\ngeneric role does not by itself claim IHE IUA or SMART conformance. See the applicable\n[IHE IUA Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#34113-resource-server)\nor [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.html)\ndefinition and the relevant [Authorization](authorization.html) requirements.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-iua-authorization-client-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/iua-authorization-client-eu-api"
      },
      "name" : "IHE IUA Authorization Client",
      "description" : "The IHE IUA Authorization Client authenticates to the Authorization Server, requests\nleast-privilege scopes, and presents the resulting bearer token to the Resource Server.\nIt implements the applicable IUA transactions. See the\n[IHE IUA Authorization Client](https://profiles.ihe.net/ITI/IUA/index.html#34111-authorization-client)\nand [Authorization](authorization.html#ihe-iua).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-iua-authorization-server-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/iua-authorization-server-eu-api"
      },
      "name" : "IHE IUA Authorization Server",
      "description" : "The independent IHE IUA Authorization Server authenticates clients, validates client\nassertions when selected, applies issuance policy, prevents replay, and issues tokens.\nWhere user authentication is required, it may use the IG-defined Authentication Service;\nthis does not remove any applicable IUA Authorization Server conformance obligation.\nIt does not provide protected-resource enforcement. See the\n[IHE IUA Authorization Server](https://profiles.ihe.net/ITI/IUA/index.html#34112-authorization-server)\nand [Authorization](authorization.html#ihe-iua).\nIUA requires this role to be grouped with a CT Time Client; see\n[required actor groupings](https://profiles.ihe.net/ITI/IUA/index.html#343-iua-required-actor-groupings)\nand the shared [Time Synchronization](authorization.html#time-synchronization) deployment guidance.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-iua-resource-server-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/iua-resource-server-eu-api"
      },
      "name" : "IHE IUA Resource Server",
      "description" : "The IHE IUA Resource Server validates or introspects access tokens and enforces granted\nauthorization and local policy for protected resources. It does not validate client\nassertions for an independent Authorization Server. See the\n[IHE IUA Resource Server](https://profiles.ihe.net/ITI/IUA/index.html#34113-resource-server)\nand [Authorization](authorization.html#ihe-iua).\nIUA requires this role to be grouped with a CT Time Client; see\n[required actor groupings](https://profiles.ihe.net/ITI/IUA/index.html#343-iua-required-actor-groupings)\nand the shared [Time Synchronization](authorization.html#time-synchronization) deployment guidance.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-smart-app-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/smart-app-eu-api"
      },
      "name" : "SMART App",
      "description" : "The SMART App is an interactive client using authorization code and PKCE in standalone\nor EHR-launch mode. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html)\nand [Authorization](authorization.html#smart-app-launch).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-smart-authorization-server-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/smart-authorization-server-eu-api"
      },
      "name" : "SMART Authorization Server",
      "description" : "The SMART Authorization Server authenticates clients as applicable, authorizes requests,\nand issues tokens. It remains a distinct participant from the protected FHIR Resource Server.\nFor interactive flows it may rely on the IG-defined Authentication Service for user\nauthentication without transferring its SMART conformance obligations. Backend Services does\nnot require runtime end-user authentication.\nSee [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/)\nand [Authorization](authorization.html#smart-app-launch). This IG recommends CT Time Client grouping\nfor this server role in both interactive and Backend Services modes; see\n[SMART Server Time Synchronization](authorization.html#smart-server-time-synchronization)\nand the shared [Time Synchronization](authorization.html#time-synchronization) deployment guidance.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-smart-backend-service-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/smart-backend-service-eu-api"
      },
      "name" : "SMART Backend Service",
      "description" : "The SMART Backend Service is a pre-authorized confidential server-side client using\nclient credentials, asymmetric client authentication, and applicable system scopes.\nSee [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html)\nand [Authorization](authorization.html#smart-app-launch).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-smart-fhir-resource-server-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/smart-fhir-resource-server-eu-api"
      },
      "name" : "SMART FHIR Resource Server",
      "description" : "The SMART FHIR Resource Server hosts protected FHIR resources, validates access tokens,\nand enforces granted SMART scopes. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/)\nand [Authorization](authorization.html#smart-app-launch). This IG recommends CT Time Client grouping\nfor this server role in both interactive and Backend Services modes; see\n[SMART Server Time Synchronization](authorization.html#smart-server-time-synchronization)\nand the shared [Time Synchronization](authorization.html#time-synchronization) deployment guidance.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ActorDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ActorDefinition-smart-launching-system-eu-api.html"
      }],
      "reference" : {
        "reference" : "ActorDefinition/smart-launching-system-eu-api"
      },
      "name" : "SMART Launching System",
      "description" : "The SMART Launching System initiates an EHR launch and supplies the launch context for\nan interactive SMART App. See [SMART App Launch](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html)\nand [Authorization](authorization.html#smart-app-launch).",
      "exampleBoolean" : false
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Home",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "background.html"
        }],
        "nameUrl" : "background.html",
        "title" : "Background",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "regulatoryAnchors.html"
          }],
          "nameUrl" : "regulatoryAnchors.html",
          "title" : "Regulatory Anchors",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "actors.html"
          }],
          "nameUrl" : "actors.html",
          "title" : "Actors and Transactions",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "priority-categories.html"
          }],
          "nameUrl" : "priority-categories.html",
          "title" : "Priority Categories",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "priority-area-eps.html"
            }],
            "nameUrl" : "priority-area-eps.html",
            "title" : "Patient Summary (EPS)",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "priority-area-mpd.html"
            }],
            "nameUrl" : "priority-area-mpd.html",
            "title" : "ePrescription / eDispensation (MPD)",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "priority-area-laboratory.html"
            }],
            "nameUrl" : "priority-area-laboratory.html",
            "title" : "Medical Test Results (Laboratory)",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "priority-area-imaging-report.html"
            }],
            "nameUrl" : "priority-area-imaging-report.html",
            "title" : "Medical Imaging Report",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "priority-area-imaging-manifest.html"
            }],
            "nameUrl" : "priority-area-imaging-manifest.html",
            "title" : "Medical Imaging Manifest",
            "generation" : "markdown"
          },
          {
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "priority-area-hdr.html"
            }],
            "nameUrl" : "priority-area-hdr.html",
            "title" : "Hospital Discharge Report",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "member-state-architectures.html"
          }],
          "nameUrl" : "member-state-architectures.html",
          "title" : "Member State Architectures",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "fhir-documents-vs-resources.html"
            }],
            "nameUrl" : "fhir-documents-vs-resources.html",
            "title" : "FHIR Documents and Resources",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "background-xds-fhir.html"
          }],
          "nameUrl" : "background-xds-fhir.html",
          "title" : "Relationship to XDS/FHIR Document Sharing",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "changes.html"
          }],
          "nameUrl" : "changes.html",
          "title" : "Change Log",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "open-issues.html"
          }],
          "nameUrl" : "open-issues.html",
          "title" : "Open Issues",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "functional.html"
        }],
        "nameUrl" : "functional.html",
        "title" : "Functional Requirements",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "capability-discovery.html"
          }],
          "nameUrl" : "capability-discovery.html",
          "title" : "Capability Discovery",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "authorization.html"
          }],
          "nameUrl" : "authorization.html",
          "title" : "Authorization",
          "generation" : "markdown",
          "page" : [{
            "extension" : [{
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "authorization-ticket-resolutions.html"
            }],
            "nameUrl" : "authorization-ticket-resolutions.html",
            "title" : "Proposed Authorization Ticket Resolutions",
            "generation" : "markdown"
          }]
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "patient-match.html"
          }],
          "nameUrl" : "patient-match.html",
          "title" : "Patient Lookup",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "document-exchange.html"
          }],
          "nameUrl" : "document-exchange.html",
          "title" : "Document Exchange",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "resource-access.html"
          }],
          "nameUrl" : "resource-access.html",
          "title" : "Resource Access",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "resourceExchange.html"
          }],
          "nameUrl" : "resourceExchange.html",
          "title" : "Resource Exchange Patterns",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "implementation.html"
        }],
        "nameUrl" : "implementation.html",
        "title" : "Implementation",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "example-patient-summary.html"
          }],
          "nameUrl" : "example-patient-summary.html",
          "title" : "Retrieve a European Patient Summary",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "usecase-cross-border-ncp.html"
          }],
          "nameUrl" : "usecase-cross-border-ncp.html",
          "title" : "Cross-Border Exchange via NCP",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "usecase-health-professional-portal.html"
          }],
          "nameUrl" : "usecase-health-professional-portal.html",
          "title" : "Health Professional Access Service",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "usecase-health-data-portal.html"
          }],
          "nameUrl" : "usecase-health-data-portal.html",
          "title" : "Health Data Access Service",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "usecase-wellness-app.html"
          }],
          "nameUrl" : "usecase-wellness-app.html",
          "title" : "Wellness Apps",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "usecase-cross-org.html"
          }],
          "nameUrl" : "usecase-cross-org.html",
          "title" : "Cross-Organization via National Infrastructure",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "usecase-provider-internal-exchange.html"
          }],
          "nameUrl" : "usecase-provider-internal-exchange.html",
          "title" : "Provider-Internal Exchange",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "ehr-system-composition.html"
          }],
          "nameUrl" : "ehr-system-composition.html",
          "title" : "EHR System Composition Patterns",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "logging-audit-considerations.html"
          }],
          "nameUrl" : "logging-audit-considerations.html",
          "title" : "Logging and Audit Considerations (Informative)",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "artifacts-overview.html"
        }],
        "nameUrl" : "artifacts-overview.html",
        "title" : "Artifacts Overview",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "about.html"
        }],
        "nameUrl" : "about.html",
        "title" : "About",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "contributors.html"
          }],
          "nameUrl" : "contributors.html",
          "title" : "Authors and contributors",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "copyright.html"
          }],
          "nameUrl" : "copyright.html",
          "title" : "Copyright",
          "generation" : "markdown"
        }]
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/assets"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
