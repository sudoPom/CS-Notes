# Trajectory Following
To move the mass to a position that is not at $x=0$, the idea is to simulate the wall of the natural system to move in the direction we want the mass to move by the distance we want it to move:

![[Pasted image 20220506033416.png]]

This changes our equation to be:
$$m\ddot{x}=-b\dot{x}-k(x-x_d)$$

Achieving regulation control works in the exact same way:
$$
\begin{align}
&\text{System: }m\ddot{x}+b\dot{x}+kx=F\\
&\text{Model: }mf +b\dot{x}+kx=F\\
&\text{Servo: }f = \dot{x_d}-k_v(\dot{x}-\dot{x_d})-k_p(x-x_d)\\
&\text{Desired stiffness: }k_p\\
& k_v = 2\sqrt{k_p}
\end{align}
$$
For actual trajectory following (following a target that keeps moving) there is a small change to the servo controller:
$$
\begin{align}
&\text{Servo: }f = \dot{x_d}-k_v(\dot{x}-\dot{x_d})-k_p(x-x_d)\\
\end{align}
$$