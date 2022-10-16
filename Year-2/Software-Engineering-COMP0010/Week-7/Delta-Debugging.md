# Delta Debugging

A method to autoomate the debugging of programs using a scientific approach of hypothesis-trial-result loop

## Applications

* Isolating failiure inducing program input
* Isolating failiure inducing user interaction
* Isolating failiure inducing input to code.

`git bisect` can be used to find the commit which caused the bug.

`git bisect start` starts the process.

`git bisect good` marks the current commit as good.

`git bisect bad` marks the current commit as bad.

Once both good and bad commits have been labelled, the commit where the program changed from good to bad is returned. 



Delta debugging tries to find a set $M$ from set $C$ elements. $M$ is the minimal subset of $C$ such that if any element in $M$ is removed from $C$ in the program, the bug is no longer produced. This only works if the bug is:

* Consistent
* Monotonic
* and Unambiguous