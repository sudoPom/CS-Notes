# Local Illumination
`Local Illumination` describes how a point of light interacts with a single surface of an object. 

$I_r$ represents the intensity of the light radiating from the object.
$I_i$ represents the normalised intensity of the light.
$k$ represents the proportion of light reflected from the object rather than absorbed .

Illumination is independant, if you shine a red light on an object you cannot get a green light reflected from it.

## Ambient Light
Approximation to global illumination. Constant across the while object. Ambient light is set for the entire scene $I_a$. Every single object will reflect a proportion of the ambient light, denoted by $k_a$ Having ambient light ensures that every object is lit, even if it is not struck by light.

This makes the equation for radiated light:
$$
\begin{align}
I_r = k_aI_a
\end{align}
$$

![[Pasted image 20221010112022.png]]

Lamberts law - incoming intensity of light is proportional to $d$ . Which is proportional to the cosine of the angle between the incoming ray and the normal of the subject.
$$
\begin{align}
\cos{\theta} = <n,l>^+ = \max(<n,l>, 0)
\end{align}
$$
We take tha max because light cannot have negative intensity.

Lambertian surfaces work under the assumption that incoming light is reflected in all direction. 

The normal of a sphere centred at $p$ at point $x$ can be found by subtracting the $x$ from $p$ and normalising the result. 

## Diffuse Light
The normalised intensity of the light incident on the surface due to a ray from a light source. The light is reflected based on lamberts law. The amount of reflected light is $k_d$
$$
\begin{align}
I_r = k_aI_a+k_dI_i<n,l>^+ 
\end{align}
$$
For multiple light sources the overall light emitted from an object is just equal to the sum of all the light emissions from each individual light source.

$$
\begin{align}
I_r &= k_aI_a+k_dI_i<n,l_1>^+\\&+k_dI_i<n,l_2>^+\\&+k_dI_i<n,l_3>^+...
\end{align}
$$

## Specular Light
In `Perfect specularity` the angle between reflection and the normal is equal to the angle between the reflected ray and the normal. This rarely happens. 
![[Pasted image 20221010114411.png]]

With `Inperfect Specularity` the intensity of the light reflected is dependant on the bisector between the emitted light ray and the observer.

![[Pasted image 20221010120500.png]]

$h$ is the bisector between $e$ and $l$.

The specular component of the object is defined as such:
$$
\begin{align}
k_sI_i<h,n>^{+m}
\end{align}
$$
Where $m$ represents the power of the light. High $m$ implies sharp, small highlight, Low $m$ implies blurred, large highlights.

Overall lighting equation with the ambient, diffuse and specular components is the following:

$$
\begin{align}
I_r = k_aI_a + I_i(k_d <n,l>^+ + k_s(<h,n>^+)^m)
\end{align}
$$
