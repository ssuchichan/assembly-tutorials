assume cs:code,ds:data

data segment
data1 dq 0FEDCBA9876543210H ;16进制数字A-F开头需添加前缀0
data2 dq  1234556789ABCDEFH
result dq ?
data ends 

code segment
start:
	mov ax, data
	mov ds, ax
	mov cx, 4      ;64位分成4个16位处理
	sub bx, bx     ;CF清零
next:
	mov ax, word ptr data1[bx]    ;被减数
	sbb ax, word ptr data2[bx]    ;带进位减
	mov word ptr result[bx], ax   ;保存结果
	
	;bx指向下一个字
	inc bx    
	inc bx
	dec cx    ;计数器减1
	jnz next  ;循环
	
	;退出程序
	mov ax, 4C00H
	int 21H
code ends
end start

