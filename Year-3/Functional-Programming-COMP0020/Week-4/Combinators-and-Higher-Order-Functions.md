
A **higher order function** is a function that either takes in a function as an input, or returns a function, or both. **Currying** is the process of reducing a function that has multiple arguments to functions that each take in one parameter. **Combinators** are a set of general purpose "particular functions". 

### Combinators

A term `M` is a combinator if there are no free variables in it. There are 5 combinators:

###### Identity
```
I x = x
```

###### Constancy
```
K x y = x
```

###### Interchange

```
C x y z = x(z y)
```

###### Composition
```
B x y z = x (y z)
```

###### Fusion

```
S x y z = (x z) (y z)
```

All of the combinators can be defined in terms of the `S` and `K` combinators. Since all of the combinators can be used to produce any I calculus term, the `S` and `K` combinators can be used to compute anything that is computable.

###### The U and J Combinators

There are two additional combinators, which can be used to further condense the language used to build programs.

$$
\begin{align}
U\ f\ g = f\ x | ^{x} g\ x
\end{align}
$$
$$
\begin{align}
J x = 
\begin{cases} 
U, \text{ if } x = K \\
K, \text{ if } x = S\\
S, \text{ otherwise } 
\end{cases}
\end{align}
$$

### Higher Order Functions

All curried function are higher order functions:

```
sumThree :: num -> num -> num -> num
```

sumThree takes in a number and returns a function that takes in a number and returns a function that takes in a number and returns a number, which should be the sum of the three input numbers. 

It is also valid to only pass in two input arguments to `sumThree`, which will in turn return the type `num -> num` - a function which takes in a number and returns a number. This is called **partial application** and can be done for any of input arguments.