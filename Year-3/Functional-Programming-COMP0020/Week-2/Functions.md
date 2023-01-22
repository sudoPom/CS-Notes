
In Miranda you can define your own functions:

```miranda
twice x = x * 2
```

The above defines a function which takes in a value `x` and returns the expression `x*2`. It's best practice to ensure your functions are annotated with types:

```miranda
twice :: num -> num
twice x = x * 2
```

This specifies that twice is a function that takes in a number and returns a number.

###### Offside Rule

The offside rule is a styling guide in miranda - expressions can be expressed on multiple lines but a continuation of an expression cannot start to the left of the expression in the line above it:

```
first_5 x =
			x + x+1 
	x+2 + x+3 + x+4 || Not allowed

first_5 x =
			x + x+1 
			x+2 + x+3 + x+4 || Allowed
```

###### Function Application

Functions can be nested and applied to other functions. However most languages are expanded in [[Lambda Calculus#Normal Order reduction|normal order]] this means the following will not work:

```miranda
twice twice 3
```

Since `twice` expects a number as it's input but is recieving twice (of type `num -> num`). The correct way makes use of parenthesis to specify the order of expansion:

```miranda
twice (twice 3) 
```

###### Functions as values

Functions can be stored under a name. This name can then be used to call the function bound to it:

```miranda
my_func = twice
my_func 4 = 8

show my_func = <function>
```

### Function Params and Results

##### Multiple Function Parameters

A function can take in multiple input arguments through the form of a tuple:

```miranda
ismybirthday :: (num,[char],num) -> bool
ismybirthday date = (date = (27, "January", 2002))
```

###### Multiple Return Values

Functions can also return multiple values in the form of a tuple:

```
quotrem :: (num,num) -> (num,num)
quotrem (x, y) = ((x div y), (x mod y))

quotrem (7, 3) = (2, 1)
```

###### Functions Without Parameters