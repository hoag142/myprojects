

# 22110029, Trần Huy Hoàng
# Lab 1
## bof1
*execute buffer overflow*  
![image](https://github.com/quang-ute/myprojects/assets/152377486/7758e4c8-2478-46e6-a6ba-9f3f07aa2a8c)



Code to run the container contain the lab



![image](https://github.com/hoag142/myprojects/assets/152377486/f05ef518-7866-48e1-a132-7992cad71d21)



We need to insert the address of the secretFunc into the eip.
 ![image](https://github.com/hoag142/myprojects/assets/152377486/d552dced-7992-4839-98eb-241788459483)


- Step 1 : Build the c program with `gcc -g bof1.c -o bof1.out -fno-stack-protector -z execstack -mpreferred-stack-boundary=2`

  
`-fno-stack-protector` : Turn off the compiler's stack smashing check option


`-mpreferred-stack-boundary=2` : set boundary euqal 2 to make gdb look more clear

 - Step 2 : run gdb to find the address of secretFunc(), run this code first `gdb bof1.out` and do this `disas secretFunc`

   
![image](https://github.com/hoag142/myprojects/assets/152377486/2096a6f9-fa70-4b2b-8b95-98dd8e0eba5a)


we can see the address of secretFunc at the first line `0x0804846b`

- Step 3 : Filling full buffer with random char and insert the function address

![image](https://github.com/hoag142/myprojects/assets/152377486/03258068-9579-4265-8288-9cd5bf3ff75d)


You can see that i fill buffer with 204 char `a` and insert address with little-endian type `/x6b/x84/x04/x08`
And i success with the line `Congratulation!`

## 4.1.b
*Is your browser running HTTP version 1.0 or 1.1? What version of HTTP is the server running?*
- Browser's HTTP version: HTTP/1.1 (as indicated by HTTP/1.1 in the request line) 
- Server's HTTP version: HTTP/1.1 (as indicated by HTTP/1.1 in the status line)
# Task 4.2: Http conditional GET/Response Interaction
- Information sniffed

<img width="726" alt="Screenshot 2023-05-02 165126" src="https://github.com/quang-ute/myprojects/assets/57078914/5b008df9-130c-4501-90d9-fb09f9a89a35">

## 4.2.a
*Inspect the contents of the first HTTP GET request from your browser to the server. Do you see an 
“IF-MODIFIED-SINCE” line in the HTTP GET?*
- There is an "If-Modified-Since" line in the HTTP GET request

<span style="color:blue">This is a way for the browser to request that content be returned only if it has been modified since the specified time</span>
## 4.2.b
*What is the HTTP status code and phrase returned from the server in response to this second HTTP GET? Did the server explicitly return the contents of the file? Explain.*
- No content is sent back.

<span style="color:blue">In my opinion it shows that the content has not changed since the specified time, so the server does not need to send the content back to the browser.</span>
# Task 4.3: Examine Http request methods
## 4.3.a
- Information being sniffed

<img width="829" alt="Screenshot 2023-05-02 171034" src="https://github.com/quang-ute/myprojects/assets/57078914/07eb9d96-0ac2-4891-986a-29f2593fa3e3">

<span style="color:blue">From my perspective, it demonstrates different methods of sending form data to the server and how the server responds based on the request type. The resulting HTML pages provide insights into how the server processes and presents the submitted data back to the user.</span>
## 4.3.b
*Examine encrypt password authentication*

![Screenshot 2023-07-02 215333](https://github.com/quang-ute/myprojects/assets/57078914/6b9b0fe0-af40-4d56-a505-fcf5e055736e)

 
