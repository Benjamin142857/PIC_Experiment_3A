#include <pic.h>
// __CONFIG(XT&WDTDIS&LVPDIS);


#define CONST_T 0xD9;
#define N_10 0x19;
int n;
void main() {
	TRISC1 = 0;
	OPTION = 0x07;
	T0IE = 1;
	T0IF = 0;
	GIE = 1;

	TMR0 = CONST_T;
	RC1 = 0;

	n = N_10;
	while(1);
}

void interrupt PIC_Int(void) {

	if(n == 0) {
		RC1 = !RC1;
		n = N_10;
	}
	else {
		n = n - 1;
	}

	TMR0 = CONST_T;
	T0IF = 0;	
}
