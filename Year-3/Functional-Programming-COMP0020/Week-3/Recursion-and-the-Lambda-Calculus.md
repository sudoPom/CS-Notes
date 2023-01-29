λ

Recursive functions require functions to have bindings to a name in order for them to be called again. Given two functions `h` and `f`. If applying `h` to `f` gives us `f` then `f` is a **fixed point** of `h`.

```
h f = f
h (h f) = f
...
```

Every function in the lambda calculus has a fixed point. The fixpoint operator, or the **Y combinator** is a function that takes in any function and returns it's fixed point.

```
Y h = f
```

It then follows that we can apply some function `h` and the application of the fixpoint operator and `h` and and we'll again get the same application back:

```
h (Y h) = (Y h)
```

This gives us the $\delta$ rule:

```
Y g = g (Y g)
```

For any function `g`.

The Y combinator can be defined using the λ calculus:

```
Y h = λq.((λx.(q(x x))) (λx.(q(x x)))) h
|
> ((λx.(h(x x))) (λx.(h(x x)))) 
|
> h((λx.(h(x x))) (λx.(h(x x)))) 

```

