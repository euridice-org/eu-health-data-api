Resource exchange between a Resource Producer and a Resource Access Provider is more complex than document publishing.

Resources are not self-contained like documents. They are atomic pieces of data with cross-references to other resources. A naive POST of a resource to a FHIR server is often not sufficient and additional steps are required (for example, resolving the Medication being prescribed before submitting a MedicationRequest).

Semantics also vary by resource type and workflow. Exchange patterns are often different per resource. For examples of this complexity, see [IHE MPD](https://profiles.ihe.net/PHARM/MPD/index.html) for a prescription workflow.

### Challenges with Resource PUSH

- **Resolving References** - How to handle pointers that are not contained within the payload
- **Unsolicited Data** - For a server to accept an unsolicited PUSH resource from an external source, it needs to expect this data
- **Reconciliation** - The receiving server needs validation rules to avoid accepting invalid or incomplete data, potentially including user review before allowing it into the patient chart

### Use Case Driven Approach

For now, support for Resource PUSH is explicitly optional for EHRs.

ERHs that need to comply with EHDS requirements for patient-generated data from medical devices, for patient corrections, or for other requirements for patients adding data into their health records SHOULD adopt the SMART App Launch specification to fulfill these requirements.

The community foresees that some of these requirements will be addressed either in a future version of this specification or in other use-case specific implementation guides.

The following patterns could address these needs in future versions:

- **CGM Remote Monitoring** - Specified in a [use-case specific implementation guide](https://hl7.org/fhir/uv/cgm/) 
- **FHIR Subscriptions / Notified-Pull** - Used in the Netherlands; shares the same query interaction pattern
- **Use-Case Specific IGs** - Like IHE MPD, developed for specific resource sets

Other ideas for potential approaches are welcome.
