# Velocity Propogation
Each joint in a robot has the ability of moving relative to it's neighbour, ie frame $1$ can move relative to frame $0$. The velocity of each link can be calculated in order from ther robot base base.

$$
velocity\ of \ link\ i+1 = velocity\ of \ link\ i + new\ component\ due\ to\ joint\ i+1
$$

### Notation

#### Rotational Velocity
Applies for rotational joints.

Relative speed: $^{i-1}\Omega_i$ (with respect to joint $i-1$)
Absolute velocity: $\omega_{i}$ (with respect to frame $0$)

Relative velocity is given as a $3\times1$ vector with a direction being the instantaneous axis of rotation and magnitude of speed. So the $i$th joint of a given robot rotating with a speed of $30^\circ$ about the $z$ axis the relative velocity would be:

$$
^{i-1}\Omega_i = \begin{bmatrix}
0\\
0\\
30
\end{bmatrix}
$$

The reference frame (the frame the rotation is relative to) can be changed by multiplying by the corresponding rotation matricies:

$$
^{i}\Omega_i =\ ^{i}_{i-1}R \cdot\ ^{i-1}\Omega_i
$$

Threfore we can find the relative velocity with respect to the base frame as so:

$$
^0\Omega_{i} =\ ^0_{i-1}R\cdot\ ^{i-1}\Omega_{i} = \omega_{i}
$$

The same rules follow for absolute velocity too:

$$
^{i+1}\omega_{i+1} =\ ^{i+1}_0R\cdot\ \omega_{i+1}
$$

#### Linear Velocity
Applies for prismatic joints.
Relative speed: $V_{i+1}$ with respect to joint $i$
Absolute speed: $v_{i+1}$ with respect to frame $0$

Recalling that:

![[Spatial-Description-and-Transformation#Position of a point]]

$$
\frac{d}{dt}(^iP_{i+1}) = ^iV_{i+1}
$$

Again, the rotation matrix can be used to change the frame of reference

$$
^{i+1}V_{i+1} =\ ^{i+1}_{i}R \cdot\ ^{i}V_{i+1}
$$

And changing the reference frame to the base frame will give the absolute velocity.

$$
^0V_{i+1} =\ ^0_{i}R\cdot\ ^{i}V_{i+1} = v_{i+1}
$$

And you can change the reference frame of absolute velocities as well.

$$
^{i+1}v_{i+1} =\ ^{i+1}_0R\cdot\ v_{i+1}
$$

### Velocity Propogation Algorithm

#### Rotational

For a joints $i$ and $i+1$:

If joint $i+1$ is revolute, the rotational velocities can be added if both of the velocities are expressed in the same frame:

$$
^i\omega_{i+1} =\ ^i\omega_i +\ ^i_{i+1}R \cdot\ ^{i+1}\dot{\theta}\cdot\ ^{i+1}\hat{Z}_{i+1}
$$

Where:

$$
Z = \begin{bmatrix}
0\\
0\\
1
\end{bmatrix}
$$
and $\dot{\theta}$ is the magnitude.

For the purpose of the algorithm, it is helpful to have the frames with respect to the $i+1$th frame:
$$
^{i+1}\omega_{i+1} =\ ^{i+1}_{i}R\cdot\ ^i\omega_i +\ ^{i+1}\dot{\theta}\cdot\ ^{i+1}\hat{Z}_{i+1}
$$

If the joint is prismatic, there is no new rotational velocity contributed by the joint:
$$
^{i+1}\omega_{i+1} =\ ^{i+1}_{i}R\cdot\ ^i\omega_i
$$

#### Linear
For a joints $i$ and $i+1$:

If the joint is revolute, there is no new linear velocity between the two of them. However the rotations at joint $i$ will create a tangential linear velocity, which can be calculated using the cross product:

$$
^iv_{i+1} =\ ^iv_i + ^i\omega_i \times ^iP_{i+1}
$$
Similarly we change the frame to with respect to the $i+1$th frame:
$$
^{i+1}v_{i+1} =\ ^{i+1}R_i\cdot(^iv_i + ^i\omega_i \times ^iP_{i+1})
$$

If the joint is prismatic then the propogated linear velocity is the tangential velocity caused from the previous joint plus the velocity caused by the joint.

$$
^{i+1}v_{i+1} =\ ^{i+1}R_i\cdot(^iv_i + ^i\omega_i \times ^iP_{i+1}) + \dot{d}_{i+1}\cdot\ ^{i+1}\hat{Z}_{i+1}
$$

Where $\dot{d}$ is the magnitude of the velocity.

### Algorithm

Starting from $^0\omega_0, ^0v_0$ (these are just the 0 vectors as frame 0 is fixed)
To calculate the next velocities:

For revolute joints:
$$
\begin{align}
&^{i+1}\omega_{i+1} =\ ^{i+1}_{i}R\cdot\ ^i\omega_i +\ ^{i+1}\dot{\theta}\cdot\ ^{i+1}\hat{Z}_{i+1}\\
&^{i+1}v_{i+1} =\ ^{i+1}_iR\cdot(^iv_i + ^i\omega_i \times ^iP_{i+1})
\end{align}
$$
And for prismatic joints:
$$
\begin{align}
&^{i+1}\omega_{i+1} =\ ^{i+1}_{i}R\cdot\ ^i\omega_i\\
&^{i+1}v_{i+1} =\ ^{i+1}R_i\cdot(^iv_i + ^i\omega_i \times ^iP_{i+1}) + \dot{d}_{i+1}\cdot\ ^{i+1}\hat{Z}_{i+1}
\end{align}
$$

The speed of the last frame can be propogated to the last frame to find it's speed as well. Since the end eddector is fixed, there is no relative velocity between them. However there is still a tangential component created by the last frame:

Speed for the end effector:

$$
\begin{align}
&^n\omega_e =\ ^n\omega_n\\
&^{n}v_{e} =\ ^nv_n + ^n\omega_n \times ^nP_{e}
\end{align}
$$

Lastly rotation matricies can be used to get the speed of any joint/end effector with respect to the base frame.

### Jacobian Matrix
The Jacobian matrix is a representation of the linear/rotational velocities in matrix form. For example: 

$$
\begin{align}
&^n\omega_e = \begin{bmatrix}
A\dot{\theta_1} + D\dot{\theta_2}\\
B\dot{\theta_2}\\
C\dot{\theta_3}\\
\end{bmatrix}
= J_{\omega}\cdot \dot{\theta}
= \begin{bmatrix}
A & D & 0\\
0 & B & 0\\
0 & 0 & C
\end{bmatrix} \cdot
\begin{bmatrix}
\theta_1 \\
\theta_2 \\
\theta_3 \\
\end{bmatrix}
\end{align}
$$
similarly for velocity:
$$
\begin{align}
&^nv_e = \begin{bmatrix}
A\dot{d_1} + D{\dot{d}_2}\\
B\dot{d_2}\\
C\dot{d_3}\\
\end{bmatrix}
= J_{v}\cdot {\dot{d}}
= \begin{bmatrix}
A & D & 0\\
0 & B & 0\\
0 & 0 & C
\end{bmatrix} \cdot
\begin{bmatrix}
\dot{d}_1 \\
\dot{d}_2 \\
\dot{d}_3 \\
\end{bmatrix}
\end{align}
$$

For linear velocity, the position of the end effector (or any frame) can be determined geometrically pretty easily. This can be expressed as a vector, which can then be differentiated to give the jacobian matrix.