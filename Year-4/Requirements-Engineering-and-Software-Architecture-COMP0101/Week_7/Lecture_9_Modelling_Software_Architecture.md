---
id: Lecture_9_Modelling_Software_Architecture
created_date: 23/11/2023
updated_date: 23/11/2023
type: note
links: 
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Modelling Software Architecture

#### Functional Viewpoint (Component Diagram)

The **component diagram** describes the functional elements of a system, their responsibilities, primary interactions and interfaces. Component diagrams are used to help in development through the separation of concerns. It gives a high level view of the system properties.

A **functional component** is a runtime element that performs a specific task. It encapsulates a subset of the system functionality and they are accessed by other functional components (or entities) through interfaces. They have the following attributes:
* Responsibility: What information the element holds and the services it provides.
* Provided interfaces: Specification of the services provided by the element. Public interfaces.
* Required interface: Interfaces from other components required by to fulfil its responsibilities.
The key idea behind functional elements is the hiding of information. The implementation of the element should be hidden from the outside.

![[Pasted image 20231123093932.png]]

An **interaction element** is an architectural element that allows runtime communication between functional elements. These include [[Lecture_4_Remote_Procedure_Calls|RPCs]], [[Shells#Pipe|pipe]], REST APIs, etc.

![[Pasted image 20231123094151.png]]

The component diagram zooms inside the machine of the [[Lecture_4_Context_Diagrams|context diagram]]. The interactions with external systems must be the same.

--- 

When making a component diagram:
* Start with a context diagram and list all the main functionalities.
* Draw a functional view for one functionality at a time. The sub tasks for a functionality should be identified, with a single functional view being created for each task. The interfaces for each component should be defined
* Group the functional views into a single diagram. Components with similar functionalities should be merged. If merging makes things too complex then its okay to have separate diagrams.

##### Common Mistakes

Component names should not be vague or technology specific. Instead of "React Front End" use "Web Shop Customer Front End". Component technologies can be further expanded within the responsibility attribute.

Weak cohesion can be caused by a single element having too many responsibilities.

Strong coupling can be caused by a large amount of interactions between different components.

![[Pasted image 20231123103629.png]]

The right level of detail needs to be specified. If the diagram is too detailed it can be hard to understand. If elements are not architecturally significant, it is likely the diagram as a whole is too detailed. If the diagram is not detailed enough then architecturally significant decisions will remain vague. A diagram with components that are too coarse grained is likely to be lacking in detail.

#### Deployment Viewpoint

The **deployment viewpoint** specifies the physical environment in which the system is intended to run. This includes:
* Hardware or hosting environment.
* Technical environment requirements for each type of node in the system.
* Mapping of software elements to the runtime environment that will execute them.

A **Node** is a hardware platform where software can be installed and executed or where data may be placed. A **link** is a connection between nodes and a **deployment** is a mapping between functional elements to nodes.

Deployment viewpoints can be expressed using UML diagrams:

![[Pasted image 20231123104316.png]]

In this example, function component A runs on node X, etc.

### Development View

A development view describes the system by splitting it up into modules and their design time relationships.

A **Module** is a grouping of source files providing some independent and reusable functionality. Initially a module can be thought to have a one to one mapping to functional components. A module contains a specification of its interfaces and implementation code.

Modules can "use" other modules. For example if module $A$ uses module $B$ then:
* Developers of $A$ can rely on $B$ and can assume that $B$ is present and correct.
* Developers of $A$ only need to know the specification of $B$s interface, not the implementation.
* Developers of $B$ only need to know the specification of $B$, they do not need to worry about who is using their module.

If a module uses another module it does not necessarily mean that the first module invokes the second. For example, in frameworks, the framework code actually calls the code that imports it. The "use" relation should be acyclic. A cyclic dependency can be resolved as follows:

![[Pasted image 20231130094707.png]]

For module $A$ to use $B$:
* $A$ should be simpler to implement due to $B$
* $B$ should not be substantially more complex to implement because it cannot use $A$
* There should be possible system variants that can have $B$ without $A$
* There should not be possible system variants having $A$ without $B$

The development view encourages modularity, allowing modules to be tested, implemented and revised independently. It allows development to take place in smaller steps by identifying the minimal subsystem that performs some service and by identifying minimal extensions that add value to the system. 
# Questions / Thoughts