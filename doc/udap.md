# SMART App Launch and Automatic Client Registration

## Question
What HL7 specification related to SMART App Launch, defined by the FAST incubator, allows a client to automatically register with an Authorization Server so that a patient-facing application can be used without prior manual client registration?

## Answer
The specification is **UDAP Dynamic Client Registration (UDAP DCR)**, which was developed within the **HL7 FHIR at Scale Taskforce (FAST) Accelerator** ecosystem.

SMART App Launch itself requires that a client be registered with the Authorization Server, but it does **not** define a standardized registration mechanism. SMART App Launch instead points implementers toward OAuth 2.0 Dynamic Client Registration as a potential solution. 【1-8bf075】【2-1af5d7】

## Relevant Specifications

### 1. SMART App Launch
- Defines OAuth-based authorization for FHIR applications.
- Assumes the client is already registered.
- Does not define automatic client registration. 【1-8bf075】【3-d46991】

### 2. UDAP Dynamic Client Registration (DCR)
- Defines how a client can dynamically register with an Authorization Server.
- Uses signed software statements.
- Supports trusted ecosystems and trust communities.
- Removes the need for manual registration of each client with each Authorization Server. 【2-1af5d7】

### 3. FAST Trust Framework Guidance
- Defines how trusted communities can recognize and trust software statements.
- Enables scalable onboarding of applications across multiple healthcare organizations. 【2-1af5d7】

## Patient App Use Case

For a patient application that must connect to many healthcare providers without separate manual registration at each provider:

```text
SMART App Launch
        +
UDAP