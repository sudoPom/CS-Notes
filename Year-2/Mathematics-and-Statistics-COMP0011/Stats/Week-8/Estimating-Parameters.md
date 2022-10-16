# Estimating Parameters
## Definitions
* A function of data $X_1,X_2,...,X_n$ is known as a `statistic` for example the average of $X_i$.
* A statistic used to measure a parameter is known as an `estimator`. The parameters make up a model used to model data, for example for data modelling the normal distribution, the parameters are $\mu$ and $\sigma^2$ and the estimators are $\bar{X}$ and $S^2$ (The sample mean and variance). Estimators are random variables.
* A particular value of an estimator obtained from a single set of data is called an estimate.

The sample mean of a random variable $X$ is an estimate of the population $\mu$.

$$
E(\bar{X})=\mu
$$
On *average* the sample mean is equal to the population mean. Making this estimate `unbiased`. However this is not the case for one particular sample.

The variance of the sample mean is:

$$
Var(\bar{X})=\frac{\sigma^2}{n}
$$
and the central limit theorem tells us that approximately: $\bar{X}$~$N(\mu,\frac{\sigma^2}{n})$ which is the `sampling distribution` of $\bar{X}$.

The standard deviation of an estimator is called the `standord error`:

$$
s.e(\bar{X}) = \frac{\sigma}{\sqrt{n}}
$$
A good estimate should have a small standard deviation/error as well as being unbiased. An unbiased estimator with the smallest possible variance (and therefore standard error) is known as the `minimum variance unbiased estimator (MVUE)` if it exists.

## Confidence intervals for the mean

A sample mean of some $X_i$, $\bar{x}$  gives us a `point estimate` of the true population mean $\mu$. An interval where we are $n\%$ confident that it contains the population mean $\mu$ is known as a `confidence interval`.

Let $X_1,X_2,...,X_n$ be an independent set of random sample from a distribution with mean $\mu$ and variance $\sigma^2$. Assume the sample size, $n$, is large enough for the CLT to apply or all samples are normally distributed:  $\bar{X}$~$N(\mu,\frac{\sigma^2}{n})$ .

Finding the confidence interval of the mean is finding a constant $d$ such that:
$$
P(\bar{X}-d < \mu < \bar{X}+d) = 0.95
$$
or

$$

P(-d < \bar{X}-\mu < d) = 0.95
$$

or in english, the probability that the absolute difference between the sample mean and the population mean is less than constant $d$ is 95%.

When standardising $\bar{X}$ this in equality becomes:

$$
P(-\frac{d}{\sigma/\sqrt{n}} < Z < \frac{d}{\sigma/\sqrt{n}}) = 0.95
$$
Let $z = \frac{d}{\sigma/\sqrt{n}}$, simplifying the inequality to:
$$
P(-z < Z < z)
$$

On our distribution of $Z$ we are required to find which value gives us the probability of landing within the 95% zone, which can be found fromthe percentage points. 
![[Pasted image 20220312155228.png]]
In this case $z = 1.96$.
Meaning:

$$
\begin{align}
&d = 1.96\frac{\sigma}{\sqrt{n}}\\

&P(\bar{X}-1.96\frac{\sigma}{\sqrt{n}} < \mu < \bar{X}+1.96\frac{\sigma}{\sqrt{n}}) = 0.95
\end{align}
$$
All these values are constants so rather than talking about probabilities we say that $\bar{X}-1.96\frac{\sigma}{\sqrt{n}} < \mu < \bar{X}+1.96\frac{\sigma}{\sqrt{n}}$ is a confidence interval of $95\%$. Confidence intervals are made up of tuples, in this case it will be $(\bar{X}-1.96\frac{\sigma}{\sqrt{n}},\bar{X}+1.96\frac{\sigma}{\sqrt{n}})$

Generally a $c\%$ confidence interval for $\mu$ is:
$$
(\bar{x}-z\frac{\sigma}{\sqrt{n}},\bar{x}+z\frac{\sigma}{\sqrt{n}})
$$
![[Pasted image 20220312160451.png]]

## Interpretation
If we were to collect a large number of data sets from the same distribution and for each data set we compute a 95% confidence interval for $\mu$ then in 95% of those cases, $\mu$ will be included in that interval.

## T Distributions

Without the true population variance we can estimate it with:

$$
s^2 = \frac{1}{n-1}\sum_{i=1}^{n}{(x_i-\bar{x})^2}
$$
This changes the approximation of $\frac{\bar{X}-\mu}{\sigma/\sqrt{n}}$ ~ $N(0,1)$. This changes to  $\frac{\bar{X}-\mu}{s/\sqrt{n}}$ which no longer models the Normal distribution. Instead we have:
 $\frac{\bar{X}-\mu}{\sigma/\sqrt{n}}$ ~ $t_{n-1}$ a `t distribution` with $n-1$ degrees of freedom.  The $n-1$ is just a parameter of the $t$ distribution. T distributions are similar to normal distributions, centered around 0 but just has a larger variance. This distribution becomes closer to the standard normal distribution with more data points. So as $n$ tends to $\infty$ the distributions converges to the standard normal distribution.

So when we do not know the true population standard deviation, our new confidence interval becomes: 
$$
(\bar{x}-t\frac{s}{\sqrt{n}}, \bar{x}+t\frac{s}{\sqrt{n}})
$$

  which is the same formula we had before, with $\sigma$ becoming $s$ and $z$ becoming $t$. Since the t distribution is more spread out, for the same confidence interval $c$, the confidence interval will be wider under the t distribution than it is under the standard normal distribtion.

## Estimating Variance
The sample variance $S^2=\frac{1}{n-1}\sum^n_{i=1}{(X_i-\bar{X}})^2$  is an unbiased estimator of $\sigma^2$.

The sampling distribution is such that $\frac{(n-1)S^2}{\sigma^2}$~$\chi^2_{n-1}$  distribution (A $\chi$ distribution with a parameter of $n-1$ which is the degrees of freedom.) Which can be used to obtain confidence intervals for $\sigma^2$. (We don't need to know this though.).