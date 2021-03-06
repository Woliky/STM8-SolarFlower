#include "stm8s.h"
#include "milis.h"
#include "stm8_hd44780.h"	//knihovna LCD
#include "stdio.h"		
#include "spse_stm8.h"		//knihovno ADC
#include "emoji.h"				//knihovna znak?
#include "stm8s_awu.h"
#include "stm8s_exti.h"

#define lcd_on		GPIO_WriteHigh(GPIOG, GPIO_PIN_2);
#define lcd_off 	GPIO_WriteLow(GPIOG, GPIO_PIN_2);
#define servo_on	GPIO_WriteHigh(GPIOG, GPIO_PIN_3);
#define servo_off	GPIO_WriteLow(GPIOG, GPIO_PIN_3);
#define foto1_on	GPIO_WriteHigh(GPIOD, GPIO_PIN_6);
#define foto1_off	GPIO_WriteLow(GPIOD, GPIO_PIN_6);
#define foto2_on	GPIO_WriteHigh(GPIOD, GPIO_PIN_5);
#define foto2_off	GPIO_WriteLow(GPIOD, GPIO_PIN_5);
#define bat_on		GPIO_WriteHigh(GPIOG, GPIO_PIN_7);
#define bat_off		GPIO_WriteLow(GPIOG, GPIO_PIN_7);



#define stav_display 1
#define stav_menu 2
#define stav_manual 3
#define stav_sleep 4 

#define nic 1
#define pravo 2
#define levo 3
#define presun 4

//p?eh?zet funkce
void process_enc(void);
void servo_manual(void);
void servo_auto(void);
void voltage(void);
void power(void);
void optic_gate(void);
void blick_bat(void);
void tlacitko(void);
void tlacitko_sleep(void);
void init_pwm(void);
void ADC_init(void);


uint16_t last_time=0,volt_time=0,foto_time=0,bat_time=0,wake_time=0;
uint16_t minule=1,last=1,x=0,y=0,volt1=0,prevod=0,left=0,right=0;
uint16_t volt=0,a=0,gate_prevod=0,slot=0;
uint8_t bat1=1,bat2=1,lcd_sloupec=0,pointer=0,kontrola=0,run=1,turn=0;
uint8_t stav=1,stav_servo=1,block=0,strana=0,gate=0,blokada=0,volno=0,pocitadlo=0,zakaz=0,spanek=0,podminka=0,podminka2=0,sleep=0,wake=0,last_sleep=0;

volatile int16_t encoder=0;
char text[24];

INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7){
	
  stav=1;
	lcd_on;
	servo_on;
	foto1_on;
	foto2_on;

} 

//AWU p?eru?en?
INTERRUPT_HANDLER(AWU_IRQHandler, 1){
	AWU_GetFlagStatus();
	spanek++;
	if(spanek == 5){
		sleep=1;
		stav=1;
		spanek=0;
		lcd_on;
		servo_on;
		foto1_on;
		foto2_on;
	}else{
		halt();
	}
}

void main(void){
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z intern?ho RC oscil?toru

init_milis(); // milis kvuli delay_ms()
lcd_init();		// inicializace displeje
init_pwm();		//inicializace PWM
ADC_init();		//inicializace ADC


EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
AWU_LSICalibrationConfig(110000);
AWU_Init(AWU_TIMEBASE_12S);


//inicializace vstup?
GPIO_Init(GPIOE,GPIO_PIN_6, GPIO_MODE_IN_FL_IT);//probouzec? tla??tko
GPIO_Init(GPIOB,GPIO_PIN_0,GPIO_MODE_IN_PU_NO_IT);//tla??tko
GPIO_Init(GPIOB,GPIO_PIN_1,GPIO_MODE_IN_PU_NO_IT);//optick? br?na
GPIO_Init(GPIOB,GPIO_PIN_2,GPIO_MODE_IN_PU_NO_IT);//encoder kan?l 1
GPIO_Init(GPIOB,GPIO_PIN_3,GPIO_MODE_IN_PU_NO_IT);//encoder kan?l 2
GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_IN_PU_NO_IT);//bat1
GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_IN_PU_NO_IT);//bat2
GPIO_Init(GPIOB,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);//fotorezistor L ADC
GPIO_Init(GPIOB,GPIO_PIN_7,GPIO_MODE_IN_PU_NO_IT);//fotorezistor R ADC

GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_OUT_PP_LOW_SLOW);//servo-pwm
GPIO_Init(GPIOD,GPIO_PIN_6,GPIO_MODE_OUT_PP_LOW_SLOW);//foto 1
GPIO_Init(GPIOD,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_SLOW);//foto 2
GPIO_Init(GPIOG,GPIO_PIN_2,GPIO_MODE_OUT_PP_LOW_SLOW);//lcd podsv?cen?
GPIO_Init(GPIOG,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_SLOW);//servo-nap?jen?
GPIO_Init(GPIOG,GPIO_PIN_7,GPIO_MODE_OUT_PP_LOW_SLOW);//foto 1
GPIO_Init(GPIOG,GPIO_PIN_6,GPIO_MODE_OUT_PP_LOW_SLOW);//foto 2

//Ulo?en? custom symbol? do RAM
lcd_store_symbol(0,time);
lcd_store_symbol(3,battery);
lcd_store_symbol(1,battery_low);
lcd_store_symbol(2,battery_low1);
lcd_store_symbol(4,battery_full1);
lcd_store_symbol(5,battery_full);
lcd_store_symbol(6,cross);
lcd_store_symbol(7,point);

foto1_on;
foto2_on;
lcd_on;
servo_on;
lcd_clear();
enableInterrupts();



  while (1){
		switch(stav){
			//stav-Zobrazov?n? hodnot na display
			case stav_display:
				
				if(sleep == 1){
					if(milis()- wake_time >= 1000){
						wake_time=milis();
						wake++;
						if(wake == 10){
							wake=0;
							sleep=0;
							wake_time=0;
							lcd_off;
							servo_off;
							foto1_off;
							foto2_off;
							halt();
						}
					}
				}
				
				power();
				voltage();
				//prvn? slot pro baterii
				if(slot < 600 || slot > 870){
					podminka=0;
					sprintf(text,"%s","chybi baterie");
					lcd_gotoxy(2,0); 
					lcd_puts(text);
					
					lcd_gotoxy(1,0); 
					lcd_putchar(6);
					lcd_gotoxy(0,0); 
					lcd_putchar(1);
				}
				else{
					if(podminka==0){
						lcd_clear();
						podminka=1;
					}
					lcd_sloupec=0;
					blick_bat();
					sprintf(text,"Nabito %u",y); 
					strcat(text, "%");
					lcd_gotoxy(1,0); 
					lcd_puts(text);
					
						
				}
				/*
				//Druh? slot pro baterii
				if(slot2 < 600 || slot2 > 870){
					podminka2=0;
					sprintf(text,"%s","chybi baterie");
					lcd_gotoxy(2,1); 
					lcd_puts(text);
					
					lcd_gotoxy(1,1); 
					lcd_putchar(6);
					lcd_gotoxy(0,1); 
					lcd_putchar(1);
				}
				else{
					if(podminka2==0){
						lcd_clear();
						podminka2=1;
				}
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
				*/
				tlacitko();
				optic_gate();
				break;
				
			//stav-prochazen? menu	
			case stav_menu:
				TIM2_SetCompare1(0);
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
		//stav-manu?ln? ot??en? serva		
		case stav_manual:
			sprintf(text,"%s","Nastavte pozici"); 
			lcd_gotoxy(0,0); 
			lcd_puts(text);
			sprintf(text,"%s","Stisk > exit"); 
			lcd_gotoxy(0,1); 
			lcd_puts(text);
			tlacitko();
			process_enc();
			servo_manual();
			break;
			
		case stav_sleep:
			lcd_off;
			servo_off;
			foto1_off;
			foto2_off;
			halt();
			break;
		}
	}
}

//funkce pro m??en? nap?t?
void voltage(void){
	if(milis() - volt_time >= 1000){
			volt_time=milis();
			volt=(slot*5)/1024;//hodnota jednotek volt
			volt1=(slot*5)%1024/10;//hodnota setin volt
			volt=(volt*100)+volt1;//hodnota v setin?ch volt(100mv)
			y=(420-volt);//dosazen? do troj?lenky pro zisk procentu?ln? hodnoty
			y=100-y;
			
			/*
			volt=(slot2*5)/1024;//hodnota jednotek volt
			volt1=(slot2*5)%1024/10;//hodnota setin volt
			volt=(volt*100)+volt1;//hodnota v setin?ch volt(100mv)
			x=(420-volt);//dosazen? do troj?lenky pro zisk procentu?ln? hodnoty
			x=100-x;
			*/
			
	}
}

void power(void){
	if(milis()-bat_time >= 1000){
		pocitadlo++;
		bat_time=milis();
	}
	if(pocitadlo==2){
		bat_off;
		pocitadlo=0;
		slot = ADC_get(ADC2_CHANNEL_4);
	}	
	if(slot > 600 && slot < 855){
		if(volno=0){
			lcd_clear();
			volno=1;
		}
		bat_on;
	}
	if(slot > 865){
		volno=0;
		bat_off;
		slot=420;
	}
	if(slot < 600){
		volno=0;
		bat_off;
		slot=420;
	}
	if(slot >= 860){
		bat_off;
		slot=420;
	}
}

//animace blik?n? baterie
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

//tla??tko pro probuzen?
void tlacitko_sleep(void){
	if(GPIO_ReadInputPin(GPIOE,GPIO_PIN_4) == RESET && last_sleep==1){
		last_sleep=0;
	}
	if(GPIO_ReadInputPin(GPIOE,GPIO_PIN_4) != RESET){
		last_sleep= 1;
	}
}

//potvrzovac? tla??tko
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
		if(stav==2 && encoder==2 && kontrola==0){
			stav=stav_sleep;
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
	kontrola=0;//p?esko?? zbyl? podm?nky 
	}
}

// vyhodnocuje stav enkod?ru
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
	
//funkce pro automatick? ot??en? serva
void servo_auto(void){
	if(milis()- foto_time >= 100){
		left = ADC_get(ADC2_CHANNEL_6);
		right = ADC_get(ADC2_CHANNEL_7);
		
		if(right+40 > left && right-40 > left){//do prava
			turn=1;
		}
		else if(left+40 > right && left-40 > right){//do leva
			turn=2;
		}
		else{
			turn=0;
		}
	}
	if(turn==1 && block==1){//pravo
		TIM2_SetCompare1(1551); 
	}
	if(turn==2 && block==2){//levo
		TIM2_SetCompare1(1430); 
	}
	if(turn==0){
		TIM2_SetCompare1(0); 
	}
	optic_gate();
}


//funkce pro obsluhu optick? br?ny
void optic_gate(void){
	gate_prevod = ADC_get(ADC2_CHANNEL_1);
	if(gate_prevod <= 300 && block==0){
		gate++;
		block=1;
	}
	if(gate_prevod >= 350){
		block=0;
		blokada=0;
	}
	if(blokada==1){gate=0;}
	
	
	switch(stav_servo){
		case nic:
			
				left = ADC_get(ADC2_CHANNEL_6);
				right = ADC_get(ADC2_CHANNEL_7);
		
				if(right+40 > left && right-40 > left){//do prava
					turn=1;
				}
				else if(left+40 > right && left-40 > right){//do leva
					turn=2;
				}
				else{
					turn=0;
				}
			
			if(turn==1){//pravo
				TIM2_SetCompare1(1551); 
			}
			if(turn==2){//levo
				TIM2_SetCompare1(1430); 
			}
			if(turn==0){
				TIM2_SetCompare1(0); 
			}
			if(turn==1 && gate==1){
				stav_servo=pravo;
			}
			if(turn==2 && gate==1){
				stav_servo=levo;
			}
		break;
		
		case pravo:
			TIM2_SetCompare1(0);
			
				left = ADC_get(ADC2_CHANNEL_6);
				right = ADC_get(ADC2_CHANNEL_7);
		
				if(right+150 > left && right-150 > left){//do prava
					stav_servo = presun;
					strana=1;
				}
				if(left+40 > right && left-40 > right){//do leva
					stav_servo = nic;
					blokada=1;
				}
			
			break;
			
		case levo:
			TIM2_SetCompare1(0);
			
				left = ADC_get(ADC2_CHANNEL_6);
				right = ADC_get(ADC2_CHANNEL_7);
		
				if(right+40 > left && right-40 > left){//do prava
					stav_servo = nic;
					blokada=1;
				}
				if(left+150 > right && left-150 > right){//do leva
					stav_servo = presun;
					strana=2;
				}
			
			break;
			
		case presun:
			if(strana==1){
				TIM2_SetCompare1(1430); //do leva
				if(gate==2){
					TIM2_SetCompare1(0); 
					stav_servo = levo;
					gate=0;
				}
			}
			if(strana==2){
				TIM2_SetCompare1(1551); //do prava
				if(gate==2){
					TIM2_SetCompare1(0); 
					stav_servo = pravo;
					gate=0;
				}
			}
			break;
	}
}


//funkce pro manu?ln? nato?en? serva
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

//funkce pro nastaven? PWM
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

//funkce pro nastaven? ADC p?evodn?ku
void ADC_init(void){
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL1,DISABLE);//optick? br?na PB1
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL4,DISABLE);//Baterie 1
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL6,DISABLE);//lev? foto PB6
ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL7,DISABLE);//prav? foto PB7
ADC2_PrescalerConfig(ADC2_PRESSEL_FCPU_D4);
ADC2_AlignConfig(ADC2_ALIGN_RIGHT);
ADC2_Select_Channel(ADC2_CHANNEL_6);
ADC2_Cmd(ENABLE);
ADC2_Startup_Wait();
}

// pod t?mto koment??em nic nem??te 
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