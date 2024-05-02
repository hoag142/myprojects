# 22110172, Vũ Văn Việt
# Task 4.1: Exploring HTTP messages
## 4.1.a
*Identify request line, header lines, blank line of HTTP request message, as well as the Status line, Header lines, blank line, Entity body of HTTP response message?*  
- Request line of HTTP request message: GET / HTTP/1.1 
- Header lines of HTTP request message (sample): 
Host: localhost:5050 
Connection: keep-alive 
Cache-Control: max-age=0 
... (other headers) 
Blank line of HTTP request message: The line immediately following the headers, separating 
headers from the body (which is empty in this case). 
- Status line of HTTP response message: HTTP/1.1 304 Not Modified 
- Header lines of HTTP response message (sample): 
 Date: Mon, 15 Apr 2024 03:33:33 GMT 
Server: Apache 
Last-Modified: Mon, 18 Mar 2024 03:15:15 GMT 
ETag: "1b6-613e6c4399123" 
... (other headers) 

Blank line of HTTP response message: The line immediately following the headers, separating 
headers from the entity body (which is empty in this case).
## 4.1.b
*Is your browser running HTTP version 1.0 or 1.1? What version of HTTP is the server running?*
- Browser's HTTP version: HTTP/1.1 (as indicated by HTTP/1.1 in the request line) 
- Server's HTTP version: HTTP/1.1 (as indicated by HTTP/1.1 in the status line)
# Task 4.2: Http conditional GET/Response Interaction
- Information sniffed
<img width=75% src="images/Screenshot 2023-05-02 165126.png">
## 4.2.a
*Inspect the contents of the first HTTP GET request from your browser to the server. Do you see an 
“IF-MODIFIED-SINCE” line in the HTTP GET?*
- There is an "If-Modified-Since" line in the HTTP GET request
- This is a way for the browser to request that content be returned only if it has been modified since 
the specified time
## 4.2.b
*What is the HTTP status code and phrase returned from the server in response to this second HTTP 
GET? Did the server explicitly return the contents of the file? Explain.*
- No content is sent back. In my opinion it shows that the content has not changed since the 
specified time, so the server does not need to send the content back to the browser.
# Task 4.3: Examine Http request methods
## 4.3.a
- Information being sniffed

  <img width=75% src="images/Screenshot 2023-05-02 165635.png">

From my perspective, it demonstrates different methods of sending form data to the server and how the 
server responds based on the request type. The resulting HTML pages provide insights into how the 
server processes and presents the submitted data back to the user.
## 4.3.b
*Examine encrypt password authentication*

<img width=75% src="images/Screenshot 2023-05-02 171034.png">

 
