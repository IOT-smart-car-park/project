#include <bcm2835.h>
#include <stdio.h>
#include "it_shield.h"




int main (void)
{
	int value=0;
	if (!bcm2835_init())
	    return -1;
	// scanf("%d",value);
   // int a=5;
     
   		

           bcm2835_gpio_fsel(PWM0,BCM2835_GPIO_FSEL_ALT5); //set gpio for PWM0
           bcm2835_pwm_set_clock(1920);   //set min frequence =19.2M/1920=0.1ms
           bcm2835_pwm_set_mode(0,1,1);   //(channel,PWM0 MSEN enable , PWM0 enable)
           bcm2835_pwm_set_range(0,200);  //set period=20ms=200*x0.1=20ms
	  	
    while (1)
    { 
		
		 
		 printf("test: %d \n", value);	
			if (value==0) {	
					// Turn it on
					for (int i = 0; i <= 20; i+=5) {
						bcm2835_pwm_set_data(0,i);  //set pulse width
						bcm2835_delay(50);
					} 

					value=1;
				
			} else if (value==1) {	
			
				// turn it off
				for (int i =20; i >= 0; i-=5) {
					bcm2835_pwm_set_data(0,i);    //set pulse width
					bcm2835_delay(50);
				}

				value=0;


			}
			
			
	    bcm2835_delay(100);  //500ms
	}
	
 
    bcm2835_close();
    return 0;
}
