;求X的以10为底的对数，X在1-10之间
assume cs:code, ds:data

data segment
value dw 4    ;
answer dw ?   ;结果
tab dw 0, 3010, 4771, 6021, 6990, 7782, 8451, 9031, 9542, 10000 ;对数表，将每个X对数乘10000，避免处理小数
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov bx, value
	dec bx         ;x-1就是下标
	add bx, bx     ;dw类型，要乘2
	;查表
	mov ax, tab[bx]
	mov word ptr answer, ax

	mov ax, 4C00H
	int 21H
code ends
end start

