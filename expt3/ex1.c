#include<pic.h>   //加载头文件；
//__CONFIG(FOSC_XT&WDTE_ON&WDTE_OFF&LVP_ON&LVP_OFF); //设置配置字；
#define uint8 unsigned char
void Delay(unsigned int delay);   //声明延时函数；
void Delay1(unsigned int delay);  //声明延时函数；
void main()                   //主函数；
{
   ADCON1=(ADCON1&0xf0)|0x07;  //设置ADCON1低四位为0111，
                                //将A口或E口作为普通I/O口使用；
   TRISB0=1;     //初始化I/O口，将RB0设置为输入；
   TRISD=0x00;   //将RD全部设置为输出；
   TRISA=TRISA&(~(0x01<<1));   //将RA1设置为输出；
   INTEDG=1;    //当INTEDG=1时，RB0/INT引脚上升沿触发；
                //当INTEDG=0时，RB0/INT引脚下降沿触发；
   INTE=1;      //使能外部触发中断，允许外部触发中断请求；
   INTF=0;      //清除标志位，未发生外部触发中断；
   GIE=1;       //使能总中断，允许所有中断源的中断请求；
   RA1=1;       //选择第一列LED灯，即选通数管的第一位；
   while(1){      //执行while语句
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
