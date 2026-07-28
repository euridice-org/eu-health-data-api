RuleSet: SetFmmAndStatusRule ( fmm, status )
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}
* ^jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#150 "Europe"


RuleSet: ExtensionContext(path)
// copied by mCode
* ^context[+].type = #element
* ^context[=].expression = "{path}"

RuleSet: ElementMapping( code, display, targetCode, targetDisplay, relationship )
* element[+]
  * code = {code}
  * display = {display}
  * target 
    * code = {targetCode}
    * display = {targetDisplay}
    * relationship = {relationship}

RuleSet: SliceElement( type, path )
* ^slicing.discriminator.type = {type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open
* ^slicing.ordered = false

RuleSet: SliceElementWithDescription( type, path, description )
* ^slicing.discriminator.type = {type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open
* ^slicing.description = "{description}"
* ^slicing.ordered = false

RuleSet: SNOMEDCopyrightForVS
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"

RuleSet: LOINCCopyrightForVS
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"

RuleSet: UCUMCopyrightForVS
* ^copyright = "The UCUM codes, UCUM table (regardless of format), and UCUM Specification are copyright 1999-2009, Regenstrief Institute, Inc. and the Unified Codes for Units of Measures (UCUM) Organization. All rights reserved. https://ucum.org/trac/wiki/TermsOfUse"

RuleSet: AddDocumentReferenceSearchParameter(name, definition, type, expectation, documentation)
* rest[=].resource[=].searchParam[+].name = "{name}"
* rest[=].resource[=].searchParam[=].definition = "{definition}"
* rest[=].resource[=].searchParam[=].type = #{type}
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #{expectation}
* rest[=].resource[=].searchParam[=].documentation = "{documentation}"

RuleSet: AddDocumentReferenceSearchParameterWithoutDefinition(name, type, expectation, documentation)
* rest[=].resource[=].searchParam[+].name = "{name}"
* rest[=].resource[=].searchParam[=].type = #{type}
* rest[=].resource[=].searchParam[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[=].resource[=].searchParam[=].extension[=].valueCode = #{expectation}
* rest[=].resource[=].searchParam[=].documentation = "{documentation}"

RuleSet: DocumentReferenceProviderSearchParameters
* insert AddDocumentReferenceSearchParameter(_id, http://hl7.org/fhir/SearchParameter/Resource-id, token, SHALL, Logical id)
* insert AddDocumentReferenceSearchParameter(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, date, MAY, Resource version last updated)
* insert AddDocumentReferenceSearchParameterWithoutDefinition(author.given, string, MAY, Author given name)
* insert AddDocumentReferenceSearchParameterWithoutDefinition(author.family, string, MAY, Author family name)
* insert AddDocumentReferenceSearchParameter(category, http://hl7.org/fhir/SearchParameter/DocumentReference-category, token, SHALL, Document category)
* insert AddDocumentReferenceSearchParameter(creation, https://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation, date, SHALL, Document creation time)
* insert AddDocumentReferenceSearchParameter(date, http://hl7.org/fhir/SearchParameter/DocumentReference-date, date, SHOULD, Reference creation time)
* insert AddDocumentReferenceSearchParameter(event, http://hl7.org/fhir/SearchParameter/DocumentReference-event, token, MAY, Main clinical acts documented)
* insert AddDocumentReferenceSearchParameter(facility, http://hl7.org/fhir/SearchParameter/DocumentReference-facility, token, MAY, Facility kind)
* insert AddDocumentReferenceSearchParameter(format, http://hl7.org/fhir/SearchParameter/DocumentReference-format, token, MAY, Document format)
* insert AddDocumentReferenceSearchParameter(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, token, MAY, Document identifier)
* insert AddDocumentReferenceSearchParameter(patient, http://hl7.org/fhir/SearchParameter/clinical-patient, reference, SHALL, Patient reference)
* insert AddDocumentReferenceSearchParameterWithoutDefinition(patient.identifier, token, SHALL, Chained patient identifier)
* insert AddDocumentReferenceSearchParameter(period, http://hl7.org/fhir/SearchParameter/DocumentReference-period, date, MAY, Documented service period)
* insert AddDocumentReferenceSearchParameter(related, http://hl7.org/fhir/SearchParameter/DocumentReference-related, reference, MAY, Related identifier or resource)
* insert AddDocumentReferenceSearchParameter(security-label, http://hl7.org/fhir/SearchParameter/DocumentReference-security-label, token, MAY, Document security label)
* insert AddDocumentReferenceSearchParameter(setting, http://hl7.org/fhir/SearchParameter/DocumentReference-setting, token, MAY, Clinical setting)
* insert AddDocumentReferenceSearchParameter(status, http://hl7.org/fhir/SearchParameter/DocumentReference-status, token, SHOULD, Document reference status)
* insert AddDocumentReferenceSearchParameter(type, http://hl7.org/fhir/SearchParameter/clinical-type, token, SHALL, Document type)

RuleSet: DocumentReferenceConsumerSearchParameters
* insert AddDocumentReferenceSearchParameter(_id, http://hl7.org/fhir/SearchParameter/Resource-id, token, SHALL, Logical id)
* insert AddDocumentReferenceSearchParameter(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, date, MAY, Resource version last updated)
* insert AddDocumentReferenceSearchParameterWithoutDefinition(author.given, string, MAY, Author given name)
* insert AddDocumentReferenceSearchParameterWithoutDefinition(author.family, string, MAY, Author family name)
* insert AddDocumentReferenceSearchParameter(category, http://hl7.org/fhir/SearchParameter/DocumentReference-category, token, MAY, Document category)
* insert AddDocumentReferenceSearchParameter(creation, https://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation, date, MAY, Document creation time)
* insert AddDocumentReferenceSearchParameter(date, http://hl7.org/fhir/SearchParameter/DocumentReference-date, date, MAY, Reference creation time)
* insert AddDocumentReferenceSearchParameter(event, http://hl7.org/fhir/SearchParameter/DocumentReference-event, token, MAY, Main clinical acts documented)
* insert AddDocumentReferenceSearchParameter(facility, http://hl7.org/fhir/SearchParameter/DocumentReference-facility, token, MAY, Facility kind)
* insert AddDocumentReferenceSearchParameter(format, http://hl7.org/fhir/SearchParameter/DocumentReference-format, token, MAY, Document format)
* insert AddDocumentReferenceSearchParameter(identifier, http://hl7.org/fhir/SearchParameter/clinical-identifier, token, MAY, Document identifier)
* insert AddDocumentReferenceSearchParameter(patient, http://hl7.org/fhir/SearchParameter/clinical-patient, reference, SHALL, Patient reference)
* insert AddDocumentReferenceSearchParameterWithoutDefinition(patient.identifier, token, SHALL, Chained patient identifier)
* insert AddDocumentReferenceSearchParameter(period, http://hl7.org/fhir/SearchParameter/DocumentReference-period, date, MAY, Documented service period)
* insert AddDocumentReferenceSearchParameter(related, http://hl7.org/fhir/SearchParameter/DocumentReference-related, reference, MAY, Related identifier or resource)
* insert AddDocumentReferenceSearchParameter(security-label, http://hl7.org/fhir/SearchParameter/DocumentReference-security-label, token, MAY, Document security label)
* insert AddDocumentReferenceSearchParameter(setting, http://hl7.org/fhir/SearchParameter/DocumentReference-setting, token, MAY, Clinical setting)
* insert AddDocumentReferenceSearchParameter(status, http://hl7.org/fhir/SearchParameter/DocumentReference-status, token, MAY, Document reference status)
* insert AddDocumentReferenceSearchParameter(type, http://hl7.org/fhir/SearchParameter/clinical-type, token, MAY, Document type)
