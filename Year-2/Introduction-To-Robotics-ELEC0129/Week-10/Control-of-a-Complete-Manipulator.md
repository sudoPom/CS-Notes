# Control of a complete Manipulator
In reallity, robots have highly coupled joints and links, making linear control unreliable.

Thankfully the model based compensator cancels off the robots dynamics, decoupling each joint. This allows a servo controller to be designed for each joint individually.

Recalling the dynamic model of a manipulator:

![[Manipulator-Dynamics#^8c3031]]

The model based compensator can be designed as:

$$
\begin{align}
\tau = M(q)f +v(q,\dot{q})+G(q)\\
\end{align}
$$

Which decouples all individual joint dynamics:
$$
\begin{align}
\ddot{q} &= f\\

\begin{bmatrix}
\ddot{q}_1\\
\ddot{q}_2\\
...\\
\ddot{q}_n\\
\end{bmatrix}
&= 
\begin{bmatrix}
\ddot{f}_1\\
\ddot{f}_2\\
...\\
\ddot{f}_n\\
\end{bmatrix}
\end{align}
$$
Next the servo controller is now defined as:
![[Pasted image 20220506043548.png]]

Where $K_v$ and $K_p$ are matricies and all other terms are vectors.
![[Pasted image 20220506043642.png]]