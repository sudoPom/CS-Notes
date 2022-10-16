## Web Sessions

- HTTP is a **stateless** protocol, but most web applications are **session-based** 
	- You log in and see personalised content
	- You stay logged in until you log out or enough time passes
- This is possible because of **cookies**


### Cookies
- Computer cookies are small files, often including unique identifiers, that web servers send to browsers. These are stored on your computer. When you revisit the website (or your browser requests a new page), your browser sends the cookies back to the server 

- Basic token (just a string) provided by the **web server** in its first response 
	- It's set using this command `Set-Cookie: <cookie-name>=<cookie-value>
- This is **attached to every future request** sent to the server
	- So the server knows who the request is coming from, and can generatae a response based on that user/cookie
	- Example: UserID, SessionID, isAuthenticated, Preferences, Shopping cart contents, shopping cart prices

- **Session cookies** exist only during current browser session
	- **Deleted** when browser is shut down (unless you configure it differently)
	- Expiration property is not set
	
- **Persistent cookies** are saved until some server-defined expiration

- What’s the threat model?
	- Which users are trusted and who is a potential **attacker**?
	- Does the web browser have to provide cookies?
	- How hard is it for a **user to modify** their cookies?


### JavaScript
- JavaScript was designed as scripting language for Navigator 2, implemented in (literally) 10 days and related to Java in name only (“Java is to JavaScript like car is to carpet”)
- Scripts embedded in web pages using `<script>` tag that get the browser to execute some linked script (src=“function.js”)
- This means **your computer is executing code (scripts) that it finds on the Internet**


#### JavaScript Security

- Script runs in a **“sandbox”**
	- no direct file access
	- restricted network access
	
- **Same-origin policy**: script can read properties of documents only from the same server, protocol, and port

- But, same-origin policy **does not apply** to scripts loaded from **arbitrary site**, so `<script type=“text/javascript” src=“http://www.dremiliano.com/myscript.js”></script>`runs as if it were loaded from the site that provided the page!

- Server can also explicitly tell browser other domains that are allowed using `Access-Control-Allow-Origin` header


### Cross-Site Scripting (XSS)
The user/browser trusts the server to be non-malicious **and** careful, but this can go wrong.

- Attacker wants to steal a cookie and use it to impersonate Alice
	- Trick Alice into sending the cookie to the attacker, maybe through a JavaScript function
- XSS exploits the trust a user has in a site
	- Form of **session hijacking**
		- from google: obtaining the session ID and masquerading as the authorized user to gain unauthorized access to a computer system
- Two ways to do it in practice
	- **Reflected XSS**
		- Alice visits both bob.com **and** evil.com
		- Script is loaded from evil.com that makes Alice give the cookie to the attacker
	- **Stored XSS**
		- occurs when a malicious script is injected directly into a vulnerable web application
		
- More generally, XSS lets an attacker do anything a **legitimate** client-side script from that server could do
	- Show **false information**
	- Request **sensitive** information
	- Trigger HTTP requests from the client

	
**How to prevent?**
- Preventing injection of scripts is hard! **Not enough** to block “<“ and “>” or allow only simple HTML tags
- Partial fix: `httpOnly` cookies cannot be accessed via script (but this **doesn’t stop XSS attacks**, just **cookie theft**)


### Cross-Site Request Forgery (CSRF)
The user/server can't always trust the browser

- The attacker is able to execute commands as if they were coming from the user

bob.com loads a script from barclays.com and creates a bank transfer
	- on bob.com `<img src=“http://barclays.com/withdraw?acct=Alice&amount=1000&for=ProfEvil”>`

- CSRF exploits the trust a site has in a browser (**confused deputy** attack)

- When a browser issues a GET request, it attaches all cookies it has from the target site
	- The target sees the cookies but has no way of knowing the request was really authorised by the (human) user

**How to prevent?**
- Secret tokens visible only by same-origin content 
	- Client needs to include these secret tokens in state-altering requests
- Don’t alter state based on GET requests
	- Don't change the state based on receiving some cookies
- Same-origin cookies (Chrome)
	- Browser should prohibit apple.com from accessing cookies of samsung.com
	- The same-origin policy is a web browser security mechanism that aims to prevent websites from attacking each other. 

### XSS vs CSRF

XSS
- Server-side vulnerability
- Attacker injects a script into the trusted website
- Trusting browser executes attacker’s script

CSRF
- Server-side vulnerability
- Attacker gets trusted browser to issue requests
- Trusting website executes attacker’s requests

### Mitigations
For websites:
- use same-origin policy / content security policy
- sanitise HTML
- require additional authentication

For users:
- don’t run scripts! (NoScript, Ghostery, etc.)
- don’t “stay signed in”

confidentiality: cryptography, black or white
integrity: use system attributes and are more ad-hoc, gray areas
![[Screen Shot 2022-05-13 at 3.34.45 PM.png]]