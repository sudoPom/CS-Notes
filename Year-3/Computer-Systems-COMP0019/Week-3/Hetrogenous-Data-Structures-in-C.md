
C doesn't allow classes like other languages like C++ or Java. However there are some ways for programmers to define custom made types.

### Structs

C structs can be used to create a data type that groups multiple different types into a single object. The data associated with a struct is stored contiguously in memory. For example, given this struct `rec`:

```c
struct rec {
	int i;
	int j;
	int a[2];
	int *p;
};
```





A `rec` object would be stored in memory as such.

![[Pasted image 20230131095215.png]]

Accessing a field of the structure adds the corresponding byte offset. For example field `i` is stored at the address of the `rec` object, whilst field `j` is stored at the address of the `rec` object + 4 bytes. 

### Unions

Unions allow a single object to be referenced using multiple types. Each field in a union object references the exact same blocks of memory. The type definition for a union is exactly the same as that of structs:

```c
union U3 {
	char c;
	int i[2];
	double v;
};
```

The `c, i` and `v` fields all have an offset of 0. The entire union object would take up the size of the largest field type, in this case it would be 8 bytes - the size of the double `v`. 

Unions can lead to weird bugs but can be useful in special cases - like when we know two fields of a struct are going to be mutually exclusive. Which will enable us to save space in the long run.

### Allignment

Some computer systems have standards in place regarding where stored data can start from in memory. For example, instructions should only be stored at addresses starting at multiples of 8. This could be done to simplify the retrieval of data - as only one read is required to read out an 8 byte data type since it only  ever takes up one memory address. Intel recommends that all data be alligned with a multiple of the size of their type:

| Allignment Multiple | Type                 |
| ------------------- | -------------------- |
| 1                   | char                 |
| 2                   | short                |
| 4                   | int, float           |
| 8                   | long, double, char * |

This alignment is enforced in structs and can be done in assembly.

```
.align 8
```

The above ensures the data following it will start at an address that is a multiple of 8. This can be used for jump tables, which hold 8 byte long addresses.

Given the following struct `S1`:

```c
struct S1 {
	int i;
	char c;
	int j;
};
```

The byte allignment would be as follows:

![[Pasted image 20230131102656.png]]

A padding is added to ensure that both the `i` and `j` fields can satisfy the 4 byte requirement. The order in which data is presented in a struct can change the size of the required padding, for example the following struct would not need any padding:

```c
struct S2 {
	int i;
	int j;
	char c;
};
```