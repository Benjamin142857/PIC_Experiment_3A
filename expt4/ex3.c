#include<pic.h>
void main(){
	ADCON1=(ADCON1&0xf0)|0x07;				// ADCON1����λΪ0111��RAΪ����IO
	TRISD=0x00;								// D�˿�����Ϊ���
	TRISA=TRISA&(~(0x01<<1));				// RA1����Ϊ���
	TRISA4=1;								// RA4����Ϊ���룬��������
	RA1=1;									// RA1��Ϊ�ߵ�ƽ��ѡ�а�����ͨ�����߰Ѱ����źŴ���RA4
	OPTION_REG=0B00101000;					// �����ڼ�����ģʽ����Ƶȡ2
	T0IF=0;									// �����־λ
	TMR0=0x00;
	// PORTD = 0x00;								//TMR0��ʼֵΪ0
	while(1){
		PORTD=TMR0;							// �������ʾ�����˼���
	}
}