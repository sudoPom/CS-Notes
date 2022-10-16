# Number Systems
A number system is just a way of representing numbers.

`Base10` is the standard way to represent numbers.

Generally a number $a$ in base $b$ is written as $a_b$.

### The Binary System
The binary system only consists of two digits, 0 and 1:
$1101_2 = 13$

A number in binary is normally prefixed with $0b$. Binary is typically used in computer systems as it is easy to represent these digits using high and low voltages.

##### Addition
Addition works similarly in binary as it does in base 10. With the rules of addition being:
* $0+0=0$
* $0+1=1$
* $1+1= 10$

![[Screenshot_20220429_170625.png]]

##### Multiplication
Multiplication also works similarly in binary as it does in base 10.
![[Screenshot_20220429_170904.png]]

When multiplying, whenever there is a 1 copy the number over (adding 0s to the end of the nnumber as you normally would in base 10).

##### Conversion between decimal to binary:
Theprocess uses the following greedy algorithm:
* Find the largest power of two that doesn't exceed the number.
* Subtract it from the number.
* Repeat.

### Hexadecimal
Hexadecimal consists of 16 digits, $0$ to $9A$ to $F$.
It is easy to convert binary digits to hex:
* Split the binary number into blocks of 4 digits (filling in blank spaces with 0s from the left)
* Convert each block to a hexadecimal digit.


## Notation
Binary  are prefixed with $b2$
Hex is prefixed with 0x
Denary is prefixed with nothing
Octal is prefixed with just a 0


### Negative numbers in binary
Sign magnitude is not ideal when it comes to binary numbers. This is because it tends to complicate calculations.

`Two's compliment` is the preferred method of representing negative numbers and is defined as the "the number needed to add to the (positive) number in order to obtain $2^N$". For example to represent -3 as a 3 bit binary number, we would need to find the number which when added to 3 $(011)$ gives us $2^3=(1000)$. And that number is $101$.

Generally for a number in 2s compliment $x$:

$$
x = (x_{N-1}...x_{0})_2 = -x_{N-1}*2^{N-1}+\sum^{N-2}_{i=0}x_i2^i 
$$
Meaning that if the first digit of a 2s compliment number is a 1, it is negative and if it is a 0 it is positive.

Generally, converting from a regular binary number to 2s compliment can be done by:
* Switching 0s to 1s
* Adding 1 to the result

### Overflows in binary
An `overflow` occurs when the result of an operation of two $N$ bit binary values results in a number that cannot fit within $N$ bits. A `carry out bit`  can be used to determine if an operation between two binary numbers resulted in an overflow. To check if a 2s compliment operation is correct the sign of the number can just be checked.

#### Sign Extension

To cast an $N$ digit binary number to some other $M$ digit binary number bigger than $N$:

* For regular unsigned binary numbers adding 0s to the left of the digit so it has $M$ total digits.
* For 2s compliment binary numbers, adding the signed bit to the left of the binary number so it has $M$ digits. 