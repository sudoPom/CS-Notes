---
id: Lecture_7_Domain_Scenarios
created_date: 19/10/2023
updated_date: 19/10/2023
type: note
links:
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Domain Scenarios

A **Domain Scenario** is a sequence of events that occurs in the world. They are helpful as they aid in facilitating discussions with stakeholders and helps gain a view of the world. Scenarios also help with identifying desired/undesired behaviour. All stakeholders should be involved.

Domain scenarios can be graphically modelled using a domain story:

![[Pasted image 20231019111500.png]]


A domain scenario is a sequence of steps that occur between objects and actors:

![[Pasted image 20231019111716.png]]

**[[Lecture_1_Foundations#^6e1dde|Actors]]** are entities that can perform actions in the world.

**World objects** are entities that can be manipulated, interacted with or talked about by actors.

An **action** is what an actor does and is described with a verb. 

A **step** is a sentence in the active voice that describes who (actor) does what (action) with what (object) and with whom (participants).

---

Steps may overlap but they have an ordering by which they are numbered. A scenario has no conditionals, loops or branching. If these are required then a different model should be used. 

A scenario should have a short title describing what happens. There should also be context (the state of the world before the scenario) and outcome (the state of the world after)

The types of scenarios include:
* **As is vs to Be**: Two comparative models that model how the world is and how it should change.  
* **Positive vs Negative**
* **Normal vs Alternative vs Exceptional**: Provide examples of scenarios that are different from the norm. Steps in each type of scenario can move to a different type of scenario. When modelling variants, you should not be exhaustive.

There are also three ways to represent scenarios:
* **Textual scenarios**
	* Easy to write
	* Easy to make mistakes
* **Domain Stories**
	* Engaging visual structure
	* Harder to create and maintain
* **Sequence Diagrams** 
	* Formal and automated tool support
	* Less stakeholder friendly

##### Guidelines

In a domain scenario, each actor should only appear once and each step includes a world object. Some additional guidelines include:
* The set of icons should be small
* Actors should be larger than objects
* Actors and objects should use different icons from objects

Additional information can be added to actions to include assumptions through annotations.

Organisational boundaries can be expressed using dotted lines, where all actors within the boundary belong to the same organisation.

When making a model you should aim for clarity, not completeness.

---
###### General Process:
* Choose a starting event: An event that requires some response.
* Ask what happens next. Too much detail is not required as it can be added later. Continue this step until the goal is satisfied or failed.
* Add a few variants if needed.

Steps that are not relevant should be excluded. Only steps that make significant progress towards the goals success/failure should be included.

The scenario shouldn't be too long, 9 steps should be the limit. Steps should be written in the active voice. "A member of the public makes an emergency call" rather than "An emergency call is made". The implementation should not be described, just the process.

---


# Questions / Thoughts