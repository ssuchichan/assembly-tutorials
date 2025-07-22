assume cs:code,ds:data

data segment
x dw 1234H
y dw 5678H
z dd ?
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov ax, 0
	jmp $+4
	nop
	nop
	nop
	nop
	mov bx, 1
	mov cx, 3
	mov dx, 4

	mov ax, 4C00H
	int 21H
code ends
end start


