---
id: Hoare_Logic
created_date: 29/02/2024
updated_date: 29/02/2024
type: note
links:
---
* **🏷️Tags** : #Validation-and-Verification-COMP0103 
# Hoare Logic

A **Hoare Triple** is a triple that contains:
* $P$ is a program state
* $C$ is a program
* $Q$ is a program state.

If a program is in state $P$ and the program $C$ is executed on it, then $Q$ will be the resulting program state. A triple can either be partially or totally correct.

**Proof rules** define how to construct a conclusion from a set of statements that have already been proved. [[Propositional-Proof-Systems|Modus Ponens]] is an example of a proof rule. Proof rules preserve truth. 

The **Assignment rule** works backwards, say we have the following:
$$
\begin{align}
(?) ~~~ x := x +1 ~~~ (x = 6)
\end{align}
$$
The precondition would be the following:
$$
\begin{align}
(|x+1 = 6|)
\end{align}
$$
Giving:
$$
\begin{align}
(|x+1 = 6|) ~~~ x:=x+1 ~~~ (|x = 6|)
\end{align}
$$
DO NOT simplify the arithmetic. This requires something called the **implication rule**. 

# Questions / Thoughts