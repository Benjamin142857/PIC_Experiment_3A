#include<pic.h>
//__CONFIG(FOSC_XT&WDTE_ON&WDTE_OFF&LVP_ON&LVP_OFF);
#define uint8 unsigned char
void Delay(unsigned int delay);
void checkkey(void);
void main()
{
   ADCON1=(ADCON1&0xf0)|0x07;
   TRISB0=1;
   TRISD=0x00;
   TRISA=TRISA&(~(0x01<<1));
   RA1=1;
   while(1)
    {
       unsigned char i=0;
       for(i=0; i<8; i++)
        {
           PORTD=(0x01<<i);
           Delay(3000);
           checkkey();
        }
   } 
}
void checkkey(void) 
{
 uint8 i;
 if (RB0==0)
 {
    PORTD=0x00;
    for(i=0; i<10; i++)
        {
           PORTD=~PORTD;
           Delay(150);
        } 
      }
    return;
}
void Delay (unsigned int delay)
{
 unsigned int i;
  for (;delay>0; delay--)
    for (i=0; i<45; i++);
}
