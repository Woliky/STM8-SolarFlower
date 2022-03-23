#include "stm8s.h"
#include "milis.h"
#include "stm8_hd44780.h"
#include "stdio.h"
#include "emoji.h"

#define stav_display 1
#define stav_menu 2
#define stav_manual 3

void process_enc(void);
void blick_bat(void);
void tlacitko(void);

uint16_t last_time=0;
uint16_t minule=1,last=1,x=70,y=180;
uint8_t stav=1,bat1=1,bat2=1,lcd_sloupec=0,pointer=0,kontrola=0;

volatile int16_t encoder=0;
char text[24];


void main(void){
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z intern�ho RC oscil�toru

init_milis(); // milis kvuli delay_ms()
lcd_init();		// inicializace displeje

GPIO_Init(GPIOB,GPIO_PIN_2,GPIO_MODE_IN_PU_NO_IT);  // vstup, s vniton�m pullup rezistorem
GPIO_Init(GPIOB,GPIO_PIN_3,GPIO_MODE_IN_PU_NO_IT);
GPIO_Init(GPIOB,GPIO_PIN_0,GPIO_MODE_IN_PU_NO_IT);

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
			case stav_display:
				//prvn� slot pro baterii
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
					sprintf(text,"Nabito %u",x); 
					strcat(text, "%");
					lcd_gotoxy(1,0); 
					lcd_puts(text);
				}
				
				//Druh� slot pro baterii
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
				
		case stav_manual:
			sprintf(text,"pozice %u",y); 
			strcat(text, "�");
			lcd_gotoxy(1,0); 
			lcd_puts(text);
			tlacitko();
			break;
		}
	}
}

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

//potvrzovac� tla��tko
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
		if(stav==3 && kontrola==0){
			stav=stav_menu;
			lcd_clear();
			kontrola=1;
		}
	}
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_0) != RESET){
	last = 1;
	kontrola=0;
	}
}

// vyhodnocuje stav enkod�ru
void process_enc(void){
	 // pamatuje si minul� stav vstupu A (nutn� k detekov�n� sestupn� hrany)
	// pokud je na vstupu A hodnota 0 a minule byla hodnota 1 tak jsme zachytili sestupnou hranu
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) == RESET && minule==1){
		minule = 0; // nyn� je pin v log.0
		// poeeteme stav vstupu B
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_3) == RESET){
			// log.0 na vstupu B (krok jedn�m smirem)
			if(stav=2){lcd_clear();}
			encoder++;
	}else{
			// log.1 na vstupu B (krok druh�m smirem)
			if(stav=2){lcd_clear();}
			encoder--;
	}
	if(encoder < 0){encoder=0;}
	}
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) != RESET){minule = 1;} // pokud je vstup A v log.1
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