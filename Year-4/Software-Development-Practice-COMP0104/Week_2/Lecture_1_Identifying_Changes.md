---
id: Untitled
created_date: 09/10/2023
updated_date: 09/10/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Identifying Changes

When making changes to a file we need to distribute this to the repository. 

The `diff` command takes in two files (`A, B`) as input and outputs a sequence of instructions that transforms file `A` to file `B`.  Each change instruction is referred to as a "hunk", for example:
```
$diff A B
1,2c1,2
< Line 1 of original
< Line 2 of original
---
< Line 1 of new
< Line 2 of new
```

Similarly there are the `a` and `d` commands for the addition and deletion of lines.

States that lines 1 and 2 from file `A` changed to lines 1 and 2 from `B`.

The `patch` command takes in a diff and a file and outputs the result of applying the diff to a file.

### Integration

There are two ways of applying multiple changes made to the same file.

**Two way integration** involves the user manually deciding which changes should be applied to the original file from each of the modified files.

**Three Way Integration** the `patch` command is used on the original file and the first changed file's diff, then the second change file's diff is used on the result. This only works if the two modified files did not change the same lines. If this is the case (conflict) , two way integration is defaulted to. Three way integration make use of a common ancestor file (in this case the original file). ^cd5545

### Diff Algorithm

The Diff Algorithm makes use of a distance matrix as shown:

![[Pasted image 20231009145935.png]]

The number of deletions/insertions that needs to be made to convert the prefix of string `A` of length `n` to the prefix of `B` of length `m` is equal the value of `D[n,m]` so the element at `D[0,0]` starts of as 0.

To fill in the table we follow three rules:
* If `D[i,j-1]` is known (to the left of `D[i,j]`) then `D[i,j]` will be at most `D[i,j-1] + 1` since we can make one insert the desired character to `B[j]`.
* Similarly if `D[i-1,j]` is known then `D[i,j]` will be at most `D[i-1,j] + 1` since we can make one deletion  at `A[i]`
* Lastly if `D[i-1, j-1]` is known and `A[i]` = `B[i]` then we do not need to do anything and `D[i,j]` can be set to the value of `D[i-1, j-1]`.

Arrows can be added to show where each transition originates from.
# Questions / Thoughts

Say we have file `original.txt` and two updates that were made at the same time, say `new1.txt` and `new2.txt`. When doing three way integration is this the same as doing the following:
```
diff2 = diff(original, new2.txt)
new_file = patch(new1.txt, diff2)
```