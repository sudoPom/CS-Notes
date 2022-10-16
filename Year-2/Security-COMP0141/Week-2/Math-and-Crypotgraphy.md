# Math and Cryptography 

Finite fields $F_p$ are used in cryptography for very large prime $p$. (1024 bits or more). (1)

The ring of ($Z/NZ$)* for $N=pq$ for very large primes $p,q$ is also used in cryptography. (2)

## Discrete Logarithm (1)

The `discrete logarithm problem` is: Given a large prime number $p$ and two numbers $g,y$ find $x$ such that $g^x = y\mod{p}$.  There is no (discovered) efficient algorithm to calculate this, even with modern technology it will take an unreasonable amount of time to compute. Quantum computers may be able to efficiently calculate this, which would break cryptography.

## The ring (Z/NZ)*

The `Euler Totient function` $\phi$ is $\phi(n)=|\set{x \in \set{0,...,N-1}|gcd(x,n)=1}|$

`Euler's theorem` states that $x^{\phi(N)} = 1 \mod N$ for $x\in(Z/NZ)*$

Let $N = pq$ for $p,q$ being two large primes.

The `RSA problem` is: Let $N = pq$ for $p,q$ being two large primes. Given $N$, find $p$ and $q$. This can be computed using Eulers theorem:
$$
\begin{align}
\phi(pq) = pq - |x:gcd(x,pq)|\neq1|\\
=pq - |\set{x:p|x}|-|\set{x:q|x|}-\set{0}\\
=pq-q-p-1=(p-1)(q-1)
\end{align}
$$
These two functions are `One way functions` - functions that are easy to compute but difficult to invert.