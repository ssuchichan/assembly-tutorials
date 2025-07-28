;将3个数由小到大排序
assume cs:code,ds:data

data segment
buff db 234,123,87
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov si, offset buff
	mov al, [si]
	mov bl, byte ptr [si+1]
	mov cl, byte ptr [si+2]

	cmp al, bl
	jbe next1     ;al <= bl
	xchg al, bl   ;al > bl
next1:
	cmp bl, cl
	jbe next2     ;bl <= cl
	xchg bl, cl   ;bl > cl
next2:
	cmp al, bl
	jbe next3
	xchg al, bl
next3:
	mov byte ptr buff, al
	mov byte ptr [buff+1], bl
	mov buff+2, cl
	mov ax, 4C00H
	int 21H
code ends
end start


