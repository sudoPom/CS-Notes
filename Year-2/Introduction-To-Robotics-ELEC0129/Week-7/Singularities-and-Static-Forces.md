# Singularities
A `singularity` occurs when a robot loses the ability to move the end effector in a certain direction or when the end effector cannot rotate about a certain axis. A singularity occurs when the jacobian matrix becomes non invertible.

![[Velocity-Propogation#Jacobian Matrix]]

This can be done by finding the determinant of the jacobian matrix (ignoring any 0 rows). 

## Static Forces
The thing we want to determine is the joint torques required to keep the robot in static equilibrium. This robot could be holding something, or pushing an object.

$$
\tau = J_v^T\cdot F
$$
Where:

$$
\tau = \begin{bmatrix} 
\tau_1\\\tau_2\\...\\\tau_n
\end{bmatrix} \ 
F = 
\begin{bmatrix} 
F_z\\F_x\\F_y
\end{bmatrix}
$$
$F$ is the desired force and $\tau$ represents the motor torques.

It is easiest for these to be represented with respect to the zero frame.

$$
^0\tau =\ ^0J_v^T\cdot\ ^0F
$$

There is a torque for each joint in the robot. Positive torques act in the anti clockwise direction.

###### Static forces at singularities
At a singularity, no torque is required to withstand large forces.