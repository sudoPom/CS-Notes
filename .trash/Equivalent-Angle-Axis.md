# Equivalent Angle Axis
A single axis and rotation angle is used rather than using three like in [[XYZ-Fixed-Angles]] and [[ZYX-Euler-Angles]].

To describe the orientation of frame $B$ with respect to $A$:
* Align frame $B$ with $A$
* Rotate $B$ About a vector $^AK$

![[Pasted image 20220428204918.png]]

Where:
$$
\begin{align}
&\hat{k} = [k_x, k_y, k_z]\\
&k_x^2 + k_y^2 + k_z^2 = 1
\end{align}
$$

There are three parameters in total, 2 which satisfy the above constraints and the 3rd being the angle of rotation, $\theta$.

Given these parameters we have $^A_BR$:
![[Pasted image 20220428205654.png]]
Where $v = 1-cos\theta$  

Given some rotation matrix:
![[Pasted image 20220428205818.png]]

We can find $\theta$:

$$
\begin{align}
&r_{11}+r_{22}+r_{33} = 1 + 2cos\theta\\
&cos\theta = \frac{r_{11}+r_{22}+r_{33}-1}{2}\\
&\theta = \arccos{\frac{r_{11}+r_{22}+r_{33}-1}{2}}
\end{align}
$$

And $\hat{k}$:
$$
\begin{align}
\hat{k} = \frac{1}{2sin\theta} \cdot \begin{bmatrix}
r_{32}-r_{23}\\
r_{13}-r_{31}\\
r_{21}-r_{12}\\
\end{bmatrix}
\end{align}
$$
$\hat{k}$ cannot be found if $sin\theta = 0$.