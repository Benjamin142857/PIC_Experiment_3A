#include <pic.h>

void delay(int t);
void init();
unsigned int RH, RL;
unsigned int temp;

void main(void) {
    init();

    while(1) {
        ADGO=1;
		while(!ADIF);
		RH=ADRESH;
		RL=ADRESL;

		temp = RH*256 + RL;  // ��10 bit�� 0~1024

		// Y***
		TXREG=(temp/1000) + 0x30;
		while(!TRMT);
		delay(5);

		// *Y**
		TXREG=(temp/100)%10 + 0x30;
		while(!TRMT);
		delay(5);

		// **Y*
		TXREG=(temp/10)%10 + 0x30;
		while(!TRMT);
		delay(5);

		//  ***Y
		TXREG=temp%10 + 0x30;
		while(!TRMT);
		delay(5);

		// \n
		TXREG=0x0A;
		while(!TRMT);
		delay(5);

		delay(400);
    }
}

void init() {
	// IO_configure
    TRISC6 = 0;
    TRISC7 = 1;

	// USART_configure
    TXSTA = 0b00100100;
    RCSTA = 0b10010000;
    SPBRG = 25;
    INTCON = 0x00;

	// AD_configure
	TRISA0=1;        //RA0 as AD input
	ADCON1=0x8E;     
	ADCON0=0x41;
	ADIF=0;
}


void delay(int t) {
    int i, j;
    for(i=t; i>0; i--) {
        for(j=0; j<100; j++);
    }
}

