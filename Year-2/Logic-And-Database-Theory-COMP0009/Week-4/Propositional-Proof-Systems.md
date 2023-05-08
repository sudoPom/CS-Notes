# Propositional Proof Systems

A `propositional proof system` is a system of determining the validity of formulas.

Drawing truth tables is an example of a truth system.

Manipulating the syntax of the formula is another truth system that works much better as drawing truth tables means you need to consider every valuation of all  propositions.

A truth system should be:

* `sound` if the system proves a formula is valid then the formula is definitely valid.  
* `complete` if a formula is valid then the system must be able to prove it is valid.

## Axiomatic Proof Systems

Start off with some axioms, an `axiom` is a rule that is known to be valid, and with these axioms prove more things.

### Propositional Axiom Schemas

* $p \to (q\to p)$ 
* $((p\to (q \to r))\to(p \to q) \to (p \to r))$ II
* $((\neg p \to \neg q)\to (q \to p))$ III
* $(p \iff \neg\neg p)$  IV
* $((p\lor q) \iff (\neg p \to q))$ V
* $((p\land q) \iff \neg(p \to \neg q))$ VI

`Modus Ponens`: If $\phi$ is valid and $\phi \to \psi$ is valid then you can conclude that $\psi$ is valid.

A `proof` is a sequence of formulas:
$$
\phi_0,\phi_1,\phi_2,...,\phi_n
$$
such that for $i \leq n$, $\phi_i$ is either an instance of an axiom or it is obtained from modus ponens from $\phi_j,\phi_k$ for $i,k \leq i$.

Proofs can have assumptions:
$$
\tau\vdash \psi
$$
Where $\phi_i$ are all assumptions.

If there is a proof of $\psi$ using assumnptions from $\phi_i$ then there is a sequence of formulas:
$$
\phi_0,\phi_1,\phi_2,...\phi_n
$$
Where $\psi = \phi_n$ and for each $i\leq n \ \phi_i$ is either:

* an instance of an axiom schema,
* an assumption $\phi_i \in \tau$
* or obtained from modus ponens.
