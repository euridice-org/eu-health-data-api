# Aspects important in resolving the authorization topic

## Authorization types

Different types:
* system-to-system
* clinician access
  * stand alone
  * launch application with scope
    * patient
    * organization (hospital)
    * location (treatment room)
    * ...
* patient access
  * stand alone
  * launch needed?
* patient access to other patient's data
  * user != patient
  * only for authorized persons (might be implicit)

## Where does authorization play a role

* EHDS-overview
  * Healthcare Provider
    * EHRSystem-2-EHRSystem
    * Clinician-2-EHRSystem - clinician-standalone
    * Clinician-2-Launched-EHRsystem - clinician-launch
    * PatientGateway (EHR system providing Healtcare Provider to patients - optional) - patient
  * EHRsystem - WellnessApp ->  Wellness-direct API - system-2-system (or patient?)
  * WellnessApp -> HDAS
  * National infrastructure
    * EHRsystem-2-EHRsystem - move data in the national infrastrucutuer, potential cache data ,...
    * HDAS-2-EHRsystem - Patient
    * HPAS-2-EHRsystem - clinician
    * EHRsystem-2-HDAS
    * GatewayEHRsystem-2-EHRsystem
    * EHRsystem-2-GatewayEHRsystem
    * EHRsystem-2-NationalContactPoint
    * NationalContactPoint-2-EHRsystem
  * MyHealth@RU
    * NCP-2-NCP

All system-2-system except for the ones where paient/clinical is indicated.

## What needs to be determined

* When a Clinician/Patient logs in  into EHRsystem1, which has a system-2-system connection to EHRsystem2 (and this one might go further), what does EHRsystem2 (and furter) need to know related to the original request? Is it required to pass information on the user? - assume not

## EIHDAS wallet login

* required patient authentication mechanism for clinicians access on HPAS (check: only there or on all EHR systems?)
* required patient authentication mechanism for patient access on HDAS (check: only there or on all EHR systems?)
* other authentication mechanisms are also allowed.

## Source specifications

* SMART App Launch
* IHE IUA

Although IUA claims to be SoF compatible it does require additional stuff.

## topics decisions need to be made on

* scope definition - open, SoF (SMART on FHIR), IUA, SoF&IUA
  * SoF&IUA - requires additional specification on how these interact as both scopes set are required - suggest to deffine that they work in conjunction: within IUA the smart scopes apply.
* OAuth mode supproted - system-2-systen, clinician, patient
  * for patient and clinician options on launch support
* Authentication
  * other
  * eIDAS-recognized electronic identification
* Whether the client knows the authorization server to use or discovers it
* Whether the client needs to register and get a client-id/secret before accessing content.