#include<pic.h>
#define uint8 unsigned char

void Delay(unsigned int delay);   //声明延时函数；
void Delay1(unsigned int delay);  //声明延时函数；
const unsigned char LED[10]=
{
	0x3f,     //0
	0x06,     //1
	0x5b,	  //2
	0x4f,	  //3
	0x66,	  //4
	0x6d,	  //5
	0x7d,	  //6
	0x07,	  //7
	0x7f,	  //8
	0x6f,	  //9
};

void main() {
	ADCON1 = (ADCON1&0b11110000)|0b00000111;  		// 设置ADCON1低四位为0111，将A口或E口作为全数电普通I/O口使用；
	TRISB = (TRISB&0b11001111)|0b00110000;     		// RB4(SW2),RB5(SW3) 输入
	TRISD = 0x00;   								// RD0~RD7(LED)，全输出
	TRISA = TRISA&0b11011101;   					// RA1(COL1,排灯1，倒数第一个LED),RA5(COL4,排灯4，倒数第四个LED)，设置为输出；

	
	RBIE = 1;		// SW2,SW3 变化中断使能
	RBIF = 0;		// SW2,SW3 变化中断标志清除
    GIE = 1;       	// 使能总中断

	RA1 = 1;		// RA1(COL1,排灯)，使能
    RA5 = 0;       	// RA5(COL4,倒数第四个LED)，关；

	while(1){      	//执行while语句
	    unsigned int i;
	    for(i=0; i<8; i++) {
	        PORTD=(0x01<<i);   //将PORTD的第i位设置为高电平
	        Delay(1000);       //设置延时参数为3000
	     }
	} 
}


void interrupt PIC_Int(void) {
	unsigned int i;


	// SW2 or SW3 触发中断
	if(RBIF) {
		PORTD=0x00;             //灭掉所有LED
		

		for(i=0; i<10; i++)  {
	       PORTD=~PORTD;    //点亮所有LED
	       Delay1(150);       //调用Delay1延时函数，设置延时参数为150
		} 
			
		RA1 = 0;				// RA1(COL1,排灯)，关
   		RA5 = 1;       			// RA5(COL4,倒数第四个LED)，使能；

		for(i=0; i<6; i++) {
			PORTD = LED[5-i];
			Delay1(300);
		} 

		PORTD=0x00;             //灭掉所有LED

		RA1 = 1;				// RA1(COL1,排灯)，使能
   		RA5 = 0;       			// RA5(COL4,倒数第四个LED)，关；
			
	} 
	RBIF = 0;
}


void Delay (unsigned int delay) {
	unsigned int i;                //定义无符号整型变量i
	for (;delay>0; delay--)       // for循环语句，delay>0时自减1，否则跳出循环
		for (i=0; i<45; i++);         // for循环语句，i<10时自加1，否则跳出循环

}

void Delay1 (unsigned int delay) {
	unsigned int i;     //定义无符号整型变量i
	for (;delay>0; delay--)   // for循环语句，delay>0时自减1，否则跳出循环
		for (i=0; i<45; i++);    // for循环语句，i<10时自加1，否则跳出循环
}
