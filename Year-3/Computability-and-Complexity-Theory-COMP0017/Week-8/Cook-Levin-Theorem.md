---
id: Cook-Levin-Theorem
created_date: 14/04/2023
updated_date: 14/04/2023
type: note
links: 
---
* **🏷️Tags** : #Computability-and-Complexity-Theory-COMP0017 
# Cook-Levin-Theorem

The *cook levin theorem* states that the SAT problem is NP complete. To do this we need to find a function $f$ that reduces an input to a problem, $A \in NP$, to an accpeting input to the SAT problem if and only if the input to $A$ yields an accept. The SAT problem is *given a CNF, is it satisfiable*. Additionally, we need to show that SAT is in NP, which can be done easily:

#### Non-Deterministic SAT solution

The algorithm to non deterministically determine the satisfiability of some formula $\phi$ using a NDTM is as follows:

* For each variable $x_i\in\phi$ guess (non deterministically select) a value, true or false.
* Accept if the guessed assignment satisfies the formula and reject otherwise.

This takes polynomial time on a NDTM meaning that $SAT\in NP$.

## SAT is NP-Complete

To show this we need to show that an instance of problem $A\in NP$ can be reduced to an instance of a SAT problem in polynomial time.

Since $A$ is in NP it must halt within $N^K$ steps with $K\in\mathbb{N}$.

With this information we can create an $a\times a$ tableau corresponding to the state of the turing machine computing $A$ on input $w$ after $i\leq N^k$ steps. This tableau is then converted to a formula which is only satisfiable when the computation of $A$ accepts $w$.

Each cell in the tableau either has a state symbol or a character in the alphabet.

##### Cell Formula

We can define a variable for a cell as $T_{i,j,q}$ where:
* $i$ represents the column of the cell
* $j$ represents the row of the cell
* $q$ is any tape symbol
$T_{i,j,q}$ is true when the cell contains the symbol $q$. It must be the case that a tape slot only has one symbol. So we construct the first formula as follows:

![[Pasted image 20230414191920.png]]

Where $x$ is the tableau and $\Gamma\cup Q$ is the set of all tape symbols.

##### Start Formula

We need to ensure that the very first row contains the initial state of the turing machine:

![[Pasted image 20230414193039.png]]

##### Accept Formula

Additionally we need to make sure that the computation ended on the halt state. To do this we check the last row to see if the accepting state symbol is present in any of the cells.

![[Pasted image 20230414193217.png]]

##### Neighbourhood Formula

Lastly we need to ensure that each vertically adjacent row represents a valid movement. For example:

| a     | $q_1$ | c   |
| ----- | ----- | --- |
| $q_3$ | b     | $q_2$    |

Is not valid as there are two state symbols (and therefore two state heads) in this configuration.

The set of valid moves depends on the transition function of the turing machine. The final formula is:

![[Pasted image 20230414194447.png]]

So the overall formula is just the conjunction of all of these, this will only be true if the computation the formula represents accepts.

## 3-Sat

From SAT we can easily convert a formula to a 3-SAT problem (a CNF where each clause has at most 3 variables). Representing the input formula to SAT as a tree, we can create a new formula from it.

For example given the formula:

$$
\begin{align}
((a\land b) \lor c) \land (\bar{a} \lor b)
\end{align}
$$
We can represent this as the following tree:

![[Pasted image 20230414205140.png]]

Each of the operators ($\lor,\land$) are also given variable names. Using the following equivalence laws:
$$
\begin{align}
&(A\to B) \iff (\bar{A} \lor B) \\
\neg &(A\land B) \iff (\neg A\lor\neg B)
\end{align}
$$
we can construct 3 variable clauses.

The variable representing each operator is set to true if the arguments are set to true and false otherwise. For example $z_1$ is set to false when we have $a = 0$ and $b = 1$. This is done for every combination of the input to the operator. From this we can construct a string on conjunctions for each operator. For example, for $z_1$ we have:

$$
\begin{align}
((a \land b) \to z_1) \land ((\neg a \land b) \to \neg z_1) \land ((a \land \neg b) \to \neg z_1) \land ((\neg a \land \neg b) \to \neg z_1)
\end{align}
$$
Lastly we can convert each implication as follows:
$$
\begin{align}
((a \land b) \to z_1) &\iff (\neg(a \land b) \lor z_1)\\
&\iff ((\neg a \lor \neg b) \lor z_1)\\
&\iff (\neg a \lor \neg b \lor z_1)
\end{align}
$$

This preserves the satisfiability of the original formula but represents it in a CNF with a maximum of 3 clauses. And because we have shown that $SAT \leq \text{3SAT}$  and SAT is NP-Complete, 3SAT is also NP-complete.



# Questions / Thoughts