assume cs:code,ds:data,ss:stack

val1 equ 1
val2 equ 2
val3 equ 3
Z=X+Y ;二次编译，X、Y可以在后面定义
X=1
Y=2

stack segment
dw 256 dup(?)
stack ends

data segment
msg db 'HELLO',0DH,0AH,'$'
;BUFF DB 1,2,3,10 DUP(0)
BUFF DW 10 DUP(0)
mybuff EQU THIS WORD
data ends

code segment
start:
	mov al, type BUFF   ;BUFF的类型（DW）的大小:2
	mov bl, LENGTH BUFF ;BUFF中DUP的重复次数:10
	mov cl, SIZE BUFF   ;BUFF所占空间大小:2*10
	xor al, al
	xor bl, bl
	xor cl, cl
	
	;设置数据段寄存器
	;mov ax, data
	mov ax, seg msg ;获取mess所在段的段地址（数据段地址）
	mov ds, ax
	
	mov ax, mybuff
	mov ax, word ptr BUFF
	
	mov al, Z
	mov al, LENGTH BUFF
	mov al, val1 * val2 / val3
	mov ax, 1234H GT 1024H
	mov ax, high(1234H + 5) ;high作用1234H+5后的结果
	mov ax, high 1234H + 5 ;high先作用于1234H的结果后加上5
	mov ax, low 1234H - 3
L1:
	;打印mess字符串
	mov dx, offset msg
	mov ah, 9
	int 21H
	;退出
	mov ax, 4C00H
	int 21H
code ends
end start




