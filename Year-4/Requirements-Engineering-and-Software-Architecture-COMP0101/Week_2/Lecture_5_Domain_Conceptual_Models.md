---
id: Lecture_5_Domain_Conceptual_Models
created_date: 18/10/2023
updated_date: 18/10/2023
type: note
links:
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Domain Conceptual Models

A **domain conceptual model** is used to define the entities that exist within the world, their attributes and their association with other entities.

![[Pasted image 20231018133041.png]]

###### Entity Types

Entity types should be named as a countable noun with all words capitalised, with or without a space between words. An entity name can be tested with the sentence: "The entity type $E$ is the set of all $e$s.".

###### Associations

Associations can have more than 2 members. These are $N$-ary associations, where $N$ is the number of members involved:

![[Pasted image 20231018133428.png]]

These aren't used because they are confusing.

Associations can also have multiplicities to express how many of the entities are involved in an association.

Associations should be named as:
* A state verb in the third person singular
* An action verb phrase in the present or past participle (ending in ed or ing)
* or any phrase that makes a state verb when prefixed by is or has.

The test sentence for associations is "An $e1$ (is || has) some $e2$.".

Associations can also have roles:

![[Pasted image 20231018135344.png]]
###### Attributes

Attributes are characteristics of an entity type or association. They should either be nouns or be prefixed by an "is" or "has" for boolean values.

---

**Specialisations** refer to sub categories of an entity type:

![[Pasted image 20231018135642.png]]

A **Glossory** contains all important definitions related to the project.
# Questions / Thoughts