---
id: Program-Representation
created_date: 22/02/2023
updated_date: 22/02/2023
type: note
links: 
---
* **🏷️Tags** : #Functional-Programming-COMP0020 
# Program-Representation

When a functional programming language is to be executed it first needs to be translated into a lambda expression. From there it needs to be represented in a certain way.

## Abstract Syntax Trees

Abstract syntax trees are the form machines hold expressions to be evaluated. The leaves of the tree consists of constant values, built in function or variable names.

There is a special `@` character which represents an application. This is called the **tag** of the node. For example:

![[Pasted image 20230222180028.png]]

The above represents the application f x. Multiple layers of tag nodes can be used to represent function currying:

![[Pasted image 20230222180208.png]] ^e545e5

Represents the expression (+ 4 2). The result of the bottom most tag is the funtion (+ 4) which is then applied to the argument 2.

For a general lambda abstraction `λx.body` we have the rule:

```
λx -> body
```

`λx` tells that the node is a lambda expression with formal parameter `x`. 


## The Graph

After successive transformations made on the tree it becomes a graph.

![[Pasted image 20230222181614.png]]

Graphs are not hierarchical in nature - two nodes can point to the same node. Graphs can be acyclic (where there are no cycles) or cyclic. Directed Acyclic graphs are also known as DAGs.

## Concrete Representation

In a typical implementation of a tree each node is represented by a small area of memory called a cell. A cell contains a **tag** which specifies the type of cell (application, number, operator, etc) and two or more fields. 

Fields can contain either a pointer to another cell or an atomic (a data value). A node in a graph/tree corresponds to a cell in its concrete representation. For example for [[Program-Representation#^e545e5|this tree]] we would have the following representation:

![[Pasted image 20230222182615.png]]

Cells can also have variable length, in which case they are represented as such:

![[Pasted image 20230222182700.png]]

Having variable length cells allows for a more efficient representation of structured data objects. They also have the following uses:

* Arrays
* Arbitrary precision integers
* Blocks of compiled code
* Multiple applications

##### Tags 

There are two types of tags:
* Structure Tags: Differentiate between data objects. For example, although CONS and NIL are both built in operators they will have different structure tags.
* System Tags: Identify the system object of the cell, differentiating between built in operators from applications, lambda abstractions and so on.

# Questions / Thoughts