---
id: Graph-Reduction
created_date: 03/03/2023
updated_date: 03/03/2023
type: note
links: 
---
[[Introduction-to-Implementation]]
[[Program-Representation]]
[[Lambda Calculus]]
* **🏷️Tags** : #Functional-Programming-COMP0020 
# Graph-Reduction

Each cell in a graph is held in a contiguous block of memory. Each cell has a left and right pointer to another cell or hold a value depending on the cell.

| Tag          | Left               | Right    |
| ------------ | ------------------ | -------- |
| @            | function           | argument |
| lambda       | 'x'                | body     |
| : (cons)     | head               | tail     |
| N(umber)     | (A number like 34) |          |
| P (Built in) | + / - * etc        |          |

Small data items like numbers and built-ins can be unboxed, meaning their cells are also capable of pointing to another cell. This has to be consistant across the whole program.

![[Pasted image 20230303123406.png]]

## Performing Beta Reduction

To perform [[Lambda Calculus#Beta Reduction|beta reduction]] you:
* Copy the function body
* Substitute each free occurence of the formal parameter (ie `x`) with a pointer to the actual argument.
* Overwrite the root node of the redex with an indirection node of the copy.

![[Pasted image 20230303124714.png]]

## Performing Delta Reduction

To perform [[Lambda Calculus#Delta Reduction|delta reduction]] you:
* Given all the arguments of the application, replace the root node of the application with the result of the application.

![[Pasted image 20230303125009.png]]

---

To find the next redex of an instruction:
* Start at the root and descend down the graph until the left, outermost function or operator, `f` is found.
* If `f` is a user defined function
	* If it requires at least one argument, perform a [[Graph-Reduction#Performing Beta Reduction|beta]] reduction.
	* Else stop
* Otherwise determine how many arguments `f` needs and how many exist.
	* If there are more required arguments than arguments that exist then stop.
	* Else evaluate each strict argument recursively from the function `f`.
* Repeat until program tree is in [[Lambda Calculus#Weak Head Normal Form|weak head normal form]].

![[Pasted image 20230306131322.png]]

### Spine Traversal

Unwinding is known as going down the spline and rewinding is known as going up it. 

##### Spine Stack

Rewinding can be done through the use of a stack, pushing on pointers to a node in the spline as you descend the spine. When you want to go up the spline, you pop off the previous pointer off the stack.

Using a stack is fast and can be used to recursively search a spline using a single stack. There is, however, a danger of stack overflow for very deep trees.

##### Pointer Reversal

Pointer reversal makes use of two memory locations, $B$ and $F$. $B$ holds a unique "TOP" pointer and $F$ holds the pointer to the root of the program. To unwind one step down the tree:
* Swap the contents of $B$ and the left field of the node pointed to by $F$.
* Then swap the contents of $B$ and $F$.

![[Pasted image 20230306133807.png]]

### Combinator Graph Reduction

Combinator graph reduction only makes use of [[Lambda Calculus#Delta Reduction|delta reduction]] corresponding to each of the combinators in the fixed set:

![[Pasted image 20230306134218.png]]

### Supercombinator Graph Reduction

Fixed combinators are treated like operators, in that they are not evaluated until all the input arguments are present. This also follows for super combinators. Super combinators have no free variable meaning they do not need a binding to an environment for changing arguments.

# Questions / Thoughts