# Propositional Tableaux

A Tableaux will determine whether a given formula $\phi$, is satisfiable or not.

It works by decomposing the formulae according to certain rules, growing a labelled tree to the point that only literals are left.

If a branch is closed, it has one node labelled by  a proposition and another labelled by its negation. A tableau that has only closed in every branches it is closed and unsatisfiable.

The original formula starts at the root. A branch is used to split up two halves of an or $\lor$ clause. Two halves of an and $\land$ clause is transformed into a single branch of two nodes containing both sides of the clause. 

## Expansion Rules

* Don't expand literals (a proposition or it's negation)
* $\alpha$ formulas (Formulae that are only true in one case): 
  * $a\land b$ nodes $a$ and $b$ are added to every leaf of the tree beneath the current node being expanded.
  * $\neg\neg\alpha$ gets expanded to $\alpha$
  * $\neg(a\land b)$ gets expanded to $\neg a$ and $\neg b$
  * $\neg(a \implies b)$ expands to $a$ and $\neg b$
* $\beta$ function (Formulae that are true in two cases)
  * $(a \lor b)$ expands to two separate nodes $a$ and $b$
  * $\neg(a \land b)$ expands to two separate nodes $\neg a$ and $\neg b$
  * $(a \implies b)$ expands to two separate nodes $\neg a$ and $b$

Upon expanding a node, it should be marked.

A tableau is complete if all nodes are ticked (have been expanded) or is a literal.

## Applications of Propositional Tableaux

* The resulting open branches form the individual clauses that make up the original formula's DNF.
* To find the CNF of the formula, you can negate the formula, apply the propositional tableaux, (which will give you the DNF form of the negated formula) and then negate the resulting open branches.

* To find out whether a formula is valid, you can apply the Propositional Tableaux on the formulas negation. If it is closed then the original formula is valid.
