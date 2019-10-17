    
	 INCLUDE "P16F877.INC"  ;PIC16F877A包含的头文件
     ORG  0000H             ;伪指令，即下面的程序从程序存储器的地址0000H开始存放

     NOP						;指令周期1
     BANKSEL TRISC				;指令周期1
     CLRF TRISC					;指令周期1
     BANKSEL PORTC				;指令周期1
     CLRF PORTC					;指令周期1
     BANKSEL PORTC    			;指令周期1
     
LP   BSF PORTC,1				;指令周期1
     BANKSEL 22H				;指令周期1
     MOVLW D'1'					;指令周期1
     MOVWF 22H					;指令周期1
     CALL DELAY1				;指令周期2

     BCF PORTC,1				;指令周期1
     BANKSEL 22H				;指令周期1

     MOVLW D'16'    ;正确设置参数，实现蜂鸣器以1秒为周期鸣叫， 指令周期1

     MOVWF 22H					;指令周期1
     CALL DELAY1				;指令周期2  
     GOTO LP					;指令周期2

DELAY1  NOP						;指令周期1
LOOP1   CALL DELAY2				;指令周期2
        DECFSZ 22H				;指令周期1（2）
        GOTO LOOP1				;指令周期2
        RETURN

DELAY2  MOVLW     D'100'        ;指令周期1
        MOVWF     20H           ;指令周期1 
LOOP2   MOVLW     D'200'        ;指令周期1
        MOVWF     21H           ;指令周期1
LOOP3   DECFSZ    21H           ;指令周期1（2）
        GOTO      LOOP3         ;指令周期2
        DECFSZ    20H           ;指令周期1（2）
        GOTO      LOOP2         ;指令周期2
        RETURN
END
