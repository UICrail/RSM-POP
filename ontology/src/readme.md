Folder containing the POP ontology
- as a ttl file (pop.ttl) generated from the GRAPHOL diagram by means of the EDDY ontology editor
- complemented with one annotation property that EDDY/GRAPHOL do not allow to add directly; see explanations in pop-annotations.ttl

The OntoQA template uses `ontology/src/config.md` (YAML front matter) to declare:

- `main_ontology`: ontology entrypoint file (relative path)
- `reasoner`: the reasoner to use in workflows

You can use any RDF serialization, but WIDOCO expects RDF/XML files (`.owl` or `.rdf`) and, second best, `.ttl`.
