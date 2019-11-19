#include <pic.h>
unsigned char GetKeyValue(void);
void delay(int t);
void ShowNumber(int n);
void init(void);

void main(void) {
    unsigned char RH, RL;
    TRISD = 0x00;
    init();
    TRISA1 = 0;
    TRISA2 = 0;
    RA2 = 1;
    PORTD = 0x12;       // 0001_0010
    RH = 0;
    RL = 0;

    while(1) {
        ADGO = ();
        while(!ADIF);
        RH = ADRESH;
        RL = ADRESL;
        RA1 = 1;
        RA2 = 0;
        PORTD = RL;
        delay()
    }
}