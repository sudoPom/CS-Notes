
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

