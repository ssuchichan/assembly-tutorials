;功能：16进制数字码到七段码的转换，0表示亮，1表示不亮
;
;              0
;          --------
;		   |      |
;		5  |      | 1
;		   |  6   |
;          --------
;          |      |
;       4  |      | 2
;          |      |
;          --------
;             3
; 
assume cs:code, ds:data

data segment
tab db 1000000B, 1111001B, 0100100B, 0110000B
    db 0011001B, 0010010B, 0000010B, 1111000B
	db 0000000B, 0010000B, 0001000B, 0000011B
	db 1000110B, 0100001B, 0001110B, 0001110B
	
xcode db 5  ;待转换的16进制数
ycode db ?  ;存放七段码
date ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	;mov bl, xcode
	;and bl, 0FH
	;xor bh, bh
	;mov al, tab[bx]
	
	;下面3条等价与上面4条指令
	mov bx, offset tab
	mov al, xcode
	xlat               ;查表指令，用bx指向表，al作为索引
	
	mov ycode, al
	
	mov ax, 4C00H
	int 21H
code ends
end start

