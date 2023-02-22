# Spatial Description and Transformation

## Position of a point

The position of a point needs a reference, eg: this point is 10m to the left from the table. 

Given a reference $A$ and a point $P_b$, the position of the point $P$ with reference to $A$ is the set of coordinates $^AP_b = [^AP_x, ^AP_y, ^AP_z]$

## Position of a Rigidbody

The position of a rigid body also needs a reference, however the exact point needs to specified. This requires the rigid body to have it's own frame. The point used when describing the position of the rigid body relative to some reference fram $A$ is the $^AP_{BORG}$ where $B$ is the frame attatched to the rigidbody and $P_{BORG}$ is the origin of the frame $B$.

Generally the superscript is the reference frame and the subscript is the origin of the object frame.

## Orientation of a Rigidbody

Orientation of rigidbody ignores translation, so that all frames have the same origin. All the axis of each frame are scaled so that they represent unique vectors (of the same length). The orientation of the rigidbody is the roatation matrix that maps the orientation of the reference frame's orientation to the orientation of the rigidbody frame's orientation. Given a reference fram $A$ and a object frame $B$ the rotation matrix is $^A_BR$:

![[Screenshot_20220428_152905.png]]


A special case exists for rotation only for the x axis: 

![[Screenshot_20220428_153256.png]]

Where $\theta$ is the angle of rotation. The same pattern follows for rotations about the y and z axis. The rotation matrix is orthonormal since each column has a unit magnitude and are linearly independant. Because of this, the inverse of a rotation matrix is it's transpose.

![[Screenshot_20220428_153757.png]]

The overall description of a position of an object for a given reference frame $A$ and object frame $B$ is $\{Position\} = \{^A_BR, ^AP_BORG\}$