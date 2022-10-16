# Discrete Distributions 
## Bernoulli Distribution
A random variable $X$ has a `discrete distribution` with success probability $p$ if the random $X$ *has only two outcomes, success or failure, where the probability of success is $p$ and the probability of failure is $1-p$*.

![[Pasted image 20220217164542.png]]

The mean of a discrete variable modelling the bernoulli distribution is 
$$
E(X) = p
$$
and the variance is

$$
Var(X) = p - p^2
$$

## Binomial Distribution
For an experiment that has two outcomes, success or fail and a random variable $X$ where $X$ denotes *the number of independant successes recieved from the experiment after being conducted $n$ times*, the distribution of $X$ is:

$$
	P(X=k) = {n\choose k}p^kq^{n-k}\ \ \ \ \ \ \ (k = 0, 1, 2, ..., n)
$$
Where $p$ is the probability of success, and $q$ is the probability of failure. In this case$X$ is known to have a `binomial distribution` with parameter ($n,p$) . This can also be written as $X$~$Bin(n,p)$. Binomial distribution is only valid when successive experiments are indpendant of each other.

The expected value (population mean) is $E(X)=np$
The variance of $X$ is$Var(X) = np(1-p) = npq$.

## Geometric Distribution
The `geometric distribution` is similar to the binomial distribution, in the case that we are dealing with successive and independant experiments that can either succeed or fail, however the random variable $X$ now represents *the number of experiments that take place up to and including the first success:

$$
P(X=k) = (first\ k-1\ trials\ fail) = q^{k-1}p
$$
In this case $X$ is said to have a geometric distribution with parameter $p$. This can be written as $X$~$Geom(p)$.

It can also be shown that
$$
E(X) = \frac{1}{p}\ \ \ Var(X) = \frac{q}{p^2}
$$
## Poisson Distribution
A discrete variable $X$ has a `poisson distribution` *with parameter $\mu$  $(\mu > 0)$* if:

$$
P(X=k) = \frac{e^{-\mu}\mu^k}{k!} \ \ \ \ \ k = 0,1,2....
$$
This can be written as $X$~$Poisson(\mu)$ and is therefore pecified with one strictly positive paramerter $\mu$. Uses for the poisson distribution are for approximating the binomial distribution and modelling the number of events that occur in a given time frame.

### Modelling events in a time frame

For a given system where events occur randomly, independant of one another and one at a time with an average occurance of $\lambda$ per unit time, the number of events in a time interval of length $t$ can be shown to have a posison distribution with mean:
$$
\mu = \lambda t
$$
This is most likely an over simplification as events occuring in the system may change due to different conditions that are not modelled in the distribution.

### Approximating the binomial distribution
For binomial distributions, calculating $n\choose k$ can be difficult, as well as calculating $p^k$ for a ver large $k$, for example $0.003^{500}$. However, for a large $n$ (number of experiments) and a small $p$ (probability of success), the binomial distribution can then be approximated by a poisson distribution with a mean $\mu$ of $np$. 