#include <pic.h>
// __CONFIG(XT&WDTDIS&LVPDIS);


void main() {
	ADCON1 = (ADCON1&0b11110000)|0b00000111;
	TRISD = 0x00;
	TRISA = TRISA&(~(0x01<<1));
//	TRISA4 = 1;
	TRISB0 = 1;
	RA1 = 1;
	PORTD = 0x00;
//	OPTION = 0b00101000;
//	T0IF = 0;
	TMR0 = 0x00;


	while(1) {
		PORTD=TMR0;
	}
}

