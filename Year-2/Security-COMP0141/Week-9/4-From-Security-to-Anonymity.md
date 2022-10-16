## Web Anonymity

**Encrypted Web Traffic**
- **HTTPS** can hide **content**
	- Eavesdropper can't see what specific page Bob is visiting on Alice's website
- Does **not** like hide and Bob's IP addresses

**Tor** (**T**he **O**nion **R**outer)
- The standard way to have anonymity on the web
- Uses **intermediate nodes**
	- The node that goes to Bob is the **exit node**
- Utilises multiple layers of encryption
	- That's why it's onion

- Tor works by sending your traffic through three random servers (also known as relays) in the Tor network

Alice wants to send a message to Bob
- Alice's Tor client obtains a list of Tor nodes from a directory server
	- List of nodes also contains the public key for each node
- Alice's Tor client picks a random path to destination server
- Alice encrypts the message multiple times (this is the multiple layers)
- The first node peels one layer by decrypting it
- Finds the next step node
- Exit node decrypts the final message and sends it to Bob
![[Screen Shot 2022-05-12 at 11.29.15 PM.png|500]]

- Every step is encrypted except the last step (from the exit node to Bob)
- Can still be de-anonymised by a global adversary through **timing attack**
	- When you correlate the time between packets that enter one node and ones that exit a node 
	- NSA can but not us
- Does Tor also **hide the content** of my web traffic?
	- **No**! Need to use HTTPS for content.
- What if I want to **ban Tor** users from my site?
	- **Block the public exit nodes** (many sites do this.) 
- Does Tor just let me visit **normal websites** anonymously?
	- **No**. Hidden services exist only within Tor network.
	- If an activist wants to host a website anonymously, they have to host it at a tor node

### Tor Hidden Services
A website that is hosted on the ToR network is known as a `ToR Hidden Service`.