For robots to be able to interact with objects they have an image of they need to be able to know the objects position and orientation wit
 ## Camera Calibration
 
 Determines the intrinsic parameters:
 * Focal Length
 * Scaling Factor
 * Distortion etc.
Extrinsic Parameters:
* Position of world frame relative to the camera
* Orientation of world frame with respect to camera frame.

## Image Formation
We will use the pinhole projection model to describe the relationship between the coordinates of a 3D image and it's projection onto the image plane. The light comes from a pinhole (the camera centre) and is projected onto the film, which is a focal length $f$ behind  the pinhole. Normally this means that the image will need to be inverted, but to simplify calculatons, we will work with a virtual plane that is a distance $f$ in front of the camera instead.

![[Pasted image 20221016140823.png]]

Graphically, the scenario looks like this:

![[Pasted image 20221016140904.png]]

## Intrinsic Parameters

The ratio between image coordinates and the focal distance is equal to the ratio between the real world coordinates and the distance between the object $z_c$ and the camera, meaning we can find out the image coordinates.

$$
\begin{align}
\frac{\tilde{y}}{f} = \frac{y_c}{z_c} \to \tilde{y} = f\frac{y_c}{z_c}
\end{align}
$$

The same follows for $\tilde{x}$:
$$
\begin{align}
\tilde{x} = f\frac{x_c}{z_c}
\end{align}
$$
The point in the image needs to be expressed in the pixel frame, which has relationship:

$$
\begin{align}
x = \frac{\tilde{x}}{dx} + x_0, ~~ y = \frac{\tilde{y}}{dy} + y_0
\end{align}
$$

Where:
* $x$/y is the location in the pixel coordinates
* $dx/dy$ is the scaling factor by the physical dimension of pixel
* $x_0/y_0$ is used to shift the centre of the image to the corner.

This gives us:

$$
\begin{align}
x &= \frac{\tilde{x}}{dx} + x_0 \\
&= \frac{f\frac{x_c}{z_c}}{dx} + x_0 \\
&= \frac{1}{z_c}(\frac{f}{dx}x_c + x_0z_c) \\

y &= \frac{1}{z_c}(\frac{f}{dy}y_c + y_0z_c) 
\end{align}
$$

These can then be written in matrix form to get:

$$
\begin{align}

\begin{bmatrix}
x \\ 
y  \\ 
1 
\end{bmatrix}
 = \frac{1}{z_c}

\begin{bmatrix}
\frac{f}{dx} & 0 & x_0 \\ 
0 & \frac{f}{dy} & y_0 \\ 
0 & 0 & 1 
\end{bmatrix}
 
\begin{bmatrix}
x_c \\ 
y_c  \\ 
z_c 
\end{bmatrix}
 =\frac{1}{z_c}
 
\begin{bmatrix}
\alpha & 0 & x_0 \\ 
0 & \beta & y_0 \\ 
0 & 0 & 1 
\end{bmatrix}


\begin{bmatrix}
x_c \\ 
y_c  \\ 
z_c 
\end{bmatrix}
 
\end{align}
$$
Where:
* $\alpha = \frac{f}{dx}$
* $\beta = \frac{f}{dy}$

It is also common to add a skewness parameter $\gamma$ into the equation to fix any distortion in the image.
$$
\begin{align}

\begin{bmatrix}
x \\ 
y  \\ 
1 
\end{bmatrix}

=\frac{1}{z_c}
 
\begin{bmatrix}
\alpha & \gamma & x_0 \\ 
0 & \beta & y_0 \\ 
0 & 0 & 1 
\end{bmatrix}


\begin{bmatrix}
x_c \\ 
y_c  \\ 
z_c 
\end{bmatrix}
 
\end{align}
$$

The right side of the equation is scale invariant, meaning that even if we were to scale $(x_c, y_c, z_c)$ by the same factor, the point $(x,y)$ would still be the same. Therefore, the equation is defined only up to a scale, using the proportionality sign:

$$
\begin{align}

\begin{bmatrix}
x \\ 
y  \\ 
1 
\end{bmatrix}

\sim
 
\begin{bmatrix}
\alpha & \gamma & x_0 \\ 
0 & \beta & y_0 \\ 
0 & 0 & 1 
\end{bmatrix}


\begin{bmatrix}
x_c \\ 
y_c  \\ 
z_c 
\end{bmatrix}

= K

\begin{bmatrix}
x_c \\ 
y_c  \\ 
z_c 
\end{bmatrix}
 

\end{align}
$$
The parameters $\alpha, \beta, \gamma, x_0$ and $y_0$ are the intrinsic parameters of the camera. 

## Extrinsic Parameters
The extrinsic parameters give the relationship between the **world coordinate system** and the **camera coordinate system**. In the camera coordinate system, the point on the object has coordinates $(x_c, y_c, z_c)$ and in the world coordinate system it has the position $(X, Y, Z)$.

The same point has the following relation (see [[Year-2/Introduction-To-Robotics-ELEC0129/Week-2/Mapping |mapping]]):

$$
\begin{align}
^CP =~ ^C_WR \cdot\ ^WP +\ ^CP_{Worgin}\\

\begin{bmatrix}
x_c \\ 
y_c \\ 
z_c 
\end{bmatrix}
=~ ^C_WR

\begin{bmatrix}
X \\ 
Y  \\ 
Z 
\end{bmatrix}
  +\ ^CP_{Worgin}\\
\end{align}
$$

## Camera Matrix
Combining the equations from the extrinsic and intrinsic parameters leads to:

$$
\begin{align}

\begin{bmatrix}
x \\ 
y  \\ 
1 
\end{bmatrix}
\sim K

\begin{bmatrix}
x_c \\ 
y_c  \\ 
z_c 
\end{bmatrix}

&=

K( ^C_WR

\begin{bmatrix}
X \\ 
Y  \\ 
Z 
\end{bmatrix}
  +\ ^CP_{Worgin})
\\
&= 

K[^C_WR ~~~~ ^CP_{Worigin}]


\begin{bmatrix}
X \\ 
Y \\ 
Z  \\ 
1 
\end{bmatrix}
 
 
\end{align}
$$
A **Planar checkerboard** is going to be used to perform calibration, with the $XY$ plane assumed to be lying on the checkerboard, meaning all points on the plane will have a $Z$ value of zero.

This simplifies the equation to

![[Pasted image 20221016145514.png]]

Where $H$ is the camera matrix.

## Camera Calibration

In the above equation $(x,y,X,Y)$ are known, but $H$ is not. Entering the known values into the equation will allow us to solve for $H$. With $H$ we are then able to extracr the intrinsic and extrinsic parameters.

Obtaining $H$ can be done by printing out a physical checkerboard, and measuring out at least four corner points of the black/white boxes accurately. These gives us $(X_i, Y_i)$ coordinates with respect to the world frame that lies on the checkerboard. where $i$ is given to each corner point.

![[Pasted image 20221016150019.png]]

We then take the first picture of the checkerboard. From the image, we find out where the pixel position of the corners are, giving us $(x_i, y_i)$ values for each corner point $i$.

For each point $i$ we have the equation:

$$
\begin{align}

\begin{bmatrix}
x_i \\ 
y_i  \\ 
1 
\end{bmatrix}
\sim

\begin{bmatrix}
h_{11} & h_{12} & h_{13} \\ 
h_{21} & h_{22} & h_{23} \\ 
h_{31} & h_{32} & h_{33}
\end{bmatrix}
 
\begin{bmatrix}
X_i \\ 
Y_i  \\ 
1 
\end{bmatrix}
 
\end{align}
$$

Because of the proportionality, we cannot calculate the $h$ values directly. On the other hand the proportionality means the the left side is a scalar multiple of the right, meaning their cross product wiuld be 0:

$$
\begin{align}

\begin{bmatrix}
x_i \\ 
y_i  \\ 
1 
\end{bmatrix}
\times
(\begin{bmatrix}
h_{11} & h_{12} & h_{13} \\ 
h_{21} & h_{22} & h_{23} \\ 
h_{31} & h_{32} & h_{33}
\end{bmatrix}
 
\begin{bmatrix}
X_i \\ 
Y_i  \\ 
1 
\end{bmatrix}
)
=

\begin{bmatrix}
0 \\ 
0  \\ 
0 
\end{bmatrix}
 
\end{align}
$$

Giving the equations:

![[Pasted image 20221016150704.png]]

This can be written in linear-in-parameter form:

![[Pasted image 20221016150743.png]]

This can be done for all the corner points we have measured on the checkerboard:

![[Pasted image 20221016150838.png]]

Where the big ass matrix is $\phi$ and $n$ is the number of measured points.

Since the right side of the equation is zero, a solution for this equation is having all the $h_{ij}$ elements be 0. Since the $h$ vector is the null space of $\phi$ we can use **singular value decomposition** to calculate the null space of the matrix $\phi$.

If the SVD of $\phi$ is:

$$
\begin{align}
\phi= U\Sigma V^T
\end{align}
$$

Then the vector $h$ will be the column of $V$ corresponding to the smallest singular value in $\Sigma$.
**Matlab has an SVD function which will order  $V$  in descending order, meaning $h$ will be in the LAST COLUMN OF $V$.   ^ed895d

With this matrix, $H$ is found for one image of the checkerboard.

This process is repeated 3 times for a set of 3 $H$ values, where each image of the checkerboard is in different positions and orientations:

![[Pasted image 20221016151933.png]]

### Recovering Intrinsic Parameters
With the $h$ values we will then try to recover the intrinsic parameters using a method discovered by **Zhengyou Zhang**. The equation relating $H$ to the parameters is:

$$
\begin{align}
H = 
\begin{bmatrix}
0 & 0 & 0 \\ 
\end{bmatrix}
 = K

\begin{bmatrix}
r_1 & r_2 & ^CP_{Worigin} \\ 
\end{bmatrix}
\end{align}
$$

Because $r_1$ and $r_2$ are vectors of a rotation matrix, we know that they are orthonormal, i.e.

$$
\begin{align}
&r_1^Tr_2 = 0\\
&r_1^Tr_1 = r^T_2r_2 = 1
\end{align}
$$
With these equations we get:

$$
\begin{align}
&h^T_1K^{-T}K^{-1}h_2 = 0\\
&h^T_1K^{-T}K^{-1}h_1=h_2^TK^{-T}K^{-1}h_2
\end{align}
$$
We can define $B$ as:
![[Pasted image 20221016153219.png]]

$B$ is symmetric and therefore only has 6 parameters.

Let $h_i$ be the $i$th column of $H$. We then have:

![[Pasted image 20221016153429.png]]

We already know the $h$ values and want to find $B$. Using the previous formulas we had before we now have:

![[Pasted image 20221016153643.png]]

Combining these equations into matrix form gives:

![[Pasted image 20221016154109.png]]

This equation is obtained for one $H$, or one checkerboard. We can repeat the process of stacking the equation for multiple $H$s from each checkerboard to get:

![[Pasted image 20221016154401.png]]

We can again solve for $b$ using the SVD of $v$

$$
\begin{align}
v = U\Sigma V^T
\end{align}
$$

$b$ will be the column of $V$ corresponding to the smallest singular value in $\Sigma$.

Now we have all the values of $b$ we can recover the intrinsic parameters. Recall that $b$ is:

![[Pasted image 20221016154803.png]]

The elements of $b$ are known but only up to a scale factor $\lambda$:
![[Pasted image 20221016154903.png]]

The intrinsic parameters can be recovered as:

$$
\begin{align}
&y_0 = \frac{(b_{12}b_{13}-b_{11}b_{23})}{b_{11}b_{22}-b_{12}^2}\\
&\lambda = b_{33} - \frac{b_{13}^2+y_0(b_{12}b_{13}-b_{11}b_{23})}{b_{11}}\\
&\alpha = \sqrt{\frac{\lambda}{b_{11}}}\\
&\beta = \sqrt{\frac{\lambda b_{11}}{(b_{11}b_{22}-b_{12})}}\\
&\gamma = - \frac{b_{12}\alpha^2\beta}{\lambda}\\
&x_0 = \frac{\gamma y_0}{\alpha} - \frac{b_{13}\alpha^2}{\lambda}
\end{align}
$$

This gives us $K$ 
$$
\begin{align}
K = 
\begin{bmatrix}
\alpha & \gamma & x_0 \\ 
0 & \beta & y_0 \\ 
0 & 0 & 1 
\end{bmatrix}
 
\end{align}
$$
### Recovering Extrinsic Parameters
Once $K$ is known we can recover the extrinsic image for each of the checkerboard images (since they are each in different positions and orientations).

For a given image we have:

$$
\begin{align}
H = 
\begin{bmatrix}
h_1 & h_2 & h_3 \\ 
\end{bmatrix}
= K 
\begin{bmatrix}
r_1 & r_2 & ^CP_{Worigin} \\ 
\end{bmatrix}
\end{align}
$$
Therefore:

$$
\begin{align}
&r_1 = K^{-1}h_1\\
&r_2 = K^{-1}h_2\\
&^CP_{Worigin}=~ K^{-1}h_3\\
\end{align}
$$
There is no guarantee that this is these values have the correct scale. Fortunately, the magnitude of $r_1$ should be one, so we can define a scale to ensure this is the case:

$$
\begin{align}
\sigma = \frac{1}{||K^{-1}h_1||}
\end{align}
$$
Changing the extrinsic parameters to:

$$
\begin{align}
r_1 &= \sigma K^{-1}h_1\\
r_2 &= \sigma K^{-1}h_2\\
r_3 &= r_1 \times r_2 \\
^CP_{Worigin}&=~ \sigma K^{-1}h_3\\
\end{align}
$$

## Robot Calibration
Robot calibration is the process of finding the relationship between the 3D robot frame and the 3D world franme. This can be done by placing the checkerboard on the object. Next the robot is moved so that the end effector touches the corner points of the checkerboard.

At each corner point we can find the position of the TCP end effector with respect to the robot frame $(X_{ri}, Y_{ri}, Z_{ri})$ by using [[Year-2/Introduction-To-Robotics-ELEC0129/Week-4/Forward-Kinematics|forward kinematics]].  We also know the position of the corner point $(X_i, Y_i, 0)$ with respect to the world frame.

Thius we therefore have the relationship between the two frames as:

$$
\begin{align}

\begin{bmatrix}
X_{ri} \\ 
Y_{ri} \\ 
Z_{ri}  \\ 
1 
\end{bmatrix}
 = 
\begin{bmatrix}
\rho_{11} & \rho_{12} & \rho_{13} & t_x \\ 
\rho_{21} & \rho_{22} &\rho_{23} & t_y \\ 
\rho_{31} & \rho_{32} & \rho_{33} & t_z \\ 
0 & 0 & 0 & 1 
\end{bmatrix}
 
\begin{bmatrix}
X_i \\ 
Y_i \\ 
0  \\ 
1 
\end{bmatrix}
 
\end{align}
$$
These parameters $\rho$ and $t$ can be found using a method devised by **Cashbaugh et al**.

The individual linear equations are:

$$
\begin{align}
X_{ri} = \rho_{11}X_i + \rho_{12}Y_i + t_x \\
Y_{ri} = \rho_{21}X_i + \rho_{22}Y_i + t_y \\
Z_{ri} = \rho_{31}X_i + \rho_{32}Y_i + t_z \\
\end{align}
$$
We can obtain the unknown parameters by **minimizing the square of errors** which are:


$$
\begin{align}
E^2_X = \Sigma^n_{i=1}(X_{ri} - (\rho_{11}X_i + \rho_{12}Y_i + t_x))^2\\
E^2_Y = \Sigma^n_{i=1}(X_{ri} - (\rho_{21}X_i + \rho_{22}Y_i + t_y))^2\\
E^2_Z = \Sigma^n_{i=1}(X_{ri} - (\rho_{31}X_i + \rho_{32}Y_i + t_z))^2
\end{align}
$$

The minimum value of the square of errors occurs when the derivatives are zero, for $E_X^2$ we have:
$$
\begin{align}
&\frac{\partial E^2_X}{\partial t_x} = -2\Sigma^n_{i=1}(X_{ri} - (\rho_{11}X_i + \rho_{12}Y_i + t_x)X_i2 = 0\\
&\frac{\partial E^2_Y}{\partial t_y} = -2\Sigma^n_{i=1}(X_{ri} - (\rho_{11}X_i + \rho_{12}Y_i + t_x))Y_i = 0\\
&\frac{\partial E^2_Z}{\partial t_z} = -2\Sigma^n_{i=1}(X_{ri} - (\rho_{11}X_i + \rho_{12}Y_i + t_x)) = 0
\end{align}
$$

The equation can be re written as:

![[Pasted image 20221016170246.png]]

Or in matrix form as:

![[Pasted image 20221016170502.png]]

The rotation parameters can then be found by solving this equation:

![[Pasted image 20221016170607.png]]

The remaining parameters can be obtained in the same way by using the $E^2_Y$ and $E^2_Z$ equations:

![[Pasted image 20221016170728.png]]

![[Pasted image 20221016170759.png]]

Finally, $(\rho_{13}, \rho_{23}, \rho_{33})$ can be calculated as:

$$
\begin{align}

\end{align}
$$