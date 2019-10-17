#include <pic.h>
// __COMFIG (HS&WDTDIS&LVPDIS)

#define CONST_T 0x8B;

void delay_10ms (unsigned int delay);

void main() {
	TRISC1 = 0;
	while(1) {
		RC1 = 0;			// ¹Ø·äÃùÆ÷
		delay_10ms (90); 	// 900ms
		RC1 = 1;			// ¿ª·äÃùÆ÷
		delay_10ms(10);		// 100ms
	}
}

void delay_10ms (unsigned int n) {
	unsigned int i;
	OPTION_REG = 0x07;
	TOIF = 0;

	for (i=0; i<n; i++) {
		TMR0 = CONST_T;
		while(!TOIF);
		TOIF = 0;
	}
}s