This page presents an example showing a complete workflow for accessing a Patient Summary document for a known patient.

### Scenario

A patient visits a care provider, but his data is in another system. The current care provider is a **Document Consumer**, and the system with his data is a **Document Access Provider**. The **Document Consumer** uses the EU Health API to access the patient summary stored at the **Document Access Provider**.

### Actors



- **[Document Consumer](actors.html#document-consumer)** - The healthcare provider's system acting as the [Health Data API Authorization Client](ActorDefinition-eu-authorization-client-eu-api.html), realized as either a [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.html) or an [IHE IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.html), according to the selected deployment flow
- **[Document Access Provider](actors.html#document-access-provider)** - The system holding the patient's health data and acting as the [Health Data API Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.html), realized as either a [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.html) or an [IHE IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.html)
- **[Health Data API Authorization Server](ActorDefinition-eu-authorization-server-eu-api.html)** - The distinct participant that issues the token, realized as either a [SMART Authorization Server](ActorDefinition-smart-authorization-server-eu-api.html) or an [IHE IUA Authorization Server](ActorDefinition-iua-authorization-server-eu-api.html); optional co-location is a deployment choice.



### Prerequisites

- Document Consumer has registered with Document Access Provider and obtained authorization credentials
- For each protected endpoint, select one applicable profile according to the environment-specific requirements in [Authorization](authorization.html#environment-specific-requirements); this example does not define dual conformance. The detailed token-request sequence below illustrates [SMART Backend Services](https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html) for pre-authorized access using asymmetric confidential-client authentication, with no runtime end-user authorization. An IUA deployment uses the applicable IUA actors and flow described in [Authorization](authorization.html#national-interoperability-infrastructure).
- Patient has a known identifier in the Document Access Provider system
- Document Access Provider supports European Patient Summary priority category

### Sequence Diagram

{% include img.html svg="patient-summary-auth-sequence.svg"
  caption="<a href='https://hl7.org/fhir/smart-app-launch/STU2.2/backend-services.html'>SMART Backend Services</a> or <a href='https://profiles.ihe.net/ITI/IUA/index.html'>IHE IUA</a> authorization sequence" %}



*Note: The Authorization Server is a separate participant and MAY be co-located with the Document Access Provider as an optional deployment choice. The diagram shows alternative SMART Backend Services and IHE IUA authorization branches; select one profile for the protected endpoint. The token-request details below illustrate only the SMART Backend Services branch. For IUA, use the [IHE IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.html), [IHE IUA Authorization Server](ActorDefinition-iua-authorization-server-eu-api.html), and [IHE IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.html) flow described in [Authorization](authorization.html#national-interoperability-infrastructure).*



### Step-by-Step Flow

#### Step 1: Discover Capabilities

Document Consumer inspects the Document Access Provider's capabilities via [Capability Discovery](capability-discovery.html).

```
GET https://provider.example.org/fhir/metadata
```

The CapabilityStatement confirms support for IHE MHD document exchange, PDQm patient search, and European Patient Summary priority category.

#### Step 2: Obtain Access Token



This token-request example uses SMART Backend Services: the Document Consumer's Health Data API Authorization Client role is realized by the SMART Backend Service. Its pre-authorization and client-authentication prerequisites are listed above; the Health Data API Authorization Server and Health Data API Resource Server roles remain distinct. An IUA deployment instead uses its selected IUA actors and flow as described in [Authorization](authorization.html#national-interoperability-infrastructure).



```
POST https://provider.example.org/auth/token
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials
&scope=system/Patient.rs system/DocumentReference.rs system/Bundle.r
&client_assertion_type=urn:ietf:params:oauth:client-assertion-type:jwt-bearer
&client_assertion=[signed JWT]
```

#### Step 3: Identify the Patient

Document Consumer searches for the patient using a known identifier ([Patient Lookup](patient-match.html)).

```
GET https://provider.example.org/fhir/Patient?identifier=urn:oid:2.16.840.1.113883.2.4.6.3|123456789
Authorization: Bearer [access_token]
```

Response includes the Patient resource with `id=patient-123`.

#### Step 4: Search for Patient Summary Document

Document Consumer queries for Patient Summary documents using **IHE MHD ITI-67** (Find Document References) transaction ([Document Exchange](document-exchange.html)).

```
GET https://provider.example.org/fhir/DocumentReference?patient=patient-123&type=http://loinc.org|60591-5
Authorization: Bearer [access_token]
```

The response Bundle contains base FHIR DocumentReference resources for available Patient Summaries. The Provider SHOULD return the metadata it has; the fields shown below are illustrative, not a required return profile.

```json
{
  "resourceType": "DocumentReference",
  "id": "docref-eps-123",
  "status": "current",
  "type": {
    "coding": [{
      "system": "http://loinc.org",
      "code": "60591-5",
      "display": "Patient summary Document"
    }]
  },
  "category": [{
    "coding": [{
      "system": "urn:oid:1.3.6.1.4.1.19376.1.2.6.1",
      "code": "SUMMARIES",
      "display": "Summaries"
    }]
  }],
  "subject": {
    "reference": "Patient/patient-123"
  },
  "date": "2024-03-15T10:30:00Z",
  "content": [{
    "attachment": {
      "contentType": "application/fhir+json",
      "url": "Bundle/ips-bundle-456"
    },
    "format": {
      "system": "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode",
      "code": "urn:ihe:pcc:ips:2020",
      "display": "International Patient Summary"
    }
  }]
}
```

#### Step 5: Retrieve Document Content

Document Consumer retrieves the document content using **IHE MHD ITI-68** (Retrieve Document) transaction. The URL is taken from `DocumentReference.content.attachment.url`.

```
GET https://provider.example.org/fhir/Bundle/ips-bundle-456
Authorization: Bearer [access_token]
```

Response is the Patient Summary as a FHIR Document (Bundle of type `document`) in JSON format.

> **Note:** Patient Summary (IPS) is a FHIR Document, so it is retrieved as a Bundle resource, not a Binary. See [Document Exchange - Document Content](document-exchange.html#document-content) for details.

### Key Points

- The authorization flow and its prerequisites are selected as described in [Authorization](authorization.html)
- Patient identification precedes health data queries
- DocumentReference contains metadata about documents
- FHIR Documents (IPS, etc.) are retrieved as Bundle resources; DICOM KOS imaging manifests ([IHE MADO](priority-area-imaging-manifest.html#ihe-mado)) are retrieved as Binary resources
- All transactions use standard FHIR RESTful interactions

### Variations

- If patient identifier is not known, use [Patient $match operation](patient-match.html)
- If Document Access Provider supports [Resource Access](resource-access.html), Consumer could query for individual resources instead of documents
- Multiple documents may be returned if patient has been seen multiple times
