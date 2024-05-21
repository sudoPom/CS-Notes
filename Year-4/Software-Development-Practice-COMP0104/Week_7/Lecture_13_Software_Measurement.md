---
id: Lecture_13_Software_Measurement
created_date: 21/11/2023
updated_date: 21/11/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Software Measurement

We measure software so we can gain an understanding of products and resources being used, which can act as a baseline for future assessments. This helps to determine whether certain goals are met, predict how our system will change based on observed relationships and to improve the system by identifying and removing any issues.

A **software metric** maps entities of a software system to numerical values. For example, the number of lines of code is a measurement. An **attribute** is a feature of a property of an entity. An **internal attribute** is one that can only be measured based on itself. For example, a project's code coverage is an internal attribute. An **external attribute** is an attribute that is based on extra context. For example the rating of a product is depenent on those who use it and how useful they find the product.  

---

**Software size** is often used as an attribute. Size can be measured in terms of physical size (MBs), the set of features the the software provides or how complex the software is.

**Lines of Code** is also a commonly used metric since it is easy to measure. There are different variations:
* SLOC (Source lines of code): number of lines, excluding comments and whitespace.
* ELOC (Executable lines of code): number of lines for which code is generated.

Lines of code correlates (somewhat) with programmer effort but is language and format dependant. 

**Halstead's Work** splits programs into two types of tokens. **Operands** which are variables, constants and addresses, and **Operators** that are defined operations in a language.

We can define the following:
* $n_1$: number of distinct operators
* $n_2$: number of distinct operands
* $N_1$: number of total operators
* $N_2$: number of total operands

We then have the program vocabulary $n = n_1 + n_2$ and the program length $N = N_1 + N_2$.

The length of the program does not exactly correlate to it's complexity. Halstead's complexity metrics are:
* Volume $V = N \times \log_2n$
* Difficulty: $D=n_1/2 \times N_2/n_2$

**Thomas McCabe's Cyclomatic Complexity** measures the complexity of a program by counting the number of linearly independent paths through a function. This is usually calculated with a flow graph:
$$
\begin{align}
V(G) = E - N + 2P
\end{align}
$$
Where:
* $E$ is the number of edges
* $N$ is the number of vertices
* $P$ is the number of unconnected sub-graphs (procedures)

A value greater than 10 is considered to be too complex. The problem with this approach is that it only considers executable code, and ignores dependencies and datastructures. 

##### Other Metrics

**Object Oriented Metrics** are metrics that are based on theory and the experience of software developers. They measure unique aspects of OO programs such as inheritance, complexity, cohesion and coupling.

Inheritance metrics measures:
* The Depth of Inheritance Tree (DIT) which is the maximum depth of a class in the inheritance tree. The intuition is the higher the DIT the higher the likelihood of faults, so inheritance depth should be minimised.
* The Number of Children metric (NOC) measures the number of *immediate* subclasses of a class. Higher NOC has been found to indicate fewer faults.
Complexity metrics measures:
* Weighted method count (WMC) which is the sum of McCabe's complexities of all methods.
* Response for a class (RFC) number of methods in a class and methods directly called by methods in the class.
* RFC' is the number of methods in a class and methods directly or indirectly called by them.
Coupling and Cohesion Metrics measures:
* Coupling between object classes (CBO) which is the number of classes a given class is coupled to.
* Lack of cohesion in methods (LCOM) is the number of methods pairs that do not share instance variables vs the number of methods that share at least one instance variable.

There have been more metrics added to the class of OO metrics, most of which are correlated.

**Functionality Metrics** focuses on measuring software functionality and utility with the idea that products with more functionality are larger. A Functionality Point (FP) is a weighted measure of software functionality. The functionality of a system is measured based on the system specification. The goals of using functionality metrics is to predict the cost (and system size) of the system before implementation.

**Code Churn Metrics** measures the amount of code changed in a period of time:
* Churned LOC is the number of added, modified and deleted lines.
* Churned Count is the total number of changes made to a file.
* Files churned is the number of changed files.
---
Tools such as Sonar Cube can be used for measuring projects and incorporated into a CI/CD pipeline to surface any concerning metrics whenever a push is made.

---


# Questions / Thoughts