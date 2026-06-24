### Overview

This environment relates to the exchange of information within a Healthcare Provider. The figure below shows the relevant actors and API's.

<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:80%; height:auto;" role="img" >
      <image href="environment-intra-healthcare-provider.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    </svg>
    <figcaption class="figure-caption"><em>Figure: Intra Healthcare Provider</em></figcaption>
  </figure>
  <p></p>
</div>

A Healthcare Provider contains a set of EHR Systems that can communicate with each other using the Intra-Organization-API. The Healthcare Provider communicates with the National infrastructure using the EHR System Gateway. This EHR system implements the Intra-Organization-API to retrieve information from EHR systems and provides them to the National Infrastructure using the member state specific Cross-Organization-API. The Healthcare Provider can connect to Wellness Applications using the Wellness-API allowing those EHR Systems to import data provided by the Wellness Application.

### Participants

- **EHR systems** — within the Healthcare Provider, all EHR systems are assumed to implement the Intra-Organization-API. Internally,it can implement this in different ways as is discussed in [EHR System composition](ehr-system-composition.html). EHR Systems can act as [Document Access Provider](actors.html#document-access-provider), and/or [Resource Access Provider](actors.html#resource-access-provider).
- **Healthcare Professionals** - typically employed by the Healthcare Provider that access EEHRxF information using the Intra-Organization-API.

### Requirements

Specific requirement related to this environment include:

* Regulatory
  * The EHDS regulation does not contain specific Intra-Healthcare-Provider requirements

* Access patterns
  * EHR systems may support resource and/or document based access.
  * When deploying EHR Systems that support the registry deployment model, an Healthcare Provider is required to support at least on registry.

* Authorization
  * EHR systems acting as Document/Resource Access providers may contain their own authorization server, or use an organization-level authorization server to control API access.
  * EHR systems are **not** required to use EIHDAS, wallet based authorization.

* Patient Identity
  * Healthcare Organizations may have a single Enterprise Master Patient Index (EMPI) which identifies patients known to the organization, , and shares this patient identity with other EHR systems in the organization (for example, by offering the Patient.$match API described in the Patient Matching section), and may integrate with national patient information systems.
  * The EHR System Gateway is responsible to ensure that any data provided to the national infrastructure holds the required National and European identifiers.

* Import of data

* Export of data

Other - feedback requested:
* Custodian specifics -  store and allow access to all published EEHRxF document versions
