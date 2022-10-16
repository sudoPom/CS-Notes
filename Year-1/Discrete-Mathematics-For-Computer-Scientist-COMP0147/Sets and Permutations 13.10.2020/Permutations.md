# Permutations

A permutation maps a set of values to another set of values:

1   2   3

1   3   2 		Here , the set (1,2,3) map to the set (1,3,2). That is to say, 1 maps to 1, 2 maps to 3, and 3 maps to 2.

Permutations have a finite domain, and rather than mapping a set of values to another set of values, it changes the order of the values in the original set. So the output set will only have the values the original set had, but in a different order.

The total number of permutations possible from a given number of values in a set is |Sn| = n!, where n is the number of input values available. 

The order of a permutation is the smallest number of times a permutation has to be carried out on itself to return to the identity permutation, which is the original set of values present before any permutation was carried out. For example let a permutation, σ, exist such that σ = (1 2 3 -> 2 1 3) .

The starting position is (1 2 3)

Then (2 1 3) -> (1 2 3) which is the identity permutation. This means the permutation has an order of 2. Applying a permutation on itself is seen as multiplying itself by itself. So applying this permutation on itself twice would be σ * σ. 

The sign of a permutation is defined as: 

sgn(σ) = (-1)^k 

Where k is the number of disorders in the permutation. That is the number of pairs that are out of order in the output of the permutation.                                     So using σ = (1 2 3 -> 2 1 3), we can see that there is one disorder, as 2 should be to the right of 1, since it is bigger, but the pairs 2,3 and 1,3 are in correct order relative to each other. That means the order of σ is -1. If the number of disorders is even, the order is 1, and if the number of disorders is odd, the order is -1.

For permutations σ1 and σ2 the following holds

sgn(σ1*σ2) = sgn(σ1) * sgn(σ2)

| sgn(σ1) / sgn(σ2) | EVEN | ODD  |
| ----------------- | ---- | ---- |
| EVEN              | EVEN | ODD  |
| ODD               | ODD  | EVEN |

 