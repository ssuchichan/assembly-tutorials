;计算1234:5678H处开始100个16位无符号数的和
;注意有进位，结果保存到result对应的内存地址中
assume cs:code,ds:data

data segment
result dd ? ;定义为32位，16位相加可能是32位
data ends

code segment
start:
	mov ax, 1234H
	mov ds, ax
	mov si, 5678H
	mov ax, 0      ;累加和
	xor dx, dx     ;异或会将CF位清零
	mov cx, 64H    ;循环100次
next:
	add ax, word ptr [si]
	adc dx, 0
	;inc si
	;inc si
	add si, 2      ;si移动到下一个字，等同于上面两条语句
	dec cx
	jnz next       ;跳转到next地址处

	;切换数据段
	mov bx, data
	mov ds, bx
	
	;保存结果
	mov word ptr result, ax
	mov word ptr result+2, dx
	
	;退出程序
	mov ax, 4C00H 
	int 21H
code ends
end start


