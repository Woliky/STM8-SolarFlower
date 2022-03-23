#include "stm8s.h"
#include "milis.h"
#include "stm8_hd44780.h"
#include "stdio.h"
#include "emoji.h"

#define stav_display 1
#define stav_menu 2

void process_enc(void);
void blick_bat(void);

uint16_t last_time=0;
uint16_t minule=1,x=70;
uint8_t stav=1,bat1=1,bat2=1,lcd_sloupec=0;

volatile int16_t hodnota=0;
char text[24];


void main(void){
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z interního RC oscilátoru

init_milis(); // milis kvuli delay_ms()
lcd_init();		// inicializace displeje

GPIO_Init(GPIOB,GPIO_PIN_2,GPIO_MODE_IN_PU_NO_IT);  // vstup, s vnitoním pullup rezistorem
GPIO_Init(GPIOB,GPIO_PIN_3,GPIO_MODE_IN_PU_NO_IT);

lcd_store_symbol(0,time);
lcd_store_symbol(3,battery);
lcd_store_symbol(1,battery_low);
lcd_store_symbol(2,battery_low1);
lcd_store_symbol(4,battery_full1);
lcd_store_symbol(5,battery_full);
lcd_store_symbol(6,cross);
lcd_clear();

  while (1){
		switch(stav){
			case stav_display:
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
					sprintf(text,"Nabito %u",x); 
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
				break;
		}
		
		process_enc();
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

// vyhodnocuje stav enkodéru
void process_enc(void){
	 // pamatuje si minulý stav vstupu A (nutné k detekování sestupné hrany)
	// pokud je na vstupu A hodnota 0 a minule byla hodnota 1 tak jsme zachytili sestupnou hranu
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) == RESET && minule==1){
		minule = 0; // nyní je pin v log.0
		// poeeteme stav vstupu B
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_3) == RESET){
			// log.0 na vstupu B (krok jedním smirem)
			hodnota++;
	}else{
			// log.1 na vstupu B (krok druhým smirem)
			hodnota--;
	}
	}
	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) != RESET){minule = 1;} // pokud je vstup A v log.1
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