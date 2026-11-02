<div markdown="1" class="stu-note">

**Not all document categories have a LOINC equivalent.** Some categories in [EEHRxF Document Category ValueSet](ValueSet-document-category-eu-api.html) have no matching LOINC Document Ontology part. These categories use temporary codes from [EEHRxF Temporary Document Category CodeSystem](CodeSystem-document-category-temp-eu-api.html). The temporary codes are expected to be replaced by LOINC codes, or retired, in a future version.

</div>

### Design choices and open points

The LOINC parts of type `Document.Kind` do not cover all the categories this IG needs. This map uses:

- parts of type `Document.Kind` for the first (parent) level;
- parts of type `COMPONENT` for the second (child) level.

This is one possible approach, and other approaches should be discussed. The approach under consideration is:

- to use LOINC parts of type `COMPONENT` wherever one is available for a category;
- meanwhile, to work with LOINC to fill the gaps, so that the temporary codes can be replaced by LOINC parts.

Feedback is welcome on this approach.

### Concepts to be requested from LOINC

No LOINC part has been identified for the concepts below. They are to be requested from LOINC.

| Temporary code | Concept | Parent in this map | Remarks |
|---|---|---|---|
| `Imaging-Report` | Imaging report | LP183761-8 "Report" | Report describing the results and interpretation of an imaging study. |
| `Dispensation` | Dispensation | None (first level) | Information on the supply of a medicinal product to a person. LP72929-0 "Medication dispensed" is narrower and is used in this map as its child. |

### LOINC parts that could replace the temporary codes

The table below lists, for each of the other temporary codes, the existing LOINC parts that could be used instead. The displays come from LOINC 2.83. The part types still need to be checked against the LOINC Document Ontology.

| Temporary code | Candidate LOINC part(s) | Remarks |
|---|---|---|
| `Imaging-Study` | LP74392-9 "Imaging study" | Check the part type and whether the meaning matches a document category. |
| `Summary` | LP182278-4 "Summary"; LP73428-2 "Summary note" | Check whether either part can be used as a first-level category. |
| `Plan` | LP175754-3 "Plan"; LP157909-5 "Plan of care note" | In LOINC, LP175754-3 sits under LP64606-4 "Evaluation and management note". Check whether it is suitable as a first-level category. |

### Consistent approach: LOINC parts of type COMPONENT only

The table below shows which LOINC parts of type `COMPONENT` could be used for each category if only parts of that type are used, at both levels. Unless the remarks say otherwise, each part listed is used as the `COMPONENT` of at least one LOINC code (LOINC 2.83); the third column gives an example.

| Category | COMPONENT part | Example LOINC code using it | Remarks |
|---|---|---|---|
| 1. Report | LP183761-8 "Report" | 80563-0 "Report" | |
| 1.1 Laboratory report | LP74123-8 "Laboratory report" | 11502-2 "Laboratory report" | |
| 1.2 Imaging report | None | | The only imaging report part found, LP248288-5 "Diagnostic imaging report - example sections & entries" (used by 85430-7), is tied to a specific report structure and is not suitable as a category. Gap to be raised with LOINC. |
| 1.3 Discharge report | LP72467-1 "Discharge summary note" | 18842-5 "Discharge summary" | |
| 2. Imaging study | LP74392-9 "Imaging study" | 19005-8 "Radiology Imaging study [Impression] (narrative)" | **Potential issue:** LP74392-9 is the COMPONENT only of 19005-8, which is not a document code. The document type used in this IG for imaging studies, 18748-4 "Diagnostic imaging study", has a different COMPONENT: LP431578-6 "Diagnostic Imaging study". The category is therefore not linked through LOINC to the document type it groups. LP431578-6 could be used instead. |
| 3. Prescription | LP116219-9 "Prescription" | 64287-6 "Deprecated Prescription" | Used only by a deprecated code. Not in scope for this IG. |
| 3.1 Medication prescription | LP97830-1 "Prescription for medication" | 57833-6 "Prescription for medication" | Not in scope for this IG. |
| 4. Dispensation | None | | Gap to be raised with LOINC. Not in scope for this IG. |
| 4.1 Medication dispensation | LP72929-0 "Medication dispensed" | 29304-3 "Medication dispensed" | **Potential issue:** LP72929-0 is the COMPONENT only of 29304-3 and 29550-1 "Medication dispensed Narrative", which are not document codes. The document code used for dispensations, 60593-1 "Medication dispensed.extended Document", has a different COMPONENT: LP101601-5 "Medication dispensed.extended". The category is therefore not linked through LOINC to the document type it groups. LP101601-5 could be used instead. Not in scope for this IG. |
| 5. Summary | LP182278-4 "Summary" | None | **Potential issue:** LP182278-4 is not the COMPONENT of any LOINC code. LP73428-2 "Summary note" is the COMPONENT of several summary note codes, for example 61143-4 "Nurse Summary Note", and could be used instead (to be checked). |
| 5.1 Patient summary | LP101599-1 "Patient summary" | 60591-5 "Patient summary Document" | |
| 5.2 Immunization summary | LP220292-9 "Immunization summary report" | 82593-5 "Immunization summary report" | |
| 6. Plan | LP175754-3 "Plan" | None | **Potential issue:** LP175754-3 is not the COMPONENT of any LOINC code. LP181119-1 "Action plan" is a Document.Kind part. Gap to be raised with LOINC. |
| 6.1 Care plan | LP116196-9 "Care plan" | None | **Potential issue:** LP116196-9 is not the COMPONENT of any LOINC code. LP157909-5 "Plan of care note" is the COMPONENT of 18776-5 "Plan of care note" and of many other plan of care note codes, and could be used instead. |
| 7. Administrative note | LP73899-4 "Administrative note" | 51851-4 "Administrative note" | |
| 7.1 Consent | LP100037-3 "Consent" | 59284-0 "Consent Document" | |
| 7.2 Letter | LP74130-3 "Letter" | 101894-4 "Cardiology Letter" | Whether letters and certificates should be separate categories is to be discussed. |
| 7.3 Certificate | LP149091-3 "Certificate" | 80571-3 "Certificate" | Whether letters and certificates should be separate categories is to be discussed. |
