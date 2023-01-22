Shadows are important as they add realism to an image by adding more information about the placement of an object relative to other objectsm given a light source. Shadows can change depending on the size and distance of the light. Large lights produce soft shadows (that look blurry) and smaller shadows produce hard shadows. Lights close to the object will produce a distorted shadow.

The intensity within a shadow is not constant. The **umbra** is the part of the shadow that does not see any of the light source whilst the **penumbra** sees soe of the light source.

### Sharp Shadows
Light source is assumed to be a point or direction. They can either dynamic, which is done using shadow maps and shadow volumes or static, which is done using light maps. A static shadow does not change (due to the object staying stationary).

##### Shadow Mapping
A point is in shadow if it is not visible from the light source. This works by rendering an image not only from the camera but also rendering the image from the light source, remembering the depth information, this is stored in a $z$-buffer. This render is known as the shadow map. This is easiest when the light has a specific direction. 

The scene is then rendered as usual from the cameras view point. Each pixel's position $(x_v, y_v, z_v)$ is transformed to the light's coordinate space. If the $z_s$ value is less or equal to the shadow map at $(x_s, y_s)$ it is lit. If not it is shadowed.

![[Pasted image 20221031112549.png]]

##### Shadow Volume
A **Shadow volume** is the volume of space below a polygon that cannot see the source. During rendering the image, the line from a point visible through a pixel to the eye is intersected with all object shadow volumes. The number of intersections indicates if the point in in shadow or not.

![[Pasted image 20221031120608.png]]

The general idea is that you count the number of shadow planes you cross, +1 for front facing -1 for back facing. If the total is greater than 0 then you are in a shadow.

![[Pasted image 20221031122924.png]]

The first step consists of constructing the shadow volume by finding all of the plane equations of the volume. Then during rendering a volume test is carried out by determinig the shadow plane count per pixel - stencil test. A **stencil buffer** is used for counting the plane intersections.

The **stencil test** consists of the following tests:
* Render the scene into RGB and $z$ buffer.
* Turn $z$ buffer off
* Render all shadow volume polygons with the stencil buffer.
	* Increment stencil count for front facing
	* Decrement for back facing
* Re render scene with lighting off and only render pixels where stencil is non-zero.

### Soft Shadows
Produce images that are more realistic. The analytical solution involves finding the boundaries within the penumbra.

