# Terminology

Robots are machines that have motorst, sensors and a programming interface.

Categories of Robots:

* Appearance

  * Humanoid
  * Animal-Like

* Service robots - Robots that perform services that are useful to humans (excluding manufacturing).

  * Surgical - For precise surgery
  * Mobile - Used to move objects
  * Education - For teaching (typically children)

  * Military robots

* Industrial Robotics Manipulator - Automatically controlled programmable multipurpose manipulator that is programmable in three axis that can be fixed in place or moved around. (Moudle focus)

## Industry Robotics Manipulators

Popular for dangerous, dull and dirty jobs. They have sensors which allow the sensing of touch and torque.

There are two types, serial robots and parallel robots.

* Serial robot - Links are buit in series one after the other
* Links are built in parallel

`Link`s are rigid components of the robot and are connected by joints. `Joints` allow movement of the robot:

* Revolute joints allow rotary movement of the link
* Prismatic joints allow translational motion of the links

Links and joints are numbered from the base of the robot to the tip. Eg: 0, joint 1, link 1, joint 2, link 2, ..., joint n, link n.

`DOF` (degree of freedom) how many translational and rotary movements a motion can undergo:

* Translation along the x,y and z axis
* Rotation about the x,y and z axis.

The number of joints reflects how big the DOF is

Devices attatched to the end of the robot arms are called `End-Effectors`. These end effectors interact with the environment and include tools such as grippers, drills, torches, etc.

`Frame` a description of the position and orientation of an object. Frames are typically RGB Colour coded with x axis being red, y axis being green and blue being the z axis.

* `Base Frame` A fixed point located at the base of the robot.
* `Tool0` Frame attached to the tip of the robot
* `TCP` (Tool center point) Frame attatched to the working point of the end effector
* `Work-object frame` Frame attatched to the work table or object being acted on

## Course Overview

Position and Orientation

Forward and Inverse Kinematics - Given joint angles / end effector coordinates calculate the end effector coordinates / joint angles.

Trajectory and Control - Time profile of moving joints and controlling joints to follow a planned trajectory.

Jacobians and Dynamics 

Build a Robot

Robotic Offline Programming - Learn how to write programs for controlling robots.

## Assignments

Robot Offline Programming (20%)

Build a Robot (30% + 10%)

Written Exam (40%)