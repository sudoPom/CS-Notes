---
id: Lecture_14_Technical_Debt
created_date: 21/11/2023
updated_date: 21/11/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Lecture_14_Technical_Debt

**Lehman's Laws** relate to the evolution of software:
* If a software evolves, it will get more complex, unless effort is made to reduce the complexity.
* If no changes are made, it will degrade in usefulness.
* For user satisfaction, the system must continually receive more functionality.
* If a system is not maintained and adapted to environmental changes, it will appear to be declining in quality.

**Technical Debt** is the debt that grows when wrong/sub optimal design decisions are made. A "Quick fix" adds technical debt to a system. The longer said fix is present, the more "interest" it will accumulate, meaning it will become more expensive to fix. Too much technical debt can make a system unmaintainable. Artefacts that are incomplete, immature or inadequate cause technical debt. The kinds of technical debts include:
* Code Debt: Inconsistent coding style, code smells and tool violations.
* Design Debt: Design smells, and violation of design rules.
* Architectural Debt: Sub optimal architectural design and implementation choices.
* Test Debt: Lack of tests, inadequate coverage, bad test design and test smells.
* Documentation Debt: No, poor or outdated documentation

Faults and failures are not technical debt. Technical debt is related to the internal quality of the software. Fixing faults and failures take priority to technical debt.

Within technical debt there are four types:
* Strategic: Known and long term technical debt. For example using an old technology in your stack.
* Tactical: Known and short term technical debt. Quick fixes fall under this.
* Inadvertent: Unknown and short or long term.
* Incremental Debt: Unknown and periodic.

Technical debt can be managed by increasing awareness and regularly detecting & repaying it off. Technical debt should be monitored and tracked. Tools that help to repay technical debt include:
* Comprehension tools
* Metric tools
* Analysis tools
* Technical debt quantification and visualisation tools
* Refactoring tools

Tools should only be used as an indicator because they (mostly) do not have awareness of context.

###### Quantification and Visualisation

Involves assigning a monetary value to how much it would cost to repay a technical debt, allowing informed decisions to be made (how many engineers to assign to repaying the debt). Key metrics can be used to quantify technical debt, trends over these metrics can be used to measure the trend in technical debt. 


# Questions / Thoughts