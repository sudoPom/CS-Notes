---
id: Types
created_date: 09/02/2023
updated_date: 22/02/2023
type: note
links: 
---
* **🏷️Tags** : #Functional-Programming-COMP0020 
# Types

We can define our own types in Miranda:

```miranda
myBool ::= Mytrue | Myfalse
```

The first letter of the legal values (constructors) must be uppercase.

User defined types can be used in functions like predefined types. 

```miranda
f :: myBool -> num
f Mytrue = 34
f any = 13
```

Each constructor can have additional data:

```
fluid ::= Gallons num | Litres num
tanklevel ::= Emptytank : Fulltank | Parttank fluid

x::tanklevel
x = Parttank (Gallons 3)
```

The underlying value can be accessed using pattern matching:

```
tankHasFiveLitresOrGallons :: fluid -> bool
tankHasFiveLitresOrGallons (Gallons 5) = True
tankHasFiveLitresOrGallons (Litres 5) = True
tankHasFiveLitresOrGallons any = False
```
The underlying type of a value can be defined as any type, even polymorphic ones:

```
samepair * ::= SamePair(*, *) // Defines a pair of values with the same type
```

##### Functional Algebraic Types

Algebraic types can take in values as well as functions of a given type:

```
numList ::= Values [num] ([num] -> [num])
```

The above type is an algebraic type that has two components. The first being a list of numbers and the second being a function that transforms a list of numbers to a list of numbers.

##### Enumerated Algebraic Types

An enumerated algebraic type is a type that can take on many values. These are seperated using the bar ( | ) character. A constructor that does not take in any parameters are called **nullary constructors**. Constructors that take in a single are known as **unary constructors**. Constructors can also have curried arguments with two or more arguments.

```
traffic_light ::= Red | Amber | Green | AmberAndRed
```

In pattern matching every single constructor needs to be mapped if it involves an algebraic type.

##### Constructors as Functions

Any two nullary constructors of the same type can be compared normally. However n-ary constructors can only be compared if their underlying type(s) are the same (and they belong to the same type).

Constructors can be composed or passed to other functions. For example:
```
measurement ::= Litres num

map Litres [1.0, 2.0, 3.0] = [Litres 1.0, Litres 2.0, Litres 3.0]
```

Constructors can also be partially applied the same way functions can. 

Constructors also have a sense of order depending on the order in their definition.

```
traffic_light ::= Green | Amber | Red
|| Green < Amber < Red
```

##### Recursive Algebraic Types

An algebraic type can be recursive, allowing for the definition of potentially infinite structures.

##### Placeholder Types

Placeholder types allow us to specify a type without giving it a proper representation. This type can be used in functions to ensure typing is correct.

```
items :: type 
```

The type can be redefined later easily once the actual type is known.

```
items == [char]
```

# Questions / Thoughts