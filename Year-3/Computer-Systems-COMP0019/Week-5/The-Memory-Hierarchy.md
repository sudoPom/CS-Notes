Random Access Memory (RAM) is a form of memory that is traditionally packaged as a chip.

There are two types of RAM:
* Static RAM 
* Dynamic RAM

DRAM needs to be refreshed periodically since it uses cells that hold charges to store bits.

### Synchronous DRAM

As time went on there became better ways to interface to DRAM using **Synchronous DRAM (SDRAM)** which uses a conventional clock signal. that the rest of the motherboard uses, rather than asynchronous control. It also allows the reuse of the row addresses when trying to access sequential columns on the same row.

### Double Data Rate Synchronous DRAM 

Double Data Rate Synchronous DRAM (DDR SDRAM) uses both rising and falling edges of the clock, allowing two bits to be sent per cycle per pin. There are different types depending on the prefetch buffer:
* DDR = 2 bit prefetch
* DDR2 = 4 bit prefetch
* DDR4 = 8 bit prefetch.

##### Nonvolatile Memories

Both DRAM and SRAM are non volatile memories meaning they lose information when powered off.

Some nonvolatile memories include:
* Read-only memory (ROM) - programmed during production
* Programmable ROM (PROM) - can be programmed once
* Erasable PROM (EPROM) - can be programmed once
* Electrically erasable PROM (EEPROM) - electronic erase capability
* Flash Memory: EEPROMs with partial erase capability. Memory is seperated to blocks and only blocks can be erased. 
	* Each block wears out after about 100,000 erasings. ^29c35a
* 3D XPoint (Intel Optane) & emerging NVMs
	* Uses new materials

Nonvolatile memories are used for firmware, typically stored in the ROM. This includes things like BIOS, disk controllers, network cards, graphics accelerators etc. 

Solid state drives have been replacing traditional hard disks. Cache is also used to hold frequently accessed data.

#### Hard Disks

A hard disk consists of "platters" each with two surfaces. Each surface has a mulltiple cocentric rings called tracks. Each track contains sectors with are seperated by gaps.

Hard disks have their capacity measured in  gigabytes (GB) where 1 GB = $10^9$ bytes. There is also a base 2 notation which is called a Gibibyte.

Modern disks partition tracks into disjoint subsets called recording zones. Each track on a zone has the same number of sectors, determined by the circumference of the innermost track.

Each zone has a different number of sectors/tracks, outer zones have more sectors than inner zones. When computing the number of sectors we refer to the average number of sectors per platter.

###### Disk Operations

Each platter surface has a read/write head which acts like a vinyl player. To seek (move the arm) to a memory segment the arm needs to be physically moved/rotated. This movement is slow relative to other non physical computer operations. 

* Seek latency is the time it takes to move the head.  (avg 3-9ms)
* Rotational latency is the time taken to roate the disk to the position. (avg 7200rpm)
* The data transfer is the amount of taken to read the data segment (rotate past the data segment)

Capacity is determined by:
* Recording density (bits/in): number of bits that can be squeezed into a 1 inch segment of track.
* Rrack density (tracks/in): number of tracks that can be squeezed into a 1 inch radial segment.
* Areal density (bits/inch$^2$): product of track and recording density.

###### Logical Disk Blocks

Available sectors in modern computers model sectors as a sequence of logical blocks. 

There is a mapping between logical blocks and actual physical sectors, which is maintained by the hardware device called the disk controller (not the CPU disk controller, a disk controller embedded in the disk). The mapping converts requests to (surface, track, sector) triples.

This allows the controller to set aside spare cylinders for each zone, which is why the formatted capacity and maximum capacity.

### Flash Memory

Flash memory is organized in blocks, which each contain a certain amount og pages. Pages tend to be between 512B and 412KB and each block contains between 32 and 48 pages. 

Data read/write can only be done in units of pages, but erausre is done in units of blocks. As stated [[The-Memory-Hierarchy#^29c35a|earlier]], erasure can only be done a certain amount of times before the block becomes unusable. Eraw sure tends to be slow (~1ms).

| Advantages     | Disadvantages                     |
| -------------- | --------------------------------- |
| No moving part | Have the potential of wearing out |
|                | More Expensive than HDD                                  |

#### Bus Structure

A **bus** is a collection of parallel wires that carry address data and control signals. Buses tend to be shared by multiple devices. Different buses perform different things.
