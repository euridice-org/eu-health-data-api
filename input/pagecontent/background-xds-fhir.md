### Overview

EHR systems across the EU manage health documents in different ways. Some expose their clinical data as FHIR resources and build a document from those resources on demand when a consumer asks for it. Others keep persistent documents, authored snapshots held in document sharing infrastructure such as an XDS/XCA registry and repository. This IG defines one API surface (ITI-67 and ITI-68) that either approach can use.

This page separates two questions:

- **Document model.** Is a document built on demand when it is retrieved, or is it a persistent document that was authored and stored?
- **Architecture.** What answers the API: an EHR's FHIR server, or document sharing infrastructure (existing XDS/XCA behind an MHD bridge, or FHIR-native)?

Any of these can be deployed directly, behind a facade, or as part of a national infrastructure; see [Member State Architectures](member-state-architectures.html). See [Document Exchange](document-exchange.html) for transaction details.

---

### Document Model: On-Demand or Persistent

**On-demand document.** Built at retrieval time from the system's current data, for example by the IPS [`$summary` operation](priority-area-eps.html#on-demand-patient-summary-assembly). The document does not need to be kept between retrievals, and two retrievals can differ as records change.

**Persistent document.** Assembled at a point in time and stored as a persistent document. It is a snapshot and does not nescesarily automatically change when the underlying record does. Where the use case needs it, a persistent document can be signed or attested by the authoring clinician or organization, for example a discharge report or a laboratory report.

FHIR servers tend toward on-demand documents, but could also store persistent documents. XDS-based document sharing systems typically hold persistent documents but can also build documents on demand as well. 

A consumer does not have to know in advance which kind it is getting. MHD marks an on-demand document by omitting `attachment.hash` and `attachment.size`; a persistent document carries both. See [On-Demand Documents](document-exchange.html#on-demand-documents) for the details.

---

### Architectures

**EHR FHIR server.** The EHR exposes its clinical data as FHIR resources (Observation, Condition, MedicationStatement, Encounter, etc.) that reflect the current state of its record at the time they are retrieved. Documents are typically built on demand from these resources. The same resources can also be served directly through [Resource Access](resource-access.html). Documents and resources are complementary views of the same underlying data; see [Resource Content](resource-access.html#resource-content) for how they relate.

**Document sharing infrastructure.** Many existing interoperability networks already share documents this way: a document registry indexes the documents and one or more document repositories hold them, usually built on IHE XDS, with XCA linking communities. These systems hold persistent documents, receive them from publishers, and serve them to consumers. [IHE MHD](https://profiles.ihe.net/ITI/MHD/) lets them offer the same functions through a FHIR API, so FHIR consumers can reach their documents through this IG's transactions:

- **XDS/XCA behind an MHD bridge.** An MHD layer translates the FHIR transactions into the existing ones: ITI-67 and ITI-68 into XDS Registry Stored Query and Retrieve Document Set (ITI-18, ITI-43) or XCA Cross Gateway Query and Retrieve (ITI-38, ITI-39), and publication into XDS Provide and Register (ITI-41), as MHD's "XDS on FHIR" Option defines. MHD calls this layer a proxy. MHD also defines the mappings between FHIR `DocumentReference` and XDS `DocumentEntry` metadata. XDS-backed systems that need richer XDS/XCA metadata should also use the metadata capabilities and mappings defined by MHD; this IG does not scope full XDS metadata conformance.
- **FHIR Document Store.** The registry and repository are FHIR servers that store `DocumentReference` resources and their content (Binary or Bundle) directly, as in IHE [MHDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-50.html). Publishers submit via ITI-105 (Simplified Publish) or ITI-65 (Provide Document Bundle).

**Variant: Document Storage Separated from the Document Registry.** Document sharing infrastructure may hold only `DocumentReference` metadata, with `attachment.url` pointing to documents hosted elsewhere (for example, at source systems). Consumers follow that URL at ITI-68.

Both architectures return base FHIR DocumentReference resources through ITI-67, and each declares DocumentReference search support and the required search parameters in its CapabilityStatement. Document sharing infrastructure can also serve clinical resources, for example extracted from the documents it holds (see [Derived Resources](resource-access.html#derived-resources)).

---

### The Shared API Contract

Whatever the architecture or document model, the document exchange transactions (ITI-67 and ITI-68) work the same way and return base FHIR DocumentReference resources. A consumer does not need to know what sits behind the API; one client works against all of them.
