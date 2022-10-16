## Web Architecture

- **Request**
A request can be obtained by Alice if:
	- Alice typed in a URL
	- Alice clicked a link
	- Alice re-loaded a page
	- Web server responded with a redirect
	- Web page embedded another page
	- Script within web page issued a request
	
- **Respond**
A response from Bob could include:
	- returns static file 
	- invokes a script and returns output 
	- invokes a plugin

- Websites are programs: 
	- Not just HTML, there's CSS + JavaScript + plugins
	- HTML: Text with markup and hyperlinks
	- CSS: Cascading Style Sheets (fonts, colours, etc.)
	- Javascript: client-side program
	
- Plugins: Java, Flash, etc.
	- Partially executed by the **client** (HTML, JavaScript, plugins, etc.)
	- Partially executed by the **server** (PHP, Ruby, SQL, etc.)


**Web Servers**

- Serving **static** content (HTML + CSS page)
- Generating **dynamic** content
	- CGI: PHP, Python, etc.
	- Web server modules: Rails, etc.
	- Database backend: SQL


**Threat Model**

- Attacker can live server-side, on the browser, on Alice's system, on the network, etc
- Is the **server** trusted by the browser? or the user?
- Is the **user** trusted by the server? or the browser? Is the browser trusted by the user? or the server?
- Is there an **eavesdropper** **spying** on your web traffic?