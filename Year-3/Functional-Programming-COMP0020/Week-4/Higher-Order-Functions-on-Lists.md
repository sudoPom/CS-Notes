
There are three main higher order functions that involve lists, these perform an operation or operations on each value of the list to provide some kind of result.

#### Map

The map function takes in a list and a function and returns a list in which each of the elements of the input list have had the input function applied to them:

```
map :: [*] -> (* -> **) -> [**]
map [] func = []
map (x:xs) func = func x : map xs func
```

#### List Folding

List folding is a higher order function which takes in a list and a dyadic function that applies itself over each element in a list sequentially without the use of explicit recursion.

###### Reduce

The reduce (or `foldr`) function takes in an input list and a dyadic function and applies the function successively on each of the elements of the list. At the very end of the list the function is applied with the "identity" element of the function, which should have no effect on the result so far.

| Operation | Identity |
| --------- | -------- |
| +         | 0        |
| -         | 0        |
| *         | 1        |
| /         | 1         |

```
reduce :: [*] -> (** -> * -> **) -> **
reduce [] func = identity_element
reduce (x:xs) func = func x (reduce xs func)
```

This is essentially a boiler plate for tail recursion.

###### Accumulate

The accumulate function (or `foldl`) works similarly to reduce but rather than making use of tail recursion it makes use of an accumulated value and uses that recursively. The initial accumulated value should be the identity element.

```
accumulate :: [**] -> * -> (* -> ** -> *) -> *
accumulate [] acc func = acc
accumulate (x:xs) acc func = accumulate xs (func acc x) func
```

Some functions can only be done using accumulate whilst others only using reduce. 

The difference between the two is that reduce can be seen as adding the identity element to the end of string of function applications. Additionally the expression is bracketed to the right, hence `foldr`:

```
1 + (2 + (3 + 0))
```

On the other hand, accumulate adds the identity element to the left of the string of applications and the expression is bracketed to the left, hence `foldl`:

```
((0 + 1) + 2) + 3
```

It is safe to substitute one of these instructions for the other, given that the dyadic function is both associative and commutative.

A function is associative if:

```
func (func x y) z = func x (func y z)
```

and commutative if:

```
func y x = func x y 
```

This only needs to be the case for the identity element.

#### List Selection

List selection is the process of removing elements from a list that do not satisfy a given condition. This is normally a function that takes in a value and returns a boolean value:

```
myFilter :: (* -> bool) -> [*] -> [*]
myFilter cond [] = []
myFilter cond (x:xs) = x : myFilter cond xs, if cond x
                     = myFilter cond xs, otherwise
```

This can be done in miranda using the `filter` function.