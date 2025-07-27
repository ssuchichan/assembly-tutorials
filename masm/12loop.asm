assume cs:code,ds:data

data segment
val dw 1234H
result db ?,?,?,?,'H',24H
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov si, 3
	mov cx, 4
	mov ax, val
next:
	push cx
	mov bl, al
	and bl, 0FH
	and bl, 30H
	mov byte ptr result[si], bl
	
	mov cl, 4
	ror ax, cl
	dec si
	pop cx
	
	;计数循环，计数器是CX
	loop next ;
	
	mov dx, offset result
	mov ah, 9
	int 21H
	
code ends
end start


