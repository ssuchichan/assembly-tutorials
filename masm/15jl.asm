assume cs:code,ds:data

data segment
string db "hello, welcome to asm!",'$'
number db 1,2,3,4,5,6
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov ah, -1
	mov al, -2
	cmp al, ah
	jnl over      ;al不小于ah则跳转到over
	
	mov dx, offset string
	mov ah, 9     ;dos系统9号功能，显示以'$'结尾的字符串
	int 21H
over:
	mov ax, 4C00H
	int 21H
code ends
end start


