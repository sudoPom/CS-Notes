The idea behind photon mapping is that we start the light path from the light source rather than from the sensor. This silves a few issues that regular path tracers cannot effectively solve but can be solved by photon mapping:

#### Small Lights

![[Pasted image 20221205110550.png]]

Vertex here is not the same as the vertices referenced in [[Planes and Polygons|planes and polygons]] but is instead just different points that the light hits.

With regular path tracing, if there is a small light then we may have a small chance of hitting the light source. We could counter this if we know the position of the light but generally this may not be the case. The same problem arises if we have an occluder which blocks the light:

![[Pasted image 20221205111049.png]]

The same problem lies in the angular domain. Some light sources only send light in a certain direction, therefore we cannot always use next event approximation.

![[Pasted image 20221205111504.png]]

##### Caustics

A **caustic** is similar to a small light source and occurs when a photon hits a specular object in such a way that the outbound ray is the reflection of the inbound ray and it hits the light source. The chance of this happening randomly is very low:

![[Pasted image 20221205112427.png]]

### Light Tracing

Light tracing works by starting a path at the light, tracing rays through the scene, and then project the position back onto the camera sensor. We then need to use next event estimation to move from any of the previous vertices. 

![[Pasted image 20221205113605.png]]

This works fine for caustics, however when it comes to complicated scenarios like caustics in a mirror it falls a part:

![[Pasted image 20221205114654.png]]

