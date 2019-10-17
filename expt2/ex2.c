#include <pic.h>     //加载头文件
// __CONFIG(XT&WDTDIS&LVPDIS); 
unsigned char GetKeyValue(void);
void delaytime(int t);
void shownumber(int n);
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
void main(void)
{
    unsigned char key=0;
    TRISD=0X00;			// RD全改为输出
    TRISA=0X00;			// RA全改为输出
    TRISB=0XFF;			// RB全改为输入
    PORTD=0X00;			// D端口值全为低电平
    //PORTA=0XFF;
	while(1)
	{
        key=GetKeyValue();
        if(key!=0)shownumber((int)key);
        key=0;
        delaytime(1);
        PORTD=0x00;
	}
} 

unsigned char GetKeyValue(void)
{
     RA1=1;   // 选择COL1
   if((PORTB&0B00110101)!= 0B00110101)
   {
       if(RB0==0)return 1;
       if(RB2==0)return 2;
       if(RB4==0)return 3;
       if(RB5==0)return 4;
   }
    RA2=1; 
   if((PORTB& 0B00110101)!= 0B00110101)
   {
       if(RB0==0)return 5;
       if(RB2==0)return 6;
       if(RB4==0)return 7;
       if(RB5==0)return 8;
   }
   RA3=1; 
   if((PORTB& 0B00110101)!= 0B00110101)
   {
       if(RB0==0)return 9;
       if(RB2==0)return 10;
       if(RB4==0)return 11;
       if(RB5==0)return 12;
   }
   RA5=1; 
   if((PORTB& 0B00110101)!= 0B00110101)
   {
       if(RB0==0)return 13;
       if(RB2==0)return 14;
       if(RB4==0)return 15;
       if(RB5==0)return 16;
   }
   return 0;
}

void delaytime(int t)
{
    int j,i;
    for(i=t; i>0; i--)
    {
       for(j=0; j<100; j++);
    }
}

void shownumber(int n)   
{
    if(n<10)
    { 
      RA1=1;
      PORTD=LED[n];
    }
    else if(n>=10&&n<20)
    {
      RA2=1;
      PORTD=LED[1];
      delaytime(100);
      RA1=1;
      PORTD=LED[n-10];
      delaytime(100);
    }
}
