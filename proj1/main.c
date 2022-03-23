#include "stm8s.h"
#include "milis.h"
#include "spse_stm8.h"
#include "stm8_hd44780.h"
#include "stdio.h"



uint16_t last_time=0,cas=0,volt=0,volt1=0;//ulo�eni �asu, ulo�en� sekund
uint16_t x=0,y=0,a=0,b=0;//pomocn� prom�n� na stisky tla��tek
uint8_t start=1,ulozeni_mezicas=0,uloz_mezcas=0;
uint8_t mezcas[5];
uint8_t text[32];

void ADC_init(void);

void main(void){
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z intern�ho RC oscil�toru

init_milis(); 
lcd_init();
ADC_init();

GPIO_Init(GPIOE, GPIO_PIN_4,GPIO_MODE_IN_FL_NO_IT);//start stop
GPIO_Init(GPIOG, GPIO_PIN_5,GPIO_MODE_IN_PU_NO_IT);
GPIO_Init(GPIOG, GPIO_PIN_4,GPIO_MODE_IN_PU_NO_IT);
GPIO_Init(GPIOB, GPIO_PIN_2,GPIO_MODE_IN_PU_NO_IT);//ADC p�evod

	
	while (1){
	if(milis() - last_time>= 1000 && start==1){
			last_time=milis();
			volt=(x*50)/1024;
			y=volt;
			volt1=volt/10;
			volt=volt%10;
			
		  sprintf(text,"%01u",volt1);
			lcd_gotoxy(0,0);
			lcd_puts(text);
			sprintf(text,"%01u",volt);
			lcd_gotoxy(1,0);
			lcd_puts(text);

		}
		x = ADC_get(ADC2_CHANNEL_2);
		
	}	
}

void ADC_init(void){
// na pinech/vstupech ADC_IN2 (PB2) a ADC_IN3 (PB3) vypneme vstupn� buffer
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL2,DISABLE);
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL3,DISABLE);
// nastav�me clock pro ADC (16MHz / 4 = 4MHz)
ADC2_PrescalerConfig(ADC2_PRESSEL_FCPU_D4);
// vol�me zarovn�n� v�sledku (typicky vpravo, jen vyjme�n� je v�hodn� vlevo)
ADC2_AlignConfig(ADC2_ALIGN_RIGHT);
// nasatv�me multiplexer na n�kter� ze vstupn�ch kan�l�
ADC2_Select_Channel(ADC2_CHANNEL_2);
// rozb�hneme AD p�evodn�k
ADC2_Cmd(ENABLE);
// po�k�me ne� se AD p�evodn�k rozb�hne (~7us)
ADC2_Startup_Wait();
}

		
// pod t�mto koment��em nic nem��te 
#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif