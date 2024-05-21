---
id: Lecture_6_Decision
created_date: 26/10/2023
updated_date: 26/10/2023
type: note
links: 
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Decision

The goal of the decision step is to identify desired features and qualities, estimate the impacts of these features and qualities and to decide which of these to actually build.

The decision phase takes in project goals, scope, ideas and stakeholders the output is the candidate features to build, not in detail.

### Features

A **feature** is an externally visible functionality/quality of the software. Features should contribute to stakeholder goals and are defined by a set of software requirements.

Some features will be delivered in this release, the next release, or not developed at all. 

Features must not:
* Be misaligned with stakeholder goals. If they don't contribute to the goals (or contribute little) they should not be prioritised/included.
* Cause scope creep by being unrelated to the main problem. ^01d387
* Be hard to understand as this will impede requirements validation.

### Techniques

The techniques that can be used for decision making include:
* Impact mapping
* User story mapping
* Goal modelling
* Strategic release planning

All of these do not need to be used for a single project.

##### Impact Mapping

Impact mapping helps business stakeholders to define their goals and how to achieve them before discussing software features. It includes the [[Lecture_3_Initiation|Initiation]], [[Lecture_6_Investigation_Understanding_Problems_and_Solutions|Investigation]] and decision phases in a single workshop.

Impact mapping covers:
* A measurable stakeholder **goal**.
* **Actors** that might contribute to the goal
* **Impacts**: Actors behaviour change that contributes to the goal
* **Deliverables** that would bring about the desired impacts.

For example:
![[Pasted image 20231026103216.png]]

##### User Story Mapping

A **user story** is a description of functionality told from the perspective of a user. The common user story format is:

```
As a <role>
I want <action>
So that <goal>
```

User stories aren't requirements but are work items that are used for project management. Specifically to:
* Estimate the amount of effort required to implement the story.
* To plan the work for the next iteration
* To track progress
* To trigger detailed requirements formulation and discovery
* And to assign tasks

An **Epic** is a large user story that often align with a goal. They can contain multiple (or no) user stories. User stories must satisfy some requirement to be useful.

**User story mapping** is a workshop exercise performed to structure and order user stories. User stories are listed by priority, with the most important at the top:

![[Pasted image 20231026104359.png]]

##### Goal Modelling

**Goal modelling** involves using the stakeholder goals as a way for discovering, documenting and analysing requirements. There are multiple ways to perform goal modelling, ([[Lecture_3_Initiation#^10a7cf|KAOS]], I* Tropos, User Requirements Notation, etc)

In goal feature mapping (the simplest form of goal mapping), the stakeholder has a goal - something they want true in the world. Goals can have a set of sub-goals, if all of these sub-goals are satisfied then the goal is satisfied. Features will satisfy certain goals:

![[Pasted image 20231026105930.png]]

There can be multiple top-level goals.

Goal feature mapping should be used to:
* Break down goals
* Understand the rationale behind developing a feature, preventing [[Lecture_6_Decision#^01d387|scope creep]].
* Helps to structure requests for proposal (RFP).

A goal should not be defined in terms of its sub-goals but should instead be it's own self contained problem that can be solved. Each goal and feature should be given a brief description for clarity.

##### Strategic Release Planning

A **software release** is a version of the software that is deployed to its users. Releases are often developed in multiple **sprints** which are short iterations.

**Release planning** involves deciding which features will be included in each release (releases often take several months), and is composed of **sprint planning** which involves deciding which user stories to build within the next few weeks.

Release planning needs to take into account:
* Dependencies between separate releases.
* The estimated effort
* The estimated value
* Team capacity in each sprint

An **architectural element** is an element that is required for the system to work but does not satisfy the stakeholder goals on its own.

![[Pasted image 20231026113721.png]]

Creates:

![[Pasted image 20231026113918.png]]

There are tools to automatically produce optimal release plans.

Release planning helps involve stakeholders in the decision process, identify feature dependencies early, highlights candidate features, and objectives. However it can be difficult to identify good goals and features as well as to identify feature dependencies. Some goals may conflicts with each other, effort and value estimates are difficult to get correct. 
# Questions / Thoughts