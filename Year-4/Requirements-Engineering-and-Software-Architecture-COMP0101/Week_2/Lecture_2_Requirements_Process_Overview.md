---
id: Lecture_2_Requirements_Process_Overview
created_date: 16/10/2023
updated_date: 16/10/2023
type: note
links: 
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Requirements Process Overview

Requirements engineering takes place in 6 phases:

###### Early Phases

Early phases are led by individuals with some form of domain knowledge and result in a list of features and qualities being outputted.

* **Initiation**: Define project scope and goals, identify stakeholder and determine whether or not the project is worth doing in the first place. ^bf2077
* **Investigation**: Understand what the world is like now and what we want the world to look like after the project is completed. This can be done through the use of information gathering techniques and modelling.
* **Decision**: Determine the viable options to execute the project and the effect of each option on the stakeholder goals. Things such as user story mapping, release planning and prototyping help with this phase
###### Late Phases

Late Phases are carried out primarily by development teams. The results of the later phases include detailed testable requirements.

* **Formulation**: Define testable and detailed requirements for the machine's features and qualities.
* **Validation**: Test machine against requirements and debug to improve the machine or remove errors (go back to formulation step if needed).
* **Evolution**: Evaluate the effect the machine has on the stakeholders goals after being deployed and evolve software to meet requirements/respond to changes (Go back to decision step).
##### Modelling

We can make use of models to provide a simplified view of the world. Various models can (and should) be used in the requirements process:

| Phase          | Models                                                                            |
| -------------- | --------------------------------------------------------------------------------- |
| Initiation     | Context diagram, stakeholder onion diagram, goal model                            |
| Investigations | Domain scenario, context diagrams, process models, conceptual models, goal model  |
| Decision       | Goal model, impact map, story map                                                 |
| Formulation    | Goal model, specification by example, state machines, formal requirements         |
| Validation     | Goal model, obstacle model, domain scenarios, state machines, formal requirements |
| Evolution      | Goal model, obstacle model, scenarios, state machines, formal requirements        |

The **goal model** describes the stakeholder goals, sub goals, machine requirements and domain assumptions. The **Conceptual model** defines the entities, relationships and events of the world. **Scenarios** describe sequences of events and interactions between world actors and the machine. And the **Context Diagram** describes the interfaces among world actors and the machine.


# Questions / Thoughts