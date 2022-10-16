# Networks Primer

A URL (http://me.bob.com/hi.html) consists of:

* Protocol specifier (http://)
* Domain name (me.bob.com)
* Page location(hi.html)

## Retrieving an IP address

Name servers stores IP addresses that are linked to domain names. The mapping of domain names to IP addresses is called `domain name resolution`. Domain names are useful since numbers are harder to remember than words.

When a URL is typed into a web browser the DNS searches down a hierarchy of domains to retrieve the IP address of the requested site. With me.bob.com, the ".com" name server is contacted to get the address of the "bob.com" name server, which is contacted to get the address of the "me.bob.com" server. This process starts at `Top level domains` which consist of addresses to the very right of the address string (".com", ".net", ".dev"). `Name servers` are servers that contain sub servers/pages.

This process is not repeated all the time as the DNS results are cached by your web browser. Top level domain addresses are actually stored within the web browsers

## Requesting Content

To request the content of a web page, IP routing is used. The internet back bone is the connection between all the IP addresses. IP Routing uses this internet backbone to determine the route between the client's PC to the target web page. This is done by the use of algorithms to decide which path to take, rather than checking every single adjacent router. 

Information sent across the internet is done in the form of `packets`, which are small pieces of data that contains information about the message being sent, including:

* Source address.
* Target address.
* Options (if any).
* The content of the request.
* Various other metadata for authentication and validation that the message was sent correctly.
* Time to live (after passing through $x$ routers, give up on sending the message).

Source and destination addresses aren't modified. Anyone who looks at this packet will be able to site what site the user is trying to reach, or the content of the packet. This is known as `packet sniffing`.

Once the request reaches the destination successfully the request is sent back.

## Receiving Content 

The content of the requested web page is split into fragments and sent back towards the clients device via IP routing. The web page is again split into packets, Once the packets reach the client's device, the packets are reconstructed and the browser can then render the web page!