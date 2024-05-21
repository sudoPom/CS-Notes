---
id: Lecture_10_Mining_Software_Repositories
created_date: 13/11/2023
updated_date: 13/11/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Mining Software Repositories

A **software repository** is a record keeping database that stores both artefacts and metadata about said artefacts. These artefacts are created by developers. We can mine software repositories to make observations about how development is being carried out. Mining software repositories has the intention of:
* Surfacing actionable information about software systems and projects.
* Predicting, planning an understanding various aspects of a project.
* To support future development
* Predict future bugs (for code repositories)
* Uncover hidden dependencies (for code repositories)

A **historical repository** records information about the evolution and progress of a project. Version control systems and issue trackers are historical repositories.

A **runtime repository** records information about the execution of a project, this can be local or deployed. Crash logs, debug logs and other forms of logs are examples of runtime repositories.

**Code Repositories** store a large amount of independent software projects. For example GitHub stores the code of a large number of software projects.

###### Steps to Mining
* Select a project for analysis
* Identify all changes (commits) made to project. This can be done with `git log`
* Transform the output so that files are mapped to numbers.
* Use a mining tool to discover patterns.
* Analyse results.

A pattern may occur often but not always. The proportion of the amount of times a pattern occurs is the **confidence** value and is expressed as a percentage. **Support** is the number of times that a rule occurs.

The ROSE system makes use of repository mining by recommending changes that are expected to be made because of previously observed patterns.

##### Cross Repository Mining

Relationships can also be found between artefacts stored in different repositories.



# Questions / Thoughts