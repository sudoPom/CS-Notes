
#### Shadows

When determining if a surface should emit light or not (in which case that point on the surface is a shadow) you can draw a ray from the intersection point to the light. If this ray intersects anything BEFORE the light, that point should be a shadow.

![[Pasted image 20221018165014.png]]

The overall light formula now becomes:
$$
\begin{align}
I_r = k_aI_a + v_iI_i(k_d<n,l>^+ + k_s(<h,n>^+)^m)
\end{align}
$$

^2a9b87

Where $v_i$ is the result of intersecting the ray $x, l$ with the scene and $v_i$ is the visibility of the light $i$. Given a point $x$ and light source $l$. A shadow is formed if:

$$
\begin{align}
0 < t < ||x-L||
\end{align}
$$
Where $t$ is the distance between a point on a surface and the $x$. 

![[Pasted image 20221018165630.png]]

#### Reflections
Reflections can be simulated by recursing and casting secondary rays from the intersection points. There needs to be a stopping conditions so that the ray tracer eventually finishes execution. This also follows for refraction.

Giving an incoming ray $e$ hitting a surface with normal $n$ the reflected ray $r$ can be found like so:
$$
\begin{align}
r = -e + 2(<n,e>)n
\end{align}
$$
![[Pasted image 20221018170715.png]]

For a given point:
$$
\begin{align}
Ir = I_{local} + K_rI_{Mirror}
\end{align}
$$

Where $I_{local}$ is calculated as [[Recursive-Ray-Tracing#^2a9b87|before]] and $I_{Mirror}$ is the light found a the reflected ray.

#### Refraction

**Snell's law** defines a ratio between refracted ray angles and the index of refraction for the surface mediums:

$$
\begin{align}
\frac{\sin\alpha}{\sin\beta} = \frac{\eta_2}{\eta_1}
\end{align}
$$

![[Pasted image 20221018171424.png]]

The refracted ray can then be found by computing:

$$
\begin{align}
t = -\eta_{12}e + n(\eta_{12}\times\cos\alpha - \sqrt{1+\eta_{12}^2}\times(\cos^2\alpha-1))
\end{align}
$$