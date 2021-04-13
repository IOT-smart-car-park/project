#include <Nano100Series.h>
#include <stdio.h>

void lcd_init(void);
void lcd_print(uint8_t pos, char *s);
void lcd_put(uint8_t c);
void lcd_cmd(uint8_t c);

static void delay(int n){
    int i;
	for (i = 0; i < n; i++)
    { }
}

void lcd_print(uint8_t pos, char *s){
    lcd_cmd(0x80|pos);
    while(*s){ lcd_put(*s++); } 
}

void lcd_put(uint8_t c){
 	PC14=0; PC15=1; 
	PD->DOUT = c;
	delay(0); PB15=1;
	delay(0); PB15=0;
	delay(500);   
}

void lcd_cmd(uint8_t c){
    PC14=0;
    PC15=0;
    PD->DOUT = c;
    delay(0);  PB15=1;
    delay(0);  PB15=0;
    delay(500);
}

void lcd_init(void){
    GPIO_SetMode(PB, BIT15, GPIO_PMD_OUTPUT);
    GPIO_SetMode(PC, BIT14+BIT15, GPIO_PMD_OUTPUT);
    GPIO_SetMode(PD, BIT0+BIT1+BIT2+BIT3+BIT4+BIT5+BIT6+BIT7, GPIO_PMD_OUTPUT);
    PB15=0;
    
    delay(1000000);

    lcd_cmd(0x38);
  	lcd_cmd(0x0C);
    lcd_cmd(0x80);
    lcd_cmd(0x06);
    lcd_print(0x00, "                ");
    lcd_print(0x40, "                "); 


    //年
    //寫入CGRAM
    lcd_cmd(CGRAM_location_1); //設定CGRAM = 0100 0000 代表CGRA第一個Pattern位址
    
    lcd_put(0x10);
    lcd_put(0x1f);
    lcd_put(0x2);
    lcd_put(0xf);
    lcd_put(0xa);
    lcd_put(0x1f);
    lcd_put(0x2);
    lcd_put(0x00);


    //月
    //寫入CGRAM
    lcd_cmd(CGRAM_location_2); 

    lcd_put(0xf);
    lcd_put(0x9);
    lcd_put(0xf);
    lcd_put(0x9);
    lcd_put(0xf);
    lcd_put(0x9);
    lcd_put(0x1b);
    lcd_put(0x00);
    

    //日
    //寫入CGRAM
    lcd_cmd(CGRAM_location_3); 

    lcd_put(0xf);
    lcd_put(0x9);
    lcd_put(0x9);
    lcd_put(0xf);
    lcd_put(0x9);
    lcd_put(0x9);
    lcd_put(0xf);
    lcd_put(0x00);
    
    //恐龍
    //寫入CGRAM
    lcd_cmd(CGRAM_location_4); 

    lcd_put(0x7);
    lcd_put(0x7);
    lcd_put(0x7);
    lcd_put(0x16);
    lcd_put(0x1f);
    lcd_put(0xa);
    lcd_put(0xa);
    lcd_put(0x00);
    
    
    //樹
    //寫入CGRAM
    lcd_cmd(CGRAM_location_5); 

    lcd_put(0x4);
    lcd_put(0x5);
    lcd_put(0x15);
    lcd_put(0x15);
    lcd_put(0x17);
    lcd_put(0x1c);
    lcd_put(0x4);
    lcd_put(0x00);
    
    //愛心
    //寫入CGRAM
    lcd_cmd(CGRAM_location_6); 

    lcd_put(0x0);
    lcd_put(0xa);
    lcd_put(0x1f);
    lcd_put(0x1f);
    lcd_put(0x1f);
    lcd_put(0xe);
    lcd_put(0x4);
    lcd_put(0x00);

    //往前箭頭
    //寫入CGRAM
    lcd_cmd(CGRAM_location_7); 

    lcd_put(0x4);
    lcd_put(0xe);
    lcd_put(0x15);
    lcd_put(0x4);
    lcd_put(0x4);
    lcd_put(0x4);
    lcd_put(0x4);
    lcd_put(0x00);
    

    //禁止通行sign
    //寫入CGRAM
    lcd_cmd(CGRAM_location_8); 

    lcd_put(0xe);
    lcd_put(0x1f);
    lcd_put(0x1f);
    lcd_put(0x11);
    lcd_put(0x1f);
    lcd_put(0x1f);
    lcd_put(0xe);
    lcd_put(0x00);
}
