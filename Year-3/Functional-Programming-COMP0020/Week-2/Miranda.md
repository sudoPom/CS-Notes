Miranda is a functional programming language which influenced many of the later functional programming languages. It was developed by David Turner in 1985.

### Definitions

Expressions can be given names as such:

```miranda
message = "hello world" 

increment x = x + 1
```

A name must start with a lower case character and cannot be the following:
```
abstype
div
mod
otherwise
readvals
show
type
where
with
```

Values stored in a name do not change, meaning the result of an expression on given names will always be the same. This is known as **referential transparency**. This means that the same name cannot be used in a definition twice.

### Types

Miranda is **strongly typed** meaning that the compiler can determine things like whether a function is being used with the correct types.

Type definitions can be done as follows:
```miranda
message :: [char]
message = "hello world" 

increment :: num -> num
increment x = x + 1
```

Miranda has the following types:
```
num 
char
[char] (text)
bool
funcs
(*,*) (tuples)
```

###### Numbers
The `num` type represents integer and real numbers. Operations include:

| Symbol | Operator          |
| ------ | ----------------- |
| `+`    | addition          |
| `-`    | subtraction       |
| `*`    | multiplication    |
| `/`    | division          |
| `div`  | integer division  |
| `mod`  | integer remainder |
| `^`    | exponentation     |

All but `div` and `mod` can be used with both real and integer values.

Negative numbers are prefixed with the `-` character, which represents the negation function:

```
-True = False
-(33) = -33
```

The `integer` function returns true if the input argument is an integer. The `entier` function takes in a number and returns the input rounded down to the nearest integer.
```
integer 3.7 = False
entier 3.7 = 3
```

### Characters and Text

A single char is defined as a single character wrapped in single quotes:
```
x = `a`
y = `2`
```

There is no empty character.

There are also special characters:

| Character | Meaning   |
| --------- | --------- |
| `\n`      | Newline   |
| `\t`      | Tab       |
| `\\`      | Backslash |
| `\'`      | Quotes    |

Ascii characters can also be expressed as `\x` where `x` is the ascii code of the desired character.

Characters can be coded to their ascii counterpart with the `code` function and an integer can be decoded to an ascii character:

```
code 'A' = 65
decode 65 = 'A'
```

###### Strings

Strings are represented as a list of characters. This means that `'a'` is not equal to `"a"`.

String Operations:

| Symbol | Operation     |
| ------ | ------------- |
| `++`   | Concatenation |
| `--`   | Difference   |
| `#`    | Length        |
| `!`    | Indexing      |

Indexing is $0$ indexed.

###### Boolean

Boolean values can either be `True` or `False`. The following operations can be used on booleans:

| Symbol | Operation           |
| ------ | ------------------- |
| `~`    | Logical Negation    |
| `&`    | Logical Conjunction |
| `\/`   | Logical Disjunction                    |

The `=` operation is additionally used for comparison AND identifiers.

```
3 = 4 = false
```

Booleans can be converted to a string using the `show` command:

```
show True = "True"
```

###### Tuples

A tuple is just a collections of other datatypes:

```
date = (13, "March", 1066)
```

For two tuples to be equal each elements need to be equal. Only tuples of the same type can be compared.

Tuple composite format can be used to identify multiple names:
```
(day, month, year) = (13, "March", 1066)

day = 13
month = "March"
year = 1066
```

### Guards

Conditional guards are used in functions bodies which can be used to return different values based on some conditions:

```miranda
f x = “good morning”, if (x < 12)
	= “good afternoon”, if (x < 17)
	= “goodbye”, otherwise
```

There is no way to check the type of an input to a function.