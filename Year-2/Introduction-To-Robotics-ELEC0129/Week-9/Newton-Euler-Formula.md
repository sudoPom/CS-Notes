# Newton Euler Formula
The Newton Euler Formula is based on:
*  [[Newtons-Second-Law]]: $F=ma$
* [[Euler's equation]]: $N = ^cI\dot{w}+w\times ^cIw$ 

Similarly to velocity, see [[Velocity-Propogation]], acceleration can also be propogated between frames $0$ to $n$ and from frame $i$ to the center of mass. With these values, the resultant force $F$ can be calculated.

$F$ consists of all the forces caused by the motors at both sides of the link, combined with any external forces acting at the end effector.

## Outward Iteration 
The algorithm starts with:

$$
\begin{align}
^0w_0 &= 0 \text{ angular velocity}\\
^0v_0 &= 0 \text{ linear velocity}\\
^0\dot{w}_0 &= 0 \text{ angular acceleration}\\
^0\dot{v}_0 &= G \text{ elaborated further later}
\end{align}
$$
The velocities and accelerations are calculated frame by frame.

For velocity:
![[Screenshot_20220505_171442.png]]
for angular acceleration:
![[Screenshot_20220505_171426.png]]

and for linear acceleration:

![[Screenshot_20220505_171403.png]]
($\dot{d}$ and $\ddot{d}$  terms are 0 when revolute and variable when prismatic)

To propogate the linear acceleration to the center of mass:

![[Screenshot_20220505_171516.png]]

The force and moment can then be calculated at the center of mass:

![[Screenshot_20220505_171942.png]]
When calculating the

This is done until link $n$.

For point center of masses $n$, the inertial tensor $^{c_{n}}I_n$ is 0.

## Inward Iteration
The algorithm starts with the forces and torques at the tip thte robot tip, $^nf_n, ^nn_n$. If the end effector is not in contact with the environment then these values will be the 0 vector. 
![[Screenshot_20220505_170722.png]]![[Screenshot_20220505_170738.png]]

This is repeated until $i=1$

The joint torques and forces can be extracted:
![[Screenshot_20220505_170834.png]]

Finally the effect of gravity can be taken into account:

$$
\begin{align}
^{0}\dot{v}_0 = G
\end{align}
$$
Where $G$ has the magnitude of the gravity vector but points in the opposite direction relative to the 0 frame.

As you can tell, this is kind of long, so use substitutions like $^2F_{2_x}$ to simplify things, then substitute things back at the end.

## Form of Dynamics Equations
Once you have the $\tau$ values you can extract them into the equation:

![[Manipulator-Dynamics#^8c3031]]

* The $n \times\ n$ matrix $M$  should contain all the coefficients of $\ddot{q}$ 
	* Where the $i$th row and the $j$th column represents the coefficient of $\ddot{\theta}_j$ present in $\tau_i$  
* The $n\times\ 1$ matrix $V$ should contain all the terms of $\dot{q}$
	* Where the $i$th row contains all terms where any $\dot{\theta}$ is present in $\tau_i$  
* The $n\times 1$ matrix $G$ should contain all the terms containing $g$ (gravitational force.)

### Friction
All mechanisms are affected by friction, which can be represented in the dynamic equation:

$$
\begin{align}
M(q)\ddot{q} + v(q, \dot{q}) + G(q) = \tau-\tau_{friction}
\end{align}
$$

As friction slows things down. There are several models for friction.

###### Viscous Friction

^8972fb

Friction that is proportional to velocity"
$$
\begin{align}
\tau_{friction} = k\dot{q}
\end{align}
$$

###### Culomb Friction
Friction is constant but the sign of the friction depends on the sign of velocity.
$$
\begin{align}
\tau_{friction} = c \cdot\ sgn(\dot{q})
\end{align}
$$
Where:
$$
\begin{align}
sgn(x) = \begin{cases}
1 & x\geq 0\\
-1 & otherwise
\end{cases}
\end{align}
$$

A combination of viscous and coulomb friction can provide a more accurate representation of friction:

$$
\begin{align}
\tau_{friction} = c \cdot\ sgn(\dot{q}) + k\dot{q}
\end{align}
$$

###### Stribeck Friction
An even more accurate model, which uses exponentials, but we don't need to know about this :).


## Dynamic Model in Cartesian Space
This can be derived from the joint space model defined above:

$$
\begin{align}
M_x(q)\ddot{x} + v_x(q, \dot{q}) + G_x(q) = F
\end{align}
$$
The matricies are still dependant on the joint configuration.
We know the relationship between the forces on the end effector $F$ and the joint torques $\tau$ is:

![[Pasted image 20220505235153.png]]

Additionally we know the relationship between joint and end effector velocities:
![[Pasted image 20220505235401.png]]

Pre multiplying the joint space dynamic equation with $J^{-T}$ gives:

![[Pasted image 20220506000018.png]]

From $\dot{x} = J(q)\dot{q}$ we can obtain $\ddot{x}$ through differentiation. 

![[Pasted image 20220506000157.png]]

Substituting $\ddot{q}$ into the joint space equation gives:
![[Pasted image 20220506000238.png]]

Which is our new cartesian space dynamic equation.

In this frame it is better to use $^eJ_v$ rather than $^0J_v$ as we want the force to be along the end effector axis.

$$
\begin{align}
^eJ_v =\ ^e_0R\cdot\ ^0J_v
\end{align}
$$

#### Inertia Tensor
Similarly to how mass provides a resistance to motion, the moment of inertia also represents a resistance to motion, This resistance depends on the shape and mass distribution of the object, as well as the axis of rotation.

The `inertia tensor` is the generalisation of the moment of inertia. 
For one object, if we place a frame $A$ ar a particular location, the inertia tensor is:

$$
^AI = \begin{bmatrix}
I_{xx} & -I_{xy} & -I_{xz}\\
-I_{xy} & I_{yy} & -I_{yz}\\
-I_{xz} & -I_{yz} & I_{zz}\\
\end{bmatrix}
$$

The diagonal terms are:
* The `mass moment of inertia`:
$$
\begin{align}
I_{xx}=\int\int\int (y^2+z^2)\rho ~ dv\\
I_{yy}=\int\int\int (x^2+z^2)\rho ~ dv\\
I_{zz}=\int\int\int (y^2+x^2)\rho ~ dv\\
\end{align}
$$
The off diagonal terms are:
* The `mass product of inertia`:
$$
\begin{align}
I_{xy} = \int\int\int(xy)~\rho~dv \\
I_{xz} = \int\int\int(xz)~\rho~dv \\
I_{yz} = \int\int\int(yz)~\rho~dv \\
\end{align}
$$
Where $\rho$ is the density of the object and $v$ is volume. So $dv=dx~dy~dz$. Intergrating will give you some volume $v$ times by the density $\rho$ which gives the mass of the object. 

##### Computing the inertial tensor
* Split $dv$ to $dx~dy~dz$
* Set the limits to integrate the object across each axis. 
* Intergrate with respect to $x$ term, then $y$, then $z$, substituting limits as you go.

If the frame is positioned at the `principle axis` the off diagonal terms are 0 and the moments of inertia are the `principle moments of inertia`.

In the dynamics equations we've placed the frame at the center of mass which is why it has been $^{ci}I_i$. 