# Tableaux Continued

Tableaux can be representedd as a set of lists rather than a tree.

A list of theory to be more specific.

Theory: Set of propositional formulas. I

* If it contains both $p$ and $\neg p$ it is contradictory.
* If it consists of only literals the theory is closed / complete.

## Algorithm

Initialise table (list) with fromula

* While the list is not empty:

  * Deque from the table store in $s$.
  * If $s$ is fully expanded and not contradictory return satisfiable.
  * Else 
    * If the first non literal (or any) is an alpha formula:
      * Expand the formula and create a formula with the same contents as $s$ but replace the non literal with the expanded formula selected.
    * If its a beta formula
      * Expand the formula and replace the l

  (Just look at the slides)





