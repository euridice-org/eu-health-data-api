Profile: EehrxfMhdSimplifiedPublishDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.SimplifiedPublish.DocumentReference
Title: "EEHRxF MHD SimplifiedPublish DocumentReference Profile"
Description: """
Profile for the DocumentReference **submitted** when publishing a document via
[ITI-105 Simplified Publish](https://profiles.ihe.net/ITI/MHD/ITI-105.html). It is based on
the IHE MHD SimplifiedPublish DocumentReference profile and re-applies the EEHRxF-specific
metadata constraints.

### Why this profile is needed

The publish-time and query-time representations of a DocumentReference are **mutually
exclusive** on the content axis:

- **SimplifiedPublish** (ITI-105 submission): `content.attachment.data` is **required** and
  `content.attachment.url` is **forbidden** — the document is carried inline as base64.
- **Minimal** (ITI-67/ITI-68 query and retrieve): `content.attachment.url` is **required**
  and `content.attachment.data` is **forbidden** — the resource only points to the content.

The existing [EEHRxF MHD DocumentReference profile](StructureDefinition-EehrxfMhdDocumentReference.html)
is parented on MHD Minimal, so it requires `url` and forbids `data`. An ITI-105 payload can
therefore **never** validate against it. Without a dedicated publish-time profile, the EEHRxF
metadata constraints (EU Core patient subject, mandatory `custodian` and `date`, document
`type` binding) would be lost on submission — submissions would only be checked against plain
MHD SimplifiedPublish, which does not carry any of those EEHRxF requirements.

This profile re-applies those EEHRxF constraints on top of SimplifiedPublish so that the
submitted resource is held to the same EEHRxF metadata expectations as the served resource,
while still carrying the embedded document required by ITI-105.

See [Document Exchange](document-exchange.html) for the full publish → query → retrieve flow.
"""
* insert SetFmmAndStatusRule( 1, draft )
* category MS
* type MS
* type from EEHRxFDocumentTypeVS (preferred)
* subject 1..1
* subject only Reference( http://hl7.eu/fhir/base/StructureDefinition/patient-eu-core )
* date 1..1
* custodian 1..1
