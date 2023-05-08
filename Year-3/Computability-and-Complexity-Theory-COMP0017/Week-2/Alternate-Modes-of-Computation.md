# Alternate Modes of Computation

There are more complex modes of computation that are even more efficient than advanced turing machines. These can also be shown to be equivalent to turing machines.

## Unlimited Register Machine

An **Unlimited register machine** (URM) consists of numbered registers. Each register stores a natural number stored in register $r_n$.

URMs also compute functions of the form $N^k\to N$. The input $x\in N^k$ is split among the first $k$ registers and all other registers contain 0. The output is stored in the first register, $r_1$.

A computation follows the sequence of instructions specified by a program $P$. These programs look similar to assembly code. There are four types of instruction:
* **Zero**: $Z(n)$ sets $r_n$ to be equal to zero
* **Successor:** $S(n)$ adds one to the content of $r_n$
* **Move**: $M(n,m)$ sets the content of $r_m$ to be equal to the content of $r_n$.
* **Jump** $J(n,m,p)$ forces the program to go to instruction $I_p$ if $r_n$s contents is equal to $r_m$s contents.

#### Equivalence with Turing Machines

A **partial function** is one whose value is not defined for all possible arguments. Since URMs and TMs compute partial function $N\to N^k$ where some inputs may fail, they compute partial functions. So to prove equivalence we need to show that a (possibly partial) function is computable by an URM If and only if it is computable by a TM.

A Turing machine can be designed to simulate the computation of a URM. This is done using 6 tapes:
* Tape 1 holds the "program counter" (the address of the current executing instruction of the URM.)
* Tape 2 holds the program code
* Tape 3 Holds the register values, with the values being seperated by blank symbols and the values written in unary notation.
* Tapes 4-6 are used as cache.
When a register is to be updated, we use the additional three tapes to update the registers. When register $r_k$ is to be updated to hold value $x$:
* register tape 4 holds the value $x$.
* Registers $r_1,r_2,...,r_{k-1}$ are stored into tape 5.
* Registers $r_{k+1},r_{k+2},...,r_j$ are stored into tape 6.
* The contents of these tapes are stored back into memory in the order: Tape 5, 4, 6.
![[Pasted image 20221014172758.png]]

#### Turing Machine Equivalence with URMs

For a Turing Machine $M = <\Sigma, Q, q_0, H, \delta>$ we need to be able to encode the behaviour of the turing machine using natural numbers.

We can have a TAPE register that encodes the current configuration of the tape of  $M$. The tape will consist of $m$ symbols, so we will therefore need to encode each of these symbols. 
For example, with alphabet $\Sigma = \set{0, 1, \rhd, blank }$ we could have:

$$
\begin{align}
code(blank) = 0\\
code(\rhd) = 1\\
code(0) = 2\\
code(1) = 3\\
\end{align}
$$
The contents of the tape can then be stored as base 4 numbers. (Because there are four symbols).

For example
$$
\begin{align}
801 = 1\times4^0 + 0\times4^1 + 2\times4^2 + 0\times4^3 + 3\times 4^4
\end{align}
$$

Encodes 
![[Pasted image 20221014175636.png]]

The power the base is raised to indicates the tape position and the number it is multiplied with represents the symbol. 

Registers will also be needed to encode the transition function of $M$. Each register needs to encode a tuple holding the input state, input symbol, output symbols and action:
$$
\begin{align}
(q_{in}, \sigma_{in}, q_{out}, \sigma_{out})
\end{align}
$$

Other registers will also be needed to store:
* Head position
* Head symbol
* Head State

Instructions will also need to be implemented for the basic instruction types:
* Move left & Move right (update the head position, head symbol and state)
* Read
* Write (update tape).

## While Programming Language

High level languages are also included in the Church-Turing thesis. A simplified language that encapsulates all high level languages is the **WHILE programming language**

##### Syntax

Variable assignments:
```
X := 3
```

While loops:
```
while X != Y do PROGRAM
```

Sequencing:
```
PROGRAM1; PROGRAM2; PROGRAM3
```

A formal defintion is as follows:

```prolog
PROG ::= begin end | begin SEQCMD end
SEQCMD ::= CMD | SEQCMD ; CMD
CMD ::= ASS | while TEST do CMD | PROG
ASS ::= VAR := 0 | VAR := s(VAR) | VAR := p(VAR)
TEST ::= VAR != VAR
VAR ::= CHAR | VAR CHAR | VAR DIGIT
CHAR ::= A|B|...|Z
DIGIT::= 0|1|...|9
```

#### Equivalence with Turing Machines

Proving this can be done via structural induction of a WHILE program that uses $X_k$
variables.

###### Base Cases
* Zero Assignment 
```WHILE
begin Xj := 0 end
```
The corresponding TM is:
![[Pasted image 20221014182640.png]]
And we can easily just update $X_j$ with the value 0.

* Empty program
* Successor Assignment
* Predecessor Assignment

###### Inductive Cases
* Sequencing
* While loops