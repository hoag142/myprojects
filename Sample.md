

# 22110029, Trần Huy Hoàng
# lab 1 Stack smashing
## task 1
### bof1
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


You can see that i fill buffer with 204 char `a`(why 204 because to fill the buffer we need 200 byte and more 4 byte to fill the ebp) and insert address with little-endian type `/x6b/x84/x04/x08`
And i success with the line `Congratulation!`

### bof 2

![image](https://github.com/hoag142/myprojects/assets/152377486/61063590-0160-40c1-b29f-6a754e6f91a0)

I do the similar at bof1 to the *step 1*

![image](https://github.com/hoag142/myprojects/assets/152377486/da76259b-0a82-400b-92cc-3925ed298f15)


But now we have buffer in main 

![image](https://github.com/hoag142/myprojects/assets/152377486/2937917d-e43c-4c80-9143-6a4e106518c3)

'check' : If `check` is not `0x04030201` and not `0xdeadbeef`, print the message `You are on the right way!`.
If the `check` is equal to `0xdeadbeef`, print `Yeah! You win!`.

- Enter data longer than 40 bytes to overwrite the `check` memory area
  
- If we enter 45 bytes, we can overwrite the `check` variable, changing its value.
  
- For example, if we enter a string longer than 40 bytes that starts at the appropriate position, we can overwrite the value `0xdeadbeef` in the check variable, resulting in the program printing `Yeah! You win!`.

  ![image](https://github.com/hoag142/myprojects/assets/152377486/178f8596-fbdb-46fa-b58b-4dd1c58c6d7b)

I enter the value `0xdeadbeef` as little-endian type.

  ![image](https://github.com/hoag142/myprojects/assets/152377486/2b641368-1528-4b1a-9f63-a803bdf4a32e)

And i success execute the buffer overflow
### bof3

The memory stack is arranged as follows in a 32 bit system
  
the frame of this code
*we can easy see that*
- buf  `[128 byte]`
- func `[4 byte]`
  
If we enter 120 `A` characters and do not overflow buf memory, the func function pointer will be assigned to the `sup()` function and print `congrat`

![image](https://github.com/hoag142/myprojects/assets/152377486/1c6f265d-f20b-4353-9994-f478f388a161)



And if we overflow buf memory and fill full `var` with random char but not fill the `func` with random char too, the `sup()` func will cannot execute again, and will show the error `segmentaion fault`

![image](https://github.com/hoag142/myprojects/assets/152377486/cb4a53cd-a91b-489d-8f88-0c7a3ae3c758)



- If we want to the `shell()` func execute we need to insert the address of shell function in func pointer

First we run gdb to find the address of shell(), run this code first `gdb bof3.out` and do this `disas shell`

![image](https://github.com/hoag142/myprojects/assets/152377486/504869cd-612a-4c88-af7c-f535b59047c8)

we can see `shell()` : `0x0804845b`

Because, buf  `[128 byte]` . So, the offset to func is 128 bytes.
And insert this address to func pointer with payload is 128 char `a` and `0x0804845b` address

![image](https://github.com/hoag142/myprojects/assets/152377486/6e185975-44b7-4ac8-8e40-716cee7d76c0)


## task 2
### preparing shell code
 Creating `file_del.asm`
 
 ![image](https://github.com/hoag142/myprojects/assets/152377486/d6119185-6b06-4e4a-867c-98d3477cd97c)




