;计算16*x+y
assume cs:code,ds:data

data segment
x dw 1234H
y dw 5678H
res dd ?
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	;结果在dx:ax中
	mov ax, x
	xor dx, dx

	;ax左移4位等价于乘16
	mov cl, 4
	shl ax, cl
	;取高4位
	mov dx, x
	mov cl, 12
	shr dx, cl
	
	;16x+y
	add ax, y
	adc dx, 0
	
	;保存结果
	mov word ptr [res], ax
	mov word ptr [res+2], dx
	
	mov ax, 4C00H
	int 21H
code ends
end start



