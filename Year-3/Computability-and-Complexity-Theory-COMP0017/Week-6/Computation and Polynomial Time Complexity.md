---
id: Computation
created_date: 18/11/2022
updated_date: 10/04/2023
type: note
links: 
---
* **🏷️Tags** : #Computability-and-Complexity-Theory-COMP0017 
# Computation and Polynomial Time Complexity

Given a turing machine $M$, let $T$ be a function $T: N \to \Bbb{N}$ stating that if the input tape to machine $M$ has n symbols, then $M$ must halt within $T(n)$ steps. $T(n)$ is the upper bound for the **time complexity** of $M$. If $M$ does not halt on the problem then $T(n) = \infty$.

The time complexity of a problem is the time complextiy of the best algorithm that solves it. The time complexity of an algorithm is the time complexity of the best implementation of the algorithm. Time complexity of course vaires depending on the computation model (turing machine vs RAM machine). That being said most deterministic models are polynomially equivalent.

### Polynomial Time

Generally a polynomial is of the form:
$$
\begin{align}
p(n) = a_kn^k + a_{k−1}n^{k−1} + \dots + a_{2}n^2 + a_1n + a0
\end{align}
$$
A Turing machine runs in polynomial time (p-time) if its complexity is bound by $p(n)$ for some polynomial $p$. If an algorithm can be implemented by a deterministic TM that runs in polynomial time, the algorithm also has polynomial complexity. All problems $P$ are in $\Sigma^*$ if they can be solved by an algorithm in  p-time. This is the set of tractable problems.

Problems that have a time complexity of less than  polynomial time like $\log n$ are still referred to as polynomial time. Problems that have a larger time complexity than polynomial are reffered to as super polynomial.

Super polynomials satisfies:
$$
\begin{align}
f(n) = n^{\omega(1)}
\end{align}
$$
Whereas sub polynomial functions satisfies:
$$
\begin{align}
f(n) = n^{o(1)}
\end{align}
$$
*In some cases exponential functions are actually faster than polynomial functions  for example $2^n$ is faster than $n^{100}$ for $n\leq 996$*.



### Input Size

When defining time complexity we need to keep into account the input size of the input. This depends on the encoding of the input. The following pseudocode runs in exponential time if $k$ is encoded in binary:

```
i = 2
While(i <= sqrt(k))
	if(i divides k)
		return False
	i++
return True
```

Runtime is $O(\sqrt{k})$ worst case but we need $n = \log_2k$ bits to represent $k$. So the complexity is $O(\sqrt{2^n})$ which is not polynomial.

A Polynomial language is in the set $P\subset \Sigma^*$. However for a problem to be in $P$ the encoding needs to be specified as this can change the time complexity.

# Questions / Thoughts