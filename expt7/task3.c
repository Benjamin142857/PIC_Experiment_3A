#include <pic.h>

void delay(int t);
void init_USART();

void main(void) {
    init_USART();
	while(1) {
		if(RCIF) {
			PORTD = RCREG-0x30;
			RCIF=0;
		}
	}
}

void init_USART() {
    TRISC6 = 0;
    TRISC7 = 1;
	TRISD = 0;
	TRISA1 = 0;
	RA1 = 1;
    TXSTA = 0b00100100;
    RCSTA = 0b10010000;
    SPBRG = 25;
    INTCON = 0x00;

}

void delay(int t) {
    int i, j;
    for(i=t; i>0; i--) {
        for(j=0; j<100; j++);
    }
}