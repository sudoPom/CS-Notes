# Denial of Service
When it comes to availability attacks, the goal is to prevent a user from using a service.
`Denial of Service (DOS)` is a type of attack which threatens users availability. The goal of a DOS attack is to take out a large service *with little computing work* (`amplification`).

There are two types of Amplification attacks are:
* `DoS bug`: Design a flaw allowing one machine to disrupt a service.
* `DoS Flood`: Command botnet to generate a flood of requests.

## Dos Bugs
* `Wireless radio jamming` attacks use a jammer to send signals at a high frequency. However this is not an amplification attack.
* `NAV Network Allocation Vector`  bugs work by having a single node on a network reserve a channel for a long period of time, denying every other node from using that channel. This can be done by any node for up to $2^{15}-1$ seconds.
* `De authentication`bugs involve sending a de auth packet to an access point on behalf of someone else which will cause them to be dropped from the network.
* `ICMP Echo/Smurf amplification DoS `attacks work by boradcasting a ping request on behalf of someone else. The broadcast will cause all connected devices on the gateway to send a ping reply to that target, flooding the target with ping responses.
* `DNS Amplification` attacks involve sending a packet to a DNS server of some size $n$ on behalf of someone else. The EDNS extension mechanism adds parameters to a DNS message, increasing the size of the packet when it is sent to the target. If the size of the resultant packet is $50n$ making the attack is 50x amplification attack. 

## TCP Handshake
* Client sends a SYN (synchronise) packet containing a randomly generated number (Session number ($SN_C$)) and 0, deonted as $AN_C$ to the server.
* The server allocates resources to store the clients session number ($SN_C$), as well as its own session number $SN_S$ which is randomly generated. 
* The server then sends back a SYN-ACK (synchronisation-acknowledgement) packet, containing the $SN_S$ it generated and $AN_S$ which is the clients session number to confirm that they recieved the correct value. If another packet is not sent within a specified time, the request is dropped.
* The client then sends an acknowledgement (ACK) packet back which contains their session number in the $SN$ field and the server's session number in the $AN$ field.
* Once the server recieves and checks these values, the connection is established. 

## Dos Floods

### Low rate SYN Flood 
Low Rate SYN Flood is a DoS bug that involves a device sending a large amount of TCP SYN packets to the server until all the servers resources are used, making it impossible to make further connections with other clients. 

### Syncookies
A server can use `syncookies` when under attack which removes states from the server. Syncookies work by:

* The server SN, $SN_S$ is generated using the a secret key as well as the data in the packet, instead of doing so randomly. 
* The server then responds with a SYN-ACK cookie which is the concatenationn  of:
	* A timestamp $T$ which increments every 64 seconds.
	* A MAC $L$ computed using a secret key over:
		* Source and destination ports
		* Source and destination addresses, the $SN_c$ and the counter $T$
	* The $SN_S$ can then be re calculated by using the counter $T$, the $mss$ (some constant) and the MAC, $L$. 
The client will recieve these and have to send an ACK response where AN=$SN_S$ and SN=$SN_C+1$, the server will only allocate space for the client if the $SN$ is correct.

### Prolextic / Versign Design
`Prolexic / Versign Design` works by having a proxy server set up before the actual server that clients must communicate with. This proxy server should be able to handle a large number of requests. The proxy server will only allow users who complete the TCP Handshake process with it to access the actual website - attackers do not send an ACK response back to the server they are trying to access, so only those who send an ACK response back will be permited. 

![[Pasted image 20220216132147.png]]

These proxies can make use of techniques to handle the large number such as syncookies.

## TCP Con Flood
A `TCP con flood` works by commanding an army of bots to actually complete the TCP handshake, which bypasses the above defenses against DOS attacks. This is done by:
* Completing the TCP handshake
* Sending a short HTTP HEAD request
* Repeat

This however cannot be done from random IP addresses as it will reveal the location of the bots, meaning that the owner of the server can block/rate limit the IP addresses of the attacker.

### Memcached attack
A `memcached` attack consists of a simple request that generates a very large response which generates a lot of traffic for the web server. This can be done without  botnet as only one request is needed.