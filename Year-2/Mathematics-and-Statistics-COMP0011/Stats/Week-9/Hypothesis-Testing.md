 # Hypothesis Testing
Data can be used to test hypotheses.

Generally to test a hypothesis:
* Assume the hypothesis is correct.
* Calculate the observed data under this assumption
* If this probability is small then our assumption is most likely wrong and we may reject the hypothesis.

For data $X_1,X_2,...,X_n$ which are an independent random sample from a distribution with mean $\mu$.

The test could be of the form: "the true mean $\mu$ is equal to $\mu_0$"

Where $\mu_0$ is a hypothetical value.

The `null hypothesis` is the belief that the assumption is correct:
$$
H_0: \mu = \mu_0
$$
There are three possible `alternative hypotheses`:
$$
\begin{align}
H_1 : \mu \neq \mu_0\\
H_1 : \mu < \mu_0\\
H_1 : \mu > \mu_0
\end{align}
$$
Assume that $n$ is large enough for the CLT to apply or that the data forms a normal distribution..

$$
T = \frac{\bar{X}-\mu}{S/\sqrt{n}} \~ t_{n-1}
$$

If $H_0$ is true then:
$$
t = \frac{\bar{X}-\mu_0}{S/\sqrt{n}}
$$
$T$ is our `test statistic` and the test being carried out is a `t-test`.

Calculate some specific data set, the observed value $t$. We should expect $t$ to be close to 0 as this is where our true mean lies.

The `p value` is the probability of obtaining a result as or more extreme as the observed value, given that $H_0$ is true:

$$
\begin{align}
	\mu \neq \mu_0 : p &= P(|t| \leq |T|) + P(-|t| \geq |T|)\\
	\mu < \mu_0 : p &= P(t \leq T)\\
	\mu > \mu_0 : p &= P(t \geq T)
\end{align}
$$
* If the $p$ value is small ($p<\alpha$) then reject $H_0$ in favour of $H_1$ - the data provides significance evidence against $H_0$.
* Otherwise do not reject $H_0$ - the data does not provide significance evidence against $H_0$.
This conclusion should be given in context to the question!

Where $\alpha$ is the significance level of the test.

## Critical Values
A `critical value` $c$ is a value such that given a significance level $\alpha$:
$$
\begin{align}
	\mu \neq \mu_0 :  \frac{\alpha}{2} &= P(|c|- \geq  |T|)\\
	o&r\\
	\frac{\alpha}{2} &=  P(|c| \leq |T|)\\
	\mu < \mu_0 : \alpha &= P(c \leq T)\\
	\mu > \mu_0 : \alpha &= P(c \geq T)
\end{align}
$$
It then follows that you should reject $H_0$:

$$
\begin{align}
	\mu \neq \mu_0 : p &< -c\\
	o&r\\
	p &> c\\
	\mu < \mu_0 : p &> c\\
	\mu > \mu_0 : p &< c
\end{align}
$$

## Common Errors
* type 1 Error: Rejecting $H_0$ when $H_0$ is true. The probability of this happening is equal to the significance level, which is why significance levels should be chosen to be small.
* type 2 error: Not rejecting $H_0$ when $H_0$ is false, denoted by $\beta$
The larger the probability of a type 1 error, the smaller the probability of a type 1 error.

The `power of a test` is $1-\beta$, it is a measure of how likely we are to reject a hypothesis given it is actually incorrect.

Increasing the sample size will increase the power of the test. 