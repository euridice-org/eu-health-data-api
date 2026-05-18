### Overview

A wellness or personal health application accesses patient data using the same API transactions defined in this IG.

### Scope

This IG specifies the API transactions a wellness app uses to retrieve data. The following are out of scope: patient authentication, SMART App Launch mechanics, EU wallet integration, and patient data submission (Article 5 write). These are access service and Member State infrastructure concerns ([Arts. 4, 47–48](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32025R0327)).

### Participants

- **Wellness application** — [Document Consumer](actors.html#document-consumer) and/or [Resource Consumer](actors.html#resource-consumer)
- **EHR system** — [Document Access Provider](actors.html#document-access-provider) and/or [Resource Access Provider](actors.html#resource-access-provider)
- **Access service (EHDAS)** — authenticates the patient and establishes authorization context; not specified here

### Workflow

1. Patient authenticates to the national access service
2. Access service establishes an authorization context for the wellness app
3. App queries the EHR: [patient lookup](patient-match.html), [documents](document-exchange.html), [resources](resource-access.html)
4. EHR responds to the authorized request

The patient-context authentication chain originates at the access service. The EHR sees an authorized request; how that authorization was established is not specified by this IG.
