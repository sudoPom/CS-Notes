# The Church Turing Thesis
The **church turing thesis** is the claim that turing machines are all we need in order to express an algorithmic solution to a problem. There is no proof for this as it is a conjecture, but there is a large amount of evidence supporting it. This essentially means that **turing machines can compute the same class of functions** (albeit less efficiently) as:
* Classic computers
* Register machines
* Programming Languages
* Quantum Computers

Turing machines are inherently slower than other models due to it's sequential data access method. They are also a lot harder to design.

However, turing machines provide a firm mathematical basis to rigorously define an algorithm. This includes probabilistic, deterministic, non deterministic and quantum algorithms. They can also be used for proving mathematical proofs for what is and isn't computable by any computer.

There are two ways to provide evidence for the Church-Turing thesis:
* Show that the definition of Turing machines is robust
* Show that other models of computers are equivalent to Turing machines.

## Variations of a Turing Machines
There are a few variations of the turing machine, such as:
* Adding more tapes
* Adding more heads
* Infinite in the left and right direction
* Non determinism

All these changes make computation more simple and design more convenient but are still equivalent to standard turing machines.

#### Multi-tape Turing machine
Input begins with the input on tape 1, and all other tapes blank. At each step, all heads are in the same state but read symbols on different tapes, and may perform different actions depending on the symbols read. If a halting state is reached then the output is read from the first step.

Formally this model is defined similarly to standard turing machines.
![[Turing-Machines#^184f03]]

The transition function is defined as:
$$
\begin{align}
\delta: (Q/H)\times\Sigma^k\to Q \times(\Sigma\lor\set{\rightarrow,\leftarrow})^k
\end{align}
$$
To prove that this type of turing machine $M$ is equivalent to regular turing machines $M^\prime$ we need to show that we can construct a single tape turing machine such that given the same input $x$. $M$ halts on $x$ if and only if $M^\prime$ halts.

##### Proof

^caaa80

If $M$ is based on alphabet $\Sigma$, $M^\prime$ will be based on alphabet:
$$
\begin{align}
\Sigma\lor\set{\bar{a}|a\in\Sigma}\lor\set{\#}
\end{align}
$$
Where a $\#$ acts as a delimiter between the different tapes, and a character with a bar ($\bar{a}$) represents the position of the head on each state.

![[Pasted image 20221011124132.png]]

Becomes

![[Pasted image 20221011124148.png]]

Proofs of this form are not typically very precise. However nobody has the time to define $M^\prime$ in full, so it is good enough to define the main change needed to be made to $M^\prime$. 

#### Two-way infinite tape Turing machines
These turing machines have the same definition as a standard TM, but works  
on a tape that is also unbounded on the left.

![[Pasted image 20221011125142.png]]

The definition of this turing machine is exactly the same as regular turing machine but does not have the restriction of moving right on the start symbol.

##### Proof
This can be proved by using the [[The-Church-Turing-Thesis#^caaa80|previous proof]] - creating a mult-tape turing machine from a standard turing machine.

#### Non-deterministic Turing Machine
These have the same definition as a standard turing machine but the transition function becomes a **transition relation**:

$$
\begin{align}
\delta: ((Q/H) \times \Sigma) \times (Q\times(\Sigma\lor\set{\rightarrow,\leftarrow}))
\end{align}
$$
At each step, there are multiple actions you can take - thus formin a tree of sequences, rather than a sequence.

![[Pasted image 20221011130002.png]]

##### Proof
The idea behind the equivalence between $M^\prime$ and $M$ is that we perform a breadth first search on the computation tree and if one path accepts then we accept. A breadth first search is required as it is not vulnerable to looping paths.

This can be done using three tapes, an input state, a simulation tape, which is used to explore a branch and an index tape which keeps track of which branch we are on.