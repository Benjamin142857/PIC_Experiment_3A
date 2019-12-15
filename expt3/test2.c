#include<pic.h>   //加载头文件；
#define uint8 unsigned char

void Delay10us(unsigned int delay);   //声明延时函数
void Delay20us(unsigned int delay);   //声明延时函数；
unsigned int i;
unsigned int t;		// 记录声波时间ms
unsigned int s;		// 记录距离cm

void main() {
	i = 3;
}

/*
void main()                   //主函数；
{

	// DEBUG
	ADCON1=(ADCON1&0xf0)|0x07; 
	TRISA1 = 0;
	RA1 = 1;
	TRISD = 0x00;
	PORTD = 0x00;
	s = 0;


	// 触发信号
	TRISC1 = 0;
	RC1 = 0;

	// 接收信号
	TRISC2 = 1;
	
	

	while(1){
		RC1 = 1;
		Delay10us(1);
		RC1 = 0;
     	Delay20us(10);
		
		t = 0;
		while(RC2) {
			Delay20us(1);
			t += 1;	
		}
		s = 0.034*t;
		PORTD = s/1;
	}
   
}
*/  

void Delay10us (unsigned int delay)     //定义延时函数Delay
{
	for (;delay>0; delay--)       // for循环语句，delay>0时自减1，否则跳出循环
    	for (i=0; i<5; i++);         // for循环语句，i<10时自加1，否则跳出循环
}

void Delay20us (unsigned int delay)     //定义延时函数Delay
{
	for (;delay>0; delay--)       // for循环语句，delay>0时自减1，否则跳出循环
    	for (i=0; i<9; i++);         // for循环语句，i<10时自加1，否则跳出循环

}
