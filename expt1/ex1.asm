

     INCLUDE "P16F877.INC"  ;PIC16F877A������ͷ�ļ�
     ORG  0000H             ;αָ�������ĳ���ӳ���洢���ĵ�ַ0000H��ʼ���

     NOP				; �ղ���

     BANKSEL TRISC		; ѡ��TRISC���ڵ�����
     CLRF TRISC			; TRISC=00000000������RCȫ��Ϊ���
     BANKSEL PORTC		; ѡ��PORTC��������
     CLRF PORTC			; PORTC=00000000���������ȫ��Ϊ�͵�ƽ
     BANKSEL PORTC      ; ѡ��PORTC��������
     BSF PORTC,1		; RC1=1������������
LP   GOTO LP			; ѭ��
	 END


