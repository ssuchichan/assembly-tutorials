assume cs:code,ds:data

data segment
string db "hello, welcome to asm!",'$'
number db 1,2,3,4,5,6
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov si, offset number ;将偏移地址number送入si
	mov ah, ds:[si]       ;将si偏移地址处1个字节送入ah
	cmp ah, 1             ;ah-1
	;jz over              ;ZF=1则跳转到over
	jnz over
	mov dx, offset string
	mov ah, 9
	int 21H
over:
	mov ax, 4C00H
	int 21H
code ends
end start



