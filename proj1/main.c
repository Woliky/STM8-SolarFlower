#include "stm8s.h"
#include "milis.h"
#include "stm8_hd44780.h"	//knihovna LCD
#include "stdio.h"		
#include "spse_stm8.h"		//knihovno ADC
#include "emoji.h"				//knihovna znakù

#define stav_display 1
#define stav_menu 2
#define stav_manual 3

void process_enc(void);
void servo_manual(void);
void servo_auto(void);
void voltage(void);
void blick_bat(void);
void tlacitko(void);
void init_pwm(void);
void ADC_init(void);

uint16_t last_time=0,volt_time=0,foto_time=0;
uint16_t minule=1,last=1,x=70,y=0,volt1=0,prevod=0;
uint8_t stav=1,bat1=1,bat2=1,lcd_sloupec=0,pointer=0,kontrola=0,run=1,turn=0;
uint16_t volt=0,a=0;
volatile int16_t encoder=0;
char text[24];


void main(void){
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z interního RC oscilátoru

init_milis(); // milis kvuli delay_ms()
lcd_init();		// inicializace displeje
init_pwm();		//inicializace PWM
ADC_init();		//inicializace ADC

//inicializace vstupù
GPIO_Init(GPIOB,GPIO_PIN_0,GPIO_MODE_IN_PU_NO_IT);//tlaèítko
GPIO_Init(GPIOB,GPIO_PIN_2,GPIO_MODE_IN_PU_NO_IT);//encoder kanál 1
GPIO_Init(GPIOB,GPIO_PIN_3,GPIO_MODE_IN_PU_NO_IT);//encoder kanál 2
GPIO_Init(GPIOB,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);//fotorezistor L ADC
GPIO_Init(GPIOB,GPIO_PIN_7,GPIO_MODE_IN_PU_NO_IT);//fotorezistor R ADC

//Uložení custom symbolù do RAM
lcd_store_symbol(0,time);
lcd_store_symbol(3,battery);
lcd_store_symbol(1,battery_low);
lcd_store_symbol(2,battery_low1);
lcd_store_symbol(4,battery_full1);
lcd_store_symbol(5,battery_full);
lcd_store_symbol(6,cross);
lcd_store_symbol(7,point);

lcd_clear();


  while (1){
		switch(stav){
			//stav-Zobrazování hodnot na display
			case stav_display:
				voltage();
				//první slot pro baterii
				if(bat1 == 0){
					sprintf(text,"%s","chybi baterie");
					lcd_gotoxy(3,0); 
					lcd_puts(text);
					
					lcd_gotoxy(1,0); 
					lcd_putchar(6);
					lcd_gotoxy(0,0); 
					lcd_putchar(1);
				}else{
					lcd_sloupec=0;
					blick_bat();
					sprintf(text,"Nabito %u",y); 
					strcat(text, "%");
					lcd_gotoxy(1,0); 
					lcd_puts(text);
					
						
				}
				
				//Druhý slot pro baterii
				if(bat2 == 0){
					sprintf(text,"%s","chybi baterie");
					lcd_gotoxy(3,1); 
					lcd_puts(text);
					
					lcd_gotoxy(1,1); 
					lcd_putchar(6);
					lcd_gotoxy(0,1); 
					lcd_putchar(1);
				}else{
					lcd_sloupec=1;
					if(bat1 == 1){
						lcd_gotoxy(0,1); 
						lcd_putchar(3);
					}else{blick_bat();}
					
					sprintf(text,"Nabito %u",x); 
					strcat(text, "%");
					
					lcd_gotoxy(1,1); 
					lcd_puts(text);
				}
				tlacitko();
				break;
				
			//stav-prochazení menu	
			case stav_menu:
				process_enc();
				if(encoder <= 1){
					sprintf(text,"%s","Manual");
					lcd_gotoxy(1,0); 
					lcd_puts(text);
				
					sprintf(text,"%s","Automat");
					lcd_gotoxy(1,1); 
					lcd_puts(text);
				}
				if(encoder == 2){
					sprintf(text,"%s","Sleep");
					lcd_gotoxy(1,0); 
					lcd_puts(text);
				}
				if(encoder >= 3 ){
					encoder=2;
				}
				lcd_gotoxy(0,encoder); 
				lcd_putchar(7);
				tlacitko();
				break;
		//stav-manuální otáèení serva		
		case stav_manual:
			sprintf(text,"pozice %u",y); 
			strcat(text, "°");
			lcd_gotoxy(1,0); 
			lcd_puts(text);
			tlacitko();
			process_enc();
			servo_manual();
			break;
		}
	}
}

//funkce pro mìøení napìtí
void voltage(void){
	if(milis() - volt_time >= 1000){
			volt_time=milis();
			volt=(833*5)/1024;//hodnota jednotek volt
			volt1=(830*5)%1024/10;//hodnota setin volt
			volt=(volt*100)+volt1;//hodnota v setinách volt(100mv)
			y=(420-volt)*10/4;//dosazení do trojèlenky pro zisk procentuální hodnoty
			y=100-y;
	}
	prevod = ADC_get(ADC2_CHANNEL_4);
}

//animace blikání baterie
void blick_bat(void){
	
static uint16_t bat_icon_time=0;
static uint8_t p=0;

if(milis()-bat_icon_time >= 500 && p==0){
	lcd_gotoxy(0,lcd_sloupec); 
	lcd_putchar(1);
	bat_icon_time=milis();
	p=1;
}

if(milis()-bat_icon_time >= 500 && p==1){
	lcd_gotoxy(0,lcd_sloupec); 
	lcd_putchar(2);
	bat_icon_time=milis();
	p=2;
}

if(milis()-bat_icon_time >= 500 && p==2){
	lcd_gotoxy(0,lcd_sloupec); 
	lcd_putchar(3);
	bat_icon_time=milis();
	p=3;
}

if(milis()-bat_icon_time >= 500 && p==3){
	lcd_gotoxy(0,lcd_sloupec); 
	lcd_putchar(4);
	bat_icon_time=milis();
	p=4;
}

if(milis()-bat_icon_time >= 500 && p==4){
	lcd_gotoxy(0,lcd_sloupec); 
	lcd_putchar(5);
	bat_icon_time=milis();
	p=0;
}
}

//potvrzovací tlaèítko
void tlacitko(void){
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_0) == RESET && last==1){
		last=0;
		if(stav==1){
			stav=stav_menu;
			lcd_clear();
			kontrola=1;
		}
		if(stav==2 && encoder==0 && kontrola==0){
			stav=stav_manual;
			lcd_clear();
			kontrola=1;
		}
		if(stav==2 && encoder==1 && kontrola==0){
			stav=stav_display;
			lcd_clear();
			kontrola=1;
		}
		if(stav==3 && kontrola==0){
			stav=stav_menu;
			lcd_clear();
			kontrola=1;
		}
	}
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_0) != RESET){
	last = 1;
	kontrola=0;//pøeskoèí zbylé podmínky 
	}
}

// vyhodnocuje stav enkodéru
void process_enc(void){
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) == RESET && minule==1){
		minule = 0; 
		
		if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_3) == RESET){
			encoder++;
			run=1;
			if(stav==2){lcd_clear();}
			if(stav==3){last_time=milis();}
		}else{
			encoder--;
			run=2;
			if(stav==2){lcd_clear();}
			if(stav==3){last_time=milis();}
		}
		if(encoder < 0){encoder=0;}
	}
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) != RESET){minule = 1;} 
	}

void servo_auto(void){
uint16_t left=0,right=0;

	if(milis()- foto_time >= 100){
		left = ADC_get(ADC2_CHANNEL_6);
		right = ADC_get(ADC2_CHANNEL_7);
		
		if(right+10 > left && right-10 > left){
			turn=1;
		}
		else if(left+10 > right && left-10 > right){
			turn=2;
		}
		else{
			turn=0;
		}
	}
	if(turn==1){
		TIM2_SetCompare1(1430); 
	}
	if(turn==2){
		TIM2_SetCompare1(1551); 
	}
	if(turn==0){
		TIM2_SetCompare1(0); 
	}
}

//funkce pro manuální natoèení serva
void servo_manual(void){
	if(run==1){
		TIM2_SetCompare1(1430);
	}
	if(run==2){
		TIM2_SetCompare1(1551);
	}
	if(milis() - last_time >= 25){
			run=0;
			TIM2_SetCompare1(0);
	}
}

//funkce pro nastavení PWM
void init_pwm(void){
TIM2_TimeBaseInit(TIM2_PRESCALER_16,19999);

TIM2_OC1Init( 	
	TIM2_OCMODE_PWM1, 				
	TIM2_OUTPUTSTATE_ENABLE,	
	0,		
	TIM2_OCPOLARITY_HIGH			
	);
	
TIM2_OC1PreloadConfig(ENABLE);
TIM2_Cmd(ENABLE);
}

//funkce pro nastavení ADC pøevodníku
void ADC_init(void){
//  ADC_IN2 (PB4) a ADC_IN3 (PB5) 
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL6,DISABLE);
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL7,DISABLE);
ADC2_PrescalerConfig(ADC2_PRESSEL_FCPU_D4);
ADC2_AlignConfig(ADC2_ALIGN_RIGHT);
ADC2_Select_Channel(ADC2_CHANNEL_6);
ADC2_Cmd(ENABLE);
ADC2_Startup_Wait();
}

// pod tímto komentáøem nic nemìòte 
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