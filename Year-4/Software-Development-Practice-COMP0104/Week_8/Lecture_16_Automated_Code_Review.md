---
id: Lecture_16_Automated_Code_Review
created_date: 28/11/2023
updated_date: 28/11/2023
type: note
links:
  - "[[Lecture_11_Profiling_and_Coverage]]"
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Automated Code Review

When continuous integration occurs post merge it can be interruptive, so it might be better to run CI pre-merge.

Automated code review checks for additional issues that are incorporated in the change. This is to reduce the chance of new bugs/technical debt being added and is normally done by a bot as developers tend to be bad at spotting bugs and code smells.

For instance, SonarCloud is a tool which can notify developers of the bugs, vulnerabilities, code smells and coverage of a change to be commited.

Generally its encouraged not to touch anything unrelated to the change. This is because doing so will:
* Cause git blame to no longer identify the last change of functionality.
* Cause the functionality to grow in size.
* Cause additional tests to be ran (even for styling changes)

Fixes to code smells should be done in separate commits or where you are changing the code causing the code smell as it is required to add functionality. 

# Questions / Thoughts