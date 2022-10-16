   # Continuous Distributions
## Uniform Distribution 
A random variable is  `uniformally distributed` if all values between some $a$ and $b$ are equally likely of being the outcome. $X$~$U(a,b)$. The probability density between this interval will be constant.![[Pasted image 20220303174808.png]]

For a probability density function $f(x)$:
$$
\begin{aligned}
    &f(x)\begin{cases*}
        \frac{1}{b-a} & for $x\in[a,b]$ \\
        0 & otherwise \\
    \end{cases*}\\
	&E(X) = \frac{a+b}{2}\\
	&Var(X) = \frac{(b-a)^2}{12}
\end{aligned} 
$$


For a cumalitive frequency function $F(x)$:
$$
F(x)\begin{cases*}
	0 &for $x < a$\\
	\frac{x-1}{b-a} &for $a \leq x \leq b$\\
	1 &for x > b
\end{cases*}
$$

### Uses
Used to model other distributions. (See below)
## Exponential Distribution
The `exponential distribution` ($X$~$Exp(\lambda$)) has a probability density function:

$$
f(x)\begin{cases*}
\lambda e^{-\lambda x} &for $x>0$\\
0 &otherwise
\end{cases*}
$$
![[Pasted image 20220303200922.png]]

and cumulative distribution function:

$$
F(x) = 1-e^{-\lambda x} \ \ \ \ x>0
$$
With mean and variance:

$$
\begin{align}
&E(X) = \frac{1}{\lambda} \\
&Var(X) = \frac{1}{\lambda^2}
\end{align}
$$
### Uses
The exponential distribution comes from the Poisson Process. Any random variable representing the time until the first event occurs can be modelled using exponential distribution, where $\lambda$ is the rate of an event happening. This follows for times between successive events that are independent of each other.

Because of this, the exponential distribution is used to model things like machine failure times, lifetimes, etc. For example, for a machine that has faults at a rate of 0.5 faults per year, the probability that it's first fault will occur within the first two years is:

$$
\begin{align}
&F(X\leq 2) = 1-e^{2\lambda}
\end{align}
$$

The `lack of memory` property of exponential distribution suggests that given an event doesn't happen within the first $x$ period of time, the probability that an event doesn't happen in the following $x$ period of time will not change.

For a random variable $X$~$U(0,1)$ and a $\lambda>0$:

$$
Y = -\frac{1}{\lambda}(X) \~Exp(\lambda)
$$
Which is useful for simulation - if a random number can be generated from a uniform distribution then this transformation allows the random number to transformed into one from other distributions.

## Normal Distribution
The `Normal distribution` ($X$~$N(\mu, \sigma^2$) has a probability density function of:

$$
f(x)=\frac{1}{\sigma\sqrt{2\pi}}e^{-\frac{(x-\mu)^2}{2\sigma^2}}
$$
cumulative distribution function $F(X)$ of:
$$
F(X) = P(X\leq x) = \int^x_{-\infty}f(u)du~~~for~-\infty<x<\infty
$$
mean and variance of:

$$
\begin{align}
&E(X) = \mu\\
&Var(X)=\sigma^2
\end{align}
$$

### Uses 
The normal distribution is used for:
* Modelling measurement error
* Modelling quantaties that are roughly symmetric and unimodal - subject to natural variation (weigh, height, IQ, etc)
* Transforming non symmetric events to approximately symmetric distributions.
* Approximating the binomial distribution for a large $n$ but a non small $p$ (which cant be done by the poisson distribution).
* `Central limit theorem` - The sample mean of a large independent random sample from any distribution is approximately normally distributed.

### Properties
* Linear functions of a normally distributed random variable also has a normal distribution.
* Any linear combination of normally distributed random variables also has a normal distribution. 

#### Standard normal Distribution
Given a random variable $X$~$N(\mu, \sigma^2)$, let $Z = \frac{X-\mu}{\sigma}$

$$
\begin{align}
E(Z)&=E(\frac{1}{\sigma}X-\frac{\mu}{\sigma})\\
&= \frac{1}{\sigma}E(X) - \frac{\mu}{\sigma}\\
&= \frac{\mu}{\sigma} - \frac{\mu}{\sigma}\\
&= 0 \\ \\
Var(Z) &= Var(\frac1\sigma X - \frac{\mu}{\sigma})\\
&= \frac1{\sigma^2} Var(X)\\
&= \frac1{\sigma^2}\sigma^2\\
&= 1
\end{align}
$$

Since $Z$ is composed of only linear transformations, it is also a normal distribution with mean 0 and variance 1.
$Z$~$N(1,0)$ is known as the `standard normal distribution` or the standardised verion of $X$.

The standard normal distribution is used together with standard normal distribution tables to determine $P(X\leq x)$ (since this integral cannot be calculated analytically).

#### Central Limit Theorem

Let $X_1,X_2,...,X_n$ be independent random variables all with the same distribution, with mean $\mu$ and variance $\sigma^2 < \infty$. For a large $n$:

$$
\begin{align}
\bar{X} = \frac1 n\sum^n_{i=1}{X_i}&\~N(\mu, \frac{\sigma^2}n)\\
&\~N(n\mu, n\sigma^2) ~~~~~ approximately
\end{align}

$$
Meaning that for any distribution, if you have a large enough (roughly $n>30$) number of random variables in said distributions, they will all approximately model the uniform distribution.  

#### Binomial Approximation
A binomial distribution is made of the sum of various bernoulli variables:

$$
\begin{align}
Let~X\~Binomial(n,p) ~ where~ q=1-p
\end{align}
$$
$X$ represents the number of successes in n independent repititions of a binary experiment withe success probability of $p$:

$$
\begin{align}\sum^n_{i=1}{X_i}~ where~ X_i=\begin{cases*}
1 &for success on ith repetition\\
0 &for failiure on ith repitition
\end{cases*}
\end{align}
$$

Each $X_i$ are independant $Bernoulli(p)$ variables. Following the Central limit theorem, for a large $n$, $X$~$N(np,npq)$ approximately.

This is roughly valid for $n$ > 30 and $p$ not close to $1$ such that $np > 5$ and $nq > 5$.

For the binomial distribution $P(X \geq a) = P(X > a-1)$ , however this is not true for normal distributions, since they are not discrete, so when approximating we should takethe value inbetween $a$ and $a-1$. This is called the `continuity correction`.