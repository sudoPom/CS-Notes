# Linear Functions With Parabolic Blends
`Linear Functions with Parabolic Blends` provides a more natural time profile compared to [[Quintic-Polynomial|quintic]] and [[Cubic-Polynomial|cubic]] functions. They consist of `blend` regions, where the robot is accelerating/decelerating and `linear` regions, where the robot is moving at a constant speed.

![[Screenshot_20220505_145552.png]]

The amount of time spent accelerating is known as the `blend time` and is defined as $t_b$, aand the distance covered during the `blend distance`.

To determine the function we need:

$$
\begin{align}
\text{start position } u_0\\
\text{end position } u_f\\
\text{time for motion }t_f \\
\text{acceleration } \ddot{u}
\end{align}
$$

Some assumptions also need to be made:

* Both parabolic blends (acceleration and acceleration) have the same duration
* The solution is symmetric about the half way point in time, $t_h$ and position  $u_h$.
* The velocity at the end of the blend region is equal to that of the velocity in the linear region.

The velocity at any given point in the blend region can be found by integrating the acceleration, which is set by the user.

$$
\begin{align}
\dot{u} = \int\ddot{u} ~ dt = \ddot{u}t
\end{align}
$$
And similarly the position can be found by integrating the velocity:

$$
\begin{align}
u = \int\dot{u} ~ dt = u_0 + \frac{1}{2}\ddot{u}t^2
\end{align}
$$
The overall trajectory function is then defined as:

$$
\begin{align}
u(t) = 
\begin{cases}
u_0 + \frac{1}{2}\ddot{u}t^2 & t < t_b\\
\frac{u_h-u_b}{t_h-t_b}\cdot (t-t_b)+u_b & t_b \leq t \lt (t_f-t_b)\\
u_f - \frac{1}{2}\ddot{u}(t_f-t)^2 & otherwise
\end{cases}
\end{align}
$$

^74fbb6

However $u_b$ and $t_b$ are still unknown but can be shown to be:

$$
\begin{align}
t_b &= \frac{t_f}{2} - \frac{\sqrt{\ddot{u}^2t_f^2-4\ddot{u}(u_f-u_0)}}{2\ddot{u}}\\
u_b &= u_0 + \frac{1}{2}\ddot{u}t^2_b
\end{align}
$$

^e7eeea

The acceleration needs to be high enough or $t_b$ will not exist. This means that:

$$
\begin{align}
\ddot{u} \geq 4\frac{u_f-u_0}{t_f^2}
\end{align}
$$