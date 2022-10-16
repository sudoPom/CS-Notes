`tags:`
# Linear Algebra
We are concerned with two `coordinate systems` used to describe the position of objects. There are `Left` and `Right` coordinate systems with the $x$ $y$ and $z$ axis.
![[Pasted image 20221003120801.png]]

A `point` is a vector from the origin $(0,0,0)$ to a given point in space $(x,y,z)$. Vectors can be scaled, added and subtracted. The length of a vector can be found as follows:
$$
\begin{align}
	\vert v \vert = \sqrt{x^2+y^2+z^2}
\end{align}
$$
A vector can be normalised such that it has the same direction but has a length 1:
$$
	v_{unit} = \frac{v}{\vert v\vert}
$$
The dot product of two vectors can be found by multiplying  the $x$ $y$ and $z$ components of each vector and summing them. This results in a scaler.
$$
$$
The `cross product` is a function which takes in two vectors and will give the normal of the two vectors.

## Matricies
A `Matrix` is an array of numbers with dimensions $m$ by $n$. All vectors are a $1\times n$ matrix.

`Identity matricies` are square $n\times n$ and have only 1's across the leading diagonal.
`Symetric matricies` have symmetrical elements across the leading diagonal.

Matricies can be multiplied with vectors to give a new vector. This is called a `transformation`.

### Rotation
Rotation matricies can be applied to vectors to keep the vectors magnitude but change it's direction by rotating the vector by some angel $\alpha$.

![[Pasted image 20221003122816.png]]

## Homogeneous Coordinates
A homogeneous point has an additional fourth coordinate which is always equal to 1. This allows us to include 3D translation in matrix form. See [[Year-2/Introduction-To-Robotics-ELEC0129/Week-2/Mapping|Mapping from robotics]]. 

A homogeneous point:
$$
\begin{align}

\begin{bmatrix}
x \\ 
y \\ 
z  \\ 
1 
\end{bmatrix}
 
\end{align}
$$

Homogeneous points allow translation of homogeneous points via matrix multiplication.
$$
\begin{align}

\begin{bmatrix}
1 & 0 & 0 & x \\ 
0 & 1 & 0 & y \\ 
0 & 0 & 1 & z \\ 
0 & 0 & 0 & 1 
\end{bmatrix}
\times

\begin{bmatrix}
a \\ 
b \\ 
c  \\ 
1 
\end{bmatrix}
 =

\begin{bmatrix}
a+x \\ 
b+y \\ 
c+z  \\ 
1 
\end{bmatrix}
 
\end{align}
$$

Matricices in homogeneous form can also encode transformations and rotations:

$$
\begin{align}

\begin{bmatrix}
R_1 & R_2 & R_3 & a \\ 
R_4 & R_5 & R_6 & b \\ 
R_7 & R_8 & R_9 & c \\ 
0 & 0 & 0 & 1 
\end{bmatrix}
 
\end{align}
$$

#### Homogeneous Division
Two vectors $v_1,~v_2$:

$$
\begin{align}

v_1 = \begin{bmatrix}
a \\ 
b \\ 
c  \\ 
w_1 
\end{bmatrix} ~~~~

v_2 = \begin{bmatrix}
x \\ 
y \\ 
z  \\ 
w_2 
\end{bmatrix}
 
\end{align}
$$

are homogeneous if:

$$
\begin{align}

\begin{bmatrix}
a/w_1 \\ 
b/w_1 \\ 
c/w_1  \\ 
w_1/w_1 
\end{bmatrix} 
= \begin{bmatrix}
x/w_2 \\ 
y/w_2 \\ 
z/w_2 \\ 
w_2/w_2 
\end{bmatrix}

\end{align}
$$


## Rays
A ray is a combination of a position and a direction that you are looking at. Rays can be described as:
$$
\begin{align}
&P(t) = P_0 + t(P_1 - P_0)
= \begin{cases}
x(t) = x_0 + t(x_1-x_0)\\
y(t) = y_0 + t(y_1-y_0)\\
z(t) = z_0 + t(z_1-z_0)
\end{cases}\\
&-\infty < t < \infty
\end{align}
$$
This equation describes all the points on a given ray. 
## Spheres 

^5fdade

A circle circle centered at $x,y$ and radius $r$ has equation:

$$
(x-x_c)^2 + (y-y_c)^2 = r^2
$$
This extends to the 3$^{rd}$ dimension for spheres:

$$
\begin{align}
(x-x_c)^2 + (y-y_c)^2 + (z-z_c)^2 = r^2
\end{align}
$$
