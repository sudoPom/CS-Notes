# Control Law Partitioning
There is a way to make the parameters $k_v$ and $k_p$ independant of the system parameters $k$, $b$ and $m$ discussed in [[Control#Control of Mass Damper]]. This can be done by partitioning the controller into two portions:
* The `model based compensator`, which cancels off the system dynamics, reducing the system to a unit mass.
* The `servo controller` - which allows $k_v,k_p$ to be modelled in a way that is independent of $k$, $b$ and $m$.

## Process
* Given system dynamics:
![[Pasted image 20220506031248.png]]
Design the model based compensator as:
![[Pasted image 20220506031312.png]]
by removing the highest term.

Making the system reduced to a unit mass:
![[Pasted image 20220506031602.png]]

The servo portion can be designed as:
![[Pasted image 20220506031641.png]]

Where $k_p$ is the desired stiffness and $k_v=2\sqrt{k_p}$ 

The closed loop equation looks like this:
![[Pasted image 20220506032958.png]]

This overall reduces the system to:
![[Pasted image 20220506031927.png]]

## Control Implementation
* A Force $F$ is exerted onto the object.
* Sensors measure the position $x$ and the velocity $\dot{x}$.
* The model determines $b\dot{x} + kx$ 
* The servo controller is used to calculate $-k_v\dot{x}-k_px = f$ 
* This value of $f$ is multiplied by some value $m$ 
* The values produced by the model and servo are added and acts as the force put back into the system.