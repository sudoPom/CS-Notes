# Image Processing
To implement robotic vision we need cameras in order to take pictures. Theses images can include:
* Colour images
* Grey Scale images
* Black and white images
* Infrared images, etc

`Image processing` is the process of manipulating and analysing a 2d image to:
* Improve an image (Sharpen)
* Correct an image (Remove Noise)
* Change an image
* Analyse an image

### Grey-Scale Images
Real world images vary contiuously in shades and colours. When a camera captures an image the image is divided into individual points of brightness - `pixels`. Each pixel has an intensity value a number between 0 (black) and 255 (white). 

An image is sampled into a rectangular array of pixels, with each pixel having an $(x,y)$ coordinate. 
* $x$ is from left to right
* $y$ from top to bottom
The brightness (intensity value) for each pixel is written as:
$$
\begin{align}
I(x,y) = n \\
0 \leq n \leq 255
\end{align}
$$
In MATLAB the rows and columns are swapped:
$$
\begin{align}
I_{matlab}(1,2) = I(2,1)
\end{align}
$$
### Colour Images
For coloured images, each pixel has an three values for the intensity of red, green and blue. These three colours can combine to create all other colours. This is the `additive colour property`.

Converting back to grey scale can be done by taking the average of the three colour intensities.:

$$
I(grey) = \frac{I(red)+I(green)+I(blue)}{3}
$$

### Black and White Images
Grey scale images can be converted to black and white images. Black is represented by 0 and white is represented by 1. From a grey scale image, a threshold can be set to determine which pixel needs to be black.

## Pixel Point Processing
Pixel point processing is the process of taking in a single pixel as input and altering that same pixel. For example converting a grey scale image to a black and white image is a pixel point operation - the same operation is performed on each pixel individually.

### Complement
Converts all black pixels to white pixels and all white pixels to black pixels. 

### Differencing 
This operation takes in two images and subtracts from each other. This can be done to get rid of the background of an image.

![[Pasted image 20221003151309.png]]

## Pixel Group Processing
Pixel group processing operates on a group of pixels surrounding a center pixel. This is also known as `spatial filtering`. This is implemented through a process called `convolution`, where you perform an element wise multiplication with a mask.

![[Pasted image 20221003151811.png]]

The center pixel is then equal to the sum of these multiplications: 
$$
O(x,y) = w_{11}(x-1, y-1) + w_{12}I(x,y-1)+...+w_{33}(x+1,y+1)
$$
### Low Pass Spatial Filter

^2a34cd

A `Low Pass Filter` is used to remove the noise from an image. The mask may look like this:

$$
\begin{align}
	\begin{bmatrix}
		1/9 & 1/9 & 1/9 \\
		1/9 & 1/9 & 1/9 \\
		1/9 & 1/9 & 1/9
	\end{bmatrix}
\end{align}
$$
All the weights add up to 1.
This works by blurring out high frequency components and mostly ignoring low frequency components.

### Guassian Spatial Filter
The `Guassian spatial filter`  works similar to the low pass filter but instead the weights are altered to favour the pixels closer to the center of the mask:
$$
\begin{align}
	\begin{bmatrix}
		1/16 & 2/16 & 1/16 \\
		2/16 & 4/16 & 2/16 \\
		1/16 & 2/16 & 1/16
	\end{bmatrix}
\end{align}
$$

Again the weights here add up to 1.

### Median Filter
The median filter orders all of the pixels, from largest to smallest and takes the median of them. This works well in cases where there are extreme outliers.

### Sharpening
An image can be made by applying the following mask:
$$
\begin{align}
	\begin{bmatrix}
		0 & 0 & 0 \\
		0 & 2 & 0 \\
		0 & 0 & 0
	\end{bmatrix}
	-
	\begin{bmatrix}
		1/9 & 1/9 & 1/9 \\
		1/9 & 1/9 & 1/9 \\
		1/9 & 1/9 & 1/9
	\end{bmatrix}
	=
	\begin{bmatrix}
		-1/9 & -1/9 & -1/9 \\
		-1/9 & 17/9 & -1/9 \\
		-1/9 & -1/9 & -1/9
	\end{bmatrix}
\end{align}
$$
The intuition is that you multiply the original image by 2, and subtract away the blurred image, which will give a sharpened image.

## Feature Extraction
A robotic system needs to be able to identify simple features in order to recognize objects. For example:
* Where is the edge?
* Where is the Corner?
* Where is the Blob (Continuous object made of the same/similar texture/colour)

### Edge detection
If there is a big change between adjacent pixels, then it is an edge. This big change can be found by determining the gradient of the adjacent pixels.

$$
\frac{\partial I(x,y)}{\partial x} = \frac{I(x,y) - I(x_{-1},y)}{1}
$$
With Mask:
$$
\begin{align}
	\begin{bmatrix}
		0 & 0 & 0 \\
		0 & -1 & 1 \\
		0 & 0 & 0
	\end{bmatrix}
\end{align}
$$

$$
\frac{\partial I(x,y)}{\partial x} = \frac{I(x_{+1},y) - I(x_,y)}{1}
$$
With Mask:
$$
\begin{align}
	\begin{bmatrix}
		0 & 0 & 0 \\
		-1 & 1 & 0 \\
		0 & 0 & 0
	\end{bmatrix}
\end{align}
$$

$$
\frac{\partial I(x,y)}{\partial x_{}} = \frac{I(x_{+1},y) - I(x_{-1},y)}{2}
$$
With Mask: 
$$
\begin{align}
	\begin{bmatrix}
		0 & 0 & 0 \\
		-1 & 0 & 1 \\
		0 & 0 & 0
	\end{bmatrix}
\end{align}
$$

The same rules apply for vertical edges.

There are some more widely used gradient filters such as `Prewitt, Sobel` and `Laplacian` filters.

Prewitt:
$$
\begin{align}
M_x = 
\begin{bmatrix}
-1 & 0 & 1 \\ 
-1 & 0 & 1 \\ 
-1 & 0 & 1 
\end{bmatrix}
 ~~~M_y = 
\begin{bmatrix}
-1 & -1 & -1 \\ 
0 & 0 & 0 \\ 
1 & 1 & 1 
\end{bmatrix}
 
\end{align}
$$
Sobel:
$$
\begin{align}
M_x = 
\begin{bmatrix}
-1 & 0 & 1 \\ 
-2 & 0 & 2 \\ 
-1 & 0 & 1 
\end{bmatrix}
 ~~~M_y = 
\begin{bmatrix}
-1 & -2 & -1 \\ 
0 & 0 & 0 \\ 
1 & 2 & 1 
\end{bmatrix}
 
\end{align}
$$
Laplacian (Omnidirectional):
$$
\begin{align}
M_{xy} = 
\begin{bmatrix}
-1 & -1 & -1 \\ 
-1 & 8 & -1 \\ 
-1 & -1 & -1 
\end{bmatrix}
\end{align}
$$
Diagonal filters can be found by combining the two filters:

$$
Gradient_{combined} = \sqrt{Gradient^2_x + Gradient^2_y}
$$

### Corener Detection
A corner can be detected in regions where there is a high gradient in both the vertical and the horizontal direction. Using the combined horizontal and vertical filters, you can detect corners by determinig which pixels are above a predetermined threshold.

### Blob Detection 
A `Blob` is a region of connected pixels (pixels that re adjacent to each other) that have similar or the same pixel value. When trying to detect blobs, we are mostly concerned with the position and orientation of the blob, as well as the shapre of the blob. There are multiple ways of detecting the position of a blob.

For a simple circular blob, the position we are concerned with would be the centre, this can be found  easily by:
* Finding the maximum and minimum pixel location in the x and y axis
* Calculate the average (or midpoint) along these two axes. These midpoints will be the location of the centre.

This method however only works for circular blobs, and can be easily be wrong in the presence of noise.

#### Moments
The moment of an object can be used to better find the center of an object, or `centroid`, even if it is non symmetrical.

The p-q-th moment is defined as:
$$
\begin{align}
M_{pq} = \Sigma_{(x,y)\in \text{Image}} x^{p}y^{q}I(x,y)
\end{align}
$$
In a binary image, when we set $p$ and $q$ equal to 0, $M_{pq}$ is just equal to the number of white pixels present, or the area of the object.

Moments can be used to find the center of mass of any given object:

$$
\begin{align}
X_c = \frac{M_{10}}{M_{00}}~~~~
Y_c = \frac{M_{01}}{M_{00}}
\end{align}
$$
#### Central Moments
Moments can also be calculated with resepct to the center of mass. This is known as the central moment:
$$
\begin{align}
\mu_{pq} = \Sigma_{(x,y)\in \text{Image}} (x-X_c)^{p}(y-Y_c)^{q}I(x,y)
\end{align}
$$
It can be shown that:

$$
\begin{align}
\mu_{00} &= M_{00} \text{ (area)}\\
\mu_{01} &= 0 \\
\mu_{10} &= 0 \\
\mu_{11} &= M_{11} - X_cM_{11} = M_{11} - Y_cM_{10} \\
\mu_{20} &= M_{20} - X_cM_{10}\\
\mu_{02} &= M_{02} - Y_cM_{01}\\
\end{align}
$$

Which can be used to create the inertia matrix of a blob: 
$$
\begin{align}



\begin{bmatrix}
\mu_{20} & \mu_{11} \\ 
\mu_{11} & \mu_{02} 
\end{bmatrix}
 
\end{align}
$$

#### Inertia Matrix And Ellipses
Using the inertia matrix or moments we can then find the parameters $a$ and $b$ used to form an ellipse.

Recalling that the equation of an ellipse is:
$$
\begin{align}
\frac{(x-x_c)^2}{a^2}+\frac{(y-y_c)^2}{b^2} &= 1\\
\end{align}
$$
$$\text{where }a >b$$
The parameters $a$ and $b$ are defined as:
$$
\begin{align}
a = 2\sqrt{\frac{\lambda_1}{M_{00}}} ~~~ 
b = 2\sqrt{\frac{\lambda_2}{M_{00}}} ~~~
\theta = \arctan(\frac{V_y}{V_x})
\end{align}
$$
$\theta$ is the angle between the minor $(b)$ and major $(a)$ axis.

Where $\lambda_1, \lambda_2$ are the eigen values of the inertia matrix of the ellipse such that:
$$
\begin{align}
\lambda_1 > \lambda_2\\ 
\end{align}
$$
$V$ represents the eigenvector corresponding to $\lambda_1$.

##### Inertia Matrix and Other Shapes
For all other shapes, we can find the equivalent ellipse to it and use that. The equivalent ellipse is centered at the object's centre of gravity and has the same moment of inertia. The same method can be used to find the major and minor axes.
#### Shape Recognition
A shape can be determined in a few ways. 

The number of coreners a shape has can be used to determine what type of shape it is. There is also the concept of circularity:
$$
\begin{align}
\text{Circularity }= \frac{4\pi M_{00}}{p^2}
\end{align}
$$
Where $p$ is the perimiter of the shape.
For a circle the circularity will be $1$, for a square it will be $\pi/4$, 0 for a long line etc.





## MATLAB CODE

Read an image
```matlab
imread("imageName.tif");
```

Display an image
```matlab
imshow(I);
```

Get a histogram of an image
```matlab
imhist(I)
```

Get image dimensions
```matlab
[m,n] = size(I)
```

Create an $n$ by $m$ matrix full of ones
```matlab
ones(m,n)
```

Create an $n$ by $m$ matrix full of zeros
```matlab
zeros(m,n)
```

Find the median of an array
```matlab
median(arr)
```
$$
\begin{align}

\end{align}
$$