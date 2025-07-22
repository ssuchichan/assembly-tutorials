assume cs:code

code segment
start:
N:
	mov ax, 0
	mov bx, 0
	jmp short S
	add ax, 1
S:
	inc ax
	mov ax, 4C00H
	int 21H
code ends
end start
