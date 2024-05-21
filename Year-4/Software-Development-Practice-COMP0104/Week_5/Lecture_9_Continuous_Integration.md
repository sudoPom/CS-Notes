---
id: Lecture_9_Continuous_Integration
created_date: 30/10/2023
updated_date: 30/10/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Continuous Integration

**Integration testing** is the process of linking together individual modules and testing the interactions between them. It is best to integrate components as soon as possible.

There are different ways of approaching integration. Each approach affects the order in which components are developed:
* Top down - Starting from the user interface and work your way down.
* Bottom up - Starting from data structures / databases and work your way up.
* Vertical slice - Start from a piece of UI and expand downwards to the relevant parts of the project.
* Sandwich
* Risk Oriented - Consider what the risk of each component is and prioritise the high risk ones first.
* Feature Oriented - Work on components whose features coincide with each other.
* T Shaped - Combination of top down and vertical slice

Having a fully integrated of a product to develop on locally does not guarantee no problems for other developers. This is because other developers may have different configurations, plugins, etc than you. The environment might even be different to where its going to be deployed.

---
##### Daily Smoke Testing

Changes should only be commited when they do not break the build.

In smoke testing, every file is compiled, linked and combined into an executable program. The program is ran to see if it runs. If this is done daily, it will be much easier to find breaking bugs as you just need to check the changes that were made since the last (successful) build.

To keep this effective the build should be fast. Additionally we could reduce the amount of features added to the build which in turn reduces the chance of a build failing, however this then makes the build outdated. Using smoke testing, code is tested once by the developer and once by the build.

---

**Continuous Integration** is a software development practice where each member of a team integrates their work frequently, at least once daily. Each integration is verified through an automated build (including tests). CI aims to discover bugs early, improve code base quality, increase project visibility (as changes are merged frequently) and always having a deployable version.

CI is done by running a build with a single build script, which is part of the repository. The tests and checks are ran (which are in the source repository). Everything not included in the repository is not used and is considered to not exist. This is all done on a CI server.

Different things should be measured about the tests. These include:
* Failed tests
* Number of classes, Lines of code
* Style violations
* Code smells
* Duration of build

The principles of CI include:
* Commit early and often
* Fail (tests) fast - identify unexpected behaviour as quickly as possible.
* Never commit broken code
* Fix build failures immediately
* Build in every target environment
* Create artefacts from every build

The test suite should be optimised so that everything is covered in the fewest amount of tests. Different tests should be ran for smoke tests versus commit tests.

**Continuous delivery** is an extension of CI that ensures that built artefacts can be deployed and released. This is harder to adopt as it requires more engineering and automation.

Steps of CI/CD make up a pipeline. Some steps make use of build infrastructure like [[Lecutre_6_Maven|maven]] or [[Lecture_7_Gradle|gradle]].
# Questions / Thoughts