#include<pic.h>
void main(){
	ADCON1=(ADCON1&0xf0)|0x07;				// ADCON1低四位为0111，RA为数字IO
	TRISD=0x00;								// D端口设置为输出
	TRISA=TRISA&(~(0x01<<1));				// RA1设置为输出
	TRISA4=1;								// RA4设置为输入，计数按键
	RA1=1;									// RA1设为高电平，选中按键，通过跳线把按键信号传给RA4
	OPTION_REG=0B00101000;					// 工作于计数器模式，分频取2
	T0IF=0;									// 清除标志位
	TMR0=0x00;
	// PORTD = 0x00;								//TMR0初始值为0
	while(1){
		PORTD=TMR0;							// 数码管显示计数了几次
	}
}