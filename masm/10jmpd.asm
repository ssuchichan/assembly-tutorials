assume cs:code,ds:data

data segment
buf db 100 dup(0)
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov si, 1234H
	mov word ptr [si], 5678H
	mov word ptr [si+2], 1234H
	jmp dword ptr[si]          ;间接跳转

	mov ax, 4C00H
	int 21H
code ends
end start


