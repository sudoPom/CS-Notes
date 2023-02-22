A **TM language property** $P$ is a function from the set of Turing machines to $\set{0, 1}$ (false/true), such that $L_M = L_{M^\prime}$ imples $P(M) = P(M^{\prime})$. This makes the property dependant on ONLY the language, not the machine that describes the language. A property is **non trivial** if there exsists a TM $M$ where the property is true and another TM $M^{\prime}$ where the property is false.

Formally, we identify the TMs satisfying property $P$ with the set:

$$
\begin{align}
\set{y \in \Sigma^* ~|~ y = code(M)\text{ and } P(M) = 1}
\end{align}
$$
**Rice's Theorem** states that if $P$ is a nontrivial language property, then the problem "Does $M$ have property $P$?" is undecidable.

### Proof

Fix a property $P$. We first suppose the $P(M_0) = 0$. Since $P$ is non trivial we can pick a TM $M_P$ such that $P(M_P) = 1$. Fix $M$ and $x$ as parameters. We construct the following TM $M_{M,x}$:

![[Pasted image 20221028133057.png]]

![[Pasted image 20221028133439.png]]

Given this, if we could decide if $M_{M,x}$ has the property $P$, we could decide the halting problem. However we know that the halting property is undecidable.

For the case when the $P(M_0) = 1$ we can repeat the argument but with the property $\neg P$ 