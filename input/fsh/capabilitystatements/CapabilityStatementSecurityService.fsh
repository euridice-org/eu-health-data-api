ValueSet: EuApiAuthorizationSecurityServiceVS
Id: eu-api-authorization-security-service
Title: "EU Health Data API Authorization Security Service ValueSet"
Description: "Security services that a concrete EU Health Data API deployment may select for its protected FHIR interface."
* ^experimental = false
* include http://terminology.hl7.org/CodeSystem/restful-security-service#SMART-on-FHIR
* include http://profiles.ihe.net/fhir/ihe.securityTypes/CodeSystem/securityTypes#IUA

Profile: EuApiDeploymentCapabilityStatement
Parent: CapabilityStatement
Id: eu-api-deployment-capabilitystatement
Title: "EU Health Data API Deployment CapabilityStatement"
Description: "A concrete EU Health Data API deployment CapabilityStatement declaring one selected authorization security service."
* kind = #instance
* rest.security 1..1
* rest.security.service 1..1
* rest.security.service from EuApiAuthorizationSecurityServiceVS (required)
* rest.security.service.coding 1..1