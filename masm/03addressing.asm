assume cs:code,ds:data
x = 1234H

data segment
val1 db 1
val2 dw ?
val3 db 1,2,3,4,5,6,7,8,9,0,1,2,3
val4 dd 12345678H
data ends

code segment
start:
	mov ax, data ;将段标号data送入ax
	mov ds, ax
	
	;立即寻址
	mov ax, x                ;ax=1234H
	mov word ptr val1, 3456H ;将3456H写入val1偏移地址处val1=56H，val2=0034H
	
	;寄存器寻址
	mov cx, ax
	
	;直接寻址
	mov al, byte ptr ds:[val1] ;将val1偏移地址处1个字节的值送入al，al=56H
	mov al, val1               ;等同于上一条语句，简写形式
	
	;寄存器间接寻址
	mov si, offset val3        ;将val3偏移地址送入si，si=0003H
	lea si, word ptr ds:[val3] ;将val3偏移地址送入si，si=0003H
	add si, 1                  ;si=0004H
	mov bx, word ptr ds:[si]   ;将si偏移地址处1个字节送入bx，bx=0302H
	
	;寄存器相对寻址
	mov bx, offset val1        ;将val1偏移地址送入bx，bx=0000H
	mov ax, ds:[bx+3]          ;将数据段bx+3偏移地址处1个字的值送入ax，ax=0201H
	
	;基址加变址
	mov si, 1                  ;si=0001H
	mov bx, offset val3        ;将val3偏移地址送入bx，bx=0003H
	mov ax, [bx+si]            ;将[bx+si]=0004H偏移地址处1个字的值送入ax，ax=0302H
	
	;相对基址加变址
	mov ax, [bx+si+1]          ;将[bx+si+1]=0005H偏移地址处1个字的值送入ax，ax=0403H
	
	lea si, val4               ;将val4偏移地址送入si，si=0010H
	mov si, offset val4        ;将val4偏移地址送入si，si=0010H
	mov al, byte ptr val4      ;将val4偏移地址处1个字节的值送入al，al=78H
	mov al, byte ptr ds:[si]   ;将si偏移地址处1个字节的值送入al，al=78H
	
	;lds从内存中读取4字节的远指针（Far Pointer），并分别存入：
    ;低2字节（偏移地址）→指定的通用寄存器
    ;高2字节（段地址）→DS段寄存器
	lds di, val4               ;将val4偏移地址处5678H送入di，1234H送入ds
	
	;切回数据段
	mov ax, data
	mov ds, ax
	
	mov al, 0      ;退出码，4C号功能入口参数
	mov ah, 4CH    ;调用dos系统4C号功能，退出程序
	mov ax, 4C00H  ;与前2条语句等价
	int 21H       
code ends
end start

