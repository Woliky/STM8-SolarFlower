// Mikroservo se polohuje pulzem ���ky 1-2ms s opakovac� frekvenc� p�ibli�n� 50Hz

#include "stm8s.h"
#include "milis.h"
#include "spse_stm8.h"
#include "stm8_hd44780.h"
#include "stdio.h"


#define base_position 1000;

void init_pwm(void);
void servo(void);
void ADC_init(void);
void lcd(void);


uint16_t pulse=0,Q0=0,Q1=0,Q2=0,Q3=0,Left=0,Right=0,stop=1000; // v�choz� ���ka pulzu
uint16_t time_servo=0,last_time=0,volt=0,volt1=0;//ulo�eni �asu
uint8_t x=0,b=0,y=0;//pomocn� prom�n� 
uint8_t text[32];


void main(void){
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z intern�ho RC oscil�toru

init_milis(); 
init_pwm(); 
ADC_init();

GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);//PWM
GPIO_Init(GPIOB, GPIO_PIN_0,GPIO_MODE_IN_PU_NO_IT);//ADC p�evod
GPIO_Init(GPIOB, GPIO_PIN_1,GPIO_MODE_IN_PU_NO_IT);//ADC p�evod
GPIO_Init(GPIOB, GPIO_PIN_2,GPIO_MODE_IN_PU_NO_IT);//ADC p�evod
GPIO_Init(GPIOB, GPIO_PIN_3,GPIO_MODE_IN_PU_NO_IT);//ADC p�evod

  while (1){
  	servo();
  }
}


//zm�na DCL/st��dy
void servo(void){
	
	if(Left == Right){
			TIM2_SetCompare1(stop); 
	}
	if(milis() - time_servo >=5){ 
		time_servo = milis();
		
		Q0 = ADC_get(ADC2_CHANNEL_0);
		Q1 = ADC_get(ADC2_CHANNEL_1);
		Q2 = ADC_get(ADC2_CHANNEL_2);
		Q3 = ADC_get(ADC2_CHANNEL_3);
		Right=Q0+Q1;
		Left=Q2+Q3;
		
		if(Left > (Right+10) && stop >= 800){
			stop--;
			TIM2_SetCompare1(stop);
		}
		
		if((Left+10) < Right && stop <= 2800){
			stop++;
			TIM2_SetCompare1(stop); 
			
		}
		
	
	}		
}


void init_pwm(void){

// Inicializujeme �asovou z�kladnu s clockem do �sova�e na 1MHz (T=1us) a s frekvenc� p�ete�en� 50Hz. 
// ���ku v�stupn�ho pulzu lad�me v rozsahu 999 a� 1999 (1ms a� 2ms) s krokem 1ms (tedy 0.1% z 1ms rozsahu)
TIM2_TimeBaseInit(TIM2_PRESCALER_16,19999);

TIM2_OC1Init( 	// inicializujeme kan�l 1 (TM2_CH1)
	TIM2_OCMODE_PWM1, 				// re�im PWM1
	TIM2_OUTPUTSTATE_ENABLE,	// V�stup povolen (TIMer ovl�d� pin)
	1000,		// v�choz� hodnota ���ky pulzu je 1.5ms
	TIM2_OCPOLARITY_HIGH			// Z�t� rozsv�c�me hodnotou HIGH 
	);
	
// aktivuji na pou�it�ch kan�lech preload (zaji��uje zm�nu st��dy bez ne��douc�ch efekt�)
TIM2_OC1PreloadConfig(ENABLE);
// spust�me timer	
TIM2_Cmd(ENABLE);
}

void ADC_init(void){
// na pinech/vstupech ADC_IN2 (PB2) a ADC_IN3 (PB3) vypneme vstupn� buffer
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL0,DISABLE);
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL1,DISABLE);
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