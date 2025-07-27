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
	mov al, 7FH
	add al, 1
	jo over      ;OF=1则跳转到over
	
	mov dx, offset string
	mov ah, 9
	int 21H
over:
	mov ax, 4C00H
	int 21H
code ends
end start


