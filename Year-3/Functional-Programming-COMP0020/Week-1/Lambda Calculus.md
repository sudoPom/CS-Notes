λ

Lambda calculus was developed by Alonzo Church and is the basis for functional programming languages. It is a notation for identifying and specialising abstraction points in expressions. The lambda calculus can be used as a target language for functional programs to be compiled down to.

There are two types of λ Calculus. λI and λK calculus. In λI calculus all argument variables to a function must be used, while in λK they do not need to be used.

The "pure type free" lambda calculus has only three constructs:

```
exp => ident : Variables
(λident . expression) OR (λident expression) : Functions
(exp_1, exp_2) : Application
```

Under the following alphabet:
$$
\begin{align}
v_0,v_1\dots &\text{ Variables}\\
\lambda &\text{ Abstractor} \\
( ~, ~) & \text{ Parentheses}
\end{align}
$$

The outer parenthesis are normally ommited and non outer `λ`s are also ommited for simplicity.

A variable is a way to abstract away an expression

A function identifies a variable `ident` as an abstraction for it to be used in the function body - the `exp`. Functions can be nested. Functions are higher order functions meaning they can accept other functions as arguments and areturn functions. Functions do not have names but their arguments can. The only acception to this is when a function is passed into another function as an argument, in which case it becomes bound to the name of the argument.

Application applies the function expression ($exp_1$) to the argument expression through beta reduction. This causes some form of the argument function to replace all occurences of the bound variable in the function expression. Application associates to the left, so $M N P = (M N) P$

### Beta Reduction

`(λf a.f a) (λs.s s) (λx.x)`

In the above function expression `(λf a.f a) (λs.s s)` we replace all occurences of `f` with `(λs.s s)` to get the new function:

`λa.(λs.s s) a `

In the original function we now have:

`(λa.(λs.s s) a) (λx.x)`

Repeating we now replace all occurences of `a` in `λa.(λs.s s) a ` with `(λx.x)` to get:

`(λs.s s) (λx.x)`

Next we replace all occurences of `s` in `(λs.s s)` with `(λx.x)` to get:

`(λx.x λx.x)`

Which finally reduces to:

`λx.x`

###### Alpha Reduction 
Alpha reduction essentially changes the name of a bound variable.

###### Delta Reduction
Used to reduce expressions including operators like + and $\times$. This only applies for a λ calculus which has been extended with constants. 

###### Eta Reduction
Eta reduction removes an argument from a function if its not used.

### How to Reduce

A λ term that can be reduced is called a rede - "reducable expression". Repeatedly reducing a redex until there are no more $\beta$ redex sub terms in the λ term, then the result is in normal form. Not all terms have normal forms. A reduction strategy is the order of which you reduce a λ term, like always expanding the leftmost redex in the expression. If the λ calculus has been extended with constants, then there must be no more $\beta$ and $\delta$ redex subterms.
* Normal Form
	* A variable `x` is in normal form.
	* `M N` is in normal form if `N` is in normal form and `M` is not an abstraction. 

##### Head Normal Form

A term $M$ is in head normal form if it is of the form:

$$
\begin{align}
\lambda x_1 ... x_n ~ . ~ (x~N_1...N_m)
\end{align}
$$
Where $n,m \geq 0$ and $x$ is a variable (head variable).

##### Weak Head Normal Form

A term $M$ is in weak head normal form if it is of the form:
$$
\begin{align}
\lambda x_1 ... x_n ~ . ~ (x~N_1...N_m)
\end{align}
$$
or
$$
\begin{align}
\lambda x ~ . N
\end{align}
$$
Neither head nor weak head normal form are unique. 


###### Church-Rosser Theorem
All reduction orders lead to the same unique normal form if they terminate.

###### Normal Order reduction

Normal order reduction is done by using the leftmost reduction strategy and is guaranteed to produce a λ term in normal form. However this is slow in some cases.

###### Applicative Order Reduction
Applicative order reduction is similar to “call by value” passing of function arguments and often faster than normal order reduction but may not always terminate.


### Scope
Scope defines where a variable is defined. If a variable is defined, it is in scope and bound variable. If a variable is not in scope then it is a free variable. For example:
```
λx.(x+y) 
```

`x` is bound here while `y` is free.

### Encoding Numbers

In the basic λK calculus there are no constants, so we need to encode numbers using functions. These are called the Church Numerals:

```
0 = λf.λx.x
1 = λf.(λx.(f x))
2 = λf.(λx.(f(f x)))
etc...
```

### Free Variable Capture

Free variable capture causes problems when an argument is equal to a variable name defined in the λ term. Free variable capture can be avoided by using [[Lambda Calculus#Alpha Reduction|alpha reduction]] to change the name of any free variables in the expression that appears in the argument.