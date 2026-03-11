##### 1\. GET vs POST



The `method` attribute in the `<form>` tag determines how form data is sent to the server.



###### \- *GET Method*

&nbsp; - Sends form data in the URL as query parameters

&nbsp; - Data is visible in the URL, stored in browser history, and can be bookmarked.

&nbsp; - It has a limited data size and is mainly used for retrieving data from a server.



###### \- *POST Method*

&nbsp; - Sends form data in the HTTP request body, not in the URL.

&nbsp; - Data is not visible in the address bar.

&nbsp; - Supports larger amounts of data and is more secure for sensitive information.

&nbsp; - Commonly used for submitting or creating data.



**Which one should be used for register.html?**



The POST method\*\* should be used for `register.html` because registration forms usually contain \*\*sensitive information such as usernames, emails, and passwords\*\*. POST keeps this data out of the URL and allows larger, more secure submissions.



---



##### &nbsp;2. Semantic HTML



Semantic HTML uses meaningful tags like `<header>`, `<main>`, `<section>`, and `<footer>` instead of relying only on `<div>` elements.



Using semantic tags is better because:



\- Improves readability – Developers can easily understand the structure of the webpage.

\- Better accessibility – Screen readers and assistive technologies can understand the page structure.

\- Improves SEO – Search engines understand the content hierarchy more easily.

\- Better maintainability – Makes the code more organized and easier to maintain.



Although a website could technically be built using only `<div>` tags, semantic elements provide \*\*clear meaning and structure\*\* to the content.



---



##### 3\. The Request/Response Cycle



When you type google.com in your browser and press Enter, the following steps occur:



1\. DNS Lookup

&nbsp;  - The browser asks a \*\*DNS (Domain Name System) server\*\* to translate the domain name google.com into an IP address.



2\. Find the Server

&nbsp;  - DNS returns the IP address of Google's server (for example: `142.250.x.x`).



3\. HTTP Request  

&nbsp;- The browser sends an HTTP request to that IP address asking for the webpage.



4\. Server Processing

&nbsp;  - The server receives the request, processes it, and prepares the webpage.



5\. HTTP Response

&nbsp;  - The server sends back an HTTP response containing HTML, CSS, JavaScript, and other resources.



6\. Browser Rendering

&nbsp;  - The browser downloads the files and renders the webpage, displaying it to the user.

