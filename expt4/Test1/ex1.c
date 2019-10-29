#include <pic.h>
// __CONFIG(XT&WDTDIS&LVPDIS);


#define CONST_T 0xD9;

void delay_10ms (unsigned int n);

void main() {
	TRISC1 = 0;

	while(1) {

		RC1 = 0;			// �ط�����
		delay_10ms(25); 	// 900ms
		RC1 = 1;			// ��������
		delay_10ms(25);		// 100ms
		RC1 = 0;			// �ط�����
		delay_10ms(25); 	// 900ms
		RC1 = 1;			// ��������
		delay_10ms(25);		// 100ms

	}

}

void delay_10ms (unsigned int n) {
	unsigned int i;
	OPTION = 0x07;
	T0IF = 0;

	for (i=0; i<n; i++) {
		TMR0 = CONST_T;
		while(!T0IF);
		T0IF = 0;
	}
}