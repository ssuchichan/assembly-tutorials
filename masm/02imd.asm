assume cs:code,ds:data
x = 1234H   ;符号x等价与1234H
y EQU 2345H ;符号y等价与2345H

;数据段
data segment
z dw 3456H       ;变量地址标号z，数据占2字节空间
char db "123456" ;变量地址标号char，数据占6字节空间
data ends

;代码段
code segment
start:
	;将data段值赋给ds
	mov ax, data 
	mov ds, ax
	
	mov ax, x ;编译时将x替换为1234H
	mov bx, y ;编译时将x替换为2345H
	mov cx, z ;执行时将地址标号z处存储的值送入cx寄存器
	mov ax, word ptr ds:[z] ;完整规范写法，地址标号加中括号，也是直接寻址
	
	;调用dos系统4CH号功能退出程序
	;mov ax, 4C00H
	mov al, 0   ;退出码
	mov ah, 4CH ;功能号
	int 21H     ;调用dos系统中断号21H
code ends
end start


