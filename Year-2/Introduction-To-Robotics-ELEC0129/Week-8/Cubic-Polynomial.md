# Cubic Polynomial
Cubic polynomials have a smooth increase in velocities which provides a much more smoother motion and has the function:

$$
f(t) = \begin{cases}
a_0 + a_1t + a_2t^2 + a_3t^3 & t<t_f\\
u_f & \text{otherwise}
\end{cases}
$$

^a424e2

To find the parameters $a_i$ we need to satisfy 4 constraints:

$$
\begin{align}
u(0) = u_0 \text{ (known)} \\
u(t_f) = t_f\text{ (known)} \\
\dot{u}(0) = 0\\
\dot{u}(t_f) = 0\\
\end{align}
$$
The parameters can be solved by solving 4 simultaneous equations. Differentiating for $a_2$ and $a_3$.

This gives the values:
$$
\begin{align}
a_0 &= u_0\\
a_1 &= 0\\
a_2 &= \frac{3}{t_f^2}(u_f-u_0)\\
a_3 &= -\frac{2}{t_f^3}(u_f-u_0)
\end{align}
$$

^f59bc2

