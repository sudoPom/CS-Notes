A pointer in `C` is a 8 byte value which represents the address of something in heap memory. pointers can be declared as such:

```c
long *long_pointer;
```

The address of a pointer (non pointer or not) can be retrieved as such:

```c
long val = 42;
long_pointer = &val;
```

The `&` token returns the address of the variable.

You can dereference a pointer, which means that you update the value stored at the address specified in the pointer:

```c
*long_pointer = 25;
printf(val == 25) // true 
```

In `C` arrays are pointers - that is to say that an array name is just a pointer to the first element of the array.

```c
long x[3];
long *xp;
x[0] = 17;
xp = x;

printf("%d = %d") // 0xABCD = 0XABCD
```

##### Pointer Arithmetic

Pointer arithmetic is the process of calculating the value of addresses by adding/subtracting values from the array. When adding a value `n` to a pointer it moves the pointer by `kn` bytes where `k` is the size of the value the pointer was pointing to.

![[Machine-Level Representation of Programs#^9e3ae1]]

`void *` can be treated as a general pointer but you should not do pointer arithmetic on them, use a cast first.