# Discrete Random Variables
A `random variable` $X$ allocates a number to each point in the the sample space.

$$
X : \Omega \to \mathbb{R}
$$
A randome variable can be continuous or discrete:
* `discrete random varaibles` only have a countable set of possible values
* `continuous random variables` have an uncountable set of possible values

The number of values a discrete random variable can take is infinite or finite, whilst for continuous random variables the possible values are always infinite.

For a possible value $x_1$, the probability $p_1$ of getting that value is $P(X = x_1)$, or in other words the probability that the random variable $X$ evaluates to the value $x_1$.
$$
p_i = P(X = x_i)
$$

## Population Mean
The population mean for a given random variable can be found as follows:
$$
\mu = \sum^{N}_{i=1}{x_ip_i} = E(X)
$$
Where $E(X)$ is the `expected value` of the random variable $X$. The expected value does not necessarily have to take a possible value that can be expressed by the random variable. 
For a symmetric distribution of values, the expected value is just the value in the middle of the distribution.

## Population Variance
The population variance for a given random variable can be found as follows:
$$
\sigma^2 = \sum^{N}_{i=1}{(x_i-\mu)^2p_i} = Var(X)
$$
or
$$
\sigma^2 = \sum^{N}_{i=1}{x_i^2p_i-\mu^2} = Var(X)
$$
This is very similar to the equation of the sample variance, however the only difference is instead of multiplying by $\frac{f_i}{N-1}$ we multiply by $p_i$ as for a large $N$ the result of $\frac{f_i}{N-1}$ is approximately equal to the relative frequency, which is the same as $p_i$.

This is also known as the expected square distance of $X$ from $\mu$/

### Population Standard Deviation
Just like with the sample standard deviation, the population standard deviation is equal to the square root of the population variance.


## Independence of Random Variables
Two random variables, $X,Y$ are independent if the events $X=x_i$ and $Y=y_i$ are independent for all values $x_i$ and $y_j$.

$$
P(X=x_i)\land P(Y=y_j) = (X=x_i,Y=y_j) = P(X=x_i)P(Y=y_j)
$$

## Useful Results from Random Variables
### Population Mean
* For a symmetric distribution of values, the expected value is just the value in the middle of the distribution.
* $E(X+b) = E(X) + b$ When shifting a random variable by some constant, the mean also shifts by that constant.
* $E(aX) =aE(X)$ When scaling a random variable by some constant the mean also scales by that constant. 
* $E(X+Y)=E(X)+E(Y)$
* $E(X-Y)=E(X)-E(Y)$
### Population Variance
* $Var(X+a) = Var(X)$ The population variance does not change when shifting values by the same constant.
* $Var(aX) = a^2Var(X), \sigma(aX)=a\sigma(X)$ When scaling a random variable by some constant, the variance is scaled by the square of the constant.
* $Var(X\pm Y)=Var(X)+Var(Y)$ given $X$ and $Y$ are independent.