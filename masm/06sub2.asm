assume cs:code,ds:data

data segment
data1  dw 6AB2H,0B2A2H,01D1H ;01D1 B2A2 6AB2H
data2  dw 334EH,0E14DH,00E8H ;00E8 E14D 334EH
result dw ?,?,?,?
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	xor si, si
	mov cx, 4
next:
	mov ax, data1[si]
	sbb ax, data2[si]
	mov result[si], ax
	inc si
	inc si
	dec cx
	jnz next
	
	mov ax, 4C00H
	int 21H
code ends
end start
