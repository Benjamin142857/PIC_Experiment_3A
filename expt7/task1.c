#include <pic.h>

void delay(int t);
void init_USART();

void main(void) {
    init_USART();
    while(1) {
        TXREG = ;
        while(!TRMT);
        delay(10);
    }
}

void init_USART() {
    TRISC6 = 0;
    TRISC7 = 1;
    TXSTA = ;
    RCSTA = ;
    SPBRG = ;
    INTCON = 0x00;
}

void delay(int t) {
    int i, j;
    for(i=t; i>0; i--) {
        for(j=0; j<100; j++);
    }
}

