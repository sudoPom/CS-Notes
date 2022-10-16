# Inverse Kinematics
`Inverse Kinematics` is the process of finding the joint parameters required to move a robot to a given position and orientation.

The position of the last frame will be known. More generally:

![[Pasted image 20220504142208.png]]

Where $r_{nm}$ is known and consists of three independent numbers, and $p_{xyz}$ are known. Making up 6 indpendent equations and 6 values to find $q_i$.

## Existence & Uniqueness of Solutions
If the desired target point lies within the manipulators workspace, there exists at least one solution. 

##### Existence

The `workspace` of a robot is the volume of space that the end effector can reach. For points within the worksace there are usually more than 1 orientations to reach the desired point, whereas if the point is on the boundary of the robots workspace then there will be 1 orientation to reach the point.

##### Uniqueness
The number of orientations a robot can reach a point dictates how many solutions there are.
To place the end effector at an arbritrary position and orientation within its space, it requires a domain of freedom of at least 6. If the DOF is greater than 6 there are an infinite number of solutions and the manipulator is known as redundant.

Having multiplicities of solutions allows the robot to be able to choose a path that will avoid collision. However this means the system has to choose one of the many solutions. If there are no collisions then the best choice is to choose the closest solution - the one that requires the smallest amount of movement.

## Geomtric Solution

The geometric solution of calculating the inverse kinematics of a robot involves using trigonometric rules such as the cosine rule to determine the joint parameters. 

In general, given the elbow up solution, $\theta$, the elbow down solution is just $-\theta$.

If the robot is planar then the sum of all the angles is equal to the final orientation.

There is no general algorithm for the geometric solution. :)

## Algebraic Solution
This approach involves solving the simultaneous equations. There is no general algorithm for this either but there are two techniques that help find solutions.

Comparing the general transform from base to final frame of the robot you can equate terms of the matrix to find the the angles of the joints. For example you may have:

![[Pasted image 20220504145648.png]]

From this you can deduce that:
$$
\begin{align}
cos\phi &= cos\theta_{123}\\
sin\phi &= sin\theta_{123}\\
x &= L_2cos\theta_{12} + L_1cos\theta_{1} \\
y &= L_2sin\theta_{12} + L_1sin\theta_{1} 
\end{align}
$$
##### Square and Sum technique

$$
\begin{align}
x^2 + y^2 &= L_1^2 + L_2^2 + 2L_1L_2(C_1C_{12}+S_1S_{12})\\
 &= L_1^2 + L_2^2 + 2L_1L_2cos(\theta_2)\\
 cos\theta_2 &= \frac{x^2+y^2-L_1^2-L_2^2}{2L_1L_2}
\end{align}
$$
There are still multiple solutions so to find them:

$$
\begin{align}
sin\theta_2 = \pm\sqrt{1-cos^2\theta_2}
\end{align}
$$
Where the sign corresponds to the angle up or down solution.

Finally $\theta_2$ can be found by doing:

$$
\theta_2 = arctan2(sin\theta_2,cos\theta_2)
$$
##### Trigonometric Substitution
Now that $\theta_2$ is known we have, for some constants $K_1 = L_1+L_2C_2$ and $K_2=L_2S_2$ we have:

$$
\begin{align}
x = K_1C_1 - K_2S_1\\
y = K_1S_1 + K_2C_1
\end{align}
$$

Let:

$$
\begin{align}
r = +\sqrt{K_1^2+K_2^2}\\
\gamma = arctan2(K_2,K_1)
\end{align}
$$
Giving us the triangle 

![[Pasted image 20220504152006.png]]

More generally, the radius and angle is made of the coefficients of the $cos$ and $sin$ terms.

All these terms are still known since $K_1$ and $K_2$ are known.

Using this triangle we have:

$$
\begin{align}
K_1 = rcos\gamma\\
K_2 = rsin\gamma\\
\end{align}
$$
Meaning we have two equations for $x$ and $y$

$$
\begin{align}
x = K_1C_1-K_2S_1 = rcos(\gamma) C_1 - rsin(\gamma) S_1\\
y = K_1S_1+K_2C_1 = rcos(\gamma) S_1 + rsin(\gamma) C_1
\end{align}
$$

After simplification:

$$
\begin{align}
\frac{x}{r} = cos(\gamma+\theta_1)\\
\frac{y}{r} = sin(\gamma+\theta_1)
\end{align}
$$
Finally:

$$
\begin{align}
\gamma+\theta_1 = arctan2(\frac{y}{r},\frac{x}{r})\\
\theta_1 = arctan2(\frac{y}{r},\frac{x}{r})-\gamma
\end{align}
$$

$\theta_3$ can then be calculated as follows:

$$
\begin{align}
&\cos\phi = C_{123}\\
&\sin\phi = S_{123}\\
&\theta_3 = arctan2(\sin\phi,\cos\phi)-\theta_1-\theta_2
\end{align}
$$