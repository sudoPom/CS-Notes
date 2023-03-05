A procedure is an abstraction which allows the re use of blocks of code.

```c
int sum(int a, int b){
	int total = a + b;
	return total;
}
```

#### Control

In assembly, procedures can be called with the `call` instruction:

```
call *address
call semanticLabel
```

The `call` instruction pushes the address of the instruction after the call, which will be used to resume execution after the procedure is called. The instruction pointer `$rip` is then changed to the address specified.

The `ret` instrucition is then used to return to the next instruction to be executed. `ret` pops off the value at the top of the stack and sets the `$rip` register to the popped off value.

#### Passing Data

Typically you need to pass values into procedures. The first 6 arguments are stored in registers:
```
$rdi
$rsi
$rdx
$rcx
$r8
$r9
```

And the return value is stored in `$rax`.

For procedures using more than 6 arguments, the stack is used.

The currently running procedure has a frame pointer between registers `$rbp` and `$rsp`. This space can be grown and shrank by decrementing and incrementing the stack pointer (`$rsp`) respectively.

### Register Conventions

When calling other functions, the calling function cannot guarantee that the registers were not used by the called function. To deal with this problem, certain registers are conventionally expected to be saved by the caller function and other functions on (this can be by storing the register contents on the stack).
| Caller Saved Registers | Callee Saved Registers |
| --------------------- | --------------------- |
| `$rdi`                | `$rbx`                |
| `$rsi`                |          `$rbp`             |
| `$rdx`                |               `$r12`        |
| `$rcx`                | `$r13`                      |
| `$r8`                 | `$r14`                      |
| `$r9`                 | `$r15`                      |
| `$r10`                |                       |



