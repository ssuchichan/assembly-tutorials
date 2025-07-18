assume cs:code,ds:data,ss:stack
;stack和data段的先后顺序不影响，但是必须在code段前面
;定义堆栈段
stack segment
db 16 dup(?) ;分配16字节的堆栈空间
stack ends

;定义数据段
data segment
string db "hello,welcome to asm!",24h
data ends

;定义代码段
code segment
start:
	mov ax,stack
	mov ss,ax ;将地址标号stack送入堆栈段寄存器ss
	mov sp,16 ;sp指向栈顶
	
	mov bx,data
	mov ds,bx ;将地址标号data送入数据段寄存器ds
	
	;调用dos系统9号功能输出字符串
	mov dx,offset string
	mov ah,9 ;功能号
	int 21H  ;调用dos系统中断号21H
	
	;调用操作系统4CH号功能，结束程序，控制权交给操作系统
	;mov ax,4C00H
	mov al,0   ;退出码
	mov ah,4CH ;功能号
	int 21H    ;调用dos系统中断号21H
code ends
end start
