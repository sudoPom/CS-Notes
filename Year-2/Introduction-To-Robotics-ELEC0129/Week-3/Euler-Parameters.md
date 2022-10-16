# Euler Parameters
In the [[Equivalent-Angle-Axis]], [[XYZ-Fixed-Angles]] and [[ZYX-Euler-Angles]] methods of describing orientation, there are some cases where solutions cannot be found. `Quaternions` solve this by introducing a fourth parameters to the [[Equivalent-Angle-Axis]] method.

The parameters are defined as:
$$
\begin{align}
\epsilon_1 &= k_x\sin(\frac{\theta}{2}) \\
\epsilon_2 &= k_y\sin(\frac{\theta}{2})\\
\epsilon_3 &= k_z\sin(\frac{\theta}{2})\\
\epsilon_4 &= cos(\frac{\theta}{2})\\
\end{align}
$$

These parameters satisfy the constraint:

$$\epsilon_1^2+\epsilon_2^2+\epsilon_3^2+\epsilon_4^2 = 1$$

The rotation matrix $^A_BR$ is given by:

![[Pasted image 20220429005722.png]]

Again, simultaneous equations can be solved to find the parameters:

$$
\begin{align}
\epsilon_4 &= \frac{1}{2}\sqrt{1+r_{11}+r_{22}+r_{33}}\\
\epsilon_1 &= \frac{r_{32}-r_{23}}{4\epsilon_4}\\
\epsilon_2 &= \frac{r_{13}-r_{31}}{4\epsilon_4}\\
\epsilon_3 &= \frac{r_{21}-r{12}}{4\epsilon_4}\\
\end{align}
$$
But this only works if $\epsilon_4 \neq 0$. The alternative for this to find the other parameters:
$$
\begin{align}
\epsilon_1 = \frac{1}{2}\sqrt{1+r_{11}-r_{22}-r_{33}}\\
\epsilon_2 = \frac{1}{2}\sqrt{1-r_{11}+r_{22}-r_{33}}\\
\epsilon_3 = \frac{1}{2}\sqrt{1-r_{11}-r_{22}+r_{33}}\\
\end{align}
$$
This method guarantees values for the euler parameters.