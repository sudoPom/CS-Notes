# Forward Kinematics
Forward kinematics is the process of determining the process of finding the position of the end effector, given:
* Link lengths $a_{i-1}$
* Link twists $\alpha_{i-1}$
* Link offsets $\theta_i$
* Joint angles $d_i$

These are known as the Denavit-Hartenberg Parameters.

A `link` is a rigid body between two joints. 

The `link length` is defined as the distance between the two axis of the joints.
The `link twist` is defined as the angle between the two joint axis. 

While in simple robots, it can be easy to determine the position and orienntation of the end effector, for non planar robots a more general approach is required.

This process is as follows:

* Attatch frames from  frame $1$ to frame $n-1$ of the mechanism 
	- the $z$ axis should be along of the axis of rotation of a revolute joint and along the axis of translation for prismatic joints, the direction does not matter but should be consistent.
	- the $x$ axis should be along the mutual perpendicular between axis.
	- the $y$ axis can be assigned using the right hand rule.

![[Screenshot_20220429_134631.png]]

- Attatch frame $0$ such that it is in the same position as frame $1$ but with $\theta_0$ being when $\theta_1 = 0$. This frame is fixed.

![[Screenshot_20220429_134819.png]]

- Attatch frame $n$ where:
	- $z_n$ points along the $n$th joint axis.
	- $x_n$ pointing in the direction such that, if $\theta_3=0$ $x_n$ is aligned with $x_{n-1}$. 

* Determine the link lengths from $a_0$ to $a_{n-1}$
	* The link length $a_{i-1}$ is the istance between $z_{i-1}$ to $z_i$ along $x_{i-1}$. This value is constant.
* Determine the link twists from $\alpha_0$ to $\alpha_{n-1}$.
	* The link length $\alpha_{i-1}$ is the angle between $z_{i-1}$ and $z_{i}$ about $x_{i-1}$. This value is constant.
* Determine the link offsets $d1$ to $d_n$ 
	* The link offset $d_i$ is the distance between $x_{i-1}$ to $x_{i}$ along $z_i$. This will be variable for prismatic joints.
* Determine the joint angles $\theta_i$ to $\theta_n$
	* The joint angle $\theta_i$ is the angle between $x_{i-1}$ and $x_i$ about $z_i$. This will be variable if the joint is revolute.
* These values should be put into a table:
	![[Screenshot_20220429_140550.png]]

The transformations betweem any two frames can then be simpliied to four steps:

* Rotate frame $i-1$ by an angle $\alpha_{i-1}$ about the $x$ axis.
* Translate the frame across by distance $a_{i-1}$ by the $x$ axis.
* Rotate the frame about the $z$ axis by angle $\theta_i$
* Translate the frame along the $z_i$ axis by $d_i$

$$
\begin{align}
^{i-1}_iT = R_x(\alpha_{i-1})\cdot D_x(a_{i-1})\cdot R_z(\theta_i) \cdot D_z(d_i)
\end{align}
$$

Which gives the transformation matrix between any two frames as:

![[Screenshot_20220429_141552.png]]

This will allow us to get the position and orientation of frame $n$. From here the end effector can be found like so:

$$
^0P = ^0_nT\cdot\ ^nP
$$

Where $^nP$ is the distance between the $n$th frame and the end effector.