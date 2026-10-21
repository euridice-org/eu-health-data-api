The actor model defined here is an orchestration of existing IHE actors and specifications, combined together into high-level composite actors. Actors and transactions are inherited from dependent IHE profiles, and those actors are stacked, constrained and potentially modified.

This is similar to the approach taken in the MHDS specification, but with a more narrow subset of specifications fit to the European situation.

### Relevant Specifications:

- Authorization
  - <span class="auth-change">[HL7 SMART App Launch 2.2](https://hl7.org/fhir/smart-app-launch/STU2.2/) - Defines Standalone, Launch and Backend Services authorization for FHIR. Whether SMART App Launch is required depends on the environment and use case.</span>
  - <span class="auth-change">[IHE IUA](https://profiles.ihe.net/ITI/IUA/index.html) - Defines authorization and access control actors and mechanisms. Wether IUA is required depends on the environment and use case.</span>
- Patient Identity Matching
  - [IHE PDQm](https://profiles.ihe.net/ITI/PDQm/index.html) - Defines how a client can perform patient lookup given demographics against a server.
- Document Exchange
  - [IHE MHD](https://profiles.ihe.net/ITI/MHD/) - Defines exchange of Documents, which we use to exchange FHIR document content.
- Resource Exchange
  - [HL7 International Patient Access (IPA)](https://hl7.org/fhir/uv/ipa/) - Defines how an application can access FHIR information using SMART authorization and resource access. IPA is the primary reference for resource access patterns.
- Foundational
  - [IHE Consistent Time](https://profiles.ihe.net/ITI/TF/Volume1/ch-7.html) - Defines the use of Network Time Protocol (NTP) to provide consistent time across systems.
  - [IHE ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) - Referenced for secure transport requirements (TLS 1.2 Floor using BCP195 Option).

<div class="auth-change" markdown="1">

### Authentication And Authorization Groupings

The generic roles are [EU Authorization Client](ActorDefinition-eu-authorization-client-eu-api.html),
[Authentication Service](ActorDefinition-authentication-service-eu-api.html),
[EU Authorization Server](ActorDefinition-eu-authorization-server-eu-api.html), and
[EU Authorization Resource Server](ActorDefinition-eu-authorization-resource-server-eu-api.html).
The EU prefix identifies roles in this IG, not centrally operated EU services.

The Authentication Service authenticates end users, directly or using a Wallet or upstream
identity provider. The Authorization Server relies on an acceptable authentication result where
required, applies authorization policy, and issues API access tokens. The Resource Server validates
or introspects those tokens and enforces granted authorization and local policy.

**Optional grouping:** an Authentication Service MAY be grouped with an EU Authorization Server in
one implementation. Separate implementations require deployment-defined trust and an authentication
interface; this IG does not define an interoperable transaction between them. Grouping does not
require an OIDC ID token or app-mediated token exchange. These are logical roles, not a required
number of physical servers.

Independently, an Authorization Server MAY be co-located with a Resource Server. Neither grouping
is required of a Document Access Provider or Resource Access Provider. The Authentication Service
is IG-defined, not an additional formal IUA or SMART actor; the selected protocol's Authorization
Server retains its conformance obligations. Pre-authorized Backend Services does not require
runtime end-user authentication. See [Authentication and API authorization](authorization.html#authentication-and-api-authorization)
for the flow and trust boundaries.

</div>

### Document Exchange

Document exchange is defined with 3 actors:

<div style="text-align: center;">
{% include img.html img="docExchange_1.drawio.svg" caption="Document Exchange Actors" %}
</div>

1. **Document Publisher (client)** <a name="document-publisher"></a>- Produces EEHRxF FHIR Documents, publishes those documents to a Document Access Provider. Can be grouped with Access Provider, in which case the publishing transactions are internalized.
2. **Document Access Provider (server)**<a name="document-access-provider"></a> - Provides access to EEHRxF FHIR Documents by offering query APIs to Document Consumers. See **Document Submission Option** below for systems that accept document publication from external producers.
3. **Document Consumer (client)**<a name="document-consumer"></a> - Consumes EEHRxF FHIR documents by querying a Document Access Provider.

<div class="auth-change" markdown="1">

These composite actors inherit existing actors from the selected IUA or SMART authorization
profile and from the PDQm and MHD specifications:

</div>

<div style="text-align: center;">
{% include img.html img="docExchange_2.svg" caption="Document Exchange - Actor Groupings" %}
</div>

<span class="auth-change">The diagram shows logical roles for one exchange, not a universal shared
Authorization Server. User authentication may be supplied by a separate Authentication Service or
the optional grouping described above.</span>

**Document Publisher**

- <span class="auth-change">The selected [IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.html), [SMART App](ActorDefinition-smart-app-eu-api.html), or [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.html); see [Authorization](authorization.html#environment-specific-requirements).</span>
- [PDQm Patient Demographics Consumer](https://profiles.ihe.net/ITI/PDQm/volume-1.html) ([CapabilityStatement](https://profiles.ihe.net/ITI/PDQm/CapabilityStatement-IHE.PDQm.PatientDemographicsConsumerQuery.html))
- [MHD Document Source](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html) with [Simplified Publish Option](https://profiles.ihe.net/ITI/MHD/1332_actor_options.html#13324-simplified-publish-option) ([CapabilityStatement](https://profiles.ihe.net/ITI/MHD/CapabilityStatement-IHE.MHD.DocumentSource.html))

**Document Access Provider**

- <span class="auth-change">The selected [IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.html) or [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.html); see [Authorization](authorization.html#environment-specific-requirements).</span>
- <span class="auth-change">An IUA or SMART Authorization Server is an independent actor. It MAY be co-located with the provider, but is not a required provider grouping.</span>
- [PDQm Patient Demographics Supplier](https://profiles.ihe.net/ITI/PDQm/volume-1.html) ([CapabilityStatement](https://profiles.ihe.net/ITI/PDQm/CapabilityStatement-IHE.PDQm.PatientDemographicsSupplier.html))
- [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html) ([CapabilityStatement](https://profiles.ihe.net/ITI/MHD/CapabilityStatement-IHE.MHD.DocumentResponder.html))

<a name="document-submission-option"></a>
**Document Submission Option** (when accepting external publication):
- [MHD Document Recipient](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html) with [Simplified Publish Option](https://profiles.ihe.net/ITI/MHD/1332_actor_options.html#13324-simplified-publish-option) ([CapabilityStatement](https://profiles.ihe.net/ITI/MHD/CapabilityStatement-IHE.MHD.DocumentRecipient.html))

**Document Consumer**

- <span class="auth-change">The selected [IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.html), [SMART App](ActorDefinition-smart-app-eu-api.html), or [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.html); see [Authorization](authorization.html#environment-specific-requirements).</span>
- [PDQm Patient Demographics Consumer](https://profiles.ihe.net/ITI/PDQm/volume-1.html) ([CapabilityStatement](https://profiles.ihe.net/ITI/PDQm/CapabilityStatement-IHE.PDQm.PatientDemographicsConsumerQuery.html))
- [MHD Document Consumer](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html) ([CapabilityStatement](https://profiles.ihe.net/ITI/MHD/CapabilityStatement-IHE.MHD.DocumentConsumer.html))

This leads to the following required transactions between these actors:

```mermaid
sequenceDiagram
    participant Publisher as Document Publisher
  participant Authorization as Authorization Server
    participant Provider as Document Access Provider
    participant Consumer as Document Consumer

  Publisher->>Authorization: Get Access Token (selected IUA or SMART flow)
  Authorization-->>Publisher: access_token
    Publisher->>Provider: Patient Lookup (PDQm ITI-78)
    Provider-->>Publisher: Patient Bundle
    Publisher->>Provider: Simplified Publish (MHD ITI-105)
    Provider-->>Publisher: Response

    Consumer->>Authorization: Get Access Token (selected IUA or SMART flow)
    Authorization-->>Consumer: access_token
    Consumer->>Provider: Patient Lookup (PDQm ITI-78)
    Provider-->>Consumer: Patient Bundle
    Consumer->>Provider: Find Document References (MHD ITI-67)
    Provider-->>Consumer: DocumentReference Bundle
    Consumer->>Provider: Retrieve Document (MHD ITI-68)
    Provider-->>Consumer: Document Content
```

  {% include figure-caption.html
     caption="Document publication and consumption transactions" %}

See the following functional pages for detailed transaction information:
- [Authorization](authorization.html) - Authentication and authorization flows
- [Patient Lookup](patient-match.html) - Patient identification transactions
- [Document Exchange](document-exchange.html) - Document query and retrieval transactions

This can be combined with content profiles defined by each EHDS Priority Category, for those categories that are primarily represented as a FHIR Document. For example, a system can be a **Lab Result Document Publisher**, a **Patient Summary Document Consumer**, or a **Imaging Manifest Document Access Provider**. 


### Resource Exchange

It is also useful in many cases to transact with individual FHIR resources. For this purpose, two resource-based actors are defined:

<div style="text-align: center;">
{% include img.html img="resExchange_1.drawio.svg" caption="Resource Exchange Actors" %}
</div>


<a name="resource-access-provider"></a>
4. **Resource Access Provider (server)** - A FHIR server providing access to FHIR resources by hosting search + read query API's.

<a name="resource-consumer"></a>
5. **Resource Consumer (client)** - A FHIR client that consumes external FHIR resources by querying a Resource Access Provider.

<details>
<summary><i>Note: What about Resource Producer? Click for more</i></summary>

Resource exchange is more complex than document publication, and in many cases has resource and use-case specific considerations. Within the scope of this version of the IG, we assume a precondition that the Resource Access Provider has access to resources and focus on defining how the Resource Access Provider enables a consumer to search and read those resources. For more details and possible approaches, see the <a href="resourceExchange.html">Resource Exchange</a> page.

</details>



<div class="auth-change" markdown="1">

These composite actors inherit existing actors from the selected IUA or SMART authorization
profile, PDQm, and [International Patient Access (IPA)](https://hl7.org/fhir/uv/ipa/)
specifications (with QEDm alignment where compatible):

</div>

<div style="text-align: center;">
{% include img.html img="resExchange_2.svg" caption="Resource Access - Actor Groupings" %}
</div>

<span class="auth-change">The Authorization Server is independent of the provider grouping.
Authentication Service grouping and Authorization Server / Resource Server co-location are
separate optional deployment choices.</span>

**Resource Access Provider**

- <span class="auth-change">The selected [IUA Resource Server](ActorDefinition-iua-resource-server-eu-api.html) or [SMART FHIR Resource Server](ActorDefinition-smart-fhir-resource-server-eu-api.html); see [Authorization](authorization.html#environment-specific-requirements).</span>
- <span class="auth-change">An IUA or SMART Authorization Server is an independent actor. It MAY be co-located with the provider, but is not a required provider grouping.</span>
- [PDQm Patient Demographics Supplier](https://profiles.ihe.net/ITI/PDQm/volume-1.html) ([CapabilityStatement](https://profiles.ihe.net/ITI/PDQm/CapabilityStatement-IHE.PDQm.PatientDemographicsSupplier.html))
- Resource Access
  - [HL7 International Patient Access Server](https://hl7.org/fhir/uv/ipa/) ([CapabilityStatement](https://hl7.org/fhir/uv/ipa/CapabilityStatement-ipa-server.html))

**Resource Consumer**

- <span class="auth-change">The selected [IUA Authorization Client](ActorDefinition-iua-authorization-client-eu-api.html), [SMART App](ActorDefinition-smart-app-eu-api.html), or [SMART Backend Service](ActorDefinition-smart-backend-service-eu-api.html); see [Authorization](authorization.html#environment-specific-requirements).</span>
- [PDQm Patient Demographics Consumer](https://profiles.ihe.net/ITI/PDQm/volume-1.html) ([CapabilityStatement](https://profiles.ihe.net/ITI/PDQm/CapabilityStatement-IHE.PDQm.PatientDemographicsConsumerQuery.html))
- Resource Access
  - [HL7 International Patient Access Client](https://hl7.org/fhir/uv/ipa/) ([CapabilityStatement](https://hl7.org/fhir/uv/ipa/CapabilityStatement-ipa-client.html))

This leads to the following required transactions between these actors:

```mermaid
sequenceDiagram
    participant Provider as Resource Access Provider
  participant Authorization as Authorization Server
    participant Consumer as Resource Consumer

  Consumer->>Authorization: Get Access Token (selected IUA or SMART flow)
  Authorization-->>Consumer: access_token
    Consumer->>Provider: Patient Lookup (PDQm ITI-78)
    Provider-->>Consumer: Patient Bundle
    Consumer->>Provider: Resource Query (IPA)
    Provider-->>Consumer: Resource Bundle
```

  {% include figure-caption.html caption="Resource access transactions" %}

> <span class="auth-change">**Note:** The Authorization Server is a separate protocol participant. It MAY be co-located with
> a provider as a deployment choice, but co-location does not merge its responsibilities with the
> Resource Server. See [Authorization Server Deployment](authorization.html#authorization-server-deployment).</span>



### Example Groupings


<div style="text-align: center;">
{% include img.html img="ExGroup_Doc.drawio.svg" caption="Example Grouping - Document" %}
</div>

<div style="text-align: center;">
{% include img.html img="ExGroup_Group.drawio.svg" caption="Example Grouping - Group" %}
</div>

<div style="text-align: center;">
{% include img.html img="ExGroup_DocAssembly.drawio.svg" caption="Example Grouping - Document Assembly from Distributed Resources" %}
</div>

