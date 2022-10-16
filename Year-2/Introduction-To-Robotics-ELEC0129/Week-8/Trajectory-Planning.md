# Trajectory Planning
`Trajectory planning` is the design of a time profile of position, velocity and acceleration. In context of robotics, trajectory planning will describe the acceleration, positioning and velocity of a robot over time when moving from point a to b.

These changes can be modelled using graphs:

![[Pasted image 20220505112108.png]]

In order for a robot to follow this time profile we need mathematical functions to express them:

$$
x = f(t) ~~ \dot{x} = f^\prime(t) ~~ \ddot{x}=f^{\prime\prime}(t)
$$
These values will allow the control to have reference values for the system to follow.

In order to obtain the function $f(t)$ we need:
* The current position and orientation of the robot
* The desired position and orientation of the robot
* The time to reach the target position 
* The general shape of the path.

With these we can find $f(t)$, and through differentiation $f^\prime(t)$ and $f^{\prime\prime}(t)$ com naturally.

#### Cartesian space schemes:
Cartesian space schemes specify orientation and position as functions with respect to time:

$$
\begin{align}
x &= f_x(t)\\
y &= f_y(t)\\
z &= f_z(t)\\
r_x &= f_{rx}(t)\\
r_y &= f_{ry}(t)\\
r_z &= f_{rz}(t)\\
\end{align}
$$
This requires 6 different functions.

##### Advantages
* Can enforce the shape of the path
* Can enforce the orientation of the end effector.
##### Disadvantages
* Computationally expensive - Inverse kinematics has to be solved to determine the joint parameters at every time step.
* Prone to problems relating to worksapce singularities.
	* Points in path may not be reachable
	* Start and end points may only be reachable in certain configurations
	* High joint rates near singularities

#### Joint Space Schemes
Joint space schemas specify the joint parameters as functions with respect to time:
$$
\begin{align}
\theta_1 &= f_{\theta_1}(t)\\
\theta_2 &= f_{\theta_2}(t)\\
&...\\
\theta_n &= f_{\theta_n}(t)\\

\end{align}
$$
This requires as many functions as there are joints.

##### Advantages
* Easy to compute
* No issues with singularities
##### Disadvantages
* Path is not linear - may be a problem if there are possible collisions

The design process for the function for cartesian and joint space schemas, $f_u(t)$ is the same.
All these functions can be calculated if given:

$$
\begin{align}
\text{start position: } &u_0 \\
\text{end position: } &u_f\\
\text{time to reach end position: } &t_f \\
\end{align}
$$
### Straight Line
The simplest trajectory is a linear time profile, which has the function:

$$
f(t) = \begin{cases}
\frac{u_f-u_0}{t_f}t + u_0 & t<t_f\\
u_f & \text{otherwise}
\end{cases}
$$
###### Disadvantage
The and velocity acceleration is instantaneous at times $0$ and $t_f$ which causes jerky motion and vibrations which increases wear and tear.

### Cubic Path
A cubic path gives a smooth change in velocity using the function:

![[Cubic-Polynomial#^a424e2]]

Where:

![[Cubic-Polynomial#^f59bc2]]

###### Disadvantage
The acceleration is still non zero at the start and end of motion which can cause some jerkiness.

### Quintic Path
A quintic path gives a smooth change in velocity and acceleration using the function:
![[Quintic-Polynomial#^abbf75]]

Where:

![[Quintic-Polynomial#^3cdf66]]

###### Disadvantage
The motion is not natural as the max speed is reached at only the midpoint.

### Linear Function with Parabolic Blends
A LFwPB path will provide a natural path with smooth acceleration and velocity, using the function: 

![[Linear-Functions-With-Parabolic-Blends#^74fbb6]]

Where:

![[Linear-Functions-With-Parabolic-Blends#^e7eeea]]
