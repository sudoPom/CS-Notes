---
id: Very_Busy_Expressions
created_date: 30/01/2024
updated_date: 30/01/2024
type: note
links: 
---
* **🏷️Tags** : #Practical-Programming-Analysis-COMP0174 
# Very_Busy_Expressions

A very busy expression is an expression that is always computed, no matter which path of execution is taken. For example:

```python
if(a < b):
	x = a - b
	y = b - a
else:
	x = b - a
	y = a - b
```

`b-a` and `a-b` are computed in both branches of the if statement and are therefore "very busy".

Very busy expressions can be **hoisted** so that they do not need to be recomputed multiple times. This will reduce the space the executable takes (and also reduce execution time in the case of loops).

```python
c = a - b
d = b - a
if(a < b):
	x = c
	y = d
else:
	x = d
	y = c
```

#### Calculating

An expression is removed from the set of very busy expressions if a variable that is present in the expression is reassigned:

```python
y = a + b # From this point, a + b is a very busy expression.
# Some stuff that doesn't change a or b
# ...
# ... the expression (a + b) is very busy up to this point.
a = a + 1 # from here (a + b) is no longer very busy and is removed from the set.

```

An expression is added to the set of very busy expressions whenever the expression is used in an assignment or loop/if condition.

We then have the following for a given block:
![[Pasted image 20240130162433.png]]

Note the reverse flow function and the intersection used in the exit of a block. This form of analysis is a backwards must analysis.
# Questions / Thoughts