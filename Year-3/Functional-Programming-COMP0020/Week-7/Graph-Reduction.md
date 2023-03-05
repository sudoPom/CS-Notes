---
id: Graph-Reduction
created_date: 03/03/2023
updated_date: 03/03/2023
type: note
links: 
---
[[Introduction-to-Implementation]]
[[Program-Representation]]
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

To perform beta reduction you:
* Copy the function body
* Substitute each free occurence of the formal parameter (ie `x`) with a pointer to the actual argument.
* Overwrite the root node of the redex with an indirection node of the copy.

![[Pasted image 20230303124714.png]]

## Performing Delta Reduction

To perform delta reduction you:
* Given all the arguments of the application, replace the root node of the application with the result of the application.

![[Pasted image 20230303125009.png]]

# Questions / Thoughts