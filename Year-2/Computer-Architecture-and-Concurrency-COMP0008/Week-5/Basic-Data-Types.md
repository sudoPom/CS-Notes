# Basic Data Types

### Characters
`ASCII (American Standard Code for Information Interchange)` is used to represent characters.  Where a single `ASCII` character is made up of 7 bits, the 4 least significant bits represent the row number, whereas the three most significant bits represent the column of the `ASCII` table.

The first 32 values of `ASCII` are control characters, such as null and backspace characers. These characters are non printable.

`Extended ASCII` is a variant of `ASCII` which encodes characters in 8 bits rather than 7.

`Unicode` is the global standard for character encoding, with characters being made up of 4 bytes, this is known as `UTF-32`. The endianness of a bit string is normally encoded with `UTF-32` files, where the default is big endian.

`UTF-8` is a variable length encoding (Different characters will be of different length). `UTF-8` determines the number of bits that makes up a character by checking the starting bits. 
* A character starting with a $0$ bit will be read as a single byte. 
* A character starting with $110$ will encode a character with the form: $110yyyyy$ followed by $10yyyyyy$ and represents the unicode character $0byyyyyyyyyyy$
* A character starting with $1110$ will encode a character of the form:
$1110yyyy$ followed by $10yyyyyy$ and $10yyyyyy$ 
* And the same pattern is repeated for a character starting with $11110$.
### Strings
In `C`, strings are made up of an array of characters, which is terminated by a null character `(0x00)`.

### Real Numbers
Real numbers are represented using floating point represenentation. The `mantissa` is defined as the digits behind the decimal point, while the `exponent`  is the power of `b` where `b` is the base the number as a while is to be multiplied by.

The `IEEE` format of floating point numbers consists of:
* A sign bit
* An exponent argument (8 bits)
* A fraction (23 bits)

![[Screenshot_20220502_002548.png]]

The exponent is not exactly encoded but is defined as:
$$
\begin{align}
exponent&=EA-B\\
B &= 127_{10}
\end{align}
$$
(for normal numbers)

Each bit of the fraction represents $\frac{1}{2^{1}},\frac{1}{2^{2}},...,\frac{1}{2^{23}}$.

The reason a bias ($B$) is used is because it allows for easy comparison by just looking at the exponent.

##### Normal numbers
Normal numbers are of the form $1.fraction*2^{n}$ A normal number will have an exponent argument between 1 and 254.

##### Subnormal numbers
Subnormal numbers are numbers of the form $0.fraction*2^{126}$.  Subnormal numbers have an exponent argument of 0. However the exponent is always -126. This allows the representation of much smaller numbers.

##### Special Numbers
Special numbers reprent things like infinity, (and negative infinity). Special numbers have a exponent argument of 255 and:
* $\infty$ has a mantissa of 0
* NaN has a non zero mantissa.  

##### Higher precision floating point variables
Double floating point precision.
![[Screenshot_20220502_005153.png]]

### MIPS and floating points
As mentioned in [[System-Calls#^a27d6d]], MIPS processors contain a floating point coprocessor which deals with floating point operations and have their own instructions. These include `lwc1 (load word from coprocessor1)`, `scw1`, `lwc1`.
There are also `add.s(add single precision)`, `sub.d(subtract double precision)`. Double precision makes use of two adjacent registers and treats them as one.

The `cvt` instruction is used to convert floats to ints and vice versa:
* `cvt.s.w` word -> single prec
* `cvt.d.s` single prec -> double prec
 