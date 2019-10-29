





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

