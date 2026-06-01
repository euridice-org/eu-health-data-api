This ConceptMap correlates the coarse-grained priority categories defined in the EHDS regulation to the LOINC document **class** codes carried in `DocumentReference.category`. The regulatory priority category is a policy grouping; the LOINC class code is the value a server filters on. It may evolve as new document classes become relevant for cross-border exchange.

For the precise LOINC document **type** codes within each category (used in `DocumentReference.type`), see the per-category ValueSets:
- `Patient-Summaries` codes are found in [EEHRxFDocumentTypePatientSummaryVS](ValueSet-eehrxf-document-type-patient-summary-vs.html)
- `Discharge-Reports` codes are found in [EEHRxFDocumentTypeDischargeReportVS](ValueSet-eehrxf-document-type-discharge-report-vs.html)
- `Laboratory-Reports` codes are found in [EEHRxFDocumentTypeLaboratoryReportVS](ValueSet-eehrxf-document-type-laboratory-report-vs.html)
- `Medical-Imaging` codes are found in [EEHRxFDocumentTypeMedicalImagingVS](ValueSet-eehrxf-document-type-medical-imaging-vs.html)

No Document Types are assigned to #Electronic-Prescriptions or #Electronic-Dispensations; as these are not considered appropriate use-cases for Documents.

<div markdown="1" class="stu-note">

**This Concept Map is Informative.** The codes mapped here are the known document type codes for the indicated priority category. This ConceptMap is expected to evolve over time as clinical practice changes and new document types become relevant for cross-border exchange.

</div>
