### Overview

Cross-border exchange routes through National Contact Points (NCPeHs) over the MyHealth@EU infrastructure ([Art. 23(2)](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202500327#art_23)). When a patient from Country A receives care in Country B, Country B's NCPeH requests the patient's data from Country A's NCPeH, which then queries national infrastructure to retrieve it.

This IG defines the API at the **final step** — how national infrastructure (or the NCPeH itself) queries EHR systems for the patient's data.

### Scope

NCPeH-to-NCPeH exchange over MyHealth@EU is governed by the [NCPeH API specification](https://build-fhir.ehdsi.eu/ncp-api/), not by this IG. National infrastructure design — how a Member State routes an NCPeH query to the holding EHR systems — is a Member State choice (see [Cross-Organization via National Infrastructure](usecase-cross-org.html)).

### Participants

- **NCPeH or national infrastructure** — acts as [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer) of the EHR API
- **EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider); the conformance target of this IG

### Architecture

```
Country B facility → NCPeH-B → MyHealth@EU → NCPeH-A → National infrastructure → EHR System API
                       └──── NCPeH API ────┘        └──── MS choice ────┘     └── This IG ──┘
```

All layers exchange EEHRxF-formatted data.

### Authorization

Cross-border patient consent, health-professional authentication in the requesting country, and authorization at the NCPeH and national-infrastructure layers are governed by MyHealth@EU and Member State infrastructure — not by this IG. At the EHR API surface, the consumer is an authorized national-infrastructure component; how that authorization was established is out of scope here.
