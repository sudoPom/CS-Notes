---
id: Data_Flow_Analysis
created_date: 18/01/2024
updated_date: 18/01/2024
type: note
links:
  - "[[Alternate-Modes-of-Computation#While Programming Language]]"
---
* **🏷️Tags** : #Practical-Programming-Analysis-COMP0174 
# Data_Flow_Analysis

Data flow analysis is the technique used for gathering information on the set of values at various points of a program. The program is represented using a control flow graph. Typically we use a simple rudimentary language ([[Alternate-Modes-of-Computation#While Programming Language|the while language]]) to perform data flow analysis. Each statement in the while language has a label.

A Data flow graph can be constructed using the following functions:

**Init**: Returns the first label in a program.
**Final** returns the last label of the statement executed in a program.
**Blocks** returns the elementary blocks of a program.
**Flow** returns the edges of the pair graph as label pairs.
**Return Flow** returns the edges of the graph for backward analysis.

There are different kinds of analysis:
* **Flow Sensitive**
* **Flow Sensitive**
* **Context Sensitive**
* **Context Insensitive**
* **Must**
* **May**
* **Forward**
* **Backward**

## Available Expressions

Available expression is the combination of must and forward and is used to see whether expressions have been recomputed.
# Questions / Thoughts