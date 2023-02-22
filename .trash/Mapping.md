# Mapping 

Mapping is determining the coordinates of a point $P$ relative to some coordinate system $A$ given you know the coordinates of point $P$ in some other coordinate system, $B$.

When the orientation of the two positions are the same, you can find out the new position by just performing vector addition. So to represent a point $P$ in reference to fram $A$ when we know it's position in frame $B$:

$$^AP = ^AP_{BORG} + ^BP$$ 

When the translation of the two positions are the same you can use the dot product between the rotation matrix between frames $A$ and $B$ and the position of $P$:

$$ ^AP = ^A_BR \cdot ^BP $$

When mapping for differing orientation and translation the idea is to match the orientation of the frame describing the point to the target frame, then perform vector addition to translate the point’s frame to the correct position relative to the target frame:

$$ ^AP = ^A_BR\ \cdot\ ^BP + ^AP_{BORG} $$

A tidier way of writing this equation is as follows:

$$ ^AP = ^A_BT \ \cdot \ ^BP $$

Where $^A_BT$  is:

![[Screenshot_20220428_154720.png]]

$^A_BT$ is known as the homogeneous transformation.

$^BP$ should have a 1 below it in it’s vector for the trick to work and $^AP$ will have a 1 below it too, this should be ignored.

For multiple frames you can perform compound mappings:

$$ ^BP = ^B_CT\ \cdot ^C_AT \ \cdot\ ^AP $$

This is valid because (after cancelling sub and super scripts on both sides) the $^B$ s match.
