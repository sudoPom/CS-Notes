---
id: Lecture_1_Foundations
created_date: 05/10/2023
updated_date: 05/10/2023
type: note
links: 
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Foundations

Requirements Engineering is a set of activities concerned with discovering, analysing and communicating the needs of **stakeholders** (people affected by your software) the **contexts** (the situation your software will be used in and everything in the world that directly interacts with it) and the **external behaviours** of your software (what the software needs to fulfil it's purpose).

Trade-offs also need to be taken into account as there may need to be different versions of the developed product (for slightly different use cases), changes in requirements, etc. Some requirements directly conflict with others.

Requirements engineering happens throughout the development process, not just at the start.

#### Definitions

The **machine** is the product being developed whereas the **world** is the part of the world that is impacted by the machine. ^3eaaa4

**Phenomena** are observable states or events, where an **event** is something that occurs at a certain time and **state** is the condition something/someone is in at a certain time.  ^2141e5

Phenomena can occur within the machine (**machine phenomena**), in the world (**world phenomena**) or in both (**shared phenomena**). Shared phenomena can be caused by the machine (**Machine output**) or caused by the world **(Machine input)**. For something to be considered a machine input/output it needs to be **directly** connected to it.

![[Pasted image 20231005105915.png]]

**Actors** are things that can act in the world, not necessarily a person - the machine is an actor. **Stakeholders** are people that are affected by or interested in the product. Some things can be both actors and stakeholders. ^6e1dde

**Behaviour** is a sequence of phenomena that happens over a period of time, they can be **desirable** or **undesirable**. A **Behavioural property** defines the conditions of behaviours and can be written using logic:

![[Pasted image 20231005111634.png]]

The use of logic allows for automated analysis to be carried out on the system but may be confusing for stakeholders.

There are three properties in RE:
* **Stakeholder goals/needs** ($Goals$): A desired property of the world. Not all goals need to be satisfied and the machine does not have to be the only thing that satisfies the goal - other actors may be involved. Should be described in terms of world phenomena only.
* **Machine Requirement** ($Req$): The desired property of the machine as its interface to the world. It is defined purely in terms of inputs and outputs (shared requirements) and does not rely on any external actors.
* **Domain Assumptions** ($Dom$): Properties of the world that either holds as a rule of nature or because of the behaviours of the set of world actors - other than the machine.

The requirements are correct with respect to the goals if there exists a valid domain such that:

$$
\begin{align}
Req, Dom \vdash Goals
\end{align}
$$

Stakeholder goals should be separate from machine requirements.

#### Engineering Terminology

A **failure** is a situation where the product does not work as intended. **Machine failure** occurs when the machine does not satisfy its requirements, while a **system failure** is a situation where the actors do not satisfy an essential stakeholder goal

**Defects** are flaws in the product that can cause a failure. A **implementation defect** is a characteristic of the software that may cause a machine failure, whereas a **requirement defect** is a characteristic of a requirement that could cause a machine or system failure.

**Errors** are human mistakes that can cause a defect An **implementation error** occurs when a programmer makes a mistake that can lead to machine failure. whereas a **requirement error** occurs when there is a mistake in the definition, communication or understanding of the machine requirements which may cause system failure. 

##### Requirement Errors

There are three different causes of requirement errors.
* The first being a misunderstanding of the stakeholder goals and creating a set of requirements that do not cover these goals. 
* The second is incorrect assumptions about the domain.
* The third is caused by requirements that do not actually fulfil the stakeholder goals. 

**Obstacles** are scenarios which cause a contradiction in domain assumptions.

# Questions / Thoughts