# ZYX-Euler Angles
`ZYX-Euler Angles` are similar to the XYZ Fixed Angles interpretation.

To describe the orientation of $B$ with respect to $A$:

* First align $B$ with $A$ 
![[Screenshot_20220428_174605.png]]

* Rotate $B$ about $Z_B$ by $\alpha$ 
![[Screenshot_20220428_174715.png]]

* Rotate $B$ about the new $Y_B$ by $\beta$
![[Screenshot_20220428_174845.png]]

* Finally, rotate $B$ about the new $X_B$ by $\gamma$
![[Screenshot_20220428_175049.png]]

The rotation matrix $^A_BR$ can be obtained by multiplying the individual rotations from left to right, or in the order they were carried out.

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

The ways to calculate the parameters is the exact same as what was done for the [[XYZ-Fixed-Angles#^851bf9]].