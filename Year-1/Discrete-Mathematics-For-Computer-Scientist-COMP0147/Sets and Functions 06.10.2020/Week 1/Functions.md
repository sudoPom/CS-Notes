# Functions

A function takes in an input, x, and performs some sort of operation to return a given output, y. The domain of the function is all the values of x, or all the inputs for which the function is defined. The image of a function is the output of the function.

Two ways of representing functions:

f : X → Y    Y = f(X)

## Surjective Functions

The function Y = f(X) is said to be surjective if and only if for every possible output, in the set y, there exists at least one input in the set X, where set X and Y are the sets of inputs and outputs respectively.

For example: the function f(x) = x^2 is not a surjective function as there does not exist a value of x which will return a -8, or any negative number as an output. However f(x) = x^3 is surjective as any output is possible to get from a given input x.

## Injective/Encoded Functions

The function Y = F(X) is said to be an injective function if and only if no different pairs of inputs will give the same output.

For example: f(x) = x^2 is not an injective function as the values of x being 1 and -1 will both give the same output of 1. However f(x) = x^3 is injective as no two different inputs give the same output.

## Bijective Functions

A function is Bijective if and only if the function is both injective and surjective. Bijective functions has an existing inverse function, it is possible to return to the input from a given output. 

For example f(x) = x^3 is Bijective since it is both surjective and it is injective.



## Composite Functions

A composite function is the combination of multiple functions.

For example H = g(f(x)) is a composite function where you first apply the function f to the input x, then apply the result to the function g. This is often written like so: h = f;g which means first apply f, then apply g to find the value of h.

### Composition of Injections:

The composition of two injective functions are still injective, that is all distinct inputs will give a distinct output.

### Composition of Surjections:

The composition of two surjective function are still surjective, meaning that 



