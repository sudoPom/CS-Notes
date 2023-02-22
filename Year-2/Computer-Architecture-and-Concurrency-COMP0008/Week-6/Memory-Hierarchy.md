# Memory Hierarchy

#### Memory Types
Memory Consists of:
* Cache - Uses SRAM (Static RAM) exteremely fast but is very expensive.
* Main Memory - Uses DRAM (Dynamic Random access memory) slower than cache memory.
* Virtual Memory - Uses HDD/SDD Much slower than cache memory

`Random Access Memory` Memory which is volatile but the data at any address location can quickly be accessed.

`Static RAM` Consists of various memory cells that uses a "flip flop" to store a single bit of information. It stays at this state once set. Each memory cell is made up of several logic gates making them expensive.

`Dynamic RAM` is cheaper and slower than Static RAM. DRAM uses a capacitor to store a bit of information, which takes less silicon wafer space. The charge however needs to refreshed regularly since the capacitor recharges.

#### Hierarchy 

Typically:
* The CPU communicates with the cache
* The Cache communicates with the main memory
* The main memory communicates with the hard drive.
Retrieving data from the cache is fastest, followed by the main memory, and lastly the hard drive. 

Some machiness do not have enough main memory and will use the `virtual memory` located on the hard drive that will store less frequently used blocks of memory in area called the `swap space`.

## Cache

The cache stroes most recently used memory so it can be quickly accessed in the future - `temportal locality`. Furthermore any instructions stored close to the instruction fetched is stored in the cache as it it likely to use these areas of  memory soon - `spatial locality`.

Cache also has multiple levels  (`L1,L2,...`) where the higher the level, the more memory they can store but the longer it takes to access. Items are retrieved from cache by making use of a `set` and `byte offset` field in a similar way that hashmaps work. 

##### Checking for memory in the Cache

The `set` is just three bits which represent a memory location  The processor uses these two values of a memory address to determine if a memory address' value is stored in the cache.

Multiple memory addresses may map to the same piece of memory in the cache. So the `tag` (the rest of the bit string) is used to determine if the memory address matches the data stored in the cache. 

![[Screenshot_20220502_155146.png]]

So the cache stores:
* Data 
* Tag
* Valid bit
The data stored in the memory address is the same as the data stored in the cache if they both have the same tag AND the valid bit is 1.

![[Screenshot_20220502_161755.png]]

##### Memory from the main memory
If the memory address' data is not stored in the cache then it retrieves it from main memory, and puts it into the cache using the memory addresses' `tag` and `set` as mentioned above, and sets the `valid bit` to 1.

This becomes inefficient if two frequently used memory addresses are put into the same location in cache - `cache conflict`.

An `n-way set associative cache set` stores `n` memory locations in the cache at any given set, which fixes this problem. This reduces the `set` field but increases the `tag` field. 

![[Screenshot_20220502_161952.png]]

A multiplexor, similar to what is mentioned in the [[MIPS-Microarchitecture#^3be584]] section is then used to determine which of the `n` memory values stored in the given `set` is the desired one. 

![[Screenshot_20220502_162146.png]]
###### LRU Cache

An additional flag is required in the cache to determine which data item should be replaced nexe, meaning it will now store:
* Data
* Tag
* Valid bit
* Least Recently Used
The `Least recently used` flag stores the `way` (where `way n` is the `nth` data item in a `cache set`) that was least recently used.


###### Spatial Locality
Rather than storing a single byte of data in memory, consecutive memory locations are stored from memory. This requires an additional field in the cache to be stored, being the `block offset` which determines which piece of data from the consecutive memory locations is required. Consecutive memory locations have the same tag.

![[Screenshot_20220502_162247.png]]

If data is only written to cache, then the cache data will be inconsistent with the data stored in main memory. 

A `write through` is the process of writing data into the cache AND main memory before continuing execution, which can be relatively slow.

`Write-back` is the process of writing values to the cache and only written to main memory when the cache line storing the updated data is about to be replaced by another piece of data. This is more efficient but can be more complex to implement.