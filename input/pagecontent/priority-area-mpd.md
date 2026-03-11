{% include variable-definitions.md %}
This section defines the API consideration for ePrescription and eDispensation exchange.

The content is defined by the {{hl7EuMpd}} profile.

### Resource Access (this IG)

Reading medication data as individual resources — MedicationRequest, MedicationDispense, MedicationStatement — is [resource access](resource-access.html), handled by this IG. This covers queries like "what medications is this patient taking?"

### ePrescription/eDispensation Workflow (out of scope)

The ePrescription and eDispensation workflow transactions (prescribing, dispensing) are out of scope for this IG. These are coordinated multi-step transactions defined by {{iheMPD}}.

