---
id: Testing_Techniques
created_date: 11/01/2024
updated_date: 11/01/2024
type: note
links: 
---
* **🏷️Tags** : #Validation-and-Verification-COMP0103 
# Testing_Techniques

There are two major classes of testing techniques, black and white box testing.

###### Random Testing

Random testing can be either black or white box. It involves randomly selecting test inputs and validating the outputs. Random testing is fairly easy to implement but can take a long time to achieve anything.

###### Combinatorial Testing

Combinatorial testing is a black box technique where the tester only knows the input specification of the program.

###### Regression Testing

Regression testing can be either black or white box. When a change is made to the program, the test suite is re ran to ensure that the changes made did not break any previously passing tests.

###### Model-based Testing

Used for complex systems with "model-based" design. The input to the test is a model that represents the system under test. Abstract test suites are derived from the model automatically, which are then mapped to concrete test suites. The model needs to be of high quality for this to be useful.

### Black Box Testing

Black box testing ignores the specifics of the program and tests it as if it were a black box. It tests the behaviour of the program according to the program specifications (given input $X$, the program $P$ should output $Y$).

Black box testing doesn't need the source code of the program and can therefore be planned out earlier in the development process.

Equivalence Partitioning is the process of separating the input domain of a program into partitions. Each input in a given partition should cause the same result. This way you only need as many tests as there are partitions. Partitions can include invalid inputs.


### White Box Techniques

###### Structural Testing

Involves dividing the program into structural units of code (lines, branches, etc).

###### Mutation Testing

A subclass of structural testing. It works by artificially injecting faults and seeing if our testing can detect them. Requires a lot of execution since each variant of modified program (mutant) needs to have the entire test suite ran on it.

###### Path Testing

Path testing aims to cover every path of the program. A simple path is one in which no edge is traversed more than once. In reality there's an unlimited number of paths in some programs involving loops. You can limit the number of iterations in loops but this still produces a large amount of paths. You can partition the infinite set of paths into a finite amount of classes. The **boundary interior criterion** groups together paths that only differ in the sub-path they follow when repeating the body of a loop.

Alternatively you can execute the loop zero times, once and multiple times in separate paths. This is the loop adequacy boundary criteria.

###### Data Flow Testing

CFGs do not take how variables are being used into consideration. Data flow testing annotates the CFG with the usage of certain variables:
* $d$ where the variable is defined
* $u_p$ where the variable is used in a predicate
* $u_c$ where the variable is used in a calculation
* $k$ where the variable is killed
You will have multiple graphs for each variable.

A definition clear path for a variable $V$ is a path from nodes $x$ to $y$ where there is no assignment to $v$, excluding nodes $x$ and $y$.

A $du$ path for variable $v$ is a path from nodes $x$ to $y$ which is simple, definition clear, $v$ is assigned in node $x$ and $v$ is used in node $y$. For every variable $v$, for every definition $d$ of $v$, for every use of $d$ and for every $du$ path between $d$ and $u$, there should be a test that executes the $du$ path. This is **All path DU testing**.

The **All use** strategy is the same as the All path DU testing method, but only one path from each definition to use is required. 


# Questions / Thoughts