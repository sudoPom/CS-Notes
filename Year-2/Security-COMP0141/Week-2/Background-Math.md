# Math for Security

## Basic Notation

* Sets: $A$ = {1, 2, 3}

* Cardinality: $|A| = 3$
* Set inclusion: $x \in A$ means $x$ is in the set $A$ 
* Integers: Whole numbers
* Division: $x | y$ means x divides evenly into y
* Set conditions: {$x:x|2$} the set of all even $x$s 

## Modular Arithmetic 

Given integers $x>0, y, z$ we write $z=y\mod{x}$ when $x | (z-y)$

For example $5=1 \mod{2}$ 

Given $x>0$ and $z$ we can find a unique $a$ and $y\in\set{0,1,...,x-1}$ such that:
$$
\begin{align}
z &= ax+y\newline
eg:\ 5 &= 2\times2+1\newline
&a=2 ~~~ y=1
\end{align}
$$
 

If $z=ax+y$ then $z=y\mod{x}$ since $z-y = ax$ and $x|ax$.

### Laws

Associativity holds for $\times$ and $+$.

Distributive laws hold: $a(b+c) = ab+ac\mod{N}$

Commutative holds: $a+b = b+a\mod{N}$

Additive Identity of 0: $a+0 = 0+a =  a \mod{N}$ 

Multiplicative identity of 1: $1(a) = a(1) = a \mod{N}$

Additive inverse: $a+(-a)=(-a)+a = 0 \mod{N}$

#### Multiplicative Inverse

Some numbers have multiplicative inverses, where $n\times x = 1\mod{N}$ where $x$ is the multiplicative inverse of $n\mod{N}$.

For example in the case of $3\mod{10}$:
$$
\begin{align}
3*7&=21\\
&=1+20\\
&=1+2*10\\
&=1\mod{10}\\
\therefore ~~ 3&=7^{-1}\mod{10}
\end{align}
$$
An element $a$ has a multiplicative inverse $\mod{N}$ if and only if $gcd(a,N)=1$. This inverse can be computed using the extended euclidean algorithm.

A number that does not have a multiplicative inverse in the ring $(Z/NZ)$ is also in the set $(Z/NZ)^*$.

All prime numbers only have divisors 1 and themselves. This means that for primes $p$, $\gcd(a,p) \in \set{1,p}$.

`Corollary of Bezout's Identity`: If $p$ is prime then for any $a\in\{1,...,p-1\}$ there is an inverse $r$ such that $1=ra\mod{p}$.

$(Z/pZ)^*$ contains all numbers from $0$ to $1$ when $p$ is prime

### Modular Exponentiation 

Often used in cryptography: $g^x\mod{p}$ 

The same exponentiation rules apply.

### Fields

A `field` is a commutative ring where all non-zero elements are (multiplicatively) invertible. A field $F_p$ is a field with $p$ elements , or has an order of $p$ and is therefore a `finite field`.

Prime-order finite fields have all the laws previously mentioned as well as the multiplicative inverse.

## Greatest common Divisor

The `GCD (Greatest common divisor)` of $a$ and $b$ is the largest number that divides both $a$ and $b$.

`Bezout's Identity`: For all $a,b$ there are $r,s \in \Z$ such that the $gcd(a,b) = ra+sb$.

The GCD of two numbers can be determined using the euclidean algorithm:

### Euclidean Algorithm

* Start by finding $r_0$ such that $a = q_0b+r_0$ so $r_0=b\mod{a}$
* then find $r_1$ such that $b=q_1r_0+r_1$ so $r_1=b\mod{r_0}$
* eventually, get $r_{n-2}=q_nr_{n-1}+0$
* This non zero remainder $r_{n-1}$ is the gcd of $a$ and $b$

The Extended euclidean algorithm can be used to determine Bezouts Identity.