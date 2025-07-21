assume cs:code,ds:data

data segment
val1 db 2
val2 db 9
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov al, val1
	mov bl, val2
	mul bl          ; ax=al*bl=0012H
	
	mov ax, word ptr [val1] ;ax=0902H
	mov cx, -1              ;cx=0FFFFH
	mul cx                  ;无符号乘法，dx=0901H,ax=0F6FEH
	
	mov bx, word ptr val2   ;bx=0009H
	mov ax, -1              ;ax=0FFFFH
	imul bx                 ;有符号乘法，dx=0FFFFH,ax=0FFF7H
	
	mov ax, 4C00H
	int 21H
code ends
end start


