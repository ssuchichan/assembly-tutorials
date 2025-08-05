;将字符串中的数字移除
assume cs:code,ds:data

data segment
msg db 'AB=C950-asd',0
data ends

code segment
_isNum proc
	cmp al, '0'
	jb _ret
	cmp al, '9'
	ja _ret
	clc        ;CF置0
	ret
_ret:
	stc        ;CF置1
	ret
_isNum endp

_start:
	mov ax, data
	mov ds, ax

	mov si, offset msg
	mov di, si
	
_loop:
	mov al, [si]
	inc si
	
	or al, al ;遇到0
	jz _end
	
	call _isNum
	
	jnc _loop     ;CF=0，数字
	mov [di], al  ;CF=1，字符
	inc di
	jmp _loop
_end:
	mov byte ptr [di], '$'
	mov dx, offset msg
	mov ah, 09H
	int 21H

	mov ax, 4C00H
	int 21H
code ends
end _start
