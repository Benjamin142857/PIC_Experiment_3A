#include<pic.h>
#define uint8 unsigned char

void Delay(unsigned int delay);   //������ʱ������
void Delay1(unsigned int delay);  //������ʱ������
const unsigned char LED[10]=
{
	0x3f,     //0
	0x06,     //1
	0x5b,	  //2
	0x4f,	  //3
	0x66,	  //4
	0x6d,	  //5
	0x7d,	  //6
	0x07,	  //7
	0x7f,	  //8
	0x6f,	  //9
};

void main() {
	ADCON1 = (ADCON1&0b11110000)|0b00000111;  		// ����ADCON1����λΪ0111����A�ڻ�E����Ϊȫ������ͨI/O��ʹ�ã�
	TRISB = (TRISB&0b11011110)|0b00100001;     		// RB0(SW0), RB5(SW3) ����
	TRISD = 0x00;   								// RD0~RD7(LED)��ȫ���
	TRISA = TRISA&0b11011101;   					// RA1(COL1,�ŵ�1��������һ��LED),RA5(COL4,�ŵ�4���������ĸ�LED)������Ϊ�����

	
	INTEDG = 1;    	// SW0 �ж������ش���
	RBIE = 1;		// SW3 �仯�ж�ʹ��
	RBIF = 0;		// SW3 �仯�жϱ�־���
	INTE = 1;      	// SW0 �仯�ж�ʹ��
    INTF = 0;      	// SW0 �仯�жϱ�־�����
    GIE = 1;       	// ʹ�����ж�
	RA1 = 1;		// RA1(COL1,�ŵ�)��ʹ��
    RA5 = 0;       	// RA5(COL4,�������ĸ�LED)���أ�

	while(1){      	//ִ��while���
	    unsigned int i;
	    for(i=0; i<8; i++)    //forѭ����䣬i<8ʱ�Լ�1����������ѭ��
	     {
	        PORTD=(0x01<<i);   //��PORTD�ĵ�iλ����Ϊ�ߵ�ƽ
	        Delay(1000);       //������ʱ����Ϊ3000
	     }
	} 
}


void interrupt PIC_Int(void) {
	unsigned int i;

	// SW0�����ж�
	if(INTF) {
		PORTD=0x00;             //�������LED
		
		for(i=0; i<10; i++)          // forѭ����䣬i<10ʱ�Լ�1����������ѭ��
		    {
		       PORTD=~PORTD;    //��������LED
		       Delay1(150);       //����Delay1��ʱ������������ʱ����Ϊ150
		    } 
		
	}
	// SW3�����ж�
	else if(RBIF && !RB5) {
		PORTD=0x00;             //�������LED
		RA1 = 0;				// RA1(COL1,�ŵ�)����
   		RA5 = 1;       			// RA5(COL4,�������ĸ�LED)��ʹ�ܣ�

		for(i=0; i<6; i++) {
			PORTD = LED[5-i];
			Delay1(300);
		} 
		PORTD=0x00;             //�������LED
		RA1 = 1;				// RA1(COL1,�ŵ�)��ʹ��
   		RA5 = 0;       			// RA5(COL4,�������ĸ�LED)���أ�
		
		
	} 
	INTF = 0;
	RBIF = 0;
}


void Delay (unsigned int delay)     //������ʱ����Delay
{
	unsigned int i;                //�����޷������ͱ���i
		for (;delay>0; delay--)       // forѭ����䣬delay>0ʱ�Լ�1����������ѭ��
		for (i=0; i<45; i++);         // forѭ����䣬i<10ʱ�Լ�1����������ѭ��

}
 void Delay1 (unsigned int delay)     //������ʱ����Delay1
{
	unsigned int i;     //�����޷������ͱ���i
		for (;delay>0; delay--)   // forѭ����䣬delay>0ʱ�Լ�1����������ѭ��
		for (i=0; i<45; i++);    // forѭ����䣬i<10ʱ�Լ�1����������ѭ��
}
