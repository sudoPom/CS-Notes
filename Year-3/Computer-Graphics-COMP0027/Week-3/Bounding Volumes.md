The previous methods of ray tracing is relatively in efficient and does not scale well.

For complex shapes we can use a **bounding volume** and use it for a rejection test. This consists of shooting a ray, If this ray does not intersect the bounding volume then it definitely will not hit the complex shape.

There are a few different kind of bounding volumes:

![[Pasted image 20221020121520.png]]

A bounding area is **good** if the bounding volume consists mostly of the internal shape (there is minimal free space)

#### Fast Bounding Volume Tests
This test consists of three pairs of planes (parallel to each of the axis) with each pair orthogonal to the other two pairs. Our ray is again defined as $r(t) = p + td$ and do the following:
* Calculate $t_{near}$ for each of the three axis (the first point in which the ray intersects the axis parallel to plane $n$)
* Find the max of the three $t_{near}$
*  Calculate $t_{far}$ for each of the three axis (the point in which the ray intersects the axis parallel to plane $n$ a second time)
* Find the min of the three $t_{far}$
If the max $t_{near}$ is greater than the min $t_{far}$ then the box is not intersected.

###### Fast BV Tests in 2D
![[Pasted image 20221020122926.png]]

![[Pasted image 20221020122958.png]]

