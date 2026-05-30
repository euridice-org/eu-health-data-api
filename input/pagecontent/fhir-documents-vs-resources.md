This Implementation Guide supports two primary patterns for exchanging health data: FHIR Documents and individual FHIR Resources.

### FHIR Documents

FHIR Documents are clinical-report representations of a patient's health information at a defined moment, expressed as FHIR Bundles with `type="document"` containing a Composition resource that provides structure and rendering information. Documents may be **persisted** — stored as authored and later retrieved — or **assembled on demand** from operational data; both are first-class patterns in this IG.

Servers that assemble documents on demand are not required to version, history, or persist past renderings. Per [MHD ITI-67](https://profiles.ihe.net/ITI/MHD/ITI-67.html), an on-demand DocumentReference is identified by the absence of both `content.attachment.hash` and `content.attachment.size`. The `content.attachment.url` may resolve to any endpoint that produces a valid Document Bundle, including operation invocations such as `Patient/[id]/$summary`.

Documents are self-contained and can be signed and attested by healthcare providers, making them suitable for clinical reports such as patient summaries, discharge reports, and laboratory reports.


### FHIR Resources

Individual FHIR Resources represent discrete pieces of health information (observations, conditions, medications, etc.) that can be queried and accessed independently. Resources provide granular, queryable access to health data and support real-time clinical decision support workflows.


### Relationship

Resources can be extracted from documents, and documents can be generated from resources. This IG supports both patterns to accommodate different implementation architectures and use cases.

### Exchange Patterns

The choice of exchange pattern follows from the priority category:

- **[Document exchange](document-exchange.html)** for priority categories structured as FHIR Documents (Patient Summary, Discharge Report, Laboratory Report, Imaging).
- **[Resource access](resource-access.html)** for individual clinical resources under scoped conformance (allergies, conditions, immunizations, medications, observations).

See [Priority Categories](priority-categories.html) for the full mapping.

