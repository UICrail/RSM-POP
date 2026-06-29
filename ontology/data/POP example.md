

Next, we need an example. Here is the plan:
- set up a small network consisting of a single track with a siding. So, linear elements LE1, LE2, LE3 (from left to right) and the siding LE4, parallel to LE2. For all elements, port 0 is on the left, so intrinsic coordinates increase from 0 to 1, from left to right. Assume lengths 1000, 800, 810, 1500 for LE1 to LE4 respectively

- assume an electrified track stretch goes from leftmost element LE1 (intrinsic coordinate 0) to the rightmost LE3 up to intrinsic coordinate 0.7.
- The siding, LE4, is electrified too (from 0 to 1), but with different characteristics.
- POP AssertedQuality subclass ex:FullyElectrified, label "Fully electrified", will associate
  - about property era:ContactLineSystem (the class of contact line systems - ERA vocabulary does NOT handle such systems as technical systems, but as caracteristics of tracks)
  - two instances for entity: AreaLocation defined above (LE1, LE2, part of LE3, LE4) and LE1, LE2, LE3 (in full)
  - the asserted quality shall be understood as expressing an intensive property "fully electrified" of type boolean (POP does not tell explicitly, maybe I should add that to POP) with aggregation rule "Logical AND"
- POP AssertedQuality subclass ex:PartlyElectrified
  - same as above, but rule becomes logical OR
  - instance for entity: LE1, LE2, LE3 (in full)
- POP asserted quality subclass MaximumContactWireHeigth
  - about property: era:maximumContactWireHeigth, which is a data property yielding a height in meter. Intensive numeric property; aggregation rule = MAX
  - one individual with about entity : linear location LE1 0 to 1, LE2 0 to 1, LE3 0 to 0.7
  - simple value = "5.5m"
- POP asserted quality MaximumContactWireHeight
  - about property: (same)
  - one individual with about entity : Linear location LE4, from 0 to 1 (the whole siding)
  - simple value = "6.2m"
- POP asserted quality ex:ElectrifiedLength
  - about data property ex:electrifiedLength; intensive; aggregation rule = ADD
  - about entity = linear location participating in ex:FullyElectrified instances
  - value is length of linear location asserted under fully electrified

- Infer POP asserted qualities Fully Electrified, Partly electrified, Max contact wire height, ElectrifiedLength over the whole network (LE1 to LE4), using the aggregation rules
- The whole expressed and computed using SWI PROLOG. Mint PROLOG variable names derived from IRIs. Aggregation rules are easily expressed in PROLOG.


Note:
- ERA 3.3.1 cannot express OCL presence and characteristics on sidings; POP can
- ERA 3.3.1 cannot naturally express partial OCL coverage. In the relation between RunningTrack and OCL system:
  - property contaclLineSystem is not declared function, nor does it bear a restriction when the subject is of type RunningTrack;
