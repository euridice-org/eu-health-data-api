This ValueSet lists example LOINC document type codes for the Patient Summary category. The list is illustrative, not exhaustive — content IGs are the authoritative source. This ValueSet is intended for informational purposes to guide implementers on which specific document types are relevant for the Patient Summary category, and it may evolve over time as clinical practice changes and new document types become relevant for cross-border exchange.

This ValueSet is identified using `useContext` with the code `focus` and the EHDS priority category code `34133-9` (LOINC Document Class) used on `DocumentReference.category`. This allows implementers to easily identify which specific document types are relevant for the Patient Summary priority category when querying for documents in that category.

When querying for the Patient Summary category, the document type codes in this ValueSet are used with the search parameter `type`.

<div markdown="1" class="stu-note">

**This Value Set is Informative.** The codes defined here are the known document type codes for the Patient Summary category. This ValueSet is expected to evolve over time as clinical practice changes and new document types become relevant for cross-border exchange. Implementers should refer to the content profile for the Patient Summary priority category for the specific data elements and structures that need to be supported for this category.

</div>
