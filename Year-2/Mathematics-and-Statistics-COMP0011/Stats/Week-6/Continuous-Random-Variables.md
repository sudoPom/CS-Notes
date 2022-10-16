# Continuous Random Variables
`Continuous random variables` can take an uncountably infinite number of values.

## Cumalative Distribution Functions

For continuous random variables, probabilities are characterised  by the `cumulative distribution function` $F(x) = P(X \leq x)$. This is because there are an infinite number of possible values of $x$. 

CDFs:

* Are non decreasing: $x < y \implies F(x) < F(y)$
* $F(\inf)=1$
* $F(-\inf) = 0$     

For all random variables it's CDF is continuous, for Continuous random variables the line the CDF makes when plotted is smooth whilst for discrete random variables the it is a step function.

The proabability that $X$ lies within an interval can be calcuated as follows:
$$
P(a < X \leq b) = (X \leq b) + P(X \leq a) = F(b) - F(a)
$$

## Probability Density Function
The derivative of the cumulative disttribution function of $X$ is defined to be the `probability density function`.
$$
f(x)=\lim_{\delta{x}\to 0}\frac{F(x+\delta{x})-F(x)}{\delta{x}} = \frac{dF(X)}{dx} = F^\prime(x) 
$$
For a PDF $f$:
* $f(x) \geq 0$ 
* $\int^b_a f(x) dx = [F(x)]^b_a = F(b) - F(a) = P(a < X \leq b)$ 
* $\int f(x) dx = [F(x)]^\inf_{} = F(b) - F(a) = P(a < X \leq b)$ 
