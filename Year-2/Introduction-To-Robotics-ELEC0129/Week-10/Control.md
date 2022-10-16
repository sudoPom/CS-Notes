# Control
There are two ways to control the joints to ensure a robot follows a set trajectory. 

The first approximates the non linear coupled manipulator as a few joints/links, and we control the joints individually.

The second technique views the readings as a vector and generates the control signal as a vector. This provides better performance due to the nonlinearities and coupling being taken into effect.

### Natural System
For a natural system:
![[Pasted image 20220506022505.png]]

When the mass is pulled and released on a frictionless surface, the position of the mass can be modelled as:

$$
\begin{align}
m\ddot{x} = \sum{forces} &= -kx\\
m\ddot{x} + kx &= 0
\end{align}
$$

Solving the differential gives:
![[Pasted image 20220506022953.png]] ^507cce

Where $\omega_n = \sqrt{\frac{k}{m}}$, which is the natural frequency of the system.

If there is [[Newton-Euler-Formula#Viscous Friction]] then the perturbed and released mass can respond in three ways depending on the mass $m$, frictional force $b$ and spring constant $k$.

The new differential function with friction is:
![[Pasted image 20220506023329.png]] ^522992

which has characteristic equation:
![[Pasted image 20220506023638.png]]

The roots of which can be found by solving the quadratic formula, giving:
![[Pasted image 20220506023711.png]]

An `overdamped result` is given if $b^2 > 4mk$ (there are real and unreal roots)

The general solution of the second order derivative will then be given as:
![[Pasted image 20220506023858.png]]

The mass in this case decreases to equilibrium (0) very slowly.

An `underdamped response` is given if $b^2 < 4mk$ (complex roots)

The general solution of the second order derivative will then be given as:
![[Pasted image 20220506024128.png]]

The mass will have an oscillatory response with reducing amplitude.

A `critically damped response` is given if $b^2=4mk$ (real and equal roots)

The general solution of the second order derivative equation will be given as:
![[Pasted image 20220506024318.png]]

This causes the mass to reach equilibrium very quickly without oscillation, which is highly desired.

Constants $c_1$ and $c_2$ can be found using the initial conditions. 
At time $0$ determine the constants by using the fact that the velocity is 0 and the position is the amount the spring was perturbed.

## Control of a second order linear system
For a mass on a frictionless surface:
![[Pasted image 20220506024748.png]]

Determine the force required to move the mass to the desired position.

If the foce is proportional to $x$ and $\dot{x}$ then the system will behave similar to the [[Control#Natural System|mass-spring-damper system]].

[[Newtons-Second-Law]] states that $m\ddot{x}=F$

So the force can be designed as:
![[Pasted image 20220506025037.png]]

Where: 
![[Pasted image 20220506025105.png]]

This is the same form as the natural system and can therefore be solved in the same way for constants $k_v$ and $k_p$.

As mentioned earlier the preferred response is to have a critically damped response. Therefore $k_v$ and $k_p$ should be:
* $k_p$ can be set to any value according to the desired stiffness of the system.
* $k_v = 2\sqrt{mk_p}$  to satisfy the constraint for a critically damped response.

##### Control of Mass Damper

If the mass is in a spring damper system:
![[Pasted image 20220506025839.png]]

Where $b$ $m$ and $k$ do not provide critical damping.

We can provide an $F$ that causes a critically damped response.

Going back to newtons law for mass:
![[Pasted image 20220506030210.png]]

We can set $F$ to be:

![[Pasted image 20220506030228.png]]

Causing our controlled system to be:

![[Pasted image 20220506030248.png]]

Which again is in the form of the natural system, and therefore we can set values of $k_p$ and $k_v$ to obtain a critically damped response:
* $k_p$ can be set to have ($k+k_p$) to match the desired stiffness
* $k_v=2\sqrt{m(k+k_p)}-b$


