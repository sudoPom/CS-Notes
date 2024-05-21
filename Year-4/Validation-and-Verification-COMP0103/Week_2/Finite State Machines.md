---
id: Finite
created_date: 09/05/2024
updated_date: 09/05/2024
type: note
links: 
---
* **🏷️Tags** : #Validation-and-Verification-COMP0103 
# Finite State Machines

Many real systems have some internal states. Such systems may be defined in state based machines, such a finite state machines. This model includes a set of logical states and transitions between these states. Each state typically represents some set of values for the state variables. Each transition represents the use of some operations to a state.

A deterministic FSM (Finite State Automata) is defined by a tuple $(S,S_1,X,Y,\delta,\lambda)$ where:
* $S$ is a finite set of states and $S_1$ is the initial state
* $X$ is the finite input alphabet.
* $Y$ is the finite output alphabet.
* $\delta$ is the state transition function.
* $\lambda$ is the output function

$\lambda$ takes in the state and input symbol to produce an output whilst $\delta$ takes in a state and an input symbol to produce a state.

A FSM is initially connected if every state can be reached from the initial state, whilst it is strongly connected if for each pair of states there's a sequence of transitions that can move the FSM from the first state to the second.

A FSM is equivalent to another FSM if they both produce the same output on all inputs in the same sequence. A FSM is minimal if no equivalent FSM exists with fewer states. 

A reset operation takes the FSM to its initial state. This can be used to reset the machine between separate tests.

##### Faults in FSMs

Faults in FSMs are usually produced by outputs (a transition has the wrong output) or through state transitions (a transition goes to the wrong state.)

Finding output faults can be done by executing transitions. The transition tour method generates a single sequence that covers each transition. The FSM is assumed to be fully specified, so we just compare the observed output to the specification. All this requires is an input sequence that will take us through all transitions in the FSM.

Transition tours can be done by:
* Choosing an edge we have yet to take
* Adding a path from where we are to the source node of this edge.
* Adding the edge.

Finding state transfer faults requires checking that each transition goes to the correct state.  This is done by:
* Getting to the start state of the transition.
* Executing the transition
* Checking if the end state is the right one.

We need to be able to determine the current state we are in based on the output of the FSM. This can be done in a few ways:
* A distinguishing sequence is an input sequence $D$ that, for every pair of states $s,s^\prime$ of the FSM such that $s \neq s^\prime$ we have that $\lambda(s,D) \neq \lambda(s^\prime,D)$, or all states produce unique outputs in response to $D$, meaning we can identify the state. Not all FSMs have a distinguishing sequence. 
* A sequence $x/y$ is a unique input output (UIO) for a given state if:
	* $y=\lambda(s,x)$ for every state $s'$ of $M$ such that $s \neq s'$ and we have that $\lambda(s,x) \neq \lambda(s',x)$. This means that every input symbol to the state produces a different output, so we can uniquely identify the state using the input $x$.
* A characterising set ($W$) is a set of input sequences that for every pair of states $s,s'$ such that $s\neq s'$ we have for some $w$ in the characterising set that $\lambda(s,W) \neq \lambda(s,W)$. This means that for each pair of states there exists at least one pair of states that distinguishes them. There is always a characterising set for a minimal FSM.

Chow's Method of checking if the transition leads to the correct state is based on the following:
* An input set $X$
* a characterising set/distinguishing set or $W$
* a state cover set $V$
* and a reliable reset
The resulting test set is $VW \lor VXW$ 
The $V$ will get us to what we believe is the source state of the transition. $W$ will check that we are actually in the source state of the transition. The reliable reset is then used to return to the source state. We then use $V$ to get back to the source state (now that we are really in the source state). The $X$ will then provide produce some input symbol that will go along the transition we want to test. Lastly $W$ is used again to verify we are really in the state we expect to be in after the transition.

The state cover set $V$ is a set of sequences such that each state of $M$ is reached by a sequence from $V$
# Questions / Thoughts