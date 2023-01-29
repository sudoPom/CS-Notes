Recalling the data representations of data in C:

![[Machine-Level Representation of Programs#^9e3ae1]]


There are also additional types of specific sizes:

| C Data Type | All Architecture Sizes |
| ----------- | ---------------------- |
| {u}int8_t   | 1                      |
| {u}int16_t   | 2                      |
| {u}int32_t   | 4                      |
| {u}int64_t   | 8                      |
| {u}pointer (im not sure what this actually is called)   | 4 or 8                       |

`{u}` is for unsigned but by default these data types are signed. Integers have a range between $0$ and $2^{w}-1$ if unsigned or $-2^{w-1}$ and $2^{w-1}-1$ if signed.

###### Shift Operations

There are two [[Machine-Level Representation of Programs#Arithmetic and Logic Operations^|shift]] operations, logical and arithmetic shifts. You cannot shift larger than the word size of the architecture, and you cannot perform negative shifts.

###### Signed vs Unsigned

* Constants in C are signed by default but can be made unsigned by suffix them with a `U`.
* Casting from signed to unsigned will just take the bit representation and interprets their value using the new representation.
	* This can also be done implicitly when passing missmatching types to functions and variable assignments.
* When there are expressions contain both signed and unsigned values, all signed values are implicitly converted to unsigned values.


## Undefined Behaviour

Defined behaviour is where the C99 standard explicitly specified what result the C abstract machine will produce. There are 199 different undefined behaviors. The most common ones:

* Programmer error involving pointers and memory allocation/deallocation
* Integer overflow - for signed arithmetic.

Checking for undefined behaviour is possible but will cost performance.