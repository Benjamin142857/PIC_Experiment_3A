#include <pic.h>     //加载头文件
 __CONFIG(XT&WDTDIS&LVPDIS);     
 //设置配置字
//名称: int const d=0B000000001;
    
 //设置配置字
//名称: 主函数		 
void main(void)
{	
     TRISE=TRISE&(~(0x01<<4));       // TRISE[4]=0, 即PSPMODE=0，D端口工作模式为串行
     ADCON1=(ADCON1&0xf0 )|0x07;     // ADCON1[3:0] = 0111, 将RA0~RA5, RE0~RE2 改为数字IO
     TRISA=TRISA&(~(0X01<<1));       // TRISA[1] = 0, RA1输出
     TRISA=TRISA&(~(0X02<<1));       // TRISA[2] = 0, RA2输出
     TRISD=0X00;                     // TRISD[7:0] = 00000000, RD全输出
     TRISB=TRISB&(0X01<<2);          // TRISB[7:0] = 00000?00, 除RB2, RB其他全输出
     PORTD=0B00000000;               // 灭掉所有LED
     PORTA=0B00000110;               // 选择了COL1, COL@, 即灯与按键的第一排和第二排
     while(1){ 
         if(RB2==0) {				// 如果SW1或SW5值为0，RD0亮，RD3灭
             RD0=1; 
             RD3=0; 
                    }
         else {						// 如果SW1或SW5值为1，RD3亮，RD1灭
                RD0=0;
                RD3=1;
                      } 
     }
}  
