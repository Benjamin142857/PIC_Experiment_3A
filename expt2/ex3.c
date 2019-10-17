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
