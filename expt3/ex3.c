#include<pic.h>
//__CONFIG(FOSC_XT&WDTE_ON&WDTE_OFF&LVP_ON&LVP_OFF);
#define uint8 unsigned char
void Delay(unsigned int delay);
void Delay1(unsigned int delay);
void shownumber(int n); 
const unsigned char LED[10]=
{
  0x3f,  //0
  0x06,  //1
  0x5b,  //2
  0x4f,  //3
  0x66,  //4
  0x6d,  //5
};
void main()
{
   ADCON1=(ADCON1&0xf0)|0x07;
   TRISB=0B00100001;
   TRISD=0x00;
   PORTA=0x00;
   TRISA=TRISA&(~(0x01<<1));
   TRISA=TRISA&(~(0x01<<5));
   INTEDG=0;
   RBIE=1;
   INTE=1;
   INTF=0;
   GIE=1;
   RA1=1;
   while(1){
       unsigned char i=0;
       for(i=0; i<8; i++)
        {
           PORTD=(0x01<<i);
           Delay(3000);
        }
   } 
}
void interrupt PIC_Int(void)  
{
 uint8 i;
 int n;
 if (RBIF)
 {  
    RA5=1;
    RA1=0;
    for(n=5;n>=0;n--)
       {
         shownumber(n);
         Delay1(300);
       }
    RA1=1;
    RA5=0;
    RBIF=0;
 }
 if (INTF)
 {  
    RA5=0;
    RA1=1;
    PORTD=0x00;
   for(i=0; i<10; i++)
        {
           PORTD=~PORTD;
           Delay1(300);
        }
    RA1=1;
    RA5=0;
    INTF=0;
 }
}
void Delay (unsigned int delay)
{
 unsigned int i;
  for (;delay>0; delay--)
    for (i=0; i<45; i++);
}
 void Delay1 (unsigned int delay)
{
 unsigned int i;
  for (;delay>0; delay--)
    for (i=0; i<45; i++);
}
void shownumber(int n)
{
   if(n<6)
   {
     RA5=1;
     PORTD=LED[n];
   }
}
    
                  
