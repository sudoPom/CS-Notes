`tags:` [[The-Church-Turing-Thesis]] [[Turing-Machines]]

# Closure Properties of Languages
Since languages are sets, we can define and reason about the union, intersection and complement of languages over the same alphabet. Since languages are sets of strings, there is also a concatenation operation.

### Decidable Languages

We say a decidable language is closed under an operation when performing said operation on the language, gives another decidable language.

##### Complentation
This can trivially be done by just swapping the $Y$ and $N$ states.

##### Union
This can be done by using a [[The-Church-Turing-Thesis#Multi-tape Turing machine|multi tape turing machine]] each with the input string and each deciding $L_1$ and $L_2$ respectively. If $M_1$ accepts then we accept, if not we run $M_2$ and if that fails we halt and if not we accept.

##### Intersection
Very similar to [[Closure-Properties-of-Languages#Union|union]] but requires both turing machines to accept their input.

##### Concatenation
This requires a non deterministic multiple tape Turing machine, $M_1,M_2$.

### Recognisable Languages
Recognisable languages are closed under all operations previously mentioned however, the process of an operation not being accepted (and therefore looping infinitely) needs to be accounted for. Therefore the exact same turing machine cannot be used to show an operation is closed for recognisable languages. 

The only exception to this is complementation, which is not closed under recognisable languages.