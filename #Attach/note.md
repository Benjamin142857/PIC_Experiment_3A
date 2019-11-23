





~~~c
#include<pic.h>   //加载头文件；

#define uint8 unsigned char
void Delay(unsigned int delay);   	//声明延时函数；
void Delay1(unsigned int delay);  	//声明延时函数；

void main()                 
{
   ADCON1=(ADCON1&0xf0)|0x07;  		//设置ADCON1低四位为0111，
                                	//将A口或E口作为普通I/O口使用；
   TRISB0=1;     					//初始化I/O口，将RB0设置为输入；
   TRISD=0x00;   					//将RD全部设置为输出；
   TRISA=TRISA&(~(0x01<<1));   		//将RA1设置为输出；
   INTEDG=1;    //当INTEDG=1时，RB0/INT引脚上升沿触发；当INTEDG=0时，RB0/INT引脚下降沿触发；
   INTE=1;      //使能外部触发中断，允许外部触发中断请求；
   INTF=0;      //清除标志位，未发生外部触发中断；
   GIE=1;       //使能总中断，允许所有中断源的中断请求；
   RA1=1;       //选择第一列LED灯，即选通数管的第一位；
   while(1){      
       unsigned char i=0;  //定义无符号变量i，i=0；
       for(i=0; i<8; i++)    //for循环语句，i<8时自加1，否则跳出循环
        {
           PORTD=(0x01<<i);   //将PORTD的第i位设置为高电平
           Delay(3000);       //设置延时参数为3000
        }
   } 
}

void interrupt PIC_Int(void)     // 开始中断服务程序
{
 uint8 i;                     //定义变量i
 if (INTF)                    //RB0电平变化触发中断
 {
    PORTD=0x00;             //灭掉所有LED
    for(i=0; i<10; i++)          // for循环语句，i<10时自加1，否则跳出循环
        {
           PORTD=~PORTD;    //点亮所有LED
           Delay1(150);       //调用Delay1延时函数，设置延时参数为150
        } 
        INTF=0;              // 清除标志位
 }
}

void Delay (unsigned int delay)     //定义延时函数Delay
{
 unsigned int i;                //定义无符号整型变量i
  for (;delay>0; delay--)       // for循环语句，delay>0时自减1，否则跳出循环
    for (i=0; i<45; i++);         // for循环语句，i<10时自加1，否则跳出循环

}
 void Delay1 (unsigned int delay)     //定义延时函数Delay1
{
 unsigned int i;     //定义无符号整型变量i
  for (;delay>0; delay--)   // for循环语句，delay>0时自减1，否则跳出循环
    for (i=0; i<45; i++);    // for循环语句，i<10时自加1，否则跳出循环
}

~~~







~~~C
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
~~~





~~~C
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
	TRISB = (TRISB&0b11011110)|0b00100001;     		// RB0(SW0), RB5(SW3) 输入
	TRISD = 0x00;   								// RD0~RD7(LED)，全输出
	TRISA = TRISA&0b11011101;   					// RA1(COL1,排灯1，倒数第一个LED),RA5(COL4,排灯4，倒数第四个LED)，设置为输出；

	
	INTEDG = 1;    	// SW0 中断上升沿触发
	RBIE = 1;		// SW3 变化中断使能
	RBIF = 0;		// SW3 变化中断标志清除
	INTE = 1;      	// SW0 变化中断使能
    INTF = 0;      	// SW0 变化中断标志清除；
    GIE = 1;       	// 使能总中断
	RA1 = 1;		// RA1(COL1,排灯)，使能
    RA5 = 0;       	// RA5(COL4,倒数第四个LED)，关；

	while(1){      	//执行while语句
	    unsigned int i;
	    for(i=0; i<8; i++)    //for循环语句，i<8时自加1，否则跳出循环
	     {
	        PORTD=(0x01<<i);   //将PORTD的第i位设置为高电平
	        Delay(1000);       //设置延时参数为3000
	     }
	} 
}


void interrupt PIC_Int(void) {
	unsigned int i;

	// SW0触发中断
	if(INTF) {
		PORTD=0x00;             //灭掉所有LED
		
		for(i=0; i<10; i++)          // for循环语句，i<10时自加1，否则跳出循环
		    {
		       PORTD=~PORTD;    //点亮所有LED
		       Delay1(150);       //调用Delay1延时函数，设置延时参数为150
		    } 
		
	}
	// SW3触发中断
	else if(RBIF && !RB5) {
		PORTD=0x00;             //灭掉所有LED
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
	INTF = 0;
	RBIF = 0;
}


void Delay (unsigned int delay)     //定义延时函数Delay
{
	unsigned int i;                //定义无符号整型变量i
		for (;delay>0; delay--)       // for循环语句，delay>0时自减1，否则跳出循环
		for (i=0; i<45; i++);         // for循环语句，i<10时自加1，否则跳出循环

}
 void Delay1 (unsigned int delay)     //定义延时函数Delay1
{
	unsigned int i;     //定义无符号整型变量i
		for (;delay>0; delay--)   // for循环语句，delay>0时自减1，否则跳出循环
		for (i=0; i<45; i++);    // for循环语句，i<10时自加1，否则跳出循环
}

~~~





~~~assembly
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
~~~





~~~C
#include <pic.h>     //加载头文件
 __CONFIG(XT&WDTDIS&LVPDIS);     
 //设置配置字
//名称: int const d=0B000000001;
    
 //设置配置字
//名称: 主函数		 
void main(void)
{	
     TRISE=TRISE&(~(0x01<<4));       // TRISE[4]=0, 即PSPMODE=0，D端口工作模式为串行
     ADCON1=(ADCON1&0xf0 )|0x07;     // ADCON1[3:0] = 0111, 将RA0~RA5, RE0~RE2 改为数字IO
     TRISA=TRISA&(~(0X01<<1));       // TRISA[1] = 0, RA1输出
     TRISA=TRISA&(~(0X02<<1));       // TRISA[2] = 0, RA2输出
     TRISD=0X00;                     // TRISD[7:0] = 00000000, RD全输出
     TRISB=TRISB&(0X01<<2);          // TRISB[7:0] = 00000?00, 除RB2, RB其他全输出
     PORTD=0B00000000;               // 灭掉所有LED
     PORTA=0B00000110;               // 选择了COL1, COL@, 即灯与按键的第一排和第二排
     while(1){ 
         if(RB2==0) {				// 如果SW1或SW5值为0，RD0亮，RD3灭
             RD0=1; 
             RD3=0; 
                    }
         else {						// 如果SW1或SW5值为1，RD3亮，RD1灭
                RD0=0;
                RD3=1;
                      } 
     }
}  

~~~







~~~C
#include<pic.h>
__CONFIG(XT&WDTDIS&LVPDIS);
#define uchar unsigned char
#define uint unsigned int

void delay(uint x)
{
	int i, j;
	for(i=x;i>0;i--)
		for(j=110;j>0;j--);
}

void main(void)
{
	int i;
	TRISE = TRISE&(~(0x01<<4));
	ADCON1=(ADCON1&0xf0)|0x07;
	TRISA=TRISA&(~(0x01<<1));
	TRISA=TRISA&(~(0x01<<2));
	TRISA=TRISA&(~(0x01<<3));
	TRISA=TRISA&(~(0x01<<4));
	TRISA=TRISA&(~(0x01<<5));
	TRISD=0x00;
	PORTA = 0B00000010;
	PORTD = 0B00000001;
	delay(100);
	while(1)
	{
		for(i=0;i<7;i++)
		{	
			PORTD = PORTD << 1;
			delay(100); 
		}

		for(i=0;i<3;i++)
		{
			if(i<2)
				PORTA = PORTA << 1;
			else
				PORTA = PORTA << 2;
			delay(100);
		}

		for(i=0;i<7;i++)
		{	
			PORTD = PORTD >> 1;
			delay(100); 
		}

		for(i=0;i<3;i++)
		{
			if(!i)
				PORTA = PORTA >> 2;
			else
				PORTA = PORTA >> 1;
			delay(100);
		}
	}	
}
~~~





~~~c
#include <pic.h>
// __CONFIG(XT&WDTDIS&LVPDIS);


#define CONST_T 0xD9;

void delay_10ms (unsigned int n);

void main() {
	TRISC1 = 0;				// RC1输出

	while(1) {

		RC1 = 0;			// 关蜂鸣器
		delay_10ms(25); 	// 900ms
		RC1 = 1;			// 开蜂鸣器
		delay_10ms(25);		// 100ms
		RC1 = 0;			// 关蜂鸣器
		delay_10ms(25); 	// 900ms
		RC1 = 1;			// 开蜂鸣器
		delay_10ms(25);		// 100ms

	}

}

void delay_10ms (unsigned int n) {
	unsigned int i;
	OPTION = 0x07;		// 分频比1:256
	T0IF = 0;			// 清除标志位

	for (i=0; i<n; i++) {
		TMR0 = CONST_T;		// 重新赋初值
		while(!T0IF);		// 溢出
		T0IF = 0;			// 清除标志位
	}
}
~~~



~~~c
#include <pic.h>
// __CONFIG(XT&WDTDIS&LVPDIS);


#define CONST_T 0xD9;
#define N_10 0x19;
int n;					// 定义全局变量 n，用于标志TRM0中断发生次数
void main() {
	TRISC1 = 0;			// RC1输出
	OPTION = 0x07;		// 分频比 1:256
	T0IE = 1;			// TMR0中断使能
	T0IF = 0;			// TMR0中断标志位清除
	GIE = 1;			// 总中断使能

	TMR0 = CONST_T;		// TMR0寄存器赋初值
	RC1 = 0;			// RC1输出低电平

	n = N_10;			// n = 0x19
	while(1);			// 循环
}

void interrupt PIC_Int(void) {

	if(n == 0) {
		RC1 = !RC1;		// RC1取反
		n = N_10;		// n重新赋值
	}
	else {
		n = n - 1;		// 中断次数+1，n-1
	}

	TMR0 = CONST_T;		// TMR0寄存器赋初值
	T0IF = 0;			// TMR0中断标志位清除
}

~~~



~~~c
#include<pic.h>
void main(){
	ADCON1=(ADCON1&0xf0)|0x07;				// ADCON1低四位为0111，RA为数字IO
	TRISD=0x00;								// D端口设置为输出
	TRISA=TRISA&(~(0x01<<1));				// RA1设置为输出
	TRISA4=1;								// RA4设置为输入，计数按键
	RA1=1;									// RA1设为高电平，选中按键，通过跳线把按键信号传给RA4
	OPTION_REG=0B00101000;					// 工作于计数器模式，分频取2
	T0IF=0;									// 清除标志位
	TMR0=0x00;								//TMR0初始值为0
				    
	while(1){
		PORTD=TMR0;							// 数码管显示计数了几次
	}
}
~~~



~~~c
#include <pic.h>

void PWMIni(void);

void main(void) {
    TRISD = 0x00;       // D端口全输出
    PORTD = 0xff;       // D端口全输出高电平
    PWMIni();			// 初始化配置
    while(1);			// 进入循环
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
~~~





~~~c
#include <pic.h>

void delay(int t);
void init_USART();

void main(void) {
    init_USART();
    while(1) {
        TXREG = 0x32;
        while(!TRMT);
        delay(10);
    }
}

void init_USART() {
    TRISC6 = 0;
    TRISC7 = 1;
    TXSTA = 0b00100100;
    RCSTA = 0b10010000;
    SPBRG = 25;
    INTCON = 0x00;
}

void delay(int t) {
    int i, j;
    for(i=t; i>0; i--) {
        for(j=0; j<100; j++);
    }
}
~~~



~~~c
#include <pic.h>

void delay(int t);
void init_USART();

void main(void) {
    init_USART();
	while(1) {
		if(RCIF) {
			PORTD = RCREG-0x30;
			RCIF=0;
		}
	}
}

void init_USART() {
    TRISC6 = 0;
    TRISC7 = 1;
	TRISD = 0;
	TRISA1 = 0;
	RA1 = 1;
    TXSTA = 0b00100100;
    RCSTA = 0b10010000;
    SPBRG = 25;
    INTCON = 0x00;

}

void delay(int t) {
    int i, j;
    for(i=t; i>0; i--) {
        for(j=0; j<100; j++);
    }
}
~~~



~~~c
#include <pic.h>

void delay(int t);
void init();
unsigned int RH, RL;
unsigned int temp;

void main(void) {
    init();

    while(1) {
        ADGO=1;
		while(!ADIF);
		RH=ADRESH;
		RL=ADRESL;

		temp = RH*256 + RL;  // 【10 bit】 0~1024

		// Y***
		TXREG=(temp/1000) + 0x30;
		while(!TRMT);
		delay(5);

		// *Y**
		TXREG=(temp/100)%10 + 0x30;
		while(!TRMT);
		delay(5);

		// **Y*
		TXREG=(temp/10)%10 + 0x30;
		while(!TRMT);
		delay(5);

		//  ***Y
		TXREG=temp%10 + 0x30;
		while(!TRMT);
		delay(5);

		// \n
		TXREG=0x0A;
		while(!TRMT);
		delay(5);

		delay(400);
    }
}

void init() {
	// IO_configure
    TRISC6 = 0;
    TRISC7 = 1;

	// USART_configure
    TXSTA = 0b00100100;
    RCSTA = 0b10010000;
    SPBRG = 25;
    INTCON = 0x00;

	// AD_configure
	TRISA0=1;        //RA0 as AD input
	ADCON1=0x8E;     
	ADCON0=0x41;
	ADIF=0;
}


void delay(int t) {
    int i, j;
    for(i=t; i>0; i--) {
        for(j=0; j<100; j++);
    }
}


~~~

