Functional programming languages can be defined in just 20 characters, but can also compute anything that is computable.

##### Imperative Style
```python
small = []
for num in results:
	if num < 10:
	small.append(num)
return small
```

##### Functional Programming
```miranda
filter (< 10) results 
where filter f [] = []
	  filter f (x:xs) = x: (filter f xs), if (f x)
				= filter f xs, otherwise
```

Generally, programs written in functional languages can be developed faster and with fewer errors and lines of code when compared to their imperative counterparts. 