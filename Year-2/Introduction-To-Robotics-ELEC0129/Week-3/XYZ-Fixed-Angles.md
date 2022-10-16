# Orientation Representations
Using a $3\times3$  rotation matrix is not easy to visualise the projections of the frame axis. 
There are only 6 constraints when it comes to describing orientations, being:
$$
\begin{align}
\vert{\hat{x}}\vert &= 1 \\
\vert{\hat{y}}\vert &= 1 \\
\vert{\hat{z}}\vert &= 1 \\
\hat{x}\cdot\hat{y} &= 0 \\
\hat{x}\cdot\hat{z} &= 0 \\
\hat{z}\cdot\hat{y} &= 0 \\
\end{align}
$$
Meaning only three parameters are required to represent the rotation matrix. 

## XYZ-Fixed Angles Representation
Also known as roll, pitch, and yaw.
To describe the orientation of $B$ from $A$:
* Align the $B$ frame with the $A$ frame.

![](Screenshot_20220428_164123.png)
* Rotate $B$ about $X_A$ by angle $\gamma$.

![[Screenshot_20220428_164153.png]]

* Next rotate $B$ about $Y_A$ by angle $\beta$.

![[Screenshot_20220428_164211.png]]

* Finally Rotate $B$ about $Z_A$ by angle $\alpha$. 

![[Screenshot_20220428_164228.png]]

The rotation matrix is obtained by multiplying each of the individual rotations from right to left, or in the reverse order of which the transformations were applied:

$$
^A_BR = R_Z(\alpha) \cdot R_Y(\beta) \cdot R_X(\gamma)
$$

All the individual rotations are known:

$$
\begin{align}
R_Z(\alpha) &= \begin{pmatrix}
\cos{\alpha}&-\sin{\alpha}&0\\
\sin{\alpha}&\cos{\alpha}&0\\
0&0&1\\
\end{pmatrix}\\
R_Y(\beta) &= \begin{pmatrix}
\cos{\beta}&0&-\sin{\beta}\\
0&1&0\\
\sin{\beta}&0&\cos{\beta}\\
\end{pmatrix}\\
R_X(\gamma) &= \begin{pmatrix}
1&0&0\\
0&\cos{\gamma}&-\sin{\gamma}\\
0&\sin{\gamma}&\cos{\gamma}\\
\end{pmatrix}
\end{align}
$$
Meaning:
$$
\begin{align}
^A_BR &= \begin{pmatrix}
\cos{\alpha}&-\sin{\alpha}&0\\
\sin{\alpha}&\cos{\alpha}&0\\
0&0&1\\
\end{pmatrix} 

\cdot

\begin{pmatrix}
\cos{\beta}&0&-\sin{\beta}\\
0&1&0\\
\sin{\beta}&0&\cos{\beta}\\
\end{pmatrix} 

\cdot

\begin{pmatrix}
1&0&0\\
0&\cos{\gamma}&-\sin{\gamma}\\
0&\sin{\gamma}&\cos{\gamma}\\
\end{pmatrix}\\
\end{align}
$$
Which is equivalent to:

![[Screenshot_20220428_165828.png]]

### Determining Parameters

Given a rotation matrix, we can find $\alpha,\beta,\gamma$ by solving simultaneous equations. ^851bf9

For the rotation matrix:

![[Screenshot_20220428_170041.png]]

$\beta$ can be found:

$$
\begin{align}
\cos^2\beta &= r_{11}^2 + r_{22}^2\\
-\sin{\beta} &= r_{31}\\
\tan{\beta} &= \frac{\sin\beta}{\cos{\beta}}\\
& = \frac{-r_{31}}{\sqrt{r_{11}^2+r_{21}^2}}\\
\beta & = arctan2(-r_{31},\sqrt{r_{11}^2+r_{21}^2})
\end{align}
$$
$\alpha$ can then be found using $\beta$:
$$\begin{align}
\tan{\alpha} &= \frac{\sin{\alpha}}{\cos{\alpha}}\\
&= \frac{r_{11}\div \cos{\beta}}{r_{21} \div \cos{\beta}}\\
\alpha &= arctan2(r_{11} \div \cos{\beta},r_{21}\div \cos{\beta})
\end{align}
$$

$\gamma$ similarly can be found using $\beta$:

$$\begin{align}
\tan{\gamma} &= \frac{\sin{\gamma}}{\cos{\gamma}}\\
&= \frac{r_{32}\div \cos{\beta}}{r_{33} \div \cos{\beta}}\\
\gamma &= arctan2(r_{32} \div \cos{\beta},r_{33}\div \cos{\beta})
\end{align}
$$
If $\cos\beta = 0$ then both $\alpha$ and $\gamma$ cannot be solved for.

