;将大写字母转成小写，并打印
assume cs:code,ds:data

data segment
msg db 'HELLO WELCOME TO ASM!',0DH,0AH,'$'
data ends


code segment
_start:
	mov ax, data
	mov ds, ax
	
	mov si, offset msg
	
_loop:	
	mov al, [si]
	cmp al, 0DH
	jz _print              ;遇到回车符，说明字符串结束，调到打印

	call _upper2lower      ;大写转小写
	
	mov byte ptr [si], al  ;将al中的结果保存到[si]
	inc si                 ;指向下一个字符
	jmp _loop              ;循环处理
	
_print:
	;打印
	mov dx, offset msg
	mov ah, 09H
	int 21H
	;退出
	mov ax, 4C00H
	int 21H

_upper2lower proc
	cmp al, 'A'
	jb _ret
	cmp al, 'Z'
	ja _ret	
	add al, 20H
_ret:
	ret
_upper2lower endp

code ends
end _start

