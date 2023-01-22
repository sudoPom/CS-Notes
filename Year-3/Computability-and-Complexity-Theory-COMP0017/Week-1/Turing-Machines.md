`tags:`
[[Church-Turing-Conjecture]]
# Turing Machines
Alan Turing is the creator of the turing machine. He is most known for his contributions in deciphering the Enigma code in WWII.

A `turing machine` has a single infinitely long tape, with a left end, divided into numbered cells with the left most cell being cell $0$. Each cell can contain a symbol or be blank, with the tape initially being blank with the exceptions being cell $0$ which has a special "start" symbol and from cell $2$ onwards containing the input string.

The turing machine has a `head` which can move along the tape. This head can be in a finite number of states. Initially the head starts at cell $1$. Conventionally the first cell is blank. The head has a distingquishing state starting at $q_0$. 

At any time the head is reading the contents of a cell, and depending on the contents of the cell and the heads state it can:
* Halt
* Change to a new state and either:
	* Write a new symbol to the current cell
	* Move to the left or right
The head cannot move to the left of cell $0$ ir write into cell $0$.

What dictates what action is made by the head are specified by a `program`.

A Turing machine is formally defined as a tuple  $<\Sigma, Q, q_0, H, \delta>$
Where:
	$\Sigma$ is a finite alphabet of symbols including a blank and end of tape symbol
	$Q$ is a finite set of states
	$q_0\in Q$ is the initial state
	$H \subset Q$ \text{ is the set of halting states
	$\delta$ is the transition function ^184f03

The `transition function` takes in the current state and  the symbol being scanned and returns the next state of the head and the action to be performed.

$$
\begin{align}
\delta: (Q/H)\times\Sigma \to Q\times (\Sigma, \{\rightarrow,\leftarrow\})
\end{align}
$$

^dcdea6

The transition function is a set of 4-tuples:
$$
\begin{align}
<q_i, a, q_j, s>
\end{align}
$$
Where:
* $q_i$ is the inital state
* $a$ is the read symbol
* $q_j$ is the new state
* $s$ is the action to be made

When a Turing machine reaches a halting state in $H$, it has finished it's computation. 

The `transition function` can be represented graphically by using Finite state Machines:

![[Pasted image 20221004135643.png]]
