assume cs:code,ds:data

data segment
string db "hello, welcome to asm!",0DH,0AH,24H
number db 1,2,3,4,5,6
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov si, offset number
	cmp al, [si+1]        ;比较al和数据段si+1偏移地址处的值
	jnc over              ;CF=0则跳转至over
	
	mov dx, offset string
	mov ah, 9
	int 21H
over:
	mov ax, 4C00H
	int 21H
code ends
end start

