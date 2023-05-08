---
id: Space-Complexity
created_date: 17/04/2023
updated_date: 17/04/2023
type: note
links: 
---
* **🏷️Tags** : #Computability-and-Complexity-Theory-COMP0017 
# Space-Complexity

Given a turing machine $M$, $S$ is a function $S: \mathbb{N} \to \mathbb{N}$ such that if the input tape has $n$ symbols, then $M$ must use $\leq S(n)$ tape cells.

If the machine does not halt then the space complexity is undefined.

The class $SPACE((S(n)))$ is the set of all languages that can be decideded by a DTM in $S(n)$ space.
Whereas $NSPACE(S(n)))$ is the set of all languages that can be decided by a NDTM in $S(n)$ space.

$PSPACE$ and $NPSPACE$ is all the languages that can be solved in $S(n^k), k \in \mathbb{N}$ by a DTM and NDTM respectively.

All languages that can be solved in time $f(n)$ (where $f(n) \geq n$) must also be solvable in $f(n)$ space. This is because a turing machine can only move the head by one in each step, meaning we can't write symbols past tape slot $n$ in time$(f(n))$.

All problems that can be solved in $SPACE$$(f(n))$ can also be decided in $TIME$$(f(2^{O(f(n))})$. 

###### Proof:

A DTM that halts in $f(n)$ steps cannot use more than $f(n)$ space and can be in $|\Gamma|^{f(n)} \cdot |Q| \cdot f(n) = 2^{O(f(n))}$ configurations, where $\Gamma$ is the tape alphabet. If a machine tuns for longer than this amount of time then it must have reached the same configuration twice at some point and is therefore in a loop which contradicts the space complexity. So a TM that uses f(n) space must halt within $TIME(2^{O(f(n))})$. 

Because of this we have:

$$
\begin{align}
P \subseteq PSPACE
\end{align}
$$
We also have that:
$$
\begin{align}
NP \subseteq PSPACE
\end{align}
$$


## Quantified Boolean Formula

A Quantified Boolean Formula includes quantifiers which apply on certain variables. These are either the existential ($\exists$) or universal ($\forall$) quantifiers.

The TQBF language is all the QBFS that evaluate to true.

##### Algorithm:
```
solve(phi, k)
	if(phi has no quantifiers)
		Terminate accordingly (accept iff phi evaluates to true)
	if(phi = forall x psi):
		Set x_k = T and let psi_t be the resulting QBF
		Set x_k = F and let psi_f be the resulting QBF
		return (solve(psi_t, k-1) AND solve(pst_f, k-1))
	else if (phi = exists x psi):
		Set x_k = T and let psi_t be the resulting QBF
		Set x_k = F and let psi_f be the resulting QBF
		return (solve(psi_t, k-1) OR solve(pst_f, k-1))
```


# Questions / Thoughts