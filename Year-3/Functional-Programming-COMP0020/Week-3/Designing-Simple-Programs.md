###### Partial Application

The arithmetic operations in miranda have curried definitions, meaning they can be partially applied. For example the plus `(+)` function can be partially applied with an presection:

```
(3+) :: = num -> num
(3+) 9 = 12
```

or a post section:

```
(+3) :: = num -> num
(+3) 9 = 12
```

This works for all functions except the `-` operator, since the presection is exactly the same as the representation of a negative number.

#### Case Analysis

This process involves manually writing down the solution to different inputs to your function until you spot a pattern (or multiple patterns) which will work for any general input.

#### Structural Induction

Structural induction is primarily used for lists, but can be used on other recursive data types. Structural induction requires consideration of: 
* The base case, or the terminating condition (of which there can be many of). This typically consists of the empty list `[]`.
* The induction hypothesis which is the assumption that the recursive function will work correctly for a list of a smaller size.
* The inductive step - which is writing the body of the general looping equation of the function.

