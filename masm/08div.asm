assume cs:code, ds:data

data segment
val1 db 2
val2 db 9
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov al, val1 ;al=02H
	mov bl, val2 ;bl=09H
	xor ah, ah   ;ax=0002H
	div bl       ;ax/bl，余数ah=02H，商al=00H

	mov ax, -1             ;ax=0FFFFH
	xor dx, dx             ;dx=0000H
	mov bx, word ptr val1  ;bx=0902H
	div bx                 ;无符号除法，dx:ax(00000902H) / 0902H，余数dx=03C7H，商ax=001CH

	mov ax, -1             ;ax=0FFFFH
	cwd                    ;dx:ax(0FFFFFFFFH)
	mov bx, word ptr val2  ;bx=0009H
	idiv bx                ;有符号除法，0FFFFFFFFH / 0009H，余数dx=0FFFFH，商ax=0

	mov ax, 4C00H
	int 21H
code ends
end start


