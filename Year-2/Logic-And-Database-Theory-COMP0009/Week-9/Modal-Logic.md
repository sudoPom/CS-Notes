# Modal Logic

There are two Modal Logic operators.

* $\diamond \phi$ means $\phi$ is possible
* $\square \phi$ means that $\phi$ must be true.

A way to interpret modal logic is by using frames. Or directed graphs. The edges represent what is possible at a given node (or world).

A valuation takes in a world in a frame, and returns an element of the power set of all the worlds in the frame. 

## Semantics

Given a frame $M = (W, R, V)\ Let\ v \in W$

$Rwz$ means that the world $z$ is accessible from $w$.

If $M,v \models\diamond\phi $ Then there is a $w, w \in W$ and $(v,w) \in R$ such that $M, w\models\phi$

If $M,v \models\diamond\phi $ Then for all $w, w \in W$ if $(v,w) \in R$ then $M, w\models\phi$.

### Validity

If a model is valid at any world:

​	$(W,R,V)\models\phi$ for all $v\in W$ $(W,R,V), v\models\phi$

Valid in a frame:

​	$(W,R)\models\phi$ for all valuations $V$, $(W,R,V)\models\phi$

Valid over a class of frames:

​	$K \models \phi$ means for all frames $F\in K$, $F\models\phi$ 

### Valid formulas

* Any propositional tautology is valid in modal logic. eg: $\square\diamond p \implies \square\diamond p$
* $\square(p\and q) \implies (\square p \and \square q)$
* $\square(p\implies q) \implies (\square p \implies \square q)$
  * However $\square(p\or q) \implies (\square p \or \square q)$ Is not valid

## Classes of Frames

A formula $\phi$ defines a frame if 	$F \models \phi\iff F\in K$, $F\models\phi$ 

### Reflexive 

$\square p \implies p$ If $p$ is true at every world connected to some world $w$, then $p$ is true at $w$. Or in first order logic $\forall w\ Rww$.

### Transitive

$\square p \implies \square\square p$. If p is true at every world connected to some world $w$ then is $p$ is true at every world connected to those same worlds connected to $w$.

### Symmetrical

### Dense 

