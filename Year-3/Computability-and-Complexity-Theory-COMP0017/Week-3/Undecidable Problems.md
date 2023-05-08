Due to the [[Church-Turing-Conjecture]] any problem that is unsolvable by a turing machine it will also be unsolvable by a well defined step-by-step procedure (like C++ and python).

The degrees of solvability include:
* [[Decidability-and-Recognizability#Decidability|Decidability]]
* [[Decidability-and-Recognizability#Recognisability|Recognisability]]
* Non-recognisability - a problem that is not solvable by any turing machine

### Recognisability - The Halting Problem

We claim that this problem is recognisable but undecidable.

The language $HALT = \{<y, x> \in \Sigma^* \Sigma^* | y =code(M) \text{ and M halts on x}\}$ 

To show that the language is undecidable we can use proof by contradiction:
* Assume that $HALT$ is decidable, and call $M_H$ the turing machine that decides it.
* This means for $<code(M), x>$, if $M_H$ halts on an accepting state if $M$ halts on $x$, and halts on a rejecting state if it does not. 

![[Pasted image 20221101121420.png]]

We can then define a new turing machine $M^{\prime}$ which takes $z$ as input, and attempts to run $M_H$ on input $<z,z>$. If $M_H$  rejects, we halt and $M_H$ accepts we loop. In other words if $z$ halts on the input of itself, we loop, if not we halt.
![[Pasted image 20221101121901.png]] ^5f27ef

We then run $M^\prime$ on itself:
* If $M'$ halts on itself as input it will loop
* If $M'$ does not halt on itself it will halt. 
Here we have a contradiction.

If $M_H$ accepts $<code(M'), code(M')>$ then $M'$ will not halt on $code(M')$ due to its [[Undecidable Problems#^5f27ef|definition]]. However this means that $<code(M'),code(M')>$  is not in the langauge of $HALT$. Which therefore means that $M_H$ does not accept $<code(M'),code(M')>$.

In the other direction if $M_H$ rejects $<code(M'),code(M')>$ then $M'$ will halt on input $code(M')$. This means that $<code(M'),code(M')>$ is in the language $HALT$ and therefore $M_H$ accepts $<code(M'),code(M')>$. 

Because of this, there cannot possibly be a turing machine $M_H$, making $HALT$ undecidable.

### Unrecognizability - HALT's Complement
**Theorem**: The complement of $HALT$, $HALT^-$ is not recognised by any turing machine: 
$$
\begin{align}
&HALT = \{<y, x> \in \Sigma^* \Sigma^* | y =code(M) \text{ and M halts on x}\}\\
&HALT^- = \{<y, x> \in \Sigma^* \Sigma^* | y \neq code(M) \text{ for any M or } y=code(M)  \text{ and M does not halt on x}\}
\end{align}
$$
This is again proved using contradiction:

Assume that $H^-$ is recognisable and let $M_{H^-}$ be the TM recognising it. We define $M''$ as follows:
* $M$ takes $z$ as input and simulates input $<z,z>$ on $M_{H^-}$
* If $M_{H^-}$ halts then we $M''$ halts
* If not we loop (we dont have a choice here since we cant determine if a program loops without looping ourselves)
![[Pasted image 20221101124220.png]]

Now we run $M''$ on itself.
* If $M''$ does not halt on itself as input then it will halt.
* If $M''$ halts on itself as input then it will loop
Again we have a contradiction

If $M_{H^-}$ halts on $<code(M''), code(M'')>$ then $M''$ halts on $code(M'')$. This however means that $<code(M''),code(M'')>$ is not in the language $HALT^-$. Which means that $M_{H^-}$ should not halt on $<code(M''),code(M'')>$.

In the other direction If $M_{H^-}$ does not halt on $<code(M''), code(M'')>$ then $M''$ does not halt on $code(M'')$. This however means that $<code(M''),code(M'')>$ is in the language $HALT^-$. Which means that $M_{H^-}$ should halt on $<code(M''),code(M'')>$.

Because of this, there cannot possibly be a turing machine $M_{H^-}$, making $HALT$ unrecognisable.

#### Alternate proof
We could also prove $HALT^-$ is unrecognisable by showing that if it were, then $HALT$ would be decidable. This is done by assuming such a machine that recognises $HALT^-$ exsists, $M_{H^-}$. We then have a machine that recognizes $HALT$ (we already know this is recognisable). If we run both these machines in parallel, one of them is guaranteed to terminate as they are both recognizable. This therefore means that we can decide the language of haltable problems.

