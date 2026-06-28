File test_pop_1.ttl exemplifies the referencing of a property defined by the ERA ontology.

This property is "Maximum contact wire height".

# Problem statement, using the ERA ontology

As per ERA ontology version 3.3.1, property "Maximum contact wire height" is a property of "Contact Line system", defined as "System that is used to transmit electrical energy to road or rail vehicles". This definition is misleading, as class "Contact Line system" is actually a limited set of technical characteristics about the contact line system (a table entry with several columns).

The set of characteristics applies to a "Running track" object, but cannot apply to a "siding" object (as it is disjoint from "Running track"). This limitation was probably meant to simplify the data collection needs when setting up RINF (a register), but is out of place in an ontology when it is supposed to reflect reality rather than a register: sidings can be electrified and the ontology should not state the contrary.

According to ERA ontology 3.3.1, one "Running track" individual can have several "contact line systems". No contact line at all is instantiated as "a contact line system"individual with property "type of contact line system" set to "non electrified". Again, this is a semantic confusion ("no system" is conventionally encoded as "a system with a special non-existence property"), closer to a data scheme hack that to an ontology.

Can a running track be "partly electrified"? a running track can have two contact line system properties, one of type ""Overhead contact line (OCL)" and the other of type "non electrified". The SHACL cardinality limiting the CLS count to 1 has been commented out for that purpose, most likely. Problem is, the ERA ontology apparently has no mechanism allowing to tell where the overhead contact line starts or stops.

_A workaround would consist in artificially segmenting running tracks according to every change of every characteristic, in order to deliver homogeneous track segments. That is probably not the intent, as tracks are defined in ERA 3.3.1 as "A pair of rails over which rail borne vehicles can run": semantically, it bears no direct relationship with other equipment._

# Solution, using RSM

RSM topology (representation of the network layout as a set of "abstracted" track segments, only considering vehicle guiding functions) provides the common backbone to which any subsystem or property can be mapped directly.

RSM localisation allows to assign a location (spot, linear, area) to any individual, and to map the location on the topology. At the most detailed level, a location will refer to linear elements or linear element segments, segments being delimited by intrinsic coordinates on the linear element (values ranging from 0 to 1).

RSM POP may refer to the semantics of any property (object property, data property, reified property) and ignores whatever constraint was applied, by design, to that property: only the semantics are considered. The object to be located is a piece of information: "value X of property Y applying to asset Z holds on location L (... over time interval T...), etc." embodied by an individual of class "Asserted quality".

In our particular example, it is possible to state maximum contact wire height (an ERA-defined property):
* on a siding, although contact line system cannot be a property of a siding in the ERA ontology (resulting in a logical contradiction)
* on the part of a track that actually has an overhead contact line (ERA ontology only allows all-or-nothing, or mixed characteristics with no boundaries)
* without consideration of the "track" component or "infrastructure" subsystem when only the "energy" subsystem is being considered.

ERA ontology defines a high number of infrastructure-bound characteristics that are documented in past and current editions of the RINF; to re-using these characteristics as they are originally defined is of high value, and is made possible by the complementary character of the ERA ontology (an epistemic ontology modelling the RINF) and the CDM ontologies (mostly taking the realist stance) via the RSM-POP epistemic module.
