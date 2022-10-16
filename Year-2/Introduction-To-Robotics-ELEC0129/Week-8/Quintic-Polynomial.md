# Quintic Polynomial
The quintic polynomial provides a time profile which ensures that the acceleration at the start and end positions are always zero.

The function is of the form:

$$
f(t) = \begin{cases}
a_0 + a_1t + a_2t^2 + a_3t^3 + a_4t^4 + a_5t^5 & t<t_f\\
u_f & \text{otherwise}
\end{cases}
$$

^abbf75

To find the parameters $a_i$ we can use the following constraints that need to be satisfied:

$$
\begin{align}
u(0) &= u_0 \text{ (known)} \\
u(t_f) &= t_f\text{ (known)} \\
\dot{u}(0) &= 0\\
\dot{u}(t_f) &= 0\\
\ddot{u}(0) &= 0\\
\ddot{u}(t_f) &= 0\\
\end{align}
$$

Similarly to how the cubic parameters were derived, we can find the quintic parameters by solving simultaneous equations.

This gives the values:

$$
\begin{align}
a_0 &= u_0\\
a_1 &= 0\\
a_2 &= 0\\
a_3 &= \frac{10}{t_f^3}(u_f-u_0)\\
a_4 &= \frac{-15}{t_f^4}(u_f-u_0)\\
a_5 &= \frac{6}{t_f^5}(u_f-u_0)\\
\end{align}
$$

^3cdf66

