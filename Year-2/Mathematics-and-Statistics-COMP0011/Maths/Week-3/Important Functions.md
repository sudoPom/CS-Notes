# Important Functions

Modulus function takes the absolute value of an input. The point at which the function touches the x axis is non differentiable.

The normal takes the magnitude of a given number, the magnitude will always be non negative, follow the triangle property $f(x_1, x_2) \le f(x_1)+f(x_2)$, satisfy the triangle property and is only 0 if the input is 0.

Rectified Linear unit is a useful function for deep learning. It is also non negative and differentiable everywhere except at x = 0. 

Step function: For x > 0 f(x) = 1, for x < 0 f(x) = -1. There are smooth versions of the step function, like $(1+e^{-x/\lambda})^{-1}$

Delta Function: Not exactly a function but is thought of an infinitely high and narrow spike at x=0 and 0 valued elsewhere. $\int{\delta(x)f(x)} = f(0)$

Logarithms: Log tells you what power you need to raise 10 to get the argument. $\log_b(x)$ Tells you what power you need to raise $b$ to get $x$. There is a special base $e$. Logarithms with base $e$ have $\log_b(x) = \ln(x)/\ln(b)$.

* $\ln(xy) = \ln(x) + \ln(y)$
* $\ln(x/y) = \ln(x) - \ln(y)$
* $\lim{x\to-\infty}\log(x) = 0$ 
* $\lim{x\to\infty}\log(x) = \infty$ (although this happens VERY slowly)
* $e = \lim_{n\to\infty}(1+\frac{1}{n})^n$

Exponential functions: Has the form $f(x) = \alpha\beta^x$

* $\frac{f^\prime}{f} = const$
* $\lim_{x\to\infty}a^x/x^n = 0$ (Exponential functions are the fastest growing functions.)

  

Convex Function: A subset $S$ of $R^d$ is convex if any two points in $S$, $S$ Contains the whole line segment joining them. A function $f$ defined on a convex set is convex only if the line joining any two points on the graph of $f$ does not lie below the graph between the two points.

* A differentiable function is convex if and only if the original function lies above the its tangent.
* If $f^{\prime\prime}(x)$ is 0 for all $x$ then $f$ is convex.

Trigonometric Functions: $\sin\theta \cos\theta \tan\theta$ etc... Are periodic (non injective) functions with angles being the input

* A single 2D revolution is $2\pi$ radians.
* $\sin^2\theta + \cos^2\theta = 1$
* $r = \frac{\pi}{180}\theta$
* $tan\theta = \frac{sin\theta}{cos\theta}$
* $\cot\theta = \frac{\cos\theta}{\sin\theta}$
* $\sec\theta = \frac{1}{\sin\theta}$
* $cosec\theta = \frac{1}{\cos\theta}$
* $\tan\theta$ varies between -inf and inf, repeating every $2\pi$ 
* $\arcsin\theta = \sin^{-1}\theta$ 

Delta "Function": $\delta(x) = \infty$ When $x=0$ and $0$ everywhere else.

**Derivatives of inverse trig functions**

**Gamma functions**

**Gaussian Functions**: A three parameter function: $G(\mu,\sigma,x) = (2\pi\sigma^2)^{-\frac{1}{2}}e^-{\frac{(x-\mu)^2}{2\sigma^2}}$

**Hermite Polynomials**:  Good for locally approximating functions. Defined recursively.
