# Logic
A logic consists of three things: 
* A Language which is defined by a `syntax` - a set of rules defining abstract symbols, for example in propositional logic $\land , \lor$
* A meaning - or the `semantics` of a language. Semantics deal with the content behind a sentence, what it means and whether it is valid, satisfiable or neither?
* an inference system -  A syntactic device used to determine the meaning of a formula. They act as a sort of bridge between the syntax and the semantics of a language.
A `formal logic` will contain these things in a formal and unambiguous way.

### Propositional Logic

$$
prop ::= p|q|r|...
$$

$$
fm ::= prop|\neg(fm)|(fm \land fm)|(fm \lor fm)
$$ 

A literal is a proposition or it's negation.

The main connective is the connective with the largest scope.

A valuation maps propositions to a meaning (Either true or false).

A formula $\phi$ is 

* Valid if for all possible valuations.
* Satisfiable if true in at least one valuation.
* Logically equivalent to another proposition if they both evaluate to the same thing for each valuation.

### Predicate Logic

For a Language $L(C, F, P)$

* *$C$ is a set of constant symbols
* $F$ is a set of function symbols. Each function $f$ has an arity denoted by $f^n$, where $n$ is the number of arguments the function takes.  
* $P$ is a set of predicate symbols. Each predicate $p$ has an arity denoted by $p^n$ which specifies the number of arguments the predicate takes.

There are also a countably infinite set of variables $V$. A term is said to be `a closed term` if it contains no variables. A formula is said to be a `sentence` if it contains no free variables.
$$
term = c(c\in C) | v(v\in V)|f^n(term_0, term_1, ...,term_{n-1})(f^n \in F)
$$
$$
atom=p^n(term_0, term_1, ..., term_{n-1})(p^n \in P)
$$
$$
fmla = atom|\neg fmla | (fmla_1\lor fmla_1) | \exists{v}fmla(v\in V)
$$

A structure $S=(D,I)$ for a language, $L(C,F,P)$, is a non-empty set $D$ and an interpretatation $I$ where $I = (I_c, I_f, I_p)$, $I_c$ maps constant symbols to elements of $D$, $I_f$ maps nary function symbols in $F$ over $D$. This means it will take in $n$ elements of $D$ and return a single element of $D$. $I_p$ maps an n-ary predicate symbol $p\in P$ to an n-ary relation over $D$. If $P$ includes the equality symbol then the symbol is always binary and is always interpreted as true equality: $\forall{x} =(x,x)$.

Variable assignment maps a variable symbol from $V$ to an element in $D$. Variable assignments are equal if for assignments $A$ and $A^\prime$ , $A(x) = A^\prime(x)$ for all $x\in V$. Terms evaluate




