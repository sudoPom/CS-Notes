The **Mapping Reduction** proof is a method of proving a language is undecidable/unrecognisable by reducing a problem which we know is undecidable/unrecognisable to the given language. For example, the language $ETH$ = {$x\in \Sigma^* | code(M) \text{ and M halts on } \epsilon$} can be shown to be undecidable by reducing the halting language to the empty string language.

### Proof that ETH is Undecidable
This proof is done by contradiction. First we assume that there $ETH$ is decidable, meaning there exsists a turing machine $M_{ETH}$ that decides the language. 

We can then construct a machine $M_H$ that will decide if a turing machine halts on a given input.
$M_H$ is defined as follows:
On input $<y,x>$ :
* If $y$ is not the code of a turing machine, we halt and reject.
* If $y$ is the code of a turing machine, $M$, we construct a new turing machine $M_{M,x}$ such that:
	* $M_{M,x}$ enters a loop on a non empty string
	* On empty input $\epsilon$ write $x$ on tape and simulate $M$ on $x$
* $M_H$ accepts if $M_{ETH}$ accepts $M_{M,x}$, otherwise reject.

However we know that $HALT$ is an undecidable language therefore $ETH$ is also undecidable.

## Mapping Reduction

**Mapping reduction** is a proof method where the main insight is understanding how to reduce the instances of one problem to another. The above is an example, we turned the $HALT$ question into a $ETH$ question.  If $L'$ reduces to $L$ then:
* The decidability of $L'$ reduces to the decidability of $L$
* The recognisability of $L'$ reduces to the recognisability of $L$

Given languages $L$ and $L'$ over an alphabet $\Sigma$, we say that $L'$ mapping reduces to $L$  and write $L' \leq L$ if there is a TM that computes a toal function: $f: \Sigma^* \to \Sigma^*$ such that:
$$
\begin{align}
x\in L' \iff f(x) \in L
\end{align}
$$
The function $f$ converts the membership problem for $L'$ to a membership problem for $L$. Intuitive reading of $L' \leq L$ means that $L$ is at least as difficult as $L'$ where difficulty is how computable something is:

* If $L' \leq L$ and $L$ is decidable then $L'$ is decidable.
* If $L' \leq L$ and $L^\prime$ is undecidable then $L$ is undecidable.
* If $L' \leq L$ and $L^\prime$ is unrecognisable then $L$ is unrecognisable.

Therefore, it is enough to give a *computable* function $f$ that maps the inputs of one problem to another.


### Reducing Halt- to Equivalence 

To show that turing machine equivalence is unrecognisable we can reduce another unrecognisable problem ($HALT^-$) to it.

$$
\begin{align}
EQ &= \set{<y,x> | y = code(M_1), x =code(M_2)~~~M_1,M_2\in TM \text{ and the TMs represented by x and y are equivalent}}\\
HALT^- &= \set{<y,x> | y = code(M) \notin TM \text{ or } y =code(M) \in TM \text{ and M does not halt on input x}}
\end{align}
$$

We need to come up with a function such that:
$$
\begin{align}
<y,x> \in HALT^- \iff f(<y,x>) \in EQ
\end{align}
$$
Which is equivalent to saying:
$$
\begin{align}
<y,x> \in HALT \iff f(<y,x>) \in EQ^-
\end{align}
$$

We can define such a function, $f$, as:
* If $y$ is not the encoding of a turing machine:
	$f(<y,x>) = <code(M), code(M)>$ for any TM $M$
	This means that $<y,x>$ is not in HALT since $y$ is not a turing machine, but $f(<y,x>)$ is since any turing machine is equal to itself.
* If $y$ is the encoding of a turing machine $M$:
	* $f(<y,x>)$ = $<code(M_1), code(M_2)>$ where:
		* $M_1$ simulates $M$ on input $x$ when given any input and halts if the simulation halts and loops if the simulation does.
		* $M_2$ always loops.
	This means that if $<y,x>$ is in $HALT$ then $M_1$ will (always) halt and since $M_2$ always loops (never halts) $M_1$ and $M_2$ are not equivalent and are therefore also in $EQ^-$

	Similarly if $<y,x>$ is not in $HALT$ then $M_1$ will not (ever) halt and since $M_2$ always loops that means that they are equivalent and therefore are also not in $EQ^-$

Therefore $HALT^-$ reduces to $EQ$. From this we can draw the conclusion that $EQ$ is unrecognisable.

In general for any non trivial language ($L \neq \emptyset$ and $L\neq \Sigma^*$) $L^`\leq L$ if $L^`$ is decidable.

Reduction is:
* Reflexive, Every language can be reduced to itself $L \leq L$
* Transitive, if $L^` \leq L$ and $L \leq L^{``}$ then $L^` \leq L^{``}$
* Not symmetric

Reduction also holds with complementation:
$$
\begin{align}
L_1 \leq L_2 \iff L^-_1 \leq L^-_2\\
\end{align}
$$

### Turing Reducability

An *oracle* of a language $L$ is an external device that can answer the membership question of language $L$. 

A language $L^`$ is *Turing-Reducible* to $L$ if we can decide $L^`$ given an oracle to $L$. Mapping reducibility implies Turing reducibility.