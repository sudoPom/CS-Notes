---
id: Lecutre_6_Maven
created_date: 23/10/2023
updated_date: 23/10/2023
type: note
links:
  - "[[Lecture_5_Another_Neat_Tool]]"
  - "[[Lecture_4_Build_Systems_and_Make]]"
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Maven

[[Lecture_5_Another_Neat_Tool|ANT]] and [[Lecture_4_Build_Systems_and_Make#Make|MAKE]] allow for different project structures, which means that it makes it hard to understand projects you are not familiar with - as they do not enforce some "best practice".

Maven is marketed as a project management tool but considered as a build tool. However, it is considered an extensible build infrastructure that implements a build life cycle over a set of standards and conventions for product structure.

Developers must follow a specific project structure when using Maven:
* A project life cycle
* Project object model
* A dependency model (external dependency)
* A set of standards
* Logic for executing plugins


Maven's builds are declarative - the elements of the project is specified but not how they are built. Maven makes use of a central repository for projects, which have a version, group and a unique artefact id. This is how external dependencies are referenced and installed locally to a project that depends on said external dependencies.

###### Project Object Model (POM)

The POM file defines a project and contains:
* The name of the project
* A set of unique identifiers
* Defines the relationships between other projects (dependencies, parents, etc)

###### Repositories

Plugins are updated via the central repository, making it easy to update infrastructure and add new build elements. Project repositories specify external dependencies, which are automatically retrieved and built.

--- 

Maven plugins consist of a collection of goals, with each goal being a unit of work, for instance compilation, test compilation etc. Each goal belongs to a lifecycle phase. A **lifecycle** is a sequence of phases involved in building a project. Each phase has a series of plugins, executing a phase executes all of the earlier phases and plugins. Phases are ran in order and dependencies are expressed in the order the phases are executed in.

Main phases include:

| Phase            | Description                                                             |
| ---------------- | ----------------------------------------------------------------------- |
| validate         | validate the project is correct                                          |
| compile          | compile the source code of the project                                  |
| test             | test the code using unit testing framework                              |
| package          | package code into a distributed format                                  |
| integration-test | deploy the package into an environment where integrations can be tested |
| verify           | run checks to verify the package                                        |
| install          | install the package into the local repository                           |
| deploy           | copies final package to remote repository                                                                        |

Maven is a black box - it is hard to understand what is actually happening, it is hard to adapt to other project structures, conflicting dependencies can occur and are hard to resolve.
# Questions / Thoughts