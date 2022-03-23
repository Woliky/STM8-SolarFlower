// Mikroservo se polohuje pulzem ���ky 1-2ms s opakovac� frekvenc� p�ibli�n� 50Hz

#include "stm8s.h"
#include "milis.h"
#include "spse_stm8.h"
#include "stm8_hd44780.h"
#include "stdio.h"


#define base_position 1000;

void init_pwm(void);
void servo(void);


uint16_t stop=800; 
uint16_t time_servo=0,last_time=0;//ulo�eni �asu
uint8_t x=0,b=0,y=0;//pomocn� prom�n� 
uint8_t text[32];


void main(void){
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z intern�ho RC oscil�toru

init_milis(); 
init_pwm(); 

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
	
	if(milis() - last_time >=20 && x==0){ 
		last_time	= milis();
		stop=stop+3;
		TIM2_SetCompare1(stop);
		if(stop>=2500){	
			x=1;
		}
	}
	
	if(milis() - last_time >=20 && x==1){ 
		last_time	= milis();
		stop=stop-5;
		TIM2_SetCompare1(stop);
		if(stop<=750){	
			x=0;
		}
	}
}

void init_pwm(void){
	
TIM2_TimeBaseInit(TIM2_PRESCALER_16,20000);

TIM2_OC1Init( 	// inicializujeme kan�l 1 (TM2_CH1)
	TIM2_OCMODE_PWM1, 				// re�im PWM1
	TIM2_OUTPUTSTATE_ENABLE,	// V�stup povolen (TIMer ovl�d� pin)
	800,		// v�choz� hodnota ���ky pulzu je 1.5ms
	TIM2_OCPOLARITY_HIGH			// Z�t� rozsv�c�me hodnotou HIGH 
	);
	
// aktivuji na pou�it�ch kan�lech preload (zaji��uje zm�nu st��dy bez ne��douc�ch efekt�)
TIM2_OC1PreloadConfig(ENABLE);
// spust�me timer	
TIM2_Cmd(ENABLE);
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