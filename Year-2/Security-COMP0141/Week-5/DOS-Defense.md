
```
tags:
```
[[Denial-of-Service]]

# DOS Mitigation
## Client Puzzles
A `client puzzle` involves making users solve a moderately computationally expensive problem before giving them access to the site. This should be easy to check and the goal is to slow down the attacker. One example is:

Given $C$ find $X$ such that:

The n least significant bits of the SHA-1 function computed on the concatination of $X$ and $C$ are all 0s

or

$LeastSigBits_n(SHA-1(C||X)) = 0^n$

This should only be required during a DOS attack.

* The difficulty of (this) puzzle can be scaled by $n$
* This requires changes to both the client and server (client must send puzzle answer in the first packet and the server needs to validate it.)
* Legitimate users will have to solve the puzzle during the attack, which delays their their use of the server.
* Verifying this puzzle is easy, but computing it is difficult.

The problem with this is that legitimate clients will also need to solve this puzzle during the attack, and when the client is using low power embedded devices, they may not be able to access the service. Memory bound functions tend to be a better puzzle to use as lower power machines are better able to handle these.
## CAPTCHAs 
A `Captcha` will attempt to ensure that the connection is coming from a human by giving puzzles that are easy for humans to solve but are computationally difficult for scripts to recognise. The request will only be processed if the captcha is answered correctly. This slows down attackers significantly if the bots cannot solve the problem as it requires human interference.

## Source Identification
Involves trying to find the source of the DOS attack. If you can find out where the attack is coming from you can just block packets from that source.

#### Ingress Filtering 
`Ingress filtering` makes use of an internet service provider (ISP) to ensure that the request comes from a legitimate source IP. If it doesn't then do not allow access to the site.
However this is only effective if ALL ISPs do this and since it requires changes to the ISP infrastructure it is unlikely that all ISPs will do this.

#### Traceback
`Traceback` involves keeping information from the packets to try and determine the path the packets took. This only works assuming that:
* Most routers are uncompromised
* Attackers send many packets
* Route from the packet to the victim remains relatively stable (attacker does not change networks frequently).

This will require that each router adds their IP address in the packet to get the complete path. However there are some issues:
* The IP address format does not have extra space
* Packet paths can be very long

Attackers will normally take the same path and therefore a probabalistic approach can be taken to reconstruct the path, resulting in fixed space usage:
* Store a single link in each packet
	* Each router probabilistically stores it's own address

This is done through a process called [[edge-sampling]]