# Herbrand Structures

A `closed term` $t$ is built up from only constants and function symbols - no variables. Closed terms are not built from predicates.

A `Herbrand Struucture` $H = (D,I)$ has:

* a domain $D$ which is a set consisting of only closed terms .
* and a fixed interpretation $I = (I_c, I_f, I_p)$ (an interpretation for constants, functions and predicates) which maps all closed term to itself.  
  * $I_c(c) = c$
  * $I_f(f^n) : (d_1,...d_n) \to f^n(d_1,...,d_n)$
  * $I_p$ can be chosen freely, just a set of tuples of the right sort. (pairs for binary relations etc.)

* Every closed term is ubterpreted as itself.

Herbrand models are useful because to check if a FOL formula is valid we can't check all the valuations of all of the variables. If a FOL formula is valid over a herbrand structure, it is valid over all structures.

## Herbrands Theorem

 Let $L$ be a language with $\infin$ many constant symbols (with no equality predicate for this version of the theorem). If $\phi$ is satisfiable (i.e $S \models_A \phi$ for some abritrary $S$ and $A$) then $\phi$ is satisfiable in a Herbrand model $H$, i.e $H \models_A \phi$ for some $A$. 

### Fairness 

A `fair` schedule will ensure that any process waiting to be processed will be processed at some point in time. Further, if a process is always waiting for input, it will always be processed again and will therefore be processed infinitely many times.