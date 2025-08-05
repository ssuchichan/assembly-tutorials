;将8位二进制数转为2位16进制数的ASCII码
;12H -> '1','2'
assume cs:code,ds:data

data segment
num db 12H
buff db 2 dup(?),'$'
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov al, num
	
	call _handle
	
	;保存结果
	mov buff, ah
	mov buff+1, al
	
	;打印
	mov dx, offset buff
	mov ah, 9
	int 21H
	
	mov ax, 4C00H
	int 21H

_handle proc
	mov cl, 4
	mov ah, al
	shr al, cl	
	call _hex2asc ;al=31H
	xchg ah, al   ;ah=31H,al=32H
	call _hex2asc
	ret
_handle endp

_hex2asc proc
	and al, 0FH
	add al, 30H
	cmp al, 39H
	jbe _ret
_ret:
	ret
_hex2asc endp

code ends
end start

