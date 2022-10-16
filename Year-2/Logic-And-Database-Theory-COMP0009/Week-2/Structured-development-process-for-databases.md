# Structured development process for databases

## Conceptual database design

Non technical data model (usually) with entity relationship diagrams.

Entity relationship diagrams are directed graphs, with nodes being entities and relationships being edges. Entities have attributes which is information about a given entity. Each entity has a type (kind of like a class). Entities can be abstract or physical. 

### Entities 

Entity instances all have the same type of attributes as each other but the values of each attribute type may differ between them.
Attributes hold values about an entity, eg: weight, age etc. An attribute will have specified domains (possible values an attribute can hold). 

`Simple attributes` are composed of a single component which cannot be subdivided.

`Composite Attributes` are made of multiple components with an independent component. `Single valued attributes`only holds a single value for each occurrence entity type. `Multi-valued attributes` hold multiple values for each entity type. 
`Derived attributes`can be calculated from one or more related attributes, these related attributes do not need to be from the same entity type.

A strong entity type is one that does not depend on some other entity type (like Staff, Branch etc). A weak entity Type is one that depends on some other entity type. (You can't have a preference without someone to have that preference!). Strong entity types can be uniquely identified using their primary keys, whilst weak entity types tend to have be referred through the strong entity type they are dependant on. A weak entity is considered to be the child of the strong entity it is dependant on. 

### Constraints 

Relationships can have constraints. For example a number/range of possible occurrences of an entity type that can relate to a single occurrence of another entity type through a certain relationship. For example, a *manager* (first entity type) can only *manage* (relationship) 10 (constraint) *staff* (second entity type). Normally relationships are binary. Binary relationships are generally:

* one to one (1:1) - One staff may oversee one property
* many to one (1:*) - One manager may manage many or zero staff  
* many to many (\*:\*) - Many students may attend 0 or more schools. 

`Cardinality` dictates the number of instances, whilst `participation` dictates whether all or some instances of an entity participates in a relationship. These two constraints form the `Multiplicity constraint`.


#### Attributes

* {PK} Primary Key
* [1..n] Multi-valued attribute
* / Derived attributes

### Relationship Type

A set of meaningful associations among entity types, like x *has* y is a relationship instance. While a relationship type is a set of meaningful associations among entities. 

* N-ary : There can be relationships between multiple entities. These are represented using a diamond symbol connecting all involved in the relationship.

![[Screenshot_20220420_164518.png]]

(A member of staff at a branch registers zero or more clients.)

* Recursive relationship: Same entity types participate more than once in different roles.
![[Screenshot_20220420_163103.png]]

Relationships can also have attributes, for example "supervises" is a relationship attribute. Relationships with many attributes may be a hidden entity type.
### Enhanced Entity Relationship Model

Enhanced Entity Relationship Model Includes concepts like specialisation / generalisation, aggregation and composition.

## Specialisation/Generalisation
Introduces sub/super classes so a subset of a group of an entity typeA  can have unique attributes to that sub group. 
`Generalising` minimises the differences between entities through common characteristics while `specialisation` maximises differences between differing characteristics. Members of a super class do not need to belong to a a sub class. Multiple super-classes can have the same subclass. A sub class inherits attributes from its super class and can have its own attributes unique to the subclass.
Constraints on super/sub class relationships include:
  * Participation Constraint: Mandatory / Optional
  * Disjoint Constraint: Determines whether an entity can be part of multiple subclasses (Non-Disjoint/And) or only one subclass (Disjoint/Or).

## Logical database design 

Converts data model into database schema, specifying the data needed for the database. 

### Rules

#### Entities 

* Create a table for each strong entity with only simple attributes. Composite attributes should be broken down into simple entities.
* Create a table for each weak attribute, with all simple attributes. The primary key should be partially / fully derived from their parent entities.

#### Relationships

* 1:* relA member of staff at a branch registers zero or more clients.ationship between a parent and it's child involves copying the PK from the parent table to the child key as a foreign key.
* 1:1: Participation used to decide if one or two tables should be made Participation dictates whether or not the entity is required in the relationsip.
  * Mandatory participation on both side: Combine entities to one table and choose a primary key uniquely identifying one of the original entities uniquely.
  * Mandatory participation on one side: Entity with optional participation is the parent. Primary key from parent is placed within the the child table and is the new primary key.
  * Optional on both side: Parent child relationship is arbitrary unless more information can be found out about the relationship.

* \*:\* Create a table to represent the relationship, with a primary key made out of the primary keys of the two tables.
* n-ary relationships: A table is created containing a primary key of made from all primary keys of entities involved in the relationship

#### Multi-Valued Attributes

* Multi-valued attributes should be represented using a new table. The primary key of the entity holding this multi-valued attribute should be kept as a foreign key. The primary key of the new table is a combination of the multi-valued attribute and the primary key of the entity.

#### Super/subclasses 

* Super class should be parent of subclass.
  * Mandatory and {And} - Single table to, one or more fields to determine sub classes entity is a part of.
  * Optional and {And} - Two tables, one for super class and one for all sub classes. The table with the sub class has discriminators to determine the type (sub class) of each row.
  * Mandatory and {Or} - One for each super/sub class relationship.
  * Optional and {Or} - One table for each sub class and one for the superclass. 

