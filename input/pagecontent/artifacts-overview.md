This page groups the artifacts defined in this implementation guide by purpose. The complete, publisher-generated list is available on the [Artifacts Summary](artifacts.html) page.

### ActorDefinitions

{% sql {
 "query" : "SELECT COALESCE(Name, Id) AS Name, Title, Type, Description, Web FROM Resources WHERE Type='ActorDefinition' ORDER BY Name",
 "class" : "lines",
 "columns" : [
 { "name" : "Name" , "type" : "link" , "source" : "Name", "target" : "Web"},
 { "name" : "Title" , "type" : "markdown" , "source" : "Title" },
 { "name" : "Description", "type" : "markdown" , "source" : "Description"}
 ]
} %}

### CapabilityStatement Profiles

{% sql {
 "query" : "SELECT COALESCE(Name, Id) AS Name, Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE '%CapabilityStatement' ORDER BY Name",
 "class" : "lines",
 "columns" : [
 { "name" : "Name" , "type" : "link" , "source" : "Name", "target" : "Web"},
 { "name" : "Title" , "type" : "markdown" , "source" : "Title" },
 { "name" : "Description", "type" : "markdown" , "source" : "Description"}
 ]
} %}

### CapabilityStatement Instances

{% sql {
 "query" : "SELECT COALESCE(Name, Id) AS Name, Title, Type, Description, Web FROM Resources WHERE Type='CapabilityStatement' AND Id NOT LIKE 'example-%' ORDER BY Name",
 "class" : "lines",
 "columns" : [
 { "name" : "Name" , "type" : "link" , "source" : "Name", "target" : "Web"},
 { "name" : "Title" , "type" : "markdown" , "source" : "Title" },
 { "name" : "Description", "type" : "markdown" , "source" : "Description"}
 ]
} %}

### DocumentReference

{% sql {
 "query" : "SELECT COALESCE(Name, Id) AS Name, Title, Type, Description, Web FROM Resources WHERE Type='DocumentReference' OR (Type='StructureDefinition' AND Name LIKE 'DocumentReference%') ORDER BY Name",
 "class" : "lines",
 "columns" : [
 { "name" : "Name" , "type" : "link" , "source" : "Name", "target" : "Web"},
 { "name" : "Title" , "type" : "markdown" , "source" : "Title" },
 { "name" : "Description", "type" : "markdown" , "source" : "Description"}
 ]
} %}

### Terminology

{% sql {
 "query" : "SELECT COALESCE(Name, Id) AS Name, Title, Type, Description, Web FROM Resources WHERE Type IN ('ValueSet','CodeSystem','ConceptMap','NamingSystem') ORDER BY Type, Name",
 "class" : "lines",
 "columns" : [
 { "name" : "Name" , "type" : "link" , "source" : "Name", "target" : "Web"},
 { "name" : "Type" , "type" : "text" , "source" : "Type" },
 { "name" : "Title" , "type" : "markdown" , "source" : "Title" },
 { "name" : "Description", "type" : "markdown" , "source" : "Description"}
 ]
} %}

### Other

{% sql {
 "query" : "SELECT COALESCE(Name, Id) AS Name, Title, Type, Description, Web FROM Resources WHERE (Type NOT IN ('ActorDefinition','ValueSet','CodeSystem','ConceptMap','NamingSystem','DocumentReference','ImplementationGuide','CapabilityStatement','StructureDefinition')) OR (Type='CapabilityStatement' AND Id LIKE 'example-%') OR (Type='StructureDefinition' AND Name NOT LIKE '%CapabilityStatement' AND Name NOT LIKE 'DocumentReference%') ORDER BY Type, Name",
 "class" : "lines",
 "columns" : [
 { "name" : "Name" , "type" : "link" , "source" : "Name", "target" : "Web"},
 { "name" : "Type" , "type" : "text" , "source" : "Type" },
 { "name" : "Title" , "type" : "markdown" , "source" : "Title" },
 { "name" : "Description", "type" : "markdown" , "source" : "Description"}
 ]
} %}
