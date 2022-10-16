# Manipulator Dynamics
Determines the amount of torque required to acceletate the robot from rest to constant velocity, and then back to rest. Dynamics provides equations of motion to model this.

A manipulators joint space dynamic equation is of the form:

$$
\begin{align}
M(q)\ddot{q} + v(q, \dot{q}) + G(q) = \tau
\end{align}
$$

^8c3031

Where:

$M(q)$ is an $n\times n$ mass matrix of the robot which depends on the generalised joint coordinates $q$ (angles/displacement). The percieved inertia depends on the mass contribution and length of the links.

$V(q,\dot{q})$ is an $n \times 1$ vector consisting of:  
* [[Centrifugal force]] 
* [[Coriolis-Force]] 

$V$ is dependant on the joint coordinates and velocity, meaning if $q=0 \text{ or } \dot{q}=0$  then $v(q,\dot{q})=0$

$G(q)$ is the $n\times 1$ vector of gravity terms, which is dependent on the joint coordinated/configuration of the robot.

Lastly $\tau$ is the generalised forces at each joint. (This could either be a force for prismatic joints and torque for revolute joints)

