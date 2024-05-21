---
id: Lecture_20_Static_Analysis
created_date: 11/12/2023
updated_date: 11/12/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Static Analysis

**Data flow analysis** is the process of collecting information about the use of values and variables in a program as accurately as possible. This is primarily done in program optimisation to identify which values are best kept in registers and when they are needed. It can also be used to detect unitialised variables.

A control flow graph shows in which order the statements can be executed. Statements are mapped to nodes, a series of statements that must be executed together is a **basic block**. Edges connecting the nodes represent the possible control flow between instructions (caused by `if`, `while`, and other branching statements). Every program has a single entry and exit node.

Data flow sets are used to perform data flow analysis:
* Generated Set contains all the newly defined variables inside a basic block. $gen(S)$. If a variable was previously defined in a predecessor node it is still included if it is redefined/updated in the current node.
* Destroyed set contains all the variables that are made undefined in a basic block or it has no known status after the basic block. $kill(S)$
* Incoming set includes all variables that are defined before the block is executed. $in(S) = \land_{S_i\in pred(S)} out(S_i)$ Note that this set only includes the variables that MUST be present. Initially the in set is set to the set of all possible variables. There are analyses that include variables that MAY be present, in which case the initial set is the empty set and a logical or is used instead of a logical and.
* Outgoing set contains all variables that are still defined at the end of the basic block. $out(S) = gen(S) \land (in(S)-kill(S))$

The ordering of statements within a basic block is still checked.

Return and exit statements do not generate or kill any nodes.

Multiple runs are performed to recompute the sets until no changes are found in any of the sets of all the nodes.

#### Bug Detectors

FindBugs is an analysis tool to determine whether or not java classes contain bugs. This is done by observing the byte code of the class. Detectors often have different inspection techniques. FindBugs can be extended to include new detectors.

Detectors often use common code violations that still compile but do not provide expected behaviour, for example string comparison in java using `==/!=`, infinite loops with no escape or internationalisation errors.


# Questions / Thoughts