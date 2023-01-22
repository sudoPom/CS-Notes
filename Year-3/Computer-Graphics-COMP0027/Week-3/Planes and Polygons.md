Normally in computer graphics we describe things with polygonal meshes. Which allows for much more complex renders. A **polygonal face** $P$ is defined by a series of points :

$$
\begin{align}
P &= \set{p_1, p_2,...,p_{n-1}, p_n}\\
p_i &= (x_i, y_i, z_i)
\end{align}
$$
The points need to be co planar and the set of $P$ must consist of at least 3 points.

##### Convex vs Concave
Convex polygons tend to be easier to represent algorithmically as it is easy to split them up into triangles.

![[Pasted image 20221017112225.png]]

#### Equation of a Plane
A plane has general equation:

$$
\begin{align}
ax + bx + cz = d
\end{align}
$$
Where:
* $a, b, c$ forms a vector representing the normal to the plane
* $d$ represents the distance from the origin (in the direction of the normal)

The values $a,b,c$ can be found by using the cross product of any two non parallel vectors in a plane.  The value $d$ can be found by performing a dot product with the normal and any point on the plane.

## Polyhedra

Polyhedras is a **collection of polygons used to form a 3D object**. They typically follow the following conditions:
* Each edge connects two verticies
* Each vertex joins 3 (or more) edges
* No faces Intersect

Polyhedras follow this equation:

$$
\begin{align}
|V| - |E| + |F| = g + 2
\end{align}
$$
Where $g$ is the genus, or number of "holes" in the object

![[Pasted image 20221017115929.png]]

**Geometry** is the shape of a given object. Whilst **Topology** is the arrangement of edges.

Equal geometry different mesh topology:

![[Pasted image 20221017120438.png]]

Same mesh topology, different geometry:

![[Pasted image 20221017120533.png]]

###### Manifoldness
A polyhedron should ideally be **manifold** meaning:
* Each vertex has one loop of polygons/edges
* Each edge has one or two polygons.


### Point in Polygon

**Half space test** 
A point $p$ is inside a polygon if it is in the negative half space of all the line segments. This can be done by dotting the normal with the point. For a plane with equation:
$$
\begin{align}
ax + by + cz = d 
\end{align}
$$
We can compute the function $l$ Where:
$$
\begin{align}
l(x,y,z) = ax + by + cz - d
\end{align}
$$
For a point $p$:
$$
\begin{align}
\text{If } l(p) = 0 \text{ the point is on the plane}\\
\text{If } l(p) > 0 \text{ the point is in the positive half space}\\
\text{If } l(p) < 0 \text{ the point is in the negative half space}
\end{align}
$$

###### Barycentric combination
A barycentric combination is a weighted sum of points where the weights sum to 1.
$$
\begin{align}
\Sigma^n_{i=1} a_i = 1
\end{align}
$$
For weigths $a_k$

If a set of points $p_1,p_2,...,p_n$ are co planar points, then any given point $p$ is defined as being inside the convex hull defined if and only if:
$$
\begin{align}
0 \leq a_i ~~~ \forall_i
\end{align}
$$
The barycentric coordinates for a triangle with point $ABC$  and a test point $p$ can be calculated as such:

$$
\begin{align}
a_1 = \triangle(PBC) / \triangle(ABC)\\
a_2 = \triangle(APC) / \triangle(ABC)\\
a_3 = \triangle(ABP) / \triangle(ABC)\\
\end{align}
$$
Where $\triangle(ABC)$ represents the area of the triangle $ABC$. This can be calculated with the determinant:

![[Pasted image 20221115153858.png]]
