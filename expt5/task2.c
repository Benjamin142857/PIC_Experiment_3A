/* 
    task2: 按键控制频率与占空比
*/

#include <pic.h>

void init(void);
void delay(unsigned int ms);

void main(void) {
    // 初始化配??
    init();

    // 扫描按键
    while(1) {
        // SW1 - 降低占空比，增加亮度
        if (!RB2) {
            delay(3);
            if (!RB2) {
                if (CCPR1L > 5) CCPR1L-=5;
            }
        }

        // SW2 - 提高占空比，减少亮度
        if (!RB4) {
            delay(3);
            if (!RB4) {
                if (CCPR1L < PR2-5) CCPR1L+=5;
            }
        }
    }
}

void init(void) {
    TRISC2 = 0;             // RC2 输出, 输出方波信号
    TRISB4 = 1;             // RB4[SW2] 输入
    TRISB2 = 1;             // RB2[SW1] 输入
    TRISA1 = 0;             // RA1 输出
    RA1 = 1;                // COL=1
    T2CON = 0x03;           // TMR2预分频比16
    CCP1CON = 0x0f;          // CCP1CON[3:0]=11xx, PWM模式
	TMR2 = 0;				// 清空TMR2
    PR2 = 205;             // 周期初值
    CCPR1L = 105;           // 脉宽初值

    TMR2ON = 1;             // 开始计时
}

void delay(unsigned int ms) {
    unsigned int i;
    // [12M]=3000, [4M]=1000
	for(;ms>0;ms--) {
		for(i=1000; i>0; i--);
	}
    
}