---
id: Introduction-to-Implementation
created_date: 02/03/2023
updated_date: 02/03/2023
type: note
links: 
---
* **🏷️Tags** : #Functional-Programming-COMP0020 
# Introduction-to-Implementation

There are two types of functional languages, strict and lazy (Miranda is lazy). Lazy languages do not evaluate expressions until they are needed to evaluate another expression.

Given a functional language's source code, the compiler produces target code in the form of an intermediate representation or fully compiled binary. Intermediate forms can either be converted to [[Lambda Calculus|lambda calculus]], which can be represented using a string, tree or graph, or to [[Combinators-and-Higher-Order-Functions|combinators]] which can be represented as a fixed or variable set. Lambda calculs representation can also be converted to combinator representation through **bracket abstraction**.

### String Representation of Lambda Calculus

The first way of representing lambda calculus was to store the lambda expression as a string. Each character is represented as a bit string. 

![[Pasted image 20230302141452.png]]

String reduction can be slow as the redex of an expression may be longer than the previous one, meaning that characters further along may need to be shifted down.

### Tree Representation of Lambda Calculus

Trees allow expressions to be represented in a hierarchical structure. (see [[Program-Representation#Abstract Syntax Trees|trees]]). This allows us to be able to store expressions in non contiguous blocks of memory.
![[Pasted image 20230302141955.png]]

Tree reduction first works by copying the function body, replacing the free occurences (free because we do not copy the lambda statement) of the variable (in this case x) with pointers to copies of the argument. This results in multiple copies of inputs to the expression.

The `IND` tag stands for indirection which signals that the result of the expression is where the cell points to.

### Graph Representation of Lambda Calculus

Graphs work similar to the tree representation but only the function body is copied. Each cell can point to a cell that is being pointed to by another cell.

![[Pasted image 20230302143218.png]]

### Fixed Set Representation of Combinators

When representing code using combinators we can use a fixed set of combinators. A fixed set must be computationally complete (can compute anything computable). For example:
```
{J}
{S, K}
{S, K, I}
...
```
### Variable Set Representation of Combinators

Variable set combinators make use of Super Combinators, which solves the problems of:
* Slow compilation due to optimisations and multiple passes over nested expressions.
* Execution taking many small steps.
* Target code being very hard to debug due to big differences between source and target code.

Super combinators are combinators with their own reduction rules but work on a much larger scale than regular combinators. A super combinator also can remove unused free variables in a function.

The variable set is created for every program, making the generated combinators dependant on the written program.


# Questions / Thoughts