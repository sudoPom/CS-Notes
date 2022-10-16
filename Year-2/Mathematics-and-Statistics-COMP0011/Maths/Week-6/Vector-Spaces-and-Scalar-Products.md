# Vector Spaces & Scalar Products

A vector is the idea of a direction with magnitude. For example a force is a vector as it has a magnitude (measured in newtons) and a direction.

Vectors only show relative displacement (change in position) and they do not encode an actual position. 

Two vectors are the same if they have the same direction (they are parallel) and they have the same magnitude. 

## Operations

Vectors support scaling as well as addition. 

A vector $[x,y]$ scaled by the real number $n$ becomes $[nx, ny]$. If the magnitude of a vector is negatively scaled ie $M \to -M$ the direction is reversed. $-2M$ has twice the length of $M$ and acts in the opposite direction.

Vectors $[a,b]$ and $[c,d]$ can be added to form the vector $[a+c, b+d]$. Only vectors of the same dimension can be added.

These operations are:

* Commutative
* Associative 

* Distributive 

## Vector Space

Vector space is a set $V$ which has the following properties:

* Addition and subtraction are defined and the result is another vector.

* The set is closed under linear combinations (scaling , addition and a mix of both)

* There is a 0 vector such that:
  $$
  \forall v \in V, 0 + v = v \newline
  \forall v \in V, 0 \times v = 0
  $$

The spanning set of a set of vectors, $S$  is all the vectors that can be represented as a linear combination of some vectors in S:


$$
S = \{v_1, v_2, v_3,..., v_n\} \newline
span(S) = \{w, w=\sum^{n}_{i=1}\lambda_iv_i\}
$$
A spanning set is linearly independent if $\sum^{n}_{i=1}\lambda_iv_i = 0$, which occurs when $\lambda_1 = \lambda_2 = ... = \lambda_n = 0$. Any member of this set is not a linear combination a linear combination of other members in the set.

Eg:
$$
S= \{v_1, v_2, v_3\} \newline
where \space v_3 = \alpha v_1 + \beta v_2
$$
$S$ is not linear independent since $v_3$ is made up of a linear combination of some elements in $S$

The number of linear independent vectors in a spanning set $S$ is the dimension. If the span of $S$ is the vector space $V$  and the vectors are linearly independent, then these vectors are called the basis of $V$.

## Euclidean Spaces

### Scalar product

The scalar product, or dot product, between two vectors $u,v$ is $\abs{\abs{u}\abs{v}}\cos{\theta}$ Where $\theta$ is the angle between the two vectors.

It is also calculated like this: $\sum^{n}_{i=1}u_iv_i$

If $u$ and $v$ are orthogonal (perpendicular ) to each other, the dot product is 0.

The scalar projection of two vectors is calculated by $\frac{u.v}{\abs{\abs{v}}}$ and it shows how much of $u$ is present on $v$.

The angle between two vectors is found by taking the $arccos$ of the dot product of the two vectors. 

If all vectors are pairwise perpendicular and each have a magnitude of 1, the basis is said to be orthonormnal.



### Vector product

The vector, or cross, product of two vectors $u,v \in R^3$ is defined to be:
$$
\vec{u}\cross\vec{v} = \abs{\abs{\vec{u}}\abs{\vec{v}}}\sin(\theta)\vec{n}
$$
The magnitude of this vector is the area between the two vectors and the direction of the vector is the normal to both the vectors.

Vector products are:

* Not commutative: $u\cross v \neq v \cross u$
* Distributive
* Parallelism: if $u \cross v = 0 $ then $u$ and $v$ are parallel.

 