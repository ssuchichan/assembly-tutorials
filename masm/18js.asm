assume cs:code,ds:data

data segment
string db "hello, welcome to asm!",'$'
number db 1,2,3,4,5,6
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov si, offset number
	mov al, [si+2]
	or bl, 10000000B     ;bl和二进制数10000000B或运算
	js over              ;SF=1则跳转至over
	
	mov dx, offset string
	mov ah, 9
	int 21H
over:
	mov ax, 4C00H
	int 21H
code ends
end start


