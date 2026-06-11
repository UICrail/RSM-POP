# OWL Profile Validation Report

**Ontology**: ontology/src/pop.ttl
**Date**: 2026-06-11 09:30:19 UTC

---

## OWL2 DL Profile

⚠️ **Status**: VIOLATIONS DETECTED

```
OWL 2 DL Profile Report: Ontology and imports closure NOT in profile. The following violations are present:
Use of reserved vocabulary for class IRI: rdf:Property [ObjectPropertyRange(<https://cdm.ovh/rsm/pop#aboutProperty> rdf:Property) in OntologyID(OntologyIRI(<https://cdm.ovh/rsm/pop>) VersionIRI(<https://cdm.ovh/rsm/pop/0.1>))]
Use of reserved vocabulary for class IRI: rdf:Property [Declaration(Class(rdf:Property)) in OntologyID(OntologyIRI(<https://cdm.ovh/rsm/pop>) VersionIRI(<https://cdm.ovh/rsm/pop/0.1>))]
```

## OWL2 RL Profile

⚠️ **Status**: VIOLATIONS DETECTED

```
OWL 2 RL Profile Report: Ontology and imports closure NOT in profile. The following violations are present:
Use of non-superclass expression in position that requires a superclass expression: ObjectSomeValuesFrom(<https://cdm.ovh/rsm/pop#aboutProperty> owl:Thing) [SubClassOf(<https://cdm.ovh/rsm/pop#AssertedQuality> ObjectSomeValuesFrom(<https://cdm.ovh/rsm/pop#aboutProperty> owl:Thing)) in OntologyID(OntologyIRI(<https://cdm.ovh/rsm/pop>) VersionIRI(<https://cdm.ovh/rsm/pop/0.1>))]
Use of reserved vocabulary for class IRI: rdf:Property [ObjectPropertyRange(<https://cdm.ovh/rsm/pop#aboutProperty> rdf:Property) in OntologyID(OntologyIRI(<https://cdm.ovh/rsm/pop>) VersionIRI(<https://cdm.ovh/rsm/pop/0.1>))]
Use of non-superclass expression in position that requires a superclass expression: ObjectSomeValuesFrom(<http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isQualityOf> <http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity>) [SubClassOf(<https://cdm.ovh/rsm/pop#AssertedQuality> ObjectSomeValuesFrom(<http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isQualityOf> <http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity>)) in OntologyID(OntologyIRI(<https://cdm.ovh/rsm/pop>) VersionIRI(<https://cdm.ovh/rsm/pop/0.1>))]
Use of reserved vocabulary for class IRI: rdf:Property [Declaration(Class(rdf:Property)) in OntologyID(OntologyIRI(<https://cdm.ovh/rsm/pop>) VersionIRI(<https://cdm.ovh/rsm/pop/0.1>))]
```
