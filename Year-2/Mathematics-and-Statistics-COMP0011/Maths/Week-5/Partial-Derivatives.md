# Partial Derivatives

A multi variable function takes in multiple inputs and produces an output:

$f(x,y) = 2x^2 +3xy$

## Partial Derivatives

The partial derivative of a function is the derivative of the function with respect to a single argument. For the function $f$ (above) that takes in arguments $x$ and $y$. The partial derivative with respect  to x is as follows:
$$
f_x = 4x + 3y
$$
And with respect to y:
$$
f_y = 3x
$$
$f_{xy}$ Means take the partial derivative of $f$ with respect to $x$ followed by the partial derivative of $f$ with respect to $y$

Partial differentiation is commutative for a defined and continuous function $f$:
$$
f_{xy} \equiv f_{yx} \forall{x,y}
$$
Partial derivatives can also be expressed as the following:
$$
\frac{\partial f}{\partial x} = f_{x} \newline \frac{\partial ^ 2 f}{\partial x \partial y} = f_{xy}
$$

## Critical Points



A point $(a, b)$ is a critical point of $f$ if $f_{a} = f_{b} = 0$

The type of critical point can be determined using the second derivative test:
$$
A = f_{xx} \newline
B = f_{xy} \newline
C = f_{yy} \newline
D = AC - B^2
$$

* When $D > 0$ and $A > 0$, the critical point is a local maxima.
* When $D > 0$ and $A < 0$, the critical point is a local minima.
* When $D < 0$ the critical point is a saddle point.
* If $D = 0$ we can't find out anything.

