---
id: Combinatorial_Interatction_Testing
created_date: 18/01/2024
updated_date: 18/01/2024
type: note
links:
---
* **🏷️Tags** : #Validation-and-Verification-COMP0103 
# Combinatorial_Interaction_Testing

An interaction fault is when two categories of a program reach states that causes a fault. We can use techniques such as equivalence techniques to identify possible values for each factors of an application, however it is impractical to test all possible combinations of these values. The motivation behind **Combinatorial Design** (CIT) is to reduce the number of combinations to test through the use of combinatorial design.

CIT aims to find a subset of all combinations of values that still satisfies some well defined combination strategies. The main observation is that not every factor contributes to every fault. Certain faults are caused by interactions between a few factors.

---

**Combinatorial Interaction Testing** is a black box system testing technique that sample inputs, configurations and parameters and combines them in a systematic fashion.

---

For example, if we had 3 three category factors of an application, testing all the possible combinations of factors would require 27 tests. However if we instead tested all the pairs of combinations (pairwise testing) we would only need 9 tests. The **covering array** is a function that finds the size of the set of all configurations (and therefore tests)  $t$ way configurations of $k$ values which can have values between $0$ and $v-1$, and is defined as:

$$
\begin{align}
CAN(t, k, v) =
{n\choose k} *v^k
\end{align}
$$ 
Most failures occur within single/pairwise interactions.

---
##### Greedy Method of Generating Interaction Combinations

This method can be done by generating a pairwise test set for the first two parameters. Then for the first three parameters, and so on. A pairwise test set for the first $n$ parameters can be generated by extending the test set of the first $n-1$ parameters.

The combinations can be extended either horizontally, by adding a value of each the parameter to each test, or vertically by adding more tests. 

---

##### Meta Heuristics

Meta heuristics are strategies that guide a search process to efficiently explore the search space to find near optimal solutions that are not problem specific.


****
# Questions / Thoughts