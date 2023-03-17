---
id: Copying-Garbage-Collection
created_date: 16/03/2023
updated_date: 16/03/2023
type: note
links: 
---
* **🏷️Tags** : #Functional-Programming-COMP0020 
# Copying-Garbage-Collection

In *copying garbage collection* memory is divided into two semi spaces, one containing the current data and the other contains obsolete data. All live blocks are reachable by tracing all live pointers. 

### Algorithm 

```
init() =
	tospace = HeapStartAddress
	fromspace = tospace + (Heapsize/2) + 1
	free = tospace
	top_of_space = tospace + (Heapsize/2)

malloc(n) = 
	if (free + n > top_of_space) flip()
	if (free + n > top_of_space) abort "Out of memory"
	result = free + Headersize write(free,(0,n))
	free = free + n + Headersize
	return (result)

flip() =
	tmp = fromspace
	fromspace = tospace
	tospace = tmp
	top_of_space = tospace + (Heapsize/2)
	free = tospace
	for each R in RootSet { R = copy(R) }

copy(P) =
if (atomic(P) or (P==nil)) return(P)
(forwarded, size) = read(P – Headersize)
forwardingaddress = read(P)
if (forwarded == 0) {
	newaddr = free
	free = free + size + Headersize
	forwardingaddress = newaddr + Headersize
	temp = read(P)
	write(P, forwardingaddress)
	write(P-Headersize, 1)
	write(forwardingaddress, copy(temp))
	for i = 1 to n-1 {
		temp = copy(read(P+i))
		write(forwardingaddress+i, temp)
	}
}
return(forwardingaddress)
```

Cheney's Iterative Copying is an iterative version of the above algorithm.

```
flip() =
	(fromspace, tospace) = (tospace, fromspace)
	top_of_space = tospace + (Heapsize/2)
	free = scan = tospace
	for each R in RootSet { R = copy(R) }
	while (scan < free) {
	(forwarded, size) = read(scan)
	for M in childrenlocs(scan) { write(M, copy(read(M))) }
	scan = scan + size + H}

copy(P) =
	(forwarded, n) = read(P – H)
	addr = read(P)
	if (forwarded == 1) { return(addr) }
	addr = free + H
	free = addr + n
	for i = 0 to n-1+H { write(addr-H+i, read(P+i-H)) }
	write(P, addr)
	write(P – H, 1)
	return(addr)
```

# Questions / Thoughts