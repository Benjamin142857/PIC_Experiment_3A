

     INCLUDE "P16F877.INC"  ;PIC16F877A包含的头文件
     ORG  0000H             ;伪指令，即下面的程序从程序存储器的地址0000H开始存放

     NOP				; 空操作

     BANKSEL TRISC		; 选择TRISC所在的体域
     CLRF TRISC			; TRISC=00000000，即将RC全设为输出
     BANKSEL PORTC		; 选择PORTC所在体域
     CLRF PORTC			; PORTC=00000000，即将输出全设为低电平
     BANKSEL PORTC      ; 选择PORTC所在体域
     BSF PORTC,1		; RC1=1，蜂鸣器响起
LP   GOTO LP			; 循环
	 END


