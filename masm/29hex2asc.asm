;将16位二进制数转为4位十六进制ASCII码
assume cs:code,ds:data

data segment
num dw 1C3BH
buff db ?,?,?,?,0DH,0AH,'$'
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov dx, num
	mov bx, offset buff
	;调用_func子程序
	call _func
	mov dx, offset buff
	mov ah, 9
	int 21H
	mov ax, 4C00H
	int 21H
;循环处理	
_func proc
	mov cx, 4
_loop:
	push cx
	mov cl, 4
	rol dx, cl
	mov al, dl
	;调用_hex_to_asc子程序
	call _hex_to_asc
	mov byte ptr [bx], al
	inc bx
	pop cx
	loop _loop
	ret 
_func endp

;将一位十六进制转为ASCII码
_hex_to_asc proc
	and al, 0FH
	add al, 30H
	cmp al, 39H
	jbe _return
	add al, 07H
_return:
	ret
_hex_to_asc endp

code ends
end start

