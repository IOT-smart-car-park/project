//! ============================
//! 此版本TCP 不走http方式，字串處理剩餘車位顯示在LCD上  *適用場外LED + 場內分區LED + LCD_SHOW
//! ============================

#include <Nano100Series.h>
#include <stdio.h>
#include <string.h>

// Setting AP
char *SERVERIP = "192.168.0.100";
char *PORT = "8000";

#define SSID "HUAWEI-610M8I"
#define PASSWD "12345678"

void lcd_init(void);
void lcd_print(uint8_t pos, char *s);
void wifi_callback(char *rbuf);
void lcd_cmd(uint8_t c);
void lcd_show(void);
void lcd_put(uint8_t c);

char day[4];
char mon[4];
char date[3];
char watch[12];
char year[5];

void init_HCLK(void){
	SYS_UnlockReg(); 
	CLK_EnableXtalRC(CLK_PWRCTL_HXT_EN_Msk);
	CLK_WaitClockReady( CLK_CLKSTATUS_HXT_STB_Msk); 
	CLK_SetHCLK(CLK_CLKSEL0_HCLK_S_HXT,CLK_HCLK_CLK_DIVIDER(1)); 
	SYS_LockReg();
}

volatile uint32_t tick=0;
void SysTick_Handler(void){
	tick++;
};

void init_systick(void){
	SysTick_Config( SystemCoreClock /1000);
}

void delay_ms(uint32_t ms){
	ms += tick;
	while( ms != tick){}
}

//  UART 0
void init_UART0(uint32_t bps){
	SYS_UnlockReg();
	//--- CLK
	CLK_EnableModuleClock(UART0_MODULE);
	CLK_SetModuleClock(UART0_MODULE, CLK_CLKSEL1_UART_S_HXT,CLK_UART_CLK_DIVIDER(1));
	//--- PIN
	SYS->PB_L_MFP = (SYS->PB_L_MFP &~ SYS_PB_L_MFP_PB0_MFP_Msk) |SYS_PB_L_MFP_PB0_MFP_UART0_RX;
	SYS->PB_L_MFP = (SYS->PB_L_MFP &~ SYS_PB_L_MFP_PB1_MFP_Msk) |SYS_PB_L_MFP_PB1_MFP_UART0_TX;
	SYS_LockReg();
	//--- OPEN
	UART_Open(UART0, bps);
	//--- NVIC 
	UART_ENABLE_INT(UART0, UART_IER_RDA_IE_Msk);
	NVIC_EnableIRQ(UART0_IRQn);
}
//  IRQ
void UART0_IRQHandler(void){
	UART1->THR = UART0->RBR;  
}

//  UART 1
void init_UART1(uint32_t bps){
	SYS_UnlockReg();
	//--- CLK
	CLK_EnableModuleClock(UART1_MODULE);
	CLK_SetModuleClock( UART1_MODULE, CLK_CLKSEL1_UART_S_HXT, CLK_UART_CLK_DIVIDER(1) );
	//--- PIN
	SYS->PB_L_MFP = (SYS->PB_L_MFP &~ SYS_PB_L_MFP_PB4_MFP_Msk) | SYS_PB_L_MFP_PB4_MFP_UART1_RX;
	SYS->PB_L_MFP = (SYS->PB_L_MFP &~ SYS_PB_L_MFP_PB5_MFP_Msk) | SYS_PB_L_MFP_PB5_MFP_UART1_TX;
	SYS_LockReg();
	//--- OPEN
	UART_Open(UART1, bps);
	//--- NVIC 
	UART_ENABLE_INT(UART1, UART_IER_RDA_IE_Msk);
	NVIC_EnableIRQ(UART1_IRQn);
}
// IRQ
uint16_t ri=0;
char rbuf[1024] = "";
void UART1_IRQHandler(void){
	//UART0->THR = UART1->RBR;  
	uint8_t r;
	r = UART1->RBR;
	UART0->THR = r;
	rbuf[ri++] = r;
	if(r=='\n'){
		ri=0;
		wifi_callback(rbuf);
	}
}

typedef struct{
	int num;
	char area_A[20];
	char area_B[20];
	char left_car[20];
}_TPREQ;

_TPREQ req;
uint8_t REQF = 0;
uint8_t ERRF = 0;

void wifi_callback(char *rbuf){
	uint8_t r;
	r = sscanf(rbuf,"+IPD,%d:A%s B%s C%s", &req.num, req.area_A, req.area_B, req.left_car);
	if(r==4) {REQF=1;}
	if(r!=4) {ERRF=0;}
}

void lcd_show(void){
	int i;
	// Part. 1
	lcd_print(0x00, "   #It's time   ");
	delay_ms(1000);
	lcd_print(0x40, "#Don't hold back");
	delay_ms(1000);
	for(i=0;i<5;i++){
		lcd_cmd(0x08);  // off
		delay_ms(500);
		lcd_cmd(0x0C); // on
		delay_ms(500);
	}
	lcd_print(0x00, "                ");
	lcd_print(0x40, "                "); 
	
	// Part. 2
	lcd_print(0x00, " Are you ready? ");
	delay_ms(1000);
	for(i = 0; i <= 15; i ++){
		lcd_print(0x40+i,"YES"); delay_ms(200);
		lcd_print(0x40,"                ");
	}
	delay_ms(3000);
	
	// Part. 3
	lcd_cmd(0x01);
	
	lcd_cmd(0x80); 
	lcd_put(' '); 	delay_ms(300);
	lcd_put('A'); 	delay_ms(300);
	lcd_put('I'); 	delay_ms(300);
	lcd_put('o'); 	delay_ms(300);
	lcd_put('T'); 	delay_ms(300);
	lcd_put(' '); 	delay_ms(300);
	lcd_put('P'); 	delay_ms(300);
	lcd_put('a'); 	delay_ms(300);
	lcd_put('r'); 	delay_ms(300);
	lcd_put('k'); 	delay_ms(300);
	lcd_put('i'); 	delay_ms(300);
	lcd_put('n'); 	delay_ms(300);
	lcd_put('g'); 	delay_ms(300);
	lcd_put(' '); 	delay_ms(300);
	lcd_put('L'); 	delay_ms(300);
	lcd_put('o'); 	delay_ms(300);
	lcd_put('t'); 	delay_ms(2000);
	
	lcd_cmd(0xc0);
	lcd_put('B'); 	delay_ms(300);
	lcd_put('e'); 	delay_ms(300);
	lcd_put('s'); 	delay_ms(300);
	lcd_put('t'); 	delay_ms(300);
	lcd_put(' '); 	delay_ms(300);
	lcd_put('1'); 	delay_ms(300);
	lcd_put(' '); 	delay_ms(300);
	lcd_put('T'); 	delay_ms(300);
	lcd_put('h'); 	delay_ms(300);
	lcd_put('e'); 	delay_ms(300);
	lcd_put(' '); 	delay_ms(300);
	lcd_put('W'); 	delay_ms(300);
	lcd_put('o'); 	delay_ms(300);
	lcd_put('r'); 	delay_ms(300);
	lcd_put('l'); 	delay_ms(300);
	lcd_put('d'); 	delay_ms(2000);
	
	for(i=0;i<3;i++){
		lcd_cmd(0x08);  // off
		delay_ms(500);
		lcd_cmd(0x0C); // on
		delay_ms(500);
	}
	delay_ms(2000);
	
	
	// Part. 4
	lcd_print(0x00, "                ");
	lcd_print(0x40, "                ");
	
	lcd_print(0x00, "Chrome Dino Game"); 
	lcd_cmd(0xc0); //Set DDRAM address
	lcd_put(0xff); //display wall 
	lcd_cmd(0xc0+15); //Set DDRAM address
	lcd_put(0xff); //display wall 
	lcd_cmd(0xc0+2); //Set DDRAM address
	lcd_put(0x03); //display dinosaur
	lcd_cmd(0xc0+5); //Set DDRAM address
	lcd_put(0x04); //display tree
	
	delay_ms(2000);
	
	for(i=0;i<8;i++){
		lcd_cmd(0x08);  // off
		delay_ms(200);
		lcd_cmd(0x0C); // on
		delay_ms(200);
	}

	lcd_print(0x00, "                ");	delay_ms(500);
	lcd_print(0x01, "Ready?");	delay_ms(1000);
	lcd_print(0x09, "Start!");	delay_ms(500);

	for(i=0;i<8;i++){
		lcd_cmd(0x08);  // off
		delay_ms(200);
		lcd_cmd(0x0C); // on
		delay_ms(200);
	}

	// Part. 5
	lcd_print(0x00, "                "); // Game Start

	lcd_cmd(0xc0+5); //Set DDRAM address
	lcd_put(' '); //clear tree
	
	lcd_cmd(0x80+13); 
	lcd_put('3'); 
	lcd_cmd(0x80+14); //Set DDRAM address
	lcd_put(0x05); //display heart

	lcd_cmd(0x80+12); //Set DDRAM address
	lcd_put(0x06); //display up_arrow
	
	for(i = 0; i < 13; i ++){
		lcd_cmd(0xc0+13-i); //Set DDRAM address
		lcd_put(0x04); //display tree
		lcd_put(' ');  //clear tree
		delay_ms(200);
	
		if(i==10){
			lcd_cmd(0xc0+2); //Set DDRAM address
			lcd_put(' '); //clear dinosaur
			lcd_cmd(0x80+2); //Set DDRAM address
			lcd_put(0x03); //display dinosaur jump
			
			lcd_cmd(0xc0+3); //Set DDRAM address
			lcd_put(0x04); //display tree
			lcd_cmd(0xc0+3); //Set DDRAM address
			lcd_put(' '); //clear tree
			delay_ms(200);
			lcd_cmd(0xc0+2); //Set DDRAM address
			lcd_put(0x04); //display tree
			lcd_cmd(0xc0+2); //Set DDRAM address
			lcd_put(' '); //clear tree
			delay_ms(200);
			++i;
			++i;
				if(i==12){
				lcd_cmd(0xc0+2); //Set DDRAM address
				lcd_put(' '); //clear tree
				lcd_cmd(0xc0+1); //Set DDRAM address
				lcd_put(0x04); //display tree
				delay_ms(200);
				lcd_cmd(0x80+2); //Set DDRAM address
				lcd_put(' '); //clear dinosaur
				lcd_cmd(0xc0+2); //Set DDRAM address
				lcd_put(0x03); //display dinosaur
				delay_ms(200);
				}
		}
	}
	
	lcd_print(0x02, "You PASS"); // Game Start
	
	/*
	lcd_cmd(0xc0+10); //Set DDRAM address
	lcd_put(0x07); //display STOP sign
	lcd_cmd(0xc0+11); 
	lcd_put('S');
	lcd_cmd(0xc0+12); 
	lcd_put('T');
	lcd_cmd(0xc0+13); 
	lcd_put('O');
	lcd_cmd(0xc0+14); 
	lcd_put('P');
	*/
	delay_ms(2000);
}

// ---------------------------------------------
//  main
// ---------------------------------------------
int main(void){
	int i;
	init_HCLK();
	init_systick();
	init_UART0(115200);
	init_UART1(115200);
	GPIO_SetMode(PA, BIT12, GPIO_PMD_OUTPUT);
	/*while(1){
		PA12=1; delay_ms(500);  //debug LED
		PA12=0; delay_ms(500);
	}*/
	
	lcd_init();
	
	lcd_print(0x00,"AIoT Parking Lot");
	delay_ms(2000);
	lcd_print(0x40,"Welcome, come in");
	delay_ms(2000);
	printf("AT\r\n");  //test
	delay_ms(2000);
	lcd_print(0x00," NTD$20 / Hours ");
	printf("AT+RST\r\n");  //reboot
	delay_ms(2000);
	printf("AT+CWMODE=1\r\n");  //Station MODE
	delay_ms(2000);
	printf("AT+CIPMUX=0\r\n");  //one connection mode
	delay_ms(2000);
	printf("AT+CWJAP=\"%s\",\"%s\"\r\n",SSID,PASSWD);
	delay_ms(6000);
	printf("AT+CIFSR\r\n");
	delay_ms(5000);

	lcd_show();  //lcd_show()

	while(1){
	printf("AT+CIPSTART=\"TCP\",\"%s\",%s\r\n",SERVERIP,PORT);  // TCP connect
	delay_ms(5000);
		
		while(REQF==1)   
		{
		char c2[20];
		REQF=0; 
		lcd_cmd(0x01);
		lcd_print(0x00,"    2021  04  23 ");
		lcd_print(0x40,"How is your day!");
			
		lcd_cmd(0x80+5); //Set DDRAM address
		lcd_put(0x00); //display year
		
		lcd_cmd(0x80+9); //Set DDRAM address
		lcd_put(0x01); //display month
		
		lcd_cmd(0x80+13); //Set DDRAM address
		lcd_put(0x02); //display date
			
		delay_ms(5000);
			
			
		sprintf(c2,"Avaliable : %s",req.left_car);  //! argument can change to : req.left_car  / req.area_A  /  req.area_B
		lcd_print(0x00,"                ");
		lcd_print(0x00," NTD$20 / Hours ");
		lcd_print(0x40,"                ");
		lcd_print(0x40,c2); 	
		lcd_cmd(0xc0+15); //Set DDRAM address
		lcd_put(0x05); //display heart
		delay_ms(5000);

			for(i=0;i<5;i++){
				lcd_cmd(0x08);  // off
				delay_ms(500);
				lcd_cmd(0x0C); // on
				delay_ms(500);
			}

		/* space A + space B left car

			sprintf(c2,"Space Area A : %s",req.area_A);  
			lcd_print(0x00,"                ");
			lcd_print(0x00,c2);
			lcd_print(0x40,"                ");
			lcd_print(0x41,"Follow me");

			lcd_cmd(0xc0+12); //Set DDRAM address
			lcd_put(0x06); //display up_arrow
			lcd_cmd(0xc0+13); //Set DDRAM address
			lcd_put(0x06); //display up_arrow
			lcd_cmd(0xc0+14); //Set DDRAM address
			lcd_put(0x06); //display up_arrow
			delay_ms(5000);

		*/

		}
	}
}
