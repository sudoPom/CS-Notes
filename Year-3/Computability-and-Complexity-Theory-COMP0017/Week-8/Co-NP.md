---
id: Co-NP
created_date: 17/04/2023
updated_date: 17/04/2023
type: note
links: 
---
* **🏷️Tags** : #Computability-and-Complexity-Theory-COMP0017 
# Co-NP

The complement of a language, $A$ is all the words that are not in $A$. The complement of a language class is all  the languages who's complement are in the language class. For example:

$$
\begin{align}
\text{co-P} = \set{\bar{L} | L\in P}
\end{align}
$$

The language class of $P$ is equal to its compliment $\text{co-P}$.

A co-NP turing mahcine is a turing machine that accepts if all computation branches result in an accept and rejects if there exists a path halting in a rejecting state.

If a language has a co-NP turing machine then it is in  co-NP.

If a language is NP-Complete, and a language is in co-NP then NP = co-NP.
# Questions / Thoughts