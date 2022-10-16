# Bots and Botnets
A `bot` is a compromised machine that can be easily controlled by an attacker remotely. Bots typically:
* Are easy to control
* Have implementation of different commands
* Are part of a large network of bots known as a `botnet`
* The program operating the bot is loaded on a computer after it is compromised.

## Centralised C&C
Botnets are controlled using a `Control and command (C&C) servers`

![[Pasted image 20220216141920.png]]

Commands can be issued from the central server, it is good practice to have multiuple servers so the botnet does not fail if a single server fails. Bots in a centralised botnet can either have commands pushed (IRC) onto them or can periodically pull instructions (HTTP) from the server.

The C&C Server IP(s) should be known by each bot, however in larger networks bots will only know the IP addresses to a few of the C&C servers - partitioning a big botnet into a group of small ones - if they had access to all it would be easy to find the location of all the C&C servers and shut down the network entirely.

## Peer-to-Peer C&C
Bots in a Peer to peer botnet act as both servers and bots. This makes it more difficult to catch the attacker and if one node fails, the network can continue to operate. P2P networks are hard to implement and some ISPs do not accept any P2P traffic.


## Bot Defense
A `honeypot` is a vulnerable computer that attracts attackers to add it to their botnet. This computer will then be used to monitor the behavior of the attackers and potentially find the IP address of the C&C server by reverse engineering the algorithms used by the bot to find the IP of its C&C server.

The IRC channel which is used for communication on botnets can be taken down, rendering the entire botnet useless. The traffic directed to the C&C server can be blocked/routed to some other place so the bots cannot communicate  with their server.


