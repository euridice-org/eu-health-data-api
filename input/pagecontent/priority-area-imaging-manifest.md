{% include variable-definitions.md %}
This section defines the API requirements for EHR systems that provide imaging study manifests (references to DICOM imaging studies).

For detailed content profiles, see the [EU Imaging Study Manifest IG](https://hl7.eu/fhir/imaging-manifest-r5/).

### Actors

Imaging Manifests can be accessed via document exchange.

| Actor | Description | CapabilityStatement |
|-------|-------------|---------------------|
| Document Consumer | Retrieves imaging manifests | [EEHRxF Document Consumer](CapabilityStatement-EEHRxF-DocumentConsumer.html) |
| Document Access Provider | Serves imaging manifests | [EEHRxF Document Responder](CapabilityStatement-EEHRxF-DocumentAccessProvider.html) |

### Document Exchange

For document-based access, use the [Document Exchange](document-exchange.html) transactions.

The Imaging Manifest is differentiated via the following DocumentReference fields:
- **type**: `18748-4` (Diagnostic imaging Study) — the LOINC code used for document search
- **category**: Unconstrained by this IG. `Medical-Imaging` ([EHDS Priority Category](CodeSystem-eehrxf-document-priority-category-cs.html)) is an informative classification; see [Document Search Strategy](document-exchange.html#document-search-strategy).

### Dual-DocumentReference Pattern (MADO)

The [EURIDICE MADO profile](https://hl7.eu/fhir/imaging-manifest-r5/) defines both a FHIR encoding and a DICOM KOS encoding for imaging manifests. When a system supports both representations, it publishes **two DocumentReference resources** linked via `relatesTo`:

| DocumentReference | `contentType` | `type` (LOINC) | Content |
|---|---|---|---|
| FHIR Manifest | `application/fhir+json` | 18748-4 | FHIR ImagingStudy manifest |
| DICOM KOS | `application/dicom` | 18748-4 | DICOM Key Object Selection |
{: .grid}

The two DocumentReferences are linked using `relatesTo.code` = **`transforms`** — each is a different technical representation of the same imaging study manifest. Document Consumers query by `type` and select the representation they can consume based on `contentType`.

This pattern was chosen ([#50](https://github.com/euridice-org/eu-health-data-api/issues/50)) because it works across all Document Sharing transports (MHD, XDS, XCA) without requiring content negotiation at the server.

<div markdown="1" class="stu-note">

**Feedback requested on the dual-DocumentReference pattern.** The [MADO profile](https://euridice.org/mado/) dual-encodes imaging manifests in both FHIR and DICOM representations. This IG uses two DocumentReferences linked via `relatesTo.transforms` so that consumers can select the encoding they support based on `contentType`. This pattern was chosen for compatibility with document sharing infrastructures (MHD, XDS, XCA), where each document entry carries exactly one format.

An alternative approach — a single DocumentReference with multiple `content` entries — has been discussed in the working group.

Implementers: does the dual-DocumentReference pattern work for your imaging infrastructure and content negotiation needs? Would a single-DocumentReference model be preferable? Feedback is welcome via [Issue #50](https://github.com/euridice-org/eu-health-data-api/issues/50).

</div>

See [Example: Imaging Study Manifest — FHIR](DocumentReference-ExampleDocumentReferenceImagingManifestFHIR.html) and [Example: Imaging Study Manifest — DICOM KOS](DocumentReference-ExampleDocumentReferenceImagingManifestKOS.html) for instances showing the dual pattern.

### Example Queries

Search for all imaging manifests (both representations):
```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|18748-4&status=current
```

Search for imaging reports:
```
GET [base]/DocumentReference?patient.identifier=http://example.org/national-id|123456789&type=http://loinc.org|85430-7&status=current
```

> **Note:** Both imaging reports and imaging manifests use the `Medical-Imaging` priority category. Use `type` to distinguish them: `85430-7` for reports, `18748-4` for manifests.

### IHE MADO

DICOM image access is in scope for EHDS and is covered by the EURIDICE MADO profile. The imaging manifest (discovered via MHD) describes which studies and series are available; the actual image retrieval uses IHE RAD transactions (WADO-RS, etc.) defined within MADO and outside the scope of this IG.
