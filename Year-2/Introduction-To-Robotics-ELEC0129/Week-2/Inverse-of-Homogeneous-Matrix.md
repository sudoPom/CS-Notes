# Inverse of Homogeneous Matrix

Given $^A_BT$: 

![[Screenshot_20220428_154720 1.png]]

We need to find $^B_AT$.

$^A_BT$ gives the description of $P$ with respect to $A$ given the same point with respect to $B$. So expanding the matrix gives us:

$$^AP =\ ^A_BR *\ ^BP + ^AP_{Borg}$$

The inverse of the matrix will give the description of $P$ with respect to $B$ given the same point with respect to $A$. This can be found by re arranging the above equation to:

$$
\begin{align}
^BP &= ^A_BR^T(^AP-^AP_{Borg})\\
^BP &= ^A_BR^T*\ ^AP -\ ^A_BR^T*\ ^AP_{Borg}  
\end{align}
$$

Which can be re written as a homgeneous matrix which represents the matrix $^B_AT$ or $^A_BT^{-1}$ which would look like this:
$$
\begin{pmatrix}
^A_BR^T & -^A_BR^T\cdot^AP_{Borg}\\
000 & 1
\end{pmatrix}
$$

![[Screenshot_20220428_161807.png]]

