---
id: P=NP
created_date: 22/11/2022
updated_date: 22/11/2022
type: note
links: 
---
* **🏷️Tags** : #Computability-and-Complexity-Theory-COMP0017 
# P=NP

The configuration of the turing machine can be described with the tuple:
$$
\begin{align}
(w,q, \iota)
\end{align}
$$

Where:
* *$w$ is the current tape contents
* $q$ is the current state
* $\iota$ is the location of the tape head

The transitions function is then just a function that converts this tuple to another tuple.

$$
\begin{align}
(q, w_l) \to (q',\gamma, d)
\end{align}
$$



With the constraints:
* $\forall k \neq \iota : w_k' = w_k$ - the only symbol that can change is the one where the head is located.
* $w_\iota ' = \gamma$ - The new symbol below the tape head is equal to the symbol to be written.
* $\iota ' = \iota + d$
	* $d \in \set{-1, 0, 1}$

A non deterministic turing machine's transition function takes in a state and symbol and returns the set of all possible TM configurations.

At a time step $t$ we have a set of configurations, which is the union of all configurations at the time $t$. Such a TM accepts if at any time $t$ there is a congifuration in the accepting state. If all possible paths reach the rejection state then the TM rejects. If any path does not halt then the TM neither accepts or rejects.

The run time of a non deterministic TM is:
$$
\begin{align}
t_M(n) = \begin{cases}
\text{Longest run of M on an input of size } \leq n \\
\infty \text{ if not bounded}
\end{cases}
\end{align}
$$

A decision problem is in $NP$ iff there is a non deterministic turing machine $M$ and a polynomial $p$ such that:
* $M$ accepts all yes instances
* $M$ rejects all no instances
* $M$ terminates within time $p(n)$ where $n$ is the input size.

Simulating a NDTM on a regular TM usin a breadth first search takes $b^{T(n)+1}$ which is exponential. There has not yet been a way to simulate a $NDTM$ using a regular $TM$

# Questions / Thoughts
