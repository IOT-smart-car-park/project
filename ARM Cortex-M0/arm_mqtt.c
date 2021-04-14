//! ============================
//! 裸機MCU使用 ESP8266 + MQTT
//! ============================

#include <Nano100Series.h>
#include <stdio.h>
#include <string.h>

char *SERVERIP = "220.132.124.155";
char *PORT = "1883";

#define SSID "xxxxxxxx"
#define PASSWD "xxxxxxxx"

void lcd_init(void);
void lcd_print(uint8_t pos, char *s);
void wifi_callback(char *rbuf);
void lcd_cmd(uint8_t c);
void lcd_show(void);
void lcd_put(uint8_t c);

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
	uint16_t r;
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

//!========================  MQTT PACKET  ==============================
unsigned char connect[] = {0x10,0x25,0x00,0x06,0x4d,0x51,0x49,0x73,0x64,0x70,0x03,0x02,0x00,0x78,0x00,0x17,0x6d,0x71,0x74,0x74,0x6a,0x73,0x5f,0x61,0x61,0x33,0x39,0x63,0x36,0x39,0x30,0x63,0x63,0x32,0x38,0x35,0x62,0x36,0x38};
unsigned char subscribe[] = {0x82,0x08,0xb9,0xc5,0x00,0x03,0x6d,0x63,0x75,0x00};
	
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


	printf("AT+CIPSTART=\"TCP\",\"%s\",%s\r\n",SERVERIP,PORT);  // TCP connect
	delay_ms(5000);
	//printf("AT+CIPMODE=1\r\n");
	//delay_ms(5000);
	
	//!========================  MQTT CONNECT  ==============================
	printf("AT+CIPSEND=%d\r\n",sizeof(connect));
	delay_ms(5000);
	for(i=0;i<sizeof(connect);i++)
	{
		printf("%c",connect[i]);   //  send MQTT CONNECT !!!!!!!
	}
	delay_ms(5000);
	//!======================================================================
	
	//!========================  MQTT SUBSCRIBE  ============================
	printf("AT+CIPSEND=%d\r\n",sizeof(subscribe));
	delay_ms(5000);
	for(i=0;i<sizeof(subscribe);i++)
	{
		printf("%c",subscribe[i]);
	}
	delay_ms(5000);
	//!======================================================================
	
}
