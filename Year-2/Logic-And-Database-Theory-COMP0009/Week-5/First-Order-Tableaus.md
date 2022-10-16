# First Order Tableaus

## Alterations in First order Tableaus

* A literal is an atomic formula or its negation: $Person(x) $

* A closed term is a term that contains no variables - built only from constants and functions over constants.

* The expansion laws for $\alpha$ and $\beta$ formulas are the same as in propositional logic.

## Delta Formula 

Delta formulas are all existential formulas where only a single value for a variable is required to make the formula true.

* $\exists x \phi$ -> $\phi(c/x)$ on every node below the current node. Introduce a constant c such that $\phi(c)$ holds.
* $\neg\forall x \phi$ -> $\neg\phi(c/x)$ on every node below the current node.

## Gamma Formula

Pick any closed term $t$ and add a formula at each leaf below the node but do NOT tick the current node. Gamma formula is when multiple values of some variable make the formula true.

*  $\forall x \phi$ -> $\phi(t/x)$ on every node below the current node. The expansion means for some valuation where x maps to constant t, $\phi$ holds.

Gamma formulas should be left for last to allow for closed terms to be presented. These closed terms should replace the variables bound by the existential formula.

