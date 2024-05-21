---
id: Formulation
created_date: 01/05/2024
updated_date: 01/05/2024
type: note
links: 
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Formulation

The formulation stage takes in the features selected for implementation from [[Lecture_6_Decision|the decision]] stage and outputs a list of detailed and testable requirements for the features, or a requirements specification. This can be done just before development of the features or upfront before coding is started.

### Specification by Example

Specification by example is a collaborative approach where the desired behaviours of a feature are defined as rules (requirements), and scenarios (examples). Scenarios act as automated acceptance tests.

Examples have three parts:
* Context: The stage of the machine at the beginning of the example. This should describe the state of the machine at the start of the scenario.
* Action: An event that triggers the behaviour being illustrated. It should describe the action which is initiated by the world or the machine.
* Outcome: The desired state of the machine after the action has happened.

This can be done in many ways, the most popular is through the Gherkin Scenarios (Given-When-Then).  Common backgrounds can be used for multiple scenarios in a feature. Data tables can be used to display more data in a better way, rather than listing everything out or producing multiple scenarios.

![[Pasted image 20240501173415.png]]

A feature scenario is different from domain scenario in the sense that they illustrate a requirement, while a domain scenario illustrates a goal through a sequence of events. Specification by example consists of three parts:
* Discovery - short meetings to identify rules and examples for a feature or user story - done by example mapping.
* Formulation - Formulate the examples in a structured language.
* Automation - Write step definitions to transform the examples into executable test code.

Example mapping is done by organising stories into a sequence of rules (requirements) and then defining scenarios that rely on said requirements. Questions can also be asked on example mapping boards. 

Feature -> Rules -> Scenarios + Questions
# Questions / Thoughts