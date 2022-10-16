# Simple Camera
In graphics we have a simple world consisting of a variety of shapes described by formulas. To view this world as a an image we need a `camera`.

A Camera requires a `centre of projection` which is where all of the rays originate from. The image captured will be from a fixed distance away from the centre of projection, $d$.

![[Pasted image 20221006120737.png]]

The boundary between $y_{max}$ and $y_{min}$ represents the boundaries of the image (The same follows for $x_{max}$ and $x_{min}$ )

![[Pasted image 20221006140929.png]]

To form rays, pixels are mapped from a $M\times N$ pixel window to points in the camera view plane (above). Rays always go through the centre of a pixel. Therefore the pixel $(i,j)$ corresponds to a rectangle with:
$$
\begin{align}
\text{width } = (x_{max} - x_{min})/M\\
\text{height } = (y_{max} - y_{min})/N
\end{align}
$$
And therefore the final 3D point, $P$, that the ray goes through is:

$$
\begin{align}
P_x &= x_{min}+width(i)+0.5\\
P_y &= y_{min}+height(j)+0.5\\
P_z &= 0
\end{align}
$$
The ray that goes through $(i,j)$ is therefore defined as a function with respect to $t$:

$$
\begin{align}
p(t) &= (x(t), y(t), z(t))\\
&= (t(x_{min}+width(i)+0.5), t(y_{min}+height(j)+0.5), d-td)
\end{align}
$$

^c9a58c

## Ray Casting
Ray casting is the process of "firing" off a ray from the centre of projection and then determinig whether the ray intercts with an object in the world. This can be done by modelling these objects using mathematical equations, substituting the [[Simple-Camera#^c9a58c|equation]] of the ray into the object's equation and solve for the values of $t$. 

#### Sphere Intersection
For example, the equation of a sphere centred about the origin has equation:

$$
\begin{align}
x^2 +y^2 +z^2 = r^2
\end{align}
$$
Substituting the ray equation gives the following:
$$
\begin{align}
(p_x+td_x)^2 + (p_x+td_x)^2 + (p_x+td_x)^2 &= r^2 \\
p^2_x+2p_xtd_x + (td_x)^2 + p^2_y+2p_ytd_x + (td_y)^2 + p^2_z+2p_xtd_z + (td_z)^2 &= r^2\\
(d_x^2 + d_y^2 + d_z^2)t^2 + 2(p_xd_x + p_yd_y + p_zd_z)t + (p^2_x+p^2_y+p^2_z - r^2) &= 0 \\
at^2 + bt + c &= 0 ~ \text{(quadratic polynomial)}\\
(d\cdot d)t^2 + 2(p\cdot d) + (p\cdot p) - r^2 &= 0 
\end{align}
$$

Of course there is the event where a ray does not intersect a sphere. This can be checked for by seeing if the quadratic equation has any roots:

$$
\begin{align}
&b^2 - 4ac < 0: ~~ \text{no roots - no intersection}\\
&b^2 - 4ac = 0: ~~ \text{one root - ray is tangential}\\
&b^2 - 4ac > 0: ~~ \text{two roots - ray intersects twice}\\
\end{align}
$$
In the case that the ray intersects the sphere, the values of $t$ can be found as follows:
$$
\begin{align}
t = (-b \pm\sqrt{b^2 - 4ac})/2a
\end{align}
$$
The point to display should then be the point closest to the centre of projection.

If the sphere is not centred at the origin, say $(P_x, P_y, P_z)$ the same process can be followed after translating th