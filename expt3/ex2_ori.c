#include <pic.h>

#define CONST_T 0xec;

void Delay (unsigned int time);
int i=0;
void main()
{
	int j;
	ADCON1=(ADCON1&0xf0)|0x07;
	TRISD=0x00;
	TRISA=TRISA&(~(0x01<<1));
	TRISC1=0;
	RA1=1;
	OPTION_REG=0x07;
	T0IE=1;
	T0IF=0;
	TMR0=CONST_T;
	GIE=1;
	while(1){
		for(j=0;j<=7;j++){
			PORTD=(0x01<<j);
			Delay(500);
		}
	}
}
void interrupt PIC_Int(void)
{
	if(T0IF)
	{
		i++;
		if(i<90) RC1=0;
		else if (i>90&&i<100) RC1=1;
		if(i>100) i=0;
		TMR0=CONST_T;
		T0IF=0;
	}
}
void Delay(unsigned int time) {
	unsigned int k;
	for(;time>0;time--){
		for(k=0;k<45;k++);
	}
}