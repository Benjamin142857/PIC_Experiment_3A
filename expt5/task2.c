/* 
    task2: ��������Ƶ����ռ�ձ�
*/

#include <pic.h>

void init(void);
void delay(unsigned int ms);

void main(void) {
    // ��ʼ����??
    init();

    // ɨ�谴��
    while(1) {
        // SW1 - ����ռ�ձȣ���������
        if (!RB2) {
            delay(3);
            if (!RB2) {
                if (CCPR1L > 5) CCPR1L-=5;
            }
        }

        // SW2 - ���ռ�ձȣ���������
        if (!RB4) {
            delay(3);
            if (!RB4) {
                if (CCPR1L < PR2-5) CCPR1L+=5;
            }
        }
    }
}

void init(void) {
    TRISC2 = 0;             // RC2 ���, ��������ź�
    TRISB4 = 1;             // RB4[SW2] ����
    TRISB2 = 1;             // RB2[SW1] ����
    TRISA1 = 0;             // RA1 ���
    RA1 = 1;                // COL=1
    T2CON = 0x03;           // TMR2Ԥ��Ƶ��16
    CCP1CON = 0x0f;          // CCP1CON[3:0]=11xx, PWMģʽ
	TMR2 = 0;				// ���TMR2
    PR2 = 205;             // ���ڳ�ֵ
    CCPR1L = 105;           // �����ֵ

    TMR2ON = 1;             // ��ʼ��ʱ
}

void delay(unsigned int ms) {
    unsigned int i;
    // [12M]=3000, [4M]=1000
	for(;ms>0;ms--) {
		for(i=1000; i>0; i--);
	}
    
}