#include<pic.h>   //����ͷ�ļ���
//__CONFIG(FOSC_XT&WDTE_ON&WDTE_OFF&LVP_ON&LVP_OFF); //���������֣�
#define uint8 unsigned char
void Delay(unsigned int delay);   //������ʱ������
void Delay1(unsigned int delay);  //������ʱ������
void main()                   //��������
{
   ADCON1=(ADCON1&0xf0)|0x07;  //����ADCON1����λΪ0111��
                                //��A�ڻ�E����Ϊ��ͨI/O��ʹ�ã�
   TRISB0=1;     //��ʼ��I/O�ڣ���RB0����Ϊ���룻
   TRISD=0x00;   //��RDȫ������Ϊ�����
   TRISA=TRISA&(~(0x01<<1));   //��RA1����Ϊ�����
   INTEDG=1;    //��INTEDG=1ʱ��RB0/INT���������ش�����
                //��INTEDG=0ʱ��RB0/INT�����½��ش�����
   INTE=1;      //ʹ���ⲿ�����жϣ������ⲿ�����ж�����
   INTF=0;      //�����־λ��δ�����ⲿ�����жϣ�
   GIE=1;       //ʹ�����жϣ����������ж�Դ���ж�����
   RA1=1;       //ѡ���һ��LED�ƣ���ѡͨ���ܵĵ�һλ��
   while(1){      //ִ��while���
       unsigned char i=0;  //�����޷��ű���i��i=0��
       for(i=0; i<8; i++)    //forѭ����䣬i<8ʱ�Լ�1����������ѭ��
        {
           PORTD=(0x01<<i);   //��PORTD�ĵ�iλ����Ϊ�ߵ�ƽ
           Delay(3000);       //������ʱ����Ϊ3000
        }
   } 
}

void interrupt PIC_Int(void)     // ��ʼ�жϷ������
{
 uint8 i;                     //�������i
 if (INTF)                    //RB0��ƽ�仯�����ж�
 {
    PORTD=0x00;             //�������LED
    for(i=0; i<10; i++)          // forѭ����䣬i<10ʱ�Լ�1����������ѭ��
        {
           PORTD=~PORTD;    //��������LED
           Delay1(150);       //����Delay1��ʱ������������ʱ����Ϊ150
        } 
        INTF=0;              // �����־λ
 }
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
