/*
    ex1: 产生1000HZ, 占空比为25%
*/

#include <pic.h>

void PWMIni(void);

void main(void) {
    TRISD = 0x00;       // D端口全输出
    PORTD = 0xff;       // 
    PWMIni();
    while(1);
}

void PWMIni(void) {
    TRISC2 = 0;                     // RC2=0,设为输出模式
    T2CON = (T2CON & 0xfc) | 0x03;  // T2CON[2:0]=1x, TRM2分频比设为16:1
    TMR2=0;                         // 清空TMR2[7:0]
    PR2=187;                        // [4M]=62, [12M]=187
    CCP1CON = 0b00111111;           // CCP1CON[3:0]=11xx, CCP1-PWM模式
                                    // CCP1CON[5:4]=11, 脉宽寄存器低二位设为11
    CCPR1L = 46;                    // [4M]=15, [12M]=46

    TMR2ON = 1;                     // TMR2 开始计时
}