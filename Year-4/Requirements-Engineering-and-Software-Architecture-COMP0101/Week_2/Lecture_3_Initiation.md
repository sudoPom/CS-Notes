---
id: Lecture_3_Initiation
created_date: 16/10/2023
updated_date: 16/10/2023
type: note
links:
  - "[[Lecture_2_Requirements_Process_Overview]]"
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Initiation

The main goal of [[Lecture_2_Requirements_Process_Overview#^bf2077|initiation]] is to identify stakeholder requirements and the viability of the project - it is best to find out if a project is not viable early as to not waste time/resources.

The result of the initiation phase includes:
* **Project Purpose**: A short statement that highlights what the resulting product should be able to do and what benefits it brings to stakeholders.
* **Project Scope**: The part of the world that is helped by the product.
* **Stakeholders**: Everyone who is interested in or affected by the product.
And *optionally*:
* *Constraints*: Limitations that need to be kept in mind.
* *Risks*: What could go wrong during the project and how to avoid it.
* *Glossary*: Definitions and concepts in the world.
* *Go/no go decision*: Whether the project is viable and worthwhile.

The **Work** is defined as the part of the world that will be improved by the [[Lecture_1_Foundations#^3eaaa4|the machine]] and is also known as **project scope** or the **problem scope**. When talking about the work we do not worry about the intricacies of how the work handles requests: ^c92e10

![[Pasted image 20231016163110.png]]

Due to this, the work of the world to be and the world as is should be identical - the work is independent of its implementation.

Project scope can be defined by:
* Identifying the real world activities that need to be supported by the machine.
* Identify the inputs and outputs to these activities.

A project scope that is too narrow has the risk of producing a product that does not solve the stakeholder requirements. This can happen when only the machine is considered without context of the world.

Similarly a project scope could be too wide and include parts of the world that the project team has no control over.

### Stakeholders

There are different classes and types of stakeholder.

###### Operational Area Stakeholders

Operational stakeholders interact directly with the product and include:
* **Users**: Those who operate the product. Typically modelled using personas.
* **Operational Support**: Those who help the users use the product (help-desk)
* **Interfacing Technologies**: All systems that interfaces with the product. The actual technologies are not stakeholders but the owners of them are.

###### Containing Business

All stakeholders who benefit from the product in some way.

* **Client**: The one who pays for the product.
* **Customer**: Pays to use the product once finished.
* **Functional Beneficiaries**: The people who benefit from the work done in the operational area.

###### The Wider Environment

Stakeholders who have an influence/interest in the product.
* **Regulators & Inspectors**
* **Financial and political beneficiaries**
* **Subject matter experts**
* **Negatively affected stakeholders**
* **Hostile stakeholders**: Hackers, terrorists etc

###### The Development Team

Those who develop, design, test, operate and maintain the product.

The development team's organisation has goals that they are concerned with as well. It is also typically a good idea to have developers and testers early in the requirements process so they can make informed decisions during requirements gathering and development.

### Project Goals

Project goals should be a short sentence describing the impact of the machine on the world. The project goals may not cover ALL the stakeholder goals. The project should not stray from these goals - requirements should tie in to satisfying project goals. 

Project goals should not:
* Be product-centric
* Have vague/immeasurable impact on the world

Techniques for finding goals include:
* Find scientific literature on evaluation metrics
* Ask questions on observable changes and Purpose, Advantage and Management questions.
* Look into organisations performance indicators.

###### Formulating Project Goals

Can be done through the use of:
* A simple list of goals
* VOLERE Fit Criteria: A measurement used to show how well a goal is satisfied:
	![[Pasted image 20231018130126.png]]
* KAOS behaviour goals and objectives: Contains a goal, the desired behaviour, a quality variable (the variable which determines whether the goal is met) and the objective function (function that takes in the quality variable and returns true if the goal is met and false otherwise). KAOS also includes a VOLERE Fit Criteria. ^10a7cf

---

### Risks and Constraints

Constraints and risks also need to be taken into consideration. Constraints limit what can be done in the project:

* Project Constraints
	* Time constrains
	* Financial constraints
* Solution Constraints
	* Design and Implementation constraints
	* Constraints of other systems that interface with the product
	* Mandated/Forbidden applications.

Risks on the other hand are potential dangers that could cause undesirable effects.

# Questions / Thoughts