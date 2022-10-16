# Attacks on Integrity

### SQL Injection
- Server-side applications generate SQL queries based on **arbitrary user input**
	- Example: making your password 'foo' OR 1=1;'![[Screen Shot 2022-05-13 at 2.36.55 PM.png]]
- More generally, can execute any SQL command!


**Mitigations**
- **Never** accept arbitrary user input!
-  **Input sanitization**
	- Make sure only **safe input** is accepted
	- What is unsafe? Single quote? Dashes? But these could be legitimate
	- Sanitize on the client or the server?
	- Use **proper escaping**/encoding?
- **Parameterized queries**
	- **Pre-compiled queries** that separate commands from input


### Clickjacking
- Attacker site frames good site and covers part of it to look different / create unintended interactions 
- **Likejacking** is when Facebook users are tricked into clicking the ‘like’ button 
	- This is often achieved using **cursorjacking**

Content from one site is **embedded** into another using **iframes**
- ``<iframe src=“https://www.google.com”></iframe>`
- Outer page can set the width and height of the frame
- Only **inner page can draw** within its frame


Typically, clickjacking is performed by **displaying an invisible page or HTML element, inside an iframe, on top of the page the user sees**. 
- set opacity to 0%
The user believes they are clicking the visible page but in fact they are **clicking an invisible element** in the additional page transposed on top of it. 
- could be "pay" button


This happens because you **trust** the user to use the browser in an **expected** way. Then things go south