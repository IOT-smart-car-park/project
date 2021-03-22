#include <Nano100Series.h>
#include <stdio.h>
#include <string.h>

// Setting AP
#define SSID "HUAWEI-610M8I"
#define PASSWD "12345678"

void lcd_init(void);
void lcd_print(uint8_t pos, char *s);
void wifi_callback(char *rbuf);

//static int CarNumber = 9999;
//static char CarString[5]={"9999"};
static char ShowCar[20]={"Avaliable:  "};

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
uint8_t U1F=0;
uint16_t ri=0;
static char rbuf[1024] = "";
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

/*
+IPD,203:HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html
Date: Fri, 19 Mar 2021 07:45:34 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Transfer-Encoding: chunked

e
left space:494
0
*/



uint8_t REQF = 0;
uint8_t ERRF = 0;
char *str;
void wifi_callback(char *rbuf){
	if((str = strstr(rbuf,"left space:")) != NULL ){
		REQF=1;
	}else{
		ERRF=1;
	}
}



// ---------------------------------------------
//  TCP Client Request Header
// ---------------------------------------------
const char request[]="GET /mcu HTTP/1.1\r\n\
Host: 192.168.88.103:8000\r\n\
Content-type: text/html\r\n\
Connetcion: keep-alive\r\n\
\r\n";


// ---------------------------------------------
//  main
// ---------------------------------------------
int main(void){
	char *rec;
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
	lcd_print(0x40,"Avaliable : 9999");
	delay_ms(2000);
	

	while(1)
	{
		lcd_print(0x00,"AIoT Parking Lot");
		printf("AT\r\n");  //test
		delay_ms(2000);
		printf("AT+RST\r\n");  //reboot
		delay_ms(2000);
		printf("AT+CWMODE=1\r\n");  //Station MODE
		delay_ms(2000);
		printf("AT+CIPMUX=0\r\n");  //one connection mode
		delay_ms(2000);
		printf("AT+CWJAP=\"%s\",\"%s\"\r\n",SSID,PASSWD);
		delay_ms(6000);
		get_staip();  //AT+CIFSR
		delay_ms(2000);
		printf("AT+CIPSTART=\"TCP\",\"192.168.3.71\",8000\r\n");  // TCP connect
		delay_ms(2000);
		printf("AT+CIPSEND=%d\r\n",sizeof(request));  //send
		delay_ms(6000);
		printf(request);
		delay_ms(8000);

		while(REQF==1)
		{
			REQF=0;
			rec = (str+1);
			strncat(ShowCar,rec,3);
			printf("99 %s",ShowCar);
			lcd_print(0x00,"                ");
			delay_ms(4000);
			lcd_print(0x00,"Welcome");
			delay_ms(4000);
			lcd_print(0x40,ShowCar);
			delay_ms(4000);
		}
	}
}

