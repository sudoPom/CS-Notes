---
id: Intractability-and-Reductions
created_date: 12/04/2023
updated_date: 12/04/2023
type: note
links: 
---
[[Computation and Polynomial Time Complexity]]
* **🏷️Tags** : #Computability-and-Complexity-Theory-COMP0017 
# Intractability-and-Reductions

Intractable problems are problems that are solvable in super polynomial time. The *time hierarchy theorem* implies that there are problems that require super-polynomial runtime.

There are two types of problems, 

|            | Optimization                                  | Decision                                      |
| ---------- | --------------------------------------------- | --------------------------------------------- |
| Definition | looks for the best solution for a given input | looks for a yes or no output to a given input |
| Example    | shortest path from A to B                     | does $M$ halt on input $y$                    |
| Input      | some encoding of the problem                  | some encoding of the problem                  |
| Output     | some encoding of the solution to the problem  | determined by the state that the $TM$ haltes on (Accepting or Rejecting state)                                              |

## Reductions

Recalling that a [[Mapping and Reduction#Mapping Reduction|reduction]] takes an input to a problem $A$ and maps it to an input to problem $B$ in some computable way. If $A \leq B$ in polynomial time then we say:

$$
\begin{align}
A \leq_p B
\end{align}
$$

The same follows for languages.

Polynomial time reductions are:
* reflexive (by just doing nothing)
* transitive (The composition of two polynomials is still polynomial)


##### Problems
*Hamiltonian Circuit Problem* does a given graph have a circuit (path where the last node is connected to the first node) that visits all the nodes exactly once?
![[Pasted image 20230412181204.png]]

*Travelling Salesmen Problem* what is the shortest path connecting all nodes in a graph?


# Questions / Thoughts