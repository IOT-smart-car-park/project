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
  	lcd_cmd(0x0E);
	lcd_cmd(0x80);
	lcd_cmd(0x06);
	lcd_print(0x00, "                ");
	lcd_print(0x40, "                "); 
}
