;x位十位数，y位个位数，计算10x+y
assume cs:code,ds:data

data segment
num db 31H,30H
val db ?
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	; dx:3130H
	mov dh, num[0]
	mov dl, num[1]
	
	call subr     ;调用子程序
	mov val, al   ;保存返回值
	
	mov ax, 4C00H
	int 21H
	
subr proc
	pushf
	push dx

	mov al, dh  ;al:31H
	and al, 0FH ;al:01H
	mov ah, 10  ;ah:0AH
	mul ah      ;ax=al*ah:0A01H
	
	mov ah, dl  ;ah:30H
	and ah, 0FH ;ah:00H
	add al, ah  ;al:0AH
	
	pop dx
	popf
	ret
	
subr endp

code ends
end start





