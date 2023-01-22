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
**Mapping reduction** is a proof method where the main insight is understanding how to reduce the instances of one problem to another. The above is an example, we turned the $HALT$ problem into a $ETH$ question.  If $L'$ reduces to $L$ then:
* The decidability of $L'$ reduces to the decidability of $L$
* The recognisability of $L'$ reduces to the recognisability of $L$

Given languages $L$ and $L'$ over an alphabet $\Sigma$, we say that $L'$ mapping reduces to $L$  and write $L' \leq L$ if there is a TM that computes a toal function: $f: \Sigma^* \to \Sigma^*$ such that:
$$
\begin{align}
x\in L' \iff f(x) \in L
\end{align}
$$
The function $f$ converts the membership problem for $L'$ to a membership problem for $L$. Intuitive reading of $L' \leq L$ means that $L$ is at least as difficult as $L'$.

* If $L' \leq L$ and $L$ is decidable then $L'$ is decidable.
* If $L' \leq L$ and $L$ is undecidable then $L'$ is undecidable.
* If $L' \leq L$ and $L$ is unrecognisable then $L'$ is unrecognisable.
