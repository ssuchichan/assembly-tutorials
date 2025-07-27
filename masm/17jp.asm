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
	mov al, [si+5]
	and al, 010B     ;al和二进制数010B按位与运算
	jp over          ;PF=1则跳转至over
	
	mov dx, offset string
	mov ah, 9
	int 21H
over:
	mov ax, 4C00H
	int 21H
code ends
end start


