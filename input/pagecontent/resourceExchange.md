Resource publication means submitting individual clinical FHIR resources to another system for incorporation into its data. It differs from [document publication](document-exchange.html#document-publication), where a Document Publisher submits a document using ITI-105.

### Current Scope

This version of the IG specifies resource search and read access, not a resource-publication interface. A Resource Access Provider is assumed to have access to the resources it serves. It may obtain them by:

1. Creating resources from user-entered data
2. Querying another Resource Access Provider as a Resource Consumer
3. Extracting resources from documents received as a Document Access Provider
4. Receiving data through another exchange method and translating it to FHIR resources

These approaches do not require a separate resource-publication transaction in this IG.

### Considerations for Resource Publication

Accepting resources for incorporation may require more than a FHIR create or update interaction:

- **References:** Referenced resources must be available or resolved, and source identifiers may need to be mapped to local identifiers.
- **Workflow:** The recipient must know how to handle the submitted resource. The required behavior varies by resource type and use case.
- **Reconciliation:** The recipient may need to validate and reconcile incoming data with existing records, potentially including clinical review.

Use-case-specific guides, such as [IHE MPD](https://profiles.ihe.net/PHARM/MPD/index.html) for medication workflows, address these concerns for particular resource sets.

### Possible Future Approaches

- **Resource publication:** Use-case-specific implementation guides could define how resources are submitted and incorporated.
- **FHIR Subscriptions:** A provider can notify a consumer that data has changed, after which the consumer retrieves the data using search or read interactions. The [Subscriptions R5 Backport](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/) supports topic-based subscriptions on FHIR R4. Notification followed by retrieval is distinct from submitting resources for incorporation; it does not by itself define a resource-publication interface.

These are informative directions for future work, not additional conformance requirements in this version.
