# Combinatronics 

`Combinatronics`  presents a method of calculating totals that is much more efficient than manually counting. 

## Multiplication principle 

If there are $n_1$ outcomes for the first task and $n_2$ outcomes for the second, the total possible number of outcomes for performing both tasks together is $n_1n_2$.

For example, throwing a die has 6 outcomes. So throwing two die has a total of $6\times 6 = 36$ possible outcomes.

## Permutations

A `permutation` is a way in which objects can be arranged. 

The total possible number of ways of arranging $n$ distinct objects is equal to $n!$  For example, arranging the numbers "123" can be done in $3! = 6$ different ways.

The number of ways $r$ distinct objects can be selected and ordered from $n$ distinct objects is called the number of permutations of $r$ objects from $n$ objects, which is known as the $^nP_r$:
$$
^nP_r = \frac{n!}{(n-r)!}
$$
Where $r$ is the number of distinct objects being selected and $n$ is the number of distinct objects to select from.

## Combinations

A `combination` is similar to permutations, however the ordering of an object does not distinguish any two combinations. The number of ways in which $r$ distinct objects can be selected from $n$ distinct objects, disregarding the order of selection, is called the number of combinations of $r$ objects from $n$ objects, and is known as $^nC_r$ or $n\choose{r}$
$$
^nC_r \times r! = ^nP_r\newline
^nC_r =\  \frac{^nP_r}{r!}\newline
^nC_r = \frac{n!}{r!(n-r)!}
$$
$^nC_r \equiv\ ^nC_{n-r}$