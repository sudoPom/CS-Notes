---
id: Lecture_4_Build_Systems_and_Make
created_date: 17/10/2023
updated_date: 17/10/2023
type: note
links:
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Build Systems and Make

In a system, manually created systems are called **source components**. A component that is generated automatically are called **derived components**. If a component is derived from another then the first component refers to the second in some way. Derivation relationships can be shown using an acyclic directed dependency graph: 

![[Pasted image 20231017161539.png]]

An incremental build will only build components that need to be rebuilt. For a derived component $A$ that depends on components $n_1,n_2,...,n_m$ $A$ is built if:
* Component $A$ does not exist.
* Any of $n_1,n_2,...n_m$ has changed.
* Any of $n_1,n_2,...,n_m$ needs to be rebuilt

A **system model** is a description of the software product that that:
* lists the component that the product is made of
* The dependencies of each component
* The steps required for their construction
### Make

**MAKE** is a build tool that builds systems incrementally. The system model of MAKE is called a **Makefile**.

Makefiles consist of **rules** which specifies the dependencies of each component and the commands required to build said components. 

In the above example, the makefile would look like:

```bash
spellcheck: grammar.o dictionary.o
	cc -o spellcheck grammar.o dictionary.o
grammar.o: grammar.c
	cc -c -o grammar.o grammar.c
dictionary.o: dictionary.c
	cc -c -o dictionary.o dictionary.c
```

Make takes a makefile as input and the target of the makefile. MAKE then calculates a dependency graph. A depth first search is made into the graph and the construction steps are executed after every return (post order).

---
##### Algorithm

* Let A be the current target component
* Find all files that A depends on (If A is not in the makefile then it does not depend on anything)
* Call the algorithm recursively on all dependencies of A
* If one of the target components has changed or if A does not exist, A must be rebuilt. If this is the case the commands associated with A as the target are executed.

---

Every file has a last modified stamp. If a file is older than any of its dependencies then it is considered to have changed and needs to be rebuilt.

Constants in makefiles are defined in makefiles as follows:
```
constant = value # Define the constant
constants = value_1 value_2 ... value_n # Define a list of components
$(constant) # Expand the constant
```

Constants can then be overwritten as follows:

```
make constant=value my_makefile
```

Suffix rules allow the combination of multiple rules:

```bash
.c.o:
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
```

This converts all files with suffix `.c` to `.o` files. `$@` is a special variable for the target file and `$<` is the input file. This only works with direct dependencies. Additional dependencies (dependencies that do not follow the suffix rule) can still be explicitly mentioned.

The makefile syntax allows specifying what are suffixes:
```
.SUFFIXES: .c .o
```

This is a standard predefined suffix rule and does not need to be defined in the makefile.

Additionally the `CC` variable is usually set to `cc` the standard c compiler.

Pattern rules allows matching for any arbitrary string. This is done using the `%` character. For example :

```
%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
```
A **pseudo target** is a make component that is never created. This is typically used for installing a program. Others include:

| Command          | Effect                                                                                                      |
| ---------------- | ----------------------------------------------------------------------------------------------------------- |
| `make all`       | Construct the whole program                                                                                 |
| `make uninstall` | deletes the program from the computer                                                                       |
| `make clean`     | deletes the program and all derived files, some generated derived components are left as they hardly change |
| `make distclean` | Like “clean”; but also reverses platform-specific adaptations of the source text.                           |
| `make dist`      | Creates a source code package                                                                               |
| `make check`     | Carries out suitable tests                                                                                  |
| `make depend`    | Recalculates dependencies                                                                                   |

---
### Make Usage

Large projects are split into subsystems, with each subsystem having their own make file. There will then be a make file in the main directory which will recursively call make in all subsystems. For example:

```
READLINE_TARGETS = readline/libreadline.a \ readline/readline.h
readline $(READLINE_TARGETS):
	cd readline && $(MAKE)
```

The `$(MAKE)` takes in the arguments passed into the make file and runs make using these arguments.

---

There is a second type of dependency - the construction tools. For example the compiler used will determine the output file created, so if the compiler used is changed, everything compiled using the compiler needs to be rebuilt. This is not expressed in a make file.

There are ways to automatically find dependencies. For the standard C compiler the command:

```
$ cc -M grammar.c
```

Will list all of the dependencies in the form:

```
grammar.o: grammar.c
grammar.o: included file dependency
grammar.o: other included file dependency
...
```

The makefile can make use of this command to include the dependencies automatically:

```
depend:
	(for file in $(SOURCES); do \
	$(CC) -M $$file; \
	done) > Makedeps
	
-include Makedeps
```

The `-` before the `include` tells make to ignore any errors.
# Questions / Thoughts