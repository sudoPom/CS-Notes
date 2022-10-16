# Vector Spaces 

A vector space is any set $V$ that follows linearity:
$$
\forall xy \ and \ \forall a \in K  \newline 
a*x \in V, \newline
x+y \in V
$$
In english, a set is a vector space if adding any two elements in the set will result in another element in that set, and scaling any element in the set by some element of a field, eg: $a \in R \or a \in C$ will also result in another element in the set.

A field is a set with a 0, 1, + and * multiplication can be inverted unless it is $n*0$ (There is an underlying divsion).

## Span

The span of a set of vectors are all of the possible vectors that can be made up out of the linear combination of all the vectors in the set.

A set of vectors is `linearly independant` if no vector in the set can be formed from a linear combination of all the other vectors in the set.

Another way of saying this is that if the linear combination of all the vecotrs is 0, then the set of vectors is linearly independant if all of the scalers in the linear combination are 0.

The `basis` of a vector space $V$ is a potentially infinite subset  $S$, such that the span of $S$ is $V$ and all of the elements in $S$ are linearly independant. The dimension of $V$ is equal to the size of $S$.

The set of all polynomials is an example of a vector space with an infinite basis.



A linear map is a function from vector space $u$ to vector space $v$. The image of a function is the set of all the possible outputs after applying the function to a vector.

The kernel of a linear map is the set of all input vectors $u$ such that $f(u) = 0$.

Every linear map can be represented as a matrix.