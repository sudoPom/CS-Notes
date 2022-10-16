# Normalisation 

Checks the internal structure of each table to improve each table's integrity.

Moves tables through 'Normal Forms' to increase data integrity and remove redundancy which can cause update anomalies. Tables are typically further fragmented, making them more restricted.

Lossless-Join: You should be able to find any instance of the original table from the instances from the smaller, fragmented tables.

Dependency Preservation: Constraints on the original table is enforced on the fragmented tables.

Normalisation depends on functional dependencies between attributes. If you can determine the value of attribute B from attribute A then B is functionally dependant on A. An example of a `dependency`  is that from a `StaffNo` you can determine the staff's `position`, however given a position you cannot pinpoint one `staffNo`. Normalisation reduces the set of functional dependencies to a manageable size.  A `Partial dependenncy` is when an attribute depends on part of a primary key. 

### Normalised Forms:
* Un normlised form: A table with multiple elements in a column.
* First Normalised Form: No repeating groups - or each attribute can have a single value.
* Second Norml Form: No partial dependencies, each attribute must be entirely dependant on the primary key of it's table.
* Third Normal Form: No transitive dependencies - an example of this is:
	In a table containing attributes: "Book", "Author" and "Author nationality", knowing the book tells us the author which tells us the author nationality.
* Boyce Codd Normal Form: There are no dependencies on non primary/candidate keys.


## Conversion
In order to move up a normalisation level, the table must satisfy all requirements for previous normalisation levels.
### To first Normal Form
An attribute or group of attributes should be nominated as a primary key. 
Fields with multiple values should be removed by either:
* Creating multiple fields 
* Create a seperate table for repeating data.

### To second Normal Form
Then every non primary-key attribute should be FULLY dependant on the primary key, not just a subset of it. This does not concern elements that are not related to the primary key at all.

### To third Normal Form
Every transitive dependency should be removed, this includes dpendencies where a non key attribute depends on another non key attribute.

### To Boyce-Codd Normal Form
Every attribute that cannot be a  `candidate key` (a key that could be a primary key) should be removed and extracted to it's own table.

