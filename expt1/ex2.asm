    
	 INCLUDE "P16F877.INC"  ;PIC16F877A������ͷ�ļ�
     ORG  0000H             ;αָ�������ĳ���ӳ���洢���ĵ�ַ0000H��ʼ���

     NOP						;ָ������1
     BANKSEL TRISC				;ָ������1
     CLRF TRISC					;ָ������1
     BANKSEL PORTC				;ָ������1
     CLRF PORTC					;ָ������1
     BANKSEL PORTC    			;ָ������1
     
LP   BSF PORTC,1				;ָ������1
     BANKSEL 22H				;ָ������1
     MOVLW D'1'					;ָ������1
     MOVWF 22H					;ָ������1
     CALL DELAY1				;ָ������2

     BCF PORTC,1				;ָ������1
     BANKSEL 22H				;ָ������1

     MOVLW D'16'    ;��ȷ���ò�����ʵ�ַ�������1��Ϊ�������У� ָ������1

     MOVWF 22H					;ָ������1
     CALL DELAY1				;ָ������2  
     GOTO LP					;ָ������2

DELAY1  NOP						;ָ������1
LOOP1   CALL DELAY2				;ָ������2
        DECFSZ 22H				;ָ������1��2��
        GOTO LOOP1				;ָ������2
        RETURN

DELAY2  MOVLW     D'100'        ;ָ������1
        MOVWF     20H           ;ָ������1 
LOOP2   MOVLW     D'200'        ;ָ������1
        MOVWF     21H           ;ָ������1
LOOP3   DECFSZ    21H           ;ָ������1��2��
        GOTO      LOOP3         ;ָ������2
        DECFSZ    20H           ;ָ������1��2��
        GOTO      LOOP2         ;ָ������2
        RETURN
END
