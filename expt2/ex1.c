#include <pic.h>     //����ͷ�ļ�
 __CONFIG(XT&WDTDIS&LVPDIS);     
 //����������
//����: int const d=0B000000001;
    
 //����������
//����: ������		 
void main(void)
{	
     TRISE=TRISE&(~(0x01<<4));       // TRISE[4]=0, ��PSPMODE=0��D�˿ڹ���ģʽΪ����
     ADCON1=(ADCON1&0xf0 )|0x07;     // ADCON1[3:0] = 0111, ��RA0~RA5, RE0~RE2 ��Ϊ����IO
     TRISA=TRISA&(~(0X01<<1));       // TRISA[1] = 0, RA1���
     TRISA=TRISA&(~(0X02<<1));       // TRISA[2] = 0, RA2���
     TRISD=0X00;                     // TRISD[7:0] = 00000000, RDȫ���
     TRISB=TRISB&(0X01<<2);          // TRISB[7:0] = 00000?00, ��RB2, RB����ȫ���
     PORTD=0B00000000;               // �������LED
     PORTA=0B00000110;               // ѡ����COL1, COL@, �����밴���ĵ�һ�ź͵ڶ���
     while(1){ 
         if(RB2==0) {				// ���SW1��SW5ֵΪ0��RD0����RD3��
             RD0=1; 
             RD3=0; 
                    }
         else {						// ���SW1��SW5ֵΪ1��RD3����RD1��
                RD0=0;
                RD3=1;
                      } 
     }
}  
