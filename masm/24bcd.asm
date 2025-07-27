assume cs:code,ds:data

data segment
BCD   DB 12H
ASCII DB 2 DUP(0),'H',24H ;24H为$的ascii码
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov al, BCD
	mov cl, 4
	shr al, cl    ;al=01H
	add al, 30H   ;al=31H
	mov ASCII, al

	mov al, BCD
	and al, 0FH  ;al=02H
	add al, 30H ;al=32H
	mov ASCII+1, al

	;显示结果
	mov dx, offset ASCII
	mov ah, 9
	int 21H

	mov ax, 4C00H
	int 21H
code ends
end start

