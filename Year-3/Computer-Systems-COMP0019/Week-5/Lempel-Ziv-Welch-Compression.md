**LZW** Compression is a lossless compression scheme proposed by Terry Welch and enhanced by Abraham Lempel and Jacob Ziv. It works by replacing repeating sequences with a shorter code (like all other compression schemes). However it does not need to send the entire dictionary. However it does need the input symbol width. Table is initialised with codes for each character of length 1.

# Algorithm

The table initially starts with a size of $2^N$, where $N$ is chosen by the implementor. 

The input is split into 8 bit symbold and the output consists of codes fixed in width.

### Pseudocode

```pseudocode
STRING = get input symbol
WHILE there are still input symbols DO
	SYMBOL = get input symbol
	IF STRING + SYMBOL is in the STRINGTABLE THEN
		STRING = STRING + SYMBOL
	ELSE
		output the code for STRING
		add STRING + SYMBOL to STRINGTABLE
		STRING = SYMBOL
	END
END

output the code for STRING
```

If the table grows too big we can either:
* Grow the size of the table 
* Reinitialize the table contents and start over. This is typically done by sending a special "CLEAR" to alert the decompressor to reset its table.

### Pseudocode Decompressor
```
READ CODE
STRING = TABLE[CODE]
output STRING
WHILE there are still codes to receive DO
	READ CODE from encoder
	IF CODE is not in the translation table THEN
		ENTRY = STRING + STRING[0]
	ELSE
		ENTRY = get translation of CODE
	END
	output ENTRY
	add STRING + ENTRY[0] to the translation table
	STRING = ENTRY
END
```

