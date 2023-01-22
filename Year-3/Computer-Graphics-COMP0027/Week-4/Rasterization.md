Ray tracing is elegant and general but is also slow. The idea behind rasterization is to project primitives rather than tracing rays. A standard rasterizaer cannot deal with reflections and refraction.

A raytracer works like so:
```
for all pixel rays i
	for all primitives j
		shade(intersect(pixel i, primitive j))
```

Whilst a Rasterizer would work like this:
```
for all primitves i
	for all pixels j in projection of primitive i
		shade(pixel j, primitive i)
```

There are several steps in rasterization:
* Projection
* Clipping
* Culling
* Rasterisation
* $z$ test 
* Shading

## Projection

![[Pasted image 20221024112708.png]]

Finding the point in the image plane is done by comparing similar triangles, just like in [[Camera-and-Robot-Calibration]]. 

$$
\begin{align}
x^{\prime} = \frac{dx}{d+z}
\end{align}
$$
This transformation can be done using 4x4 matricies, as they allow perspective division.

For a point $(x,y,z,1)$ we can perform perspective division carrying out this transformation:

$$
\begin{align}

\begin{bmatrix}
1 & 0 & 0 & 0 \\ 
0 & 1 & 0 & 0 \\ 
0 & 0 & 1 & 0 \\ 
0 & 0 & 1 & 1 
\end{bmatrix}


\begin{bmatrix}
x \\ 
y \\ 
z  \\ 
1 
\end{bmatrix}
=

\begin{bmatrix}
x \\ 
y \\ 
z  \\ 
z+1 
\end{bmatrix}
\end{align}
$$

Which results in the position:
$$
\begin{align}
\begin{bmatrix}
\frac{x}{z+1} \\ 
\frac{y}{z+1} \\ 
\frac{z}{z+1}  \\ 
1 
\end{bmatrix} 
\end{align}
$$
### Camera 

A camera is defined with a few parameters, including position, direction (where it is facing) and the "up" direction on the image. These are known as the View Reference Point $(VRP)$, View Plane Normal $(VPN)$ and the View up Vector ($VUV$) respectively. The $X$ axis for the camera is referred to as the $U$ axis to avoid confusion.
* $VRP$ is the origin
* $VPN$ is the $z$ axis ($N$ axis)
* $VUV$ is the $y$ axis ($V$ axis)
* $X$ ($U$ axis) forms the $LHS$ 

We would like to find a $4\times 4$ matrix which maps points in the world space to points in the camera space. Or in other words a mapping from world coordinates to view coordinates.

##### Basis Vectors
$$
\begin{align}
&n = \frac{VPN}{|VPN|}\\\\
&u = \frac{n\times VUV}{|n \times VUV|}\\\\
&v = u \times n

\end{align}
$$

##### Mapping (Rotation)
The rotation portion of the mapping matrix will be the upper $3\times3$ matrix. 
$$
\begin{align}
R = 
\begin{bmatrix}
u_1 & v_1 & n_1 \\ 
u_2 & v_2 & n_2 \\ 
u_3 & v_3 & n_3 
\end{bmatrix}
 
\end{align}
$$

##### Mapping Translation
The mapping portion of the translation is found in the bottom left most $1\times 3$ vector.
$$
\begin{align}
T = 
\begin{bmatrix}
\sum^{3}_{i=1}q_iu_i & \sum^{3}_{i=1}q_iv_i & \sum^{3}_{i=1}q_in_i \\ 
\end{bmatrix}
 
\end{align}
$$

This makes the entire mapping matrix from view space to world space:
$$
\begin{align}
M =
\begin{bmatrix}
u_1 & v_1 & n_1 & 0 \\ 
u_2 & v_2 & n_2 & 0 \\ 
u_3 & v_3 & n_3 & 0 \\ 
\sum^{3}_{i=1}q_iu_i & \sum^{3}_{i=1}q_iv_i & \sum^{3}_{i=1}q_in_i & 1 
\end{bmatrix}
 
\end{align}
$$

