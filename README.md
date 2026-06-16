# Purpose

The POP ontology aims at describing data from different perspectives, namely:
* Prescriptions, such as specifications, mandatory standards, etc.
* Observations; here, SOSA/SSN rules;
* Predictions,
* Corrections (new or updated prescriptions), as may result from maintenance processes,

and to enable their expression and comparison "inside the knowledge graph", allowing data from heterogeneous sources to be documented in view of further processing, and avoiding risks of semantic misalignments.

For instance:
* prescribed toleranced values shall be compared with
* observed values with uncertainties, and
* predicted values with confidence intervals.

The POP ontology thus helps build a knowledge base for data reconciliation, or for prediction model re-calibration.

# Main features

## Philosophical stance

POP generalizes the SOSA/SSN observation pattern from "observed (physical) properties" to "asserted property values", and removes the _requirement_ that the property be reified as a class.

This is a substantial change because __it allows POP to sit on top of arbitrary OWL ontologies__ without forcing them into the SSN metamodel.

For a large railway ecosystem with many imported ontologies, that reduction in coupling is likely more important than the extra OWL inferencing opportunities offered by ssn:Property.

## Referencing properties defined elsewhere

POP references properties (or other ontology terms, such as reified properties) defined elsewhere that we shall call "external properties". Formally, these properties can be any rdf:Property, owl:ObjectProperty, owl:DatatypeProperty, etc. POP defines pop:aboutProperty to link to external properties, but the linked property does not play any role in OWL inferencing. It is merely a semantic reference.

External properties are referenced using an owl:AnnotationProperty defined in POP, namely `pop:aboutProperty`. The values (objects) of annotation properties are ignored by OWL reasoners (not however by SHACL shapes). `pop:aboutProperty` only provides unambiguous semantic context to the user. Consequently,
* data checking should take place upstream, using the external SHACL shapes coming with the external ontologies;
* conversion of external data to their POP-conforming presentation is an automated downstream process that should undergo usual software verification and validation steps, not data validation.

> Note: SOSA/SSN would instead require duplicating as a class any domain property originally expressed as an owl property. For instance, ex:signalAspect would require a sibling ex:signalAspectAssertion class to be defined, and the link between object property and class can only reside in an annotation property which OWL reasoners would ignore. From that point of view, POP is no regression compared to SOSA/SSN.

## Welcoming all sources

The overarching concept is that of "assertion-generating activity" (a class), differentiating prescription (in particular specification), observation, estimation, prediction, correction. These activities are processes that produce assertions, although prescriptions and specifications are often confused with the documents yielded by the process.

## Property aggregation, or properties of aggregation

In physics and especially thermodynamics, one common distinction is whether properties are "intensive" (like temperature or pressure) or "extensive" (like mass, volume, or energy). Classical thermodynamics describes extensive quantities as scaling with the size of the system and being additive over independent subsystems, whereas intensive quantities do not scale in that way. See for instance Guggenheim (referenced below), pp. 18-19.

Mathematically, an extensive property can often be treated as a finitely additive set function, or measure-like quantity, over the parts being composed. A property $P$ is extensive when its value over a composite object is obtained by adding the values of its parts, provided that these parts do not overlap:

$$
P(A \cup B) = P(A) + P(B) \quad \text{when } A \cap B = \varnothing
$$

More generally, when $A$ and $B$ may overlap, additivity requires correcting for the overlap:

$$
P(A \cup B) = P(A) + P(B) - P(A \cap B)
$$

For instance, the mass of two wagons is the sum of the masses of each wagon, which characterizes "mass" as an extensive property. The same would apply to wagons lengths in the context of a train formation (not outside that context though).

By contrast, intensive properties do not add up; at best, they can be compared using an order relation. Evaluating $P(A \cup B)$ does not necessarily make sense, and even when it does, the evaluation method may depend on context. For instance:
* If $P$ is "temperature" and bodies $A$ and $B$ have the same temperature $T$, then $P(A \cup B) = T$; if they have different temperatures $T_1$ and $T_2$, and if $A$ and $B$ can exchange heat with each other while remaining isolated from their environment, the temperature of $A \cup B$ will ultimately settle to an intermediate value, namely the average of $T_1$ and $T_2$ weighted by their respective thermal capacities;
* If $P$ is "number of tracks" of a line, and the line is partly single track and partly double track, the property value could be "N/A" or $\{1, 2\}$ (an enumeration, not a number): a convention has to be agreed;
* If $P$ is "maximum permissible axle load" (understood as a constraint on the rolling stock), and the value is 18 tonnes on stretch of track $A$ and 20 tonnes on stretch of track $B$, then $P(A \cup B)$ is the minimum value;
* If $P$ is "maximum pantograph deployment" (understood as a required pantograph capability on a stretch of track), then $P(A \cup B)$ is the maximum value.

As can be seen above, aggregation rules depend strongly on context ("understood as"), which may be missing in the raw definition of the property.

Therefore, in the case of inhomogeneous properties, characterizing how property values of a composition should be derived from the property values of components is a fundamental piece of information. This characteristic is seldom mentioned in property definitions, let alone formalized. This is a gap POP intends to fill by specializing "Asserted quality" and enumerating possible aggregation rules.

Some useful background references for this modelling choice are:
* H. B. Callen, _Thermodynamics and an Introduction to Thermostatistics_, 2nd ed., Wiley, 1985, especially the distinction between extensive and intensive thermodynamic variables;
* E. A. Guggenheim, _Thermodynamics_, 5th ed., North-Holland, 1967, for another standard presentation of extensive and intensive quantities;
* P. R. Halmos, _Measure Theory_, Van Nostrand, 1950, for additive set functions and measure-like aggregation;
* P. Suppes, _Measurement theory and engineering_, in Handbook of the philosophy of science, vol. 9: philosophy of technology and engineering sciences, Elsevier, 2009


