# Series & Power Series



## Infinite Series

$\sum_{i=0}^{n}{a_i} = S_n = a_1+a_2+a_3+...+a_n$

If a limit exists (it approaches some value) as $n \to \infty$ it is convergent, and the limit is known as the sum. If there is no limit the sum is said to be divergent.

* $ 1 + \frac{1}{2} + \frac{1}{4} + \frac{1}{8} + ... = 2$
* $1 + \frac{1}{1!} + \frac{1}{2!} + \frac{1}{3!}+... = e$

### Tests for Convergence

* d'Alembert's Test: $\lim_{n\to\infty}{\vert{\frac{a_{n+1}}{a_n}}}\vert$
* Cauchy's Test: $\lim_{n\to\infty}{\vert{a_n}^{\frac{1}{n}}}\vert$
  * If ratio is 1 then test is indecisive 
  * converges if ratio is less than 1
  * diverges if greater than one

## Power Series

A series with an infinite sum, with each term having a coefficient with infinitely increasing power.

$\sum_{i=0}^{n}{c_0+c_1x+c_2x^2...c_nx^n}$

If a power series $\sum_{n\ge0}{(x-c)^n}$ converges it does so for all $x$ within $\vert{x-c}< R$ Where $R$ is the radius of convergence.

The radius of convergence is the same as the previous tests mentioned:

* $\lim_{n\to\infty}{\vert{\frac{a_{n+1}}{a_n}}}\vert = R^{-1}$
* $\lim_{n\to\infty}{\vert{a_n}^{\frac{1}{n}}}\vert = R^{-1}$

### Important Power Series

* $cosx \sum_{n=0}^{\infty}{-1}^n*\frac{x^{2n}}{2n!}$ 
* $sinx = \sum_{n=0}^{\infty}{-1}^n*\frac{x^{2n+1}}{(2n+1)!}$
* $e^x = \sum_{n=0}^{\infty}\frac{x^n}{n!}$
* $(1-x)^{-1} = \sum_{n=0}^{\infty}{x^n}$
* $ln(1+x) = \sum_{n=1}^{\infty}{(-1)^{n-1}\frac{x^n}{n}}$

The closed form of a power series can be found using substitution or derivatives/integrals.

## Maclaurin Series

The Maclaurin Series approximates the function in the neighbourhood of x=0, the higher the order the more accurate the approximation.

The nth order Maclaurin series is:

* $f(x) \approx a_0+a_1x+a_2x^2+...$ 

$a_n = \frac{f^{(n)}(0)}{n!}$

## Taylor Series

The Taylor series is a more general form of the Maclaurin series. It approximates a function around the point $x_0$.

$f(x) = f(x_0)+\frac{f^{(1)}(x_0)}{1!}(x-x_0) + \frac{f^{(2)}(x_0)}{2!}(x-x_0)^2 + ... + \frac{f^{(n)}(x_0)}{n!}(x-x_0)^n$ 

## Partial Derivatives

$f(x,y) = \frac{df}{dx} , \frac{df}{dy}$ 

To find the partial derivative of a function, the function is differentiated with respect to each variable separately. The partial derivative of a function $f$ consisting of variables $x, y, z$ will how how each variable changes as the other two variables stay fixed at some given value. $f_x$ is the partial derivative with respect the variable $x$. $f_{xy}$ Is the partial derivative with respect to $x$ then the partial derivative with respect to $y$ of the resulting function.

Critical points: All the points where the gradient vanishes or does not exist. 

For:

* $D = AC -B^2$

* $A = f_{xx}(a,b)$

* $B = f_{xy}(a,b)$

* $C = f_{yy}(a,b)$

  A critical point of $(a,b)$ of function $f$ is:

  * A local maximum if $D > 0$ and $f_{xx}(a,b) < 0$
  * A local minimum if $D > 0$ and $f_{xx}(a,b) > 0$
  * A saddle point if $D > 0$ 
  * If $D=0$ we know nothing from the test.