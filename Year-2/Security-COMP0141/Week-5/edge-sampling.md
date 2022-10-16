# Edge Sampling
`Edge sampling` is a technique used to probibalistically store a path between a source and a target address in a fixed amount of memory. The algorithm works as follows:

```
For each router R
	let p = someProbability
	let x = someNumberBetweenOneAndZero
	if x <= p:
		write R into start address
		write 0 into distance field
	else:
		if distance == 0:
			write R into end field
		increment distance field
```

The probability `p` can be parameterised and with enough packets an accurate path can be constructed from the source to the target nodes.