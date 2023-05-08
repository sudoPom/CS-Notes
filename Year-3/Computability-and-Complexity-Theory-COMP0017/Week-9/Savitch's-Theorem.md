---
id: Savitch's-Theorem
created_date: 18/04/2023
updated_date: 18/04/2023
type: note
links: 
---
[[The Ladder Game]]
* **🏷️Tags** : #Computability-and-Complexity-Theory-COMP0017 
# Savitch's-Theorem

*Savitch's theorem* states that all the languages that can be solved non deterministically in $NSPACE(f(n))$ can also be solved in $PSPACE(f(n)^2)$, given $f(n)$ is at least linear. 

To do this we convert a NDTM $N$ into a DTM $M$ while only squaring the space used. For configurations $c$, $c'$ and $k\in\mathbb{N}$ we want to know if $N$ can get from $c$ to $c'$ in at most $k$ steps:

![[Pasted image 20230418143008.png]]

This is similar to [[The Ladder Game|the ladder game]] as there are a constant number of changes that can be made at any given time.

![[Pasted image 20230418143510.png]]

To ensure that the NDTM has only one accepting configuration we can tweak the machine by reversing the head and erasing the tape before halting.

Since the NDTM $N$ uses $f(n)$ space there are $C= |Q| \times f(n) \times |\Gamma|^{f(n)}$ different configurations.

We therefore start by calling Reachable($c_0,c_Y,C$) where $c_0$ encodes the input specific starting configuration.

Again, like in the [[The Ladder Game|ladder game]] the depth of the recursion is equal to the total number of possible configurations, $\log_2C = O(f(n))$ and each time we recurse we store a configuration which requires $O(f(n))$ space, meaning that the total space complexity is $O(f^2(n))$. 

This shows that $PSPACE = NPSPACE$.

### PSPACE Completeness and TQBF

A problem is $\text{PSPACE-complete}$ if it is in $PSPACE$ and it is $PSPACE$ hard (every problem in PSPACE is polynomially reducable to the problem).

The TQBF problem can be shown to be PSPACE complete.
 
# Questions / Thoughts