The flow of operation in a program tends to change depending on different conditions:

```c
int main(args, argsv){
	int x = argsv[1];
	if(x > 10){
		return 0;
	}
	return 1;
}
```

To represent this (and other constructs in c such as loops) we need to make use of logical conditions.

### Control Codes
After an arithmetic/logical instruction is carried out, certain flags are set depending on the result of the computation.

The condition codes include:

| Insturction | Meaning                                                                  |
| ----------- | ------------------------------------------------------------------------ |
| `CF`        | Carry Flag: Set whenever there is an overflow.                           |
| `ZF`        | Zero Flag: Set when the operation resulted in a zero.                    |
| `SF`        | Sign Flag: Set when the operation resulted in a negative value.          |
| `OF`        | Overflow: Set when the operation resulted in a two's-complement overflow |

### Compare and Test Instructions

Comparison Instructions are used to compare to values:
```
cmpq val1 val2
```

`val2` is compared to `val1`.

The actual computation done by `cmpq` is `val2 - val1`.

Testing is also done between two registers:
```
test val1 val2
```

This computes `val1 && val2`.

These instructions will set [[Program-Control#Control Codes|control codes]] depending on the result.

### Jumping

A jump changes the instruction pointer to an address.
```
jmp label
jump *operand
```

Where `label` represents a semantic label in the code. 

Conditional branches will only jump depending on the state of certain flags:

![[Pasted image 20230117134902.png]]

C has a `goto` statement which also allows jump statements to semantic labels:

```c
long absdiff_j(long x, long y)
{
	long result;
	int ntest = x <= y;
	if (ntest) goto Else;
	result = x-y;
	goto Done;
Else:
	result = y-x;
Done:
	return result;
}
```

C allows single line conditional expression translation:

```c
val = test ? then_expression : else_expression
```

Which always has a corresponding goto version.

##### Conditional Move Instruction

A conditional move is a `mov` instruction that only does the operation if a condition is met.

```
cmovle src dest
```

The above translates to "If the previous instruction satifies less than or equal to, move `src` to `dest`". This can be done in C:

```c
result = then_expr;
eval = else_expr;
nt = !test;
if (nt) result = eval;
return result;
```

This is useful as it allows for pipelining since there are no branches that need to be predicted - the CPU knows which instructions to fetch next.

Conditional moves are bad in some cases:
* Expensive operations - since you'll be calculating two values.
* "Risky" operations like dereferencing a null pointer which is not allowed.
* Computations with side effects - where calculations alter other parts memory.

### Do While Loops

In C a do while loop performs an operation whilst a condition is true. The operation is always done at least once.

```C
long pcount_do(unsigned long x){
	long result = 0;
	do{
	result += x & 0x1;
	x >>= 1
	} while (x);
	return result;
}
```

Again we can do this with goto statements.

```c
long pcount_do(unsigned long x){
	long result = 0;
Loop:
	result += x & 0x1;
	x >>= 1
	if(x) goto Loop;
	return result;
}
```

### While Loops

While loops are exactly the same as do while loops but do not guarantee an execution of the loop body.

```c
long pcount_do(unsigned long x){
	long result = 0;
	while(x){
		result += x & 0x1;
		x >>= 1
	}
	return result;
}```

The corresponding `goto` version is:

```c
long pcount_do(unsigned long x){
	long result = 0;
	goto Test
Loop:
	result += x & 0x1;
	x >>= 1
Test
	if(x) goto Loop;
	return result;
}
```

With the optimization flage `-O1` while loops are converted to a do while loop:

```c
while(test){
	do_something();
}
```

Becomes:
```c
if(!test){
	goto Done
}
Loop:
	do_something();
Test:
	if(test) goto Loop
Done:
	// Finished
```

The advantage of this is that the compiler can determine if the inital test ever needs to ever be ran.

### For Loops

For loops are ran while a condition is true, the condition contains an initialisation, test and update.

```c
#define WSIZE 8 * sizeof(long)

long pcount_do(unsigned long x){
	size_t i;
	long result = 0;
	for(i = 0; i < WSIZE; i++){
		unsigned bit = (x >> i) & 0x1;
		result += bit
	}
	return result;
```

```c
for(init; test; update){
	do_something();
}
```

Which can be converted to a while loop as such.

```c
init;
while(test){
	do_something();
	update;
}
```

Which can then be converted to a do while loop:

```c
init;
if(!test){
	goto Done;
}
Loop:
	do_something();
	update;
Test:
	if(test) goto Loop;
Done:
// Finished
```

### Switch Statements

Switch statements take in an expression and will perform different operations depending on the value.

```c
switch(n){
	case 100:
		val *= 13;
		break;
	case 102:
		val += 10; //Fall through to next switch
	case 103:
		val += 11;
		break
	case 104: //Accepts multiple values.
	case 106:
		val *= val
		break;

	default: // Uncovered value
		val = 0;
}
```

Switch statements use a jump table:

```c
goto *JTab[x]
```

A jump table is an array of addresses which points to blocks of code. 

```
switch2:
	addq    $2, %rdi
	cmpq    $8, %rdi // Check to see if the argument should be in the                                         
	                 // Default case
	ja      .L2 // Jumps to default case
	jmp     *.L4(,%rdi,8) // Performs the jump to the correct block in the switch
						  // Statement
```

In assembly, a jump table is just an array of addresses :

```
.L4:
	.quad    .L9 // Different semantic labels
	.quad    .L8
	.quad    .L7
	.quad    .L6
	.quad    .L5
	.quad    .L4
```

To jump to an address in the table you would perform an indirect jump.

```
jmp *.L4(, $rdi, 8)
```

Where `$rdi` holds the desired index of the address we want to jump to. The `*` states that the address at the specified memory address in `L4` should be jumped to.

For sparse switch statements a long if else chain will be generated instead.