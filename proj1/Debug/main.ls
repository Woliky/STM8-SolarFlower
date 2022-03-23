   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  84                     ; 24 char *
  84                     ; 25 strcat(char *dest, const char *src)
  84                     ; 26 {
  86                     	switch	.text
  87  0000               _strcat:
  89  0000 89            	pushw	x
  90  0001 5204          	subw	sp,#4
  91       00000004      OFST:	set	4
  94                     ; 28     for (i = 0; dest[i] != '\0'; i++)
  96  0003 5f            	clrw	x
  97  0004 1f01          	ldw	(OFST-3,sp),x
 100  0006 2007          	jra	L74
 101  0008               L34:
 105  0008 1e01          	ldw	x,(OFST-3,sp)
 106  000a 1c0001        	addw	x,#1
 107  000d 1f01          	ldw	(OFST-3,sp),x
 109  000f               L74:
 112  000f 1e05          	ldw	x,(OFST+1,sp)
 113  0011 72fb01        	addw	x,(OFST-3,sp)
 114  0014 7d            	tnz	(x)
 115  0015 26f1          	jrne	L34
 116                     ; 30     for (j = 0; src[j] != '\0'; j++)
 118  0017 5f            	clrw	x
 119  0018 1f03          	ldw	(OFST-1,sp),x
 122  001a 2016          	jra	L75
 123  001c               L35:
 124                     ; 31         dest[i+j] = src[j];
 126  001c 1e09          	ldw	x,(OFST+5,sp)
 127  001e 72fb03        	addw	x,(OFST-1,sp)
 128  0021 f6            	ld	a,(x)
 129  0022 1e01          	ldw	x,(OFST-3,sp)
 130  0024 72fb03        	addw	x,(OFST-1,sp)
 131  0027 72fb05        	addw	x,(OFST+1,sp)
 132  002a f7            	ld	(x),a
 133                     ; 30     for (j = 0; src[j] != '\0'; j++)
 135  002b 1e03          	ldw	x,(OFST-1,sp)
 136  002d 1c0001        	addw	x,#1
 137  0030 1f03          	ldw	(OFST-1,sp),x
 139  0032               L75:
 142  0032 1e09          	ldw	x,(OFST+5,sp)
 143  0034 72fb03        	addw	x,(OFST-1,sp)
 144  0037 7d            	tnz	(x)
 145  0038 26e2          	jrne	L35
 146                     ; 32     dest[i+j] = '\0';
 148  003a 1e01          	ldw	x,(OFST-3,sp)
 149  003c 72fb03        	addw	x,(OFST-1,sp)
 150  003f 72fb05        	addw	x,(OFST+1,sp)
 151  0042 7f            	clr	(x)
 152                     ; 33     return dest;
 154  0043 1e05          	ldw	x,(OFST+1,sp)
 157  0045 5b06          	addw	sp,#6
 158  0047 81            	ret
 171                     	bsct
 172  0000               _time:
 173  0000 00            	dc.b	0
 174  0001 00            	dc.b	0
 175  0002 08            	dc.b	8
 176  0003 08            	dc.b	8
 177  0004 08            	dc.b	8
 178  0005 04            	dc.b	4
 179  0006 02            	dc.b	2
 180  0007 00            	dc.b	0
 181  0008               _cross:
 182  0008 00            	dc.b	0
 183  0009 00            	dc.b	0
 184  000a 11            	dc.b	17
 185  000b 0a            	dc.b	10
 186  000c 04            	dc.b	4
 187  000d 0a            	dc.b	10
 188  000e 11            	dc.b	17
 189  000f 00            	dc.b	0
 190  0010               _point:
 191  0010 08            	dc.b	8
 192  0011 04            	dc.b	4
 193  0012 02            	dc.b	2
 194  0013 01            	dc.b	1
 195  0014 02            	dc.b	2
 196  0015 04            	dc.b	4
 197  0016 08            	dc.b	8
 198  0017 00            	dc.b	0
 199  0018               _battery:
 200  0018 0c            	dc.b	12
 201  0019 12            	dc.b	18
 202  001a 12            	dc.b	18
 203  001b 1a            	dc.b	26
 204  001c 1e            	dc.b	30
 205  001d 1e            	dc.b	30
 206  001e 1e            	dc.b	30
 207  001f 00            	dc.b	0
 208  0020               _battery_low:
 209  0020 0c            	dc.b	12
 210  0021 12            	dc.b	18
 211  0022 12            	dc.b	18
 212  0023 12            	dc.b	18
 213  0024 12            	dc.b	18
 214  0025 12            	dc.b	18
 215  0026 1e            	dc.b	30
 216  0027 00            	dc.b	0
 217  0028               _battery_low1:
 218  0028 0c            	dc.b	12
 219  0029 12            	dc.b	18
 220  002a 12            	dc.b	18
 221  002b 12            	dc.b	18
 222  002c 1a            	dc.b	26
 223  002d 1e            	dc.b	30
 224  002e 1e            	dc.b	30
 225  002f 00            	dc.b	0
 226  0030               _battery_full1:
 227  0030 0c            	dc.b	12
 228  0031 12            	dc.b	18
 229  0032 1a            	dc.b	26
 230  0033 1e            	dc.b	30
 231  0034 1e            	dc.b	30
 232  0035 1e            	dc.b	30
 233  0036 1e            	dc.b	30
 234  0037 00            	dc.b	0
 235  0038               _battery_full:
 236  0038 0c            	dc.b	12
 237  0039 1e            	dc.b	30
 238  003a 1e            	dc.b	30
 239  003b 1e            	dc.b	30
 240  003c 1e            	dc.b	30
 241  003d 1e            	dc.b	30
 242  003e 1e            	dc.b	30
 243  003f 00            	dc.b	0
 344                     	bsct
 345  0040               _last_time:
 346  0040 0000          	dc.w	0
 347  0042               _volt_time:
 348  0042 0000          	dc.w	0
 349  0044               _foto_time:
 350  0044 0000          	dc.w	0
 351  0046               _bat_time:
 352  0046 0000          	dc.w	0
 353  0048               _wake_time:
 354  0048 0000          	dc.w	0
 355  004a               _minule:
 356  004a 0001          	dc.w	1
 357  004c               _last:
 358  004c 0001          	dc.w	1
 359  004e               _x:
 360  004e 0000          	dc.w	0
 361  0050               _y:
 362  0050 0000          	dc.w	0
 363  0052               _volt1:
 364  0052 0000          	dc.w	0
 365  0054               _prevod:
 366  0054 0000          	dc.w	0
 367  0056               _left:
 368  0056 0000          	dc.w	0
 369  0058               _right:
 370  0058 0000          	dc.w	0
 371  005a               _volt:
 372  005a 0000          	dc.w	0
 373  005c               _a:
 374  005c 0000          	dc.w	0
 375  005e               _gate_prevod:
 376  005e 0000          	dc.w	0
 377  0060               _slot:
 378  0060 0000          	dc.w	0
 379  0062               _bat1:
 380  0062 01            	dc.b	1
 381  0063               _bat2:
 382  0063 01            	dc.b	1
 383  0064               _lcd_sloupec:
 384  0064 00            	dc.b	0
 385  0065               _pointer:
 386  0065 00            	dc.b	0
 387  0066               _kontrola:
 388  0066 00            	dc.b	0
 389  0067               _run:
 390  0067 01            	dc.b	1
 391  0068               _turn:
 392  0068 00            	dc.b	0
 393  0069               _stav:
 394  0069 01            	dc.b	1
 395  006a               _stav_servo:
 396  006a 01            	dc.b	1
 397  006b               _block:
 398  006b 00            	dc.b	0
 399  006c               _strana:
 400  006c 00            	dc.b	0
 401  006d               _gate:
 402  006d 00            	dc.b	0
 403  006e               _blokada:
 404  006e 00            	dc.b	0
 405  006f               _volno:
 406  006f 00            	dc.b	0
 407  0070               _pocitadlo:
 408  0070 00            	dc.b	0
 409  0071               _zakaz:
 410  0071 00            	dc.b	0
 411  0072               _spanek:
 412  0072 00            	dc.b	0
 413  0073               _podminka:
 414  0073 00            	dc.b	0
 415  0074               _podminka2:
 416  0074 00            	dc.b	0
 417  0075               _sleep:
 418  0075 00            	dc.b	0
 419  0076               _wake:
 420  0076 00            	dc.b	0
 421  0077               _last_sleep:
 422  0077 00            	dc.b	0
 423  0078               _encoder:
 424  0078 0000          	dc.w	0
 457                     ; 56 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7){
 459                     	switch	.text
 460  0048               f_EXTI_PORTE_IRQHandler:
 462  0048 8a            	push	cc
 463  0049 84            	pop	a
 464  004a a4bf          	and	a,#191
 465  004c 88            	push	a
 466  004d 86            	pop	cc
 467  004e 3b0002        	push	c_x+2
 468  0051 be00          	ldw	x,c_x
 469  0053 89            	pushw	x
 470  0054 3b0002        	push	c_y+2
 471  0057 be00          	ldw	x,c_y
 472  0059 89            	pushw	x
 475                     ; 58   stav=1;
 477  005a 35010069      	mov	_stav,#1
 478                     ; 59 	lcd_on;
 480  005e 4b04          	push	#4
 481  0060 ae501e        	ldw	x,#20510
 482  0063 cd0000        	call	_GPIO_WriteHigh
 484  0066 84            	pop	a
 485                     ; 60 	servo_on;
 488  0067 4b08          	push	#8
 489  0069 ae501e        	ldw	x,#20510
 490  006c cd0000        	call	_GPIO_WriteHigh
 492  006f 84            	pop	a
 493                     ; 61 	foto1_on;
 496  0070 4b40          	push	#64
 497  0072 ae500f        	ldw	x,#20495
 498  0075 cd0000        	call	_GPIO_WriteHigh
 500  0078 84            	pop	a
 501                     ; 62 	foto2_on;
 504  0079 4b20          	push	#32
 505  007b ae500f        	ldw	x,#20495
 506  007e cd0000        	call	_GPIO_WriteHigh
 508  0081 84            	pop	a
 509                     ; 64 } 
 513  0082 85            	popw	x
 514  0083 bf00          	ldw	c_y,x
 515  0085 320002        	pop	c_y+2
 516  0088 85            	popw	x
 517  0089 bf00          	ldw	c_x,x
 518  008b 320002        	pop	c_x+2
 519  008e 80            	iret
 547                     ; 67 INTERRUPT_HANDLER(AWU_IRQHandler, 1){
 548                     	switch	.text
 549  008f               f_AWU_IRQHandler:
 551  008f 8a            	push	cc
 552  0090 84            	pop	a
 553  0091 a4bf          	and	a,#191
 554  0093 88            	push	a
 555  0094 86            	pop	cc
 556  0095 3b0002        	push	c_x+2
 557  0098 be00          	ldw	x,c_x
 558  009a 89            	pushw	x
 559  009b 3b0002        	push	c_y+2
 560  009e be00          	ldw	x,c_y
 561  00a0 89            	pushw	x
 564                     ; 68 	AWU_GetFlagStatus();
 566  00a1 cd0000        	call	_AWU_GetFlagStatus
 568                     ; 69 	spanek++;
 570  00a4 3c72          	inc	_spanek
 571                     ; 70 	if(spanek == 5){
 573  00a6 b672          	ld	a,_spanek
 574  00a8 a105          	cp	a,#5
 575  00aa 2630          	jrne	L561
 576                     ; 71 		sleep=1;
 578  00ac 35010075      	mov	_sleep,#1
 579                     ; 72 		stav=1;
 581  00b0 35010069      	mov	_stav,#1
 582                     ; 73 		spanek=0;
 584  00b4 3f72          	clr	_spanek
 585                     ; 74 		lcd_on;
 587  00b6 4b04          	push	#4
 588  00b8 ae501e        	ldw	x,#20510
 589  00bb cd0000        	call	_GPIO_WriteHigh
 591  00be 84            	pop	a
 592                     ; 75 		servo_on;
 595  00bf 4b08          	push	#8
 596  00c1 ae501e        	ldw	x,#20510
 597  00c4 cd0000        	call	_GPIO_WriteHigh
 599  00c7 84            	pop	a
 600                     ; 76 		foto1_on;
 603  00c8 4b40          	push	#64
 604  00ca ae500f        	ldw	x,#20495
 605  00cd cd0000        	call	_GPIO_WriteHigh
 607  00d0 84            	pop	a
 608                     ; 77 		foto2_on;
 611  00d1 4b20          	push	#32
 612  00d3 ae500f        	ldw	x,#20495
 613  00d6 cd0000        	call	_GPIO_WriteHigh
 615  00d9 84            	pop	a
 618  00da 2001          	jra	L761
 619  00dc               L561:
 620                     ; 79 		halt();
 623  00dc 8e            halt
 625  00dd               L761:
 626                     ; 81 }
 629  00dd 85            	popw	x
 630  00de bf00          	ldw	c_y,x
 631  00e0 320002        	pop	c_y+2
 632  00e3 85            	popw	x
 633  00e4 bf00          	ldw	c_x,x
 634  00e6 320002        	pop	c_x+2
 635  00e9 80            	iret
 706                     ; 83 void main(void){
 708                     	switch	.text
 709  00ea               _main:
 713                     ; 84 CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z interního RC oscilátoru
 715  00ea 4f            	clr	a
 716  00eb cd0000        	call	_CLK_HSIPrescalerConfig
 718                     ; 86 init_milis(); // milis kvuli delay_ms()
 720  00ee cd0000        	call	_init_milis
 722                     ; 87 lcd_init();		// inicializace displeje
 724  00f1 cd0000        	call	_lcd_init
 726                     ; 88 init_pwm();		//inicializace PWM
 728  00f4 cd096d        	call	_init_pwm
 730                     ; 89 ADC_init();		//inicializace ADC
 732  00f7 cd098e        	call	_ADC_init
 734                     ; 92 EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 736  00fa ae0202        	ldw	x,#514
 737  00fd cd0000        	call	_EXTI_SetExtIntSensitivity
 739                     ; 93 EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 741  0100 4f            	clr	a
 742  0101 cd0000        	call	_EXTI_SetTLISensitivity
 744                     ; 94 AWU_LSICalibrationConfig(110000);
 746  0104 aeadb0        	ldw	x,#44464
 747  0107 89            	pushw	x
 748  0108 ae0001        	ldw	x,#1
 749  010b 89            	pushw	x
 750  010c cd0000        	call	_AWU_LSICalibrationConfig
 752  010f 5b04          	addw	sp,#4
 753                     ; 95 AWU_Init(AWU_TIMEBASE_12S);
 755  0111 a60f          	ld	a,#15
 756  0113 cd0000        	call	_AWU_Init
 758                     ; 99 GPIO_Init(GPIOE,GPIO_PIN_6, GPIO_MODE_IN_FL_IT);//probouzecí tlaèítko
 760  0116 4b20          	push	#32
 761  0118 4b40          	push	#64
 762  011a ae5014        	ldw	x,#20500
 763  011d cd0000        	call	_GPIO_Init
 765  0120 85            	popw	x
 766                     ; 100 GPIO_Init(GPIOB,GPIO_PIN_0,GPIO_MODE_IN_PU_NO_IT);//tlaèítko
 768  0121 4b40          	push	#64
 769  0123 4b01          	push	#1
 770  0125 ae5005        	ldw	x,#20485
 771  0128 cd0000        	call	_GPIO_Init
 773  012b 85            	popw	x
 774                     ; 101 GPIO_Init(GPIOB,GPIO_PIN_1,GPIO_MODE_IN_PU_NO_IT);//optická brána
 776  012c 4b40          	push	#64
 777  012e 4b02          	push	#2
 778  0130 ae5005        	ldw	x,#20485
 779  0133 cd0000        	call	_GPIO_Init
 781  0136 85            	popw	x
 782                     ; 102 GPIO_Init(GPIOB,GPIO_PIN_2,GPIO_MODE_IN_PU_NO_IT);//encoder kanál 1
 784  0137 4b40          	push	#64
 785  0139 4b04          	push	#4
 786  013b ae5005        	ldw	x,#20485
 787  013e cd0000        	call	_GPIO_Init
 789  0141 85            	popw	x
 790                     ; 103 GPIO_Init(GPIOB,GPIO_PIN_3,GPIO_MODE_IN_PU_NO_IT);//encoder kanál 2
 792  0142 4b40          	push	#64
 793  0144 4b08          	push	#8
 794  0146 ae5005        	ldw	x,#20485
 795  0149 cd0000        	call	_GPIO_Init
 797  014c 85            	popw	x
 798                     ; 104 GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_IN_PU_NO_IT);//bat1
 800  014d 4b40          	push	#64
 801  014f 4b10          	push	#16
 802  0151 ae5005        	ldw	x,#20485
 803  0154 cd0000        	call	_GPIO_Init
 805  0157 85            	popw	x
 806                     ; 105 GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_IN_PU_NO_IT);//bat2
 808  0158 4b40          	push	#64
 809  015a 4b20          	push	#32
 810  015c ae5005        	ldw	x,#20485
 811  015f cd0000        	call	_GPIO_Init
 813  0162 85            	popw	x
 814                     ; 106 GPIO_Init(GPIOB,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);//fotorezistor L ADC
 816  0163 4b40          	push	#64
 817  0165 4b40          	push	#64
 818  0167 ae5005        	ldw	x,#20485
 819  016a cd0000        	call	_GPIO_Init
 821  016d 85            	popw	x
 822                     ; 107 GPIO_Init(GPIOB,GPIO_PIN_7,GPIO_MODE_IN_PU_NO_IT);//fotorezistor R ADC
 824  016e 4b40          	push	#64
 825  0170 4b80          	push	#128
 826  0172 ae5005        	ldw	x,#20485
 827  0175 cd0000        	call	_GPIO_Init
 829  0178 85            	popw	x
 830                     ; 109 GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_OUT_PP_LOW_SLOW);//servo-pwm
 832  0179 4bc0          	push	#192
 833  017b 4b10          	push	#16
 834  017d ae500f        	ldw	x,#20495
 835  0180 cd0000        	call	_GPIO_Init
 837  0183 85            	popw	x
 838                     ; 110 GPIO_Init(GPIOD,GPIO_PIN_6,GPIO_MODE_OUT_PP_LOW_SLOW);//foto 1
 840  0184 4bc0          	push	#192
 841  0186 4b40          	push	#64
 842  0188 ae500f        	ldw	x,#20495
 843  018b cd0000        	call	_GPIO_Init
 845  018e 85            	popw	x
 846                     ; 111 GPIO_Init(GPIOD,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_SLOW);//foto 2
 848  018f 4bc0          	push	#192
 849  0191 4b20          	push	#32
 850  0193 ae500f        	ldw	x,#20495
 851  0196 cd0000        	call	_GPIO_Init
 853  0199 85            	popw	x
 854                     ; 112 GPIO_Init(GPIOG,GPIO_PIN_2,GPIO_MODE_OUT_PP_LOW_SLOW);//lcd podsvícení
 856  019a 4bc0          	push	#192
 857  019c 4b04          	push	#4
 858  019e ae501e        	ldw	x,#20510
 859  01a1 cd0000        	call	_GPIO_Init
 861  01a4 85            	popw	x
 862                     ; 113 GPIO_Init(GPIOG,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_SLOW);//servo-napájení
 864  01a5 4bc0          	push	#192
 865  01a7 4b08          	push	#8
 866  01a9 ae501e        	ldw	x,#20510
 867  01ac cd0000        	call	_GPIO_Init
 869  01af 85            	popw	x
 870                     ; 114 GPIO_Init(GPIOG,GPIO_PIN_7,GPIO_MODE_OUT_PP_LOW_SLOW);//foto 1
 872  01b0 4bc0          	push	#192
 873  01b2 4b80          	push	#128
 874  01b4 ae501e        	ldw	x,#20510
 875  01b7 cd0000        	call	_GPIO_Init
 877  01ba 85            	popw	x
 878                     ; 115 GPIO_Init(GPIOG,GPIO_PIN_6,GPIO_MODE_OUT_PP_LOW_SLOW);//foto 2
 880  01bb 4bc0          	push	#192
 881  01bd 4b40          	push	#64
 882  01bf ae501e        	ldw	x,#20510
 883  01c2 cd0000        	call	_GPIO_Init
 885  01c5 85            	popw	x
 886                     ; 118 lcd_store_symbol(0,time);
 888  01c6 ae0000        	ldw	x,#_time
 889  01c9 89            	pushw	x
 890  01ca 4f            	clr	a
 891  01cb cd0000        	call	_lcd_store_symbol
 893  01ce 85            	popw	x
 894                     ; 119 lcd_store_symbol(3,battery);
 896  01cf ae0018        	ldw	x,#_battery
 897  01d2 89            	pushw	x
 898  01d3 a603          	ld	a,#3
 899  01d5 cd0000        	call	_lcd_store_symbol
 901  01d8 85            	popw	x
 902                     ; 120 lcd_store_symbol(1,battery_low);
 904  01d9 ae0020        	ldw	x,#_battery_low
 905  01dc 89            	pushw	x
 906  01dd a601          	ld	a,#1
 907  01df cd0000        	call	_lcd_store_symbol
 909  01e2 85            	popw	x
 910                     ; 121 lcd_store_symbol(2,battery_low1);
 912  01e3 ae0028        	ldw	x,#_battery_low1
 913  01e6 89            	pushw	x
 914  01e7 a602          	ld	a,#2
 915  01e9 cd0000        	call	_lcd_store_symbol
 917  01ec 85            	popw	x
 918                     ; 122 lcd_store_symbol(4,battery_full1);
 920  01ed ae0030        	ldw	x,#_battery_full1
 921  01f0 89            	pushw	x
 922  01f1 a604          	ld	a,#4
 923  01f3 cd0000        	call	_lcd_store_symbol
 925  01f6 85            	popw	x
 926                     ; 123 lcd_store_symbol(5,battery_full);
 928  01f7 ae0038        	ldw	x,#_battery_full
 929  01fa 89            	pushw	x
 930  01fb a605          	ld	a,#5
 931  01fd cd0000        	call	_lcd_store_symbol
 933  0200 85            	popw	x
 934                     ; 124 lcd_store_symbol(6,cross);
 936  0201 ae0008        	ldw	x,#_cross
 937  0204 89            	pushw	x
 938  0205 a606          	ld	a,#6
 939  0207 cd0000        	call	_lcd_store_symbol
 941  020a 85            	popw	x
 942                     ; 125 lcd_store_symbol(7,point);
 944  020b ae0010        	ldw	x,#_point
 945  020e 89            	pushw	x
 946  020f a607          	ld	a,#7
 947  0211 cd0000        	call	_lcd_store_symbol
 949  0214 85            	popw	x
 950                     ; 127 foto1_on;
 952  0215 4b40          	push	#64
 953  0217 ae500f        	ldw	x,#20495
 954  021a cd0000        	call	_GPIO_WriteHigh
 956  021d 84            	pop	a
 957                     ; 128 foto2_on;
 960  021e 4b20          	push	#32
 961  0220 ae500f        	ldw	x,#20495
 962  0223 cd0000        	call	_GPIO_WriteHigh
 964  0226 84            	pop	a
 965                     ; 129 lcd_on;
 968  0227 4b04          	push	#4
 969  0229 ae501e        	ldw	x,#20510
 970  022c cd0000        	call	_GPIO_WriteHigh
 972  022f 84            	pop	a
 973                     ; 130 servo_on;
 976  0230 4b08          	push	#8
 977  0232 ae501e        	ldw	x,#20510
 978  0235 cd0000        	call	_GPIO_WriteHigh
 980  0238 84            	pop	a
 981                     ; 131 lcd_clear();
 984  0239 a601          	ld	a,#1
 985  023b cd0000        	call	_lcd_command
 987                     ; 132 enableInterrupts();
 990  023e 9a            rim
 992  023f               L112:
 993                     ; 137 		switch(stav){
 995  023f b669          	ld	a,_stav
 997                     ; 265 			break;
 998  0241 4a            	dec	a
 999  0242 2714          	jreq	L171
1000  0244 4a            	dec	a
1001  0245 2603          	jrne	L41
1002  0247 cc032d        	jp	L371
1003  024a               L41:
1004  024a 4a            	dec	a
1005  024b 2603          	jrne	L61
1006  024d cc03b7        	jp	L571
1007  0250               L61:
1008  0250 4a            	dec	a
1009  0251 2603          	jrne	L02
1010  0253 cc03fa        	jp	L771
1011  0256               L02:
1012  0256 20e7          	jra	L112
1013  0258               L171:
1014                     ; 139 			case stav_display:
1014                     ; 140 				
1014                     ; 141 				if(sleep == 1){
1016  0258 b675          	ld	a,_sleep
1017  025a a101          	cp	a,#1
1018  025c 2645          	jrne	L122
1019                     ; 142 					if(milis()- wake_time >= 1000){
1021  025e cd0000        	call	_milis
1023  0261 72b00048      	subw	x,_wake_time
1024  0265 a303e8        	cpw	x,#1000
1025  0268 2539          	jrult	L122
1026                     ; 143 						wake_time=milis();
1028  026a cd0000        	call	_milis
1030  026d bf48          	ldw	_wake_time,x
1031                     ; 144 						wake++;
1033  026f 3c76          	inc	_wake
1034                     ; 145 						if(wake == 10){
1036  0271 b676          	ld	a,_wake
1037  0273 a10a          	cp	a,#10
1038  0275 262c          	jrne	L122
1039                     ; 146 							wake=0;
1041  0277 3f76          	clr	_wake
1042                     ; 147 							sleep=0;
1044  0279 3f75          	clr	_sleep
1045                     ; 148 							wake_time=0;
1047  027b 5f            	clrw	x
1048  027c bf48          	ldw	_wake_time,x
1049                     ; 149 							lcd_off;
1051  027e 4b04          	push	#4
1052  0280 ae501e        	ldw	x,#20510
1053  0283 cd0000        	call	_GPIO_WriteLow
1055  0286 84            	pop	a
1056                     ; 150 							servo_off;
1059  0287 4b08          	push	#8
1060  0289 ae501e        	ldw	x,#20510
1061  028c cd0000        	call	_GPIO_WriteLow
1063  028f 84            	pop	a
1064                     ; 151 							foto1_off;
1067  0290 4b40          	push	#64
1068  0292 ae500f        	ldw	x,#20495
1069  0295 cd0000        	call	_GPIO_WriteLow
1071  0298 84            	pop	a
1072                     ; 152 							foto2_off;
1075  0299 4b20          	push	#32
1076  029b ae500f        	ldw	x,#20495
1077  029e cd0000        	call	_GPIO_WriteLow
1079  02a1 84            	pop	a
1080                     ; 153 							halt();
1084  02a2 8e            halt
1087  02a3               L122:
1088                     ; 158 				power();
1090  02a3 cd0478        	call	_power
1092                     ; 159 				voltage();
1094  02a6 cd0427        	call	_voltage
1096                     ; 161 				if(slot < 600 || slot > 870){
1098  02a9 be60          	ldw	x,_slot
1099  02ab a30258        	cpw	x,#600
1100  02ae 2507          	jrult	L132
1102  02b0 be60          	ldw	x,_slot
1103  02b2 a30367        	cpw	x,#871
1104  02b5 253c          	jrult	L722
1105  02b7               L132:
1106                     ; 162 					podminka=0;
1108  02b7 3f73          	clr	_podminka
1109                     ; 163 					sprintf(text,"%s","chybi baterie");
1111  02b9 ae003e        	ldw	x,#L532
1112  02bc 89            	pushw	x
1113  02bd ae004c        	ldw	x,#L332
1114  02c0 89            	pushw	x
1115  02c1 ae0000        	ldw	x,#_text
1116  02c4 cd0000        	call	_sprintf
1118  02c7 5b04          	addw	sp,#4
1119                     ; 164 					lcd_gotoxy(2,0); 
1121  02c9 ae0200        	ldw	x,#512
1122  02cc cd0000        	call	_lcd_gotoxy
1124                     ; 165 					lcd_puts(text);
1126  02cf ae0000        	ldw	x,#_text
1127  02d2 cd0000        	call	_lcd_puts
1129                     ; 167 					lcd_gotoxy(1,0); 
1131  02d5 ae0100        	ldw	x,#256
1132  02d8 cd0000        	call	_lcd_gotoxy
1134                     ; 168 					lcd_putchar(6);
1136  02db a606          	ld	a,#6
1137  02dd cd0000        	call	_lcd_data
1139                     ; 169 					lcd_gotoxy(0,0); 
1141  02e0 5f            	clrw	x
1142  02e1 cd0000        	call	_lcd_gotoxy
1144                     ; 170 					lcd_putchar(1);
1146  02e4 a601          	ld	a,#1
1147  02e6 cd0000        	call	_lcd_data
1150  02e9               L732:
1151                     ; 217 				tlacitko();
1153  02e9 cd05f4        	call	_tlacitko
1155                     ; 218 				optic_gate();
1157  02ec cd07a2        	call	_optic_gate
1159                     ; 219 				break;
1161  02ef ac3f023f      	jpf	L112
1162  02f3               L722:
1163                     ; 173 					if(podminka==0){
1165  02f3 3d73          	tnz	_podminka
1166  02f5 2609          	jrne	L142
1167                     ; 174 						lcd_clear();
1169  02f7 a601          	ld	a,#1
1170  02f9 cd0000        	call	_lcd_command
1172                     ; 175 						podminka=1;
1174  02fc 35010073      	mov	_podminka,#1
1175  0300               L142:
1176                     ; 177 					lcd_sloupec=0;
1178  0300 3f64          	clr	_lcd_sloupec
1179                     ; 178 					blick_bat();
1181  0302 cd050d        	call	_blick_bat
1183                     ; 179 					sprintf(text,"Nabito %u",y); 
1185  0305 be50          	ldw	x,_y
1186  0307 89            	pushw	x
1187  0308 ae0034        	ldw	x,#L342
1188  030b 89            	pushw	x
1189  030c ae0000        	ldw	x,#_text
1190  030f cd0000        	call	_sprintf
1192  0312 5b04          	addw	sp,#4
1193                     ; 180 					strcat(text, "%");
1195  0314 ae0032        	ldw	x,#L542
1196  0317 89            	pushw	x
1197  0318 ae0000        	ldw	x,#_text
1198  031b cd0000        	call	_strcat
1200  031e 85            	popw	x
1201                     ; 181 					lcd_gotoxy(1,0); 
1203  031f ae0100        	ldw	x,#256
1204  0322 cd0000        	call	_lcd_gotoxy
1206                     ; 182 					lcd_puts(text);
1208  0325 ae0000        	ldw	x,#_text
1209  0328 cd0000        	call	_lcd_puts
1211  032b 20bc          	jra	L732
1212  032d               L371:
1213                     ; 222 			case stav_menu:
1213                     ; 223 				TIM2_SetCompare1(0);
1215  032d 5f            	clrw	x
1216  032e cd0000        	call	_TIM2_SetCompare1
1218                     ; 224 				process_enc();
1220  0331 cd06a4        	call	_process_enc
1222                     ; 225 				if(encoder <= 1){
1224  0334 9c            	rvf
1225  0335 be78          	ldw	x,_encoder
1226  0337 a30002        	cpw	x,#2
1227  033a 2e38          	jrsge	L742
1228                     ; 226 					sprintf(text,"%s","Manual");
1230  033c ae002b        	ldw	x,#L152
1231  033f 89            	pushw	x
1232  0340 ae004c        	ldw	x,#L332
1233  0343 89            	pushw	x
1234  0344 ae0000        	ldw	x,#_text
1235  0347 cd0000        	call	_sprintf
1237  034a 5b04          	addw	sp,#4
1238                     ; 227 					lcd_gotoxy(1,0); 
1240  034c ae0100        	ldw	x,#256
1241  034f cd0000        	call	_lcd_gotoxy
1243                     ; 228 					lcd_puts(text);
1245  0352 ae0000        	ldw	x,#_text
1246  0355 cd0000        	call	_lcd_puts
1248                     ; 230 					sprintf(text,"%s","Automat");
1250  0358 ae0023        	ldw	x,#L352
1251  035b 89            	pushw	x
1252  035c ae004c        	ldw	x,#L332
1253  035f 89            	pushw	x
1254  0360 ae0000        	ldw	x,#_text
1255  0363 cd0000        	call	_sprintf
1257  0366 5b04          	addw	sp,#4
1258                     ; 231 					lcd_gotoxy(1,1); 
1260  0368 ae0101        	ldw	x,#257
1261  036b cd0000        	call	_lcd_gotoxy
1263                     ; 232 					lcd_puts(text);
1265  036e ae0000        	ldw	x,#_text
1266  0371 cd0000        	call	_lcd_puts
1268  0374               L742:
1269                     ; 234 				if(encoder == 2){
1271  0374 be78          	ldw	x,_encoder
1272  0376 a30002        	cpw	x,#2
1273  0379 261c          	jrne	L552
1274                     ; 235 					sprintf(text,"%s","Sleep");
1276  037b ae001d        	ldw	x,#L752
1277  037e 89            	pushw	x
1278  037f ae004c        	ldw	x,#L332
1279  0382 89            	pushw	x
1280  0383 ae0000        	ldw	x,#_text
1281  0386 cd0000        	call	_sprintf
1283  0389 5b04          	addw	sp,#4
1284                     ; 236 					lcd_gotoxy(1,0); 
1286  038b ae0100        	ldw	x,#256
1287  038e cd0000        	call	_lcd_gotoxy
1289                     ; 237 					lcd_puts(text);
1291  0391 ae0000        	ldw	x,#_text
1292  0394 cd0000        	call	_lcd_puts
1294  0397               L552:
1295                     ; 239 				if(encoder >= 3 ){
1297  0397 9c            	rvf
1298  0398 be78          	ldw	x,_encoder
1299  039a a30003        	cpw	x,#3
1300  039d 2f05          	jrslt	L162
1301                     ; 240 					encoder=2;
1303  039f ae0002        	ldw	x,#2
1304  03a2 bf78          	ldw	_encoder,x
1305  03a4               L162:
1306                     ; 242 				lcd_gotoxy(0,encoder); 
1308  03a4 b679          	ld	a,_encoder+1
1309  03a6 5f            	clrw	x
1310  03a7 97            	ld	xl,a
1311  03a8 cd0000        	call	_lcd_gotoxy
1313                     ; 243 				lcd_putchar(7);
1315  03ab a607          	ld	a,#7
1316  03ad cd0000        	call	_lcd_data
1318                     ; 244 				tlacitko();
1320  03b0 cd05f4        	call	_tlacitko
1322                     ; 245 				break;
1324  03b3 ac3f023f      	jpf	L112
1325  03b7               L571:
1326                     ; 247 		case stav_manual:
1326                     ; 248 			sprintf(text,"%s","Nastavte pozici"); 
1328  03b7 ae000d        	ldw	x,#L362
1329  03ba 89            	pushw	x
1330  03bb ae004c        	ldw	x,#L332
1331  03be 89            	pushw	x
1332  03bf ae0000        	ldw	x,#_text
1333  03c2 cd0000        	call	_sprintf
1335  03c5 5b04          	addw	sp,#4
1336                     ; 249 			lcd_gotoxy(0,0); 
1338  03c7 5f            	clrw	x
1339  03c8 cd0000        	call	_lcd_gotoxy
1341                     ; 250 			lcd_puts(text);
1343  03cb ae0000        	ldw	x,#_text
1344  03ce cd0000        	call	_lcd_puts
1346                     ; 251 			sprintf(text,"%s","Stisk > exit"); 
1348  03d1 ae0000        	ldw	x,#L562
1349  03d4 89            	pushw	x
1350  03d5 ae004c        	ldw	x,#L332
1351  03d8 89            	pushw	x
1352  03d9 ae0000        	ldw	x,#_text
1353  03dc cd0000        	call	_sprintf
1355  03df 5b04          	addw	sp,#4
1356                     ; 252 			lcd_gotoxy(0,1); 
1358  03e1 ae0001        	ldw	x,#1
1359  03e4 cd0000        	call	_lcd_gotoxy
1361                     ; 253 			lcd_puts(text);
1363  03e7 ae0000        	ldw	x,#_text
1364  03ea cd0000        	call	_lcd_puts
1366                     ; 254 			tlacitko();
1368  03ed cd05f4        	call	_tlacitko
1370                     ; 255 			process_enc();
1372  03f0 cd06a4        	call	_process_enc
1374                     ; 256 			servo_manual();
1376  03f3 cd0942        	call	_servo_manual
1378                     ; 257 			break;
1380  03f6 ac3f023f      	jpf	L112
1381  03fa               L771:
1382                     ; 259 		case stav_sleep:
1382                     ; 260 			lcd_off;
1384  03fa 4b04          	push	#4
1385  03fc ae501e        	ldw	x,#20510
1386  03ff cd0000        	call	_GPIO_WriteLow
1388  0402 84            	pop	a
1389                     ; 261 			servo_off;
1392  0403 4b08          	push	#8
1393  0405 ae501e        	ldw	x,#20510
1394  0408 cd0000        	call	_GPIO_WriteLow
1396  040b 84            	pop	a
1397                     ; 262 			foto1_off;
1400  040c 4b40          	push	#64
1401  040e ae500f        	ldw	x,#20495
1402  0411 cd0000        	call	_GPIO_WriteLow
1404  0414 84            	pop	a
1405                     ; 263 			foto2_off;
1408  0415 4b20          	push	#32
1409  0417 ae500f        	ldw	x,#20495
1410  041a cd0000        	call	_GPIO_WriteLow
1412  041d 84            	pop	a
1413                     ; 264 			halt();
1417  041e 8e            halt
1419                     ; 265 			break;
1422  041f ac3f023f      	jpf	L112
1423  0423               L712:
1425  0423 ac3f023f      	jpf	L112
1454                     ; 271 void voltage(void){
1455                     	switch	.text
1456  0427               _voltage:
1460                     ; 272 	if(milis() - volt_time >= 1000){
1462  0427 cd0000        	call	_milis
1464  042a 72b00042      	subw	x,_volt_time
1465  042e a303e8        	cpw	x,#1000
1466  0431 2544          	jrult	L772
1467                     ; 273 			volt_time=milis();
1469  0433 cd0000        	call	_milis
1471  0436 bf42          	ldw	_volt_time,x
1472                     ; 274 			volt=(slot*5)/1024;//hodnota jednotek volt
1474  0438 be60          	ldw	x,_slot
1475  043a a605          	ld	a,#5
1476  043c cd0000        	call	c_bmulx
1478  043f 4f            	clr	a
1479  0440 01            	rrwa	x,a
1480  0441 54            	srlw	x
1481  0442 54            	srlw	x
1482  0443 bf5a          	ldw	_volt,x
1483                     ; 275 			volt1=(slot*5)%1024/10;//hodnota setin volt
1485  0445 be60          	ldw	x,_slot
1486  0447 a605          	ld	a,#5
1487  0449 cd0000        	call	c_bmulx
1489  044c 01            	rrwa	x,a
1490  044d a4ff          	and	a,#255
1491  044f 01            	rrwa	x,a
1492  0450 a403          	and	a,#3
1493  0452 01            	rrwa	x,a
1494  0453 a60a          	ld	a,#10
1495  0455 62            	div	x,a
1496  0456 bf52          	ldw	_volt1,x
1497                     ; 276 			volt=(volt*100)+volt1;//hodnota v setinách volt(100mv)
1499  0458 be5a          	ldw	x,_volt
1500  045a a664          	ld	a,#100
1501  045c cd0000        	call	c_bmulx
1503  045f 72bb0052      	addw	x,_volt1
1504  0463 bf5a          	ldw	_volt,x
1505                     ; 277 			y=(420-volt);//dosazení do trojèlenky pro zisk procentuální hodnoty
1507  0465 ae01a4        	ldw	x,#420
1508  0468 72b0005a      	subw	x,_volt
1509  046c bf50          	ldw	_y,x
1510                     ; 278 			y=100-y;
1512  046e ae0064        	ldw	x,#100
1513  0471 72b00050      	subw	x,_y
1514  0475 bf50          	ldw	_y,x
1515  0477               L772:
1516                     ; 289 }
1519  0477 81            	ret
1551                     ; 291 void power(void){
1552                     	switch	.text
1553  0478               _power:
1557                     ; 292 	if(milis()-bat_time >= 1000){
1559  0478 cd0000        	call	_milis
1561  047b 72b00046      	subw	x,_bat_time
1562  047f a303e8        	cpw	x,#1000
1563  0482 2507          	jrult	L113
1564                     ; 293 		pocitadlo++;
1566  0484 3c70          	inc	_pocitadlo
1567                     ; 294 		bat_time=milis();
1569  0486 cd0000        	call	_milis
1571  0489 bf46          	ldw	_bat_time,x
1572  048b               L113:
1573                     ; 296 	if(pocitadlo==2){
1575  048b b670          	ld	a,_pocitadlo
1576  048d a102          	cp	a,#2
1577  048f 2612          	jrne	L313
1578                     ; 297 		bat_off;
1580  0491 4b80          	push	#128
1581  0493 ae501e        	ldw	x,#20510
1582  0496 cd0000        	call	_GPIO_WriteLow
1584  0499 84            	pop	a
1585                     ; 298 		pocitadlo=0;
1588  049a 3f70          	clr	_pocitadlo
1589                     ; 299 		slot = ADC_get(ADC2_CHANNEL_4);
1591  049c a604          	ld	a,#4
1592  049e cd0000        	call	_ADC_get
1594  04a1 bf60          	ldw	_slot,x
1595  04a3               L313:
1596                     ; 301 	if(slot > 600 && slot < 855){
1598  04a3 be60          	ldw	x,_slot
1599  04a5 a30259        	cpw	x,#601
1600  04a8 251f          	jrult	L513
1602  04aa be60          	ldw	x,_slot
1603  04ac a30357        	cpw	x,#855
1604  04af 2418          	jruge	L513
1605                     ; 302 		if(volno=0){
1607  04b1 3f6f          	clr	_volno
1608  04b3 3d6f          	tnz	_volno
1609  04b5 2709          	jreq	L713
1610                     ; 303 			lcd_clear();
1612  04b7 a601          	ld	a,#1
1613  04b9 cd0000        	call	_lcd_command
1615                     ; 304 			volno=1;
1617  04bc 3501006f      	mov	_volno,#1
1618  04c0               L713:
1619                     ; 306 		bat_on;
1621  04c0 4b80          	push	#128
1622  04c2 ae501e        	ldw	x,#20510
1623  04c5 cd0000        	call	_GPIO_WriteHigh
1625  04c8 84            	pop	a
1627  04c9               L513:
1628                     ; 308 	if(slot > 865){
1630  04c9 be60          	ldw	x,_slot
1631  04cb a30362        	cpw	x,#866
1632  04ce 2510          	jrult	L123
1633                     ; 309 		volno=0;
1635  04d0 3f6f          	clr	_volno
1636                     ; 310 		bat_off;
1638  04d2 4b80          	push	#128
1639  04d4 ae501e        	ldw	x,#20510
1640  04d7 cd0000        	call	_GPIO_WriteLow
1642  04da 84            	pop	a
1643                     ; 311 		slot=420;
1646  04db ae01a4        	ldw	x,#420
1647  04de bf60          	ldw	_slot,x
1648  04e0               L123:
1649                     ; 313 	if(slot < 600){
1651  04e0 be60          	ldw	x,_slot
1652  04e2 a30258        	cpw	x,#600
1653  04e5 2410          	jruge	L323
1654                     ; 314 		volno=0;
1656  04e7 3f6f          	clr	_volno
1657                     ; 315 		bat_off;
1659  04e9 4b80          	push	#128
1660  04eb ae501e        	ldw	x,#20510
1661  04ee cd0000        	call	_GPIO_WriteLow
1663  04f1 84            	pop	a
1664                     ; 316 		slot=420;
1667  04f2 ae01a4        	ldw	x,#420
1668  04f5 bf60          	ldw	_slot,x
1669  04f7               L323:
1670                     ; 318 	if(slot >= 860){
1672  04f7 be60          	ldw	x,_slot
1673  04f9 a3035c        	cpw	x,#860
1674  04fc 250e          	jrult	L523
1675                     ; 319 		bat_off;
1677  04fe 4b80          	push	#128
1678  0500 ae501e        	ldw	x,#20510
1679  0503 cd0000        	call	_GPIO_WriteLow
1681  0506 84            	pop	a
1682                     ; 320 		slot=420;
1685  0507 ae01a4        	ldw	x,#420
1686  050a bf60          	ldw	_slot,x
1687  050c               L523:
1688                     ; 322 }
1691  050c 81            	ret
1694                     	bsct
1695  007a               L723_bat_icon_time:
1696  007a 0000          	dc.w	0
1697  007c               L133_p:
1698  007c 00            	dc.b	0
1743                     ; 325 void blick_bat(void){
1744                     	switch	.text
1745  050d               _blick_bat:
1749                     ; 330 if(milis()-bat_icon_time >= 500 && p==0){
1751  050d cd0000        	call	_milis
1753  0510 72b0007a      	subw	x,L723_bat_icon_time
1754  0514 a301f4        	cpw	x,#500
1755  0517 2519          	jrult	L553
1757  0519 3d7c          	tnz	L133_p
1758  051b 2615          	jrne	L553
1759                     ; 331 	lcd_gotoxy(0,lcd_sloupec); 
1761  051d b664          	ld	a,_lcd_sloupec
1762  051f 5f            	clrw	x
1763  0520 97            	ld	xl,a
1764  0521 cd0000        	call	_lcd_gotoxy
1766                     ; 332 	lcd_putchar(1);
1768  0524 a601          	ld	a,#1
1769  0526 cd0000        	call	_lcd_data
1771                     ; 333 	bat_icon_time=milis();
1773  0529 cd0000        	call	_milis
1775  052c bf7a          	ldw	L723_bat_icon_time,x
1776                     ; 334 	p=1;
1778  052e 3501007c      	mov	L133_p,#1
1779  0532               L553:
1780                     ; 337 if(milis()-bat_icon_time >= 500 && p==1){
1782  0532 cd0000        	call	_milis
1784  0535 72b0007a      	subw	x,L723_bat_icon_time
1785  0539 a301f4        	cpw	x,#500
1786  053c 251b          	jrult	L753
1788  053e b67c          	ld	a,L133_p
1789  0540 a101          	cp	a,#1
1790  0542 2615          	jrne	L753
1791                     ; 338 	lcd_gotoxy(0,lcd_sloupec); 
1793  0544 b664          	ld	a,_lcd_sloupec
1794  0546 5f            	clrw	x
1795  0547 97            	ld	xl,a
1796  0548 cd0000        	call	_lcd_gotoxy
1798                     ; 339 	lcd_putchar(2);
1800  054b a602          	ld	a,#2
1801  054d cd0000        	call	_lcd_data
1803                     ; 340 	bat_icon_time=milis();
1805  0550 cd0000        	call	_milis
1807  0553 bf7a          	ldw	L723_bat_icon_time,x
1808                     ; 341 	p=2;
1810  0555 3502007c      	mov	L133_p,#2
1811  0559               L753:
1812                     ; 344 if(milis()-bat_icon_time >= 500 && p==2){
1814  0559 cd0000        	call	_milis
1816  055c 72b0007a      	subw	x,L723_bat_icon_time
1817  0560 a301f4        	cpw	x,#500
1818  0563 251b          	jrult	L163
1820  0565 b67c          	ld	a,L133_p
1821  0567 a102          	cp	a,#2
1822  0569 2615          	jrne	L163
1823                     ; 345 	lcd_gotoxy(0,lcd_sloupec); 
1825  056b b664          	ld	a,_lcd_sloupec
1826  056d 5f            	clrw	x
1827  056e 97            	ld	xl,a
1828  056f cd0000        	call	_lcd_gotoxy
1830                     ; 346 	lcd_putchar(3);
1832  0572 a603          	ld	a,#3
1833  0574 cd0000        	call	_lcd_data
1835                     ; 347 	bat_icon_time=milis();
1837  0577 cd0000        	call	_milis
1839  057a bf7a          	ldw	L723_bat_icon_time,x
1840                     ; 348 	p=3;
1842  057c 3503007c      	mov	L133_p,#3
1843  0580               L163:
1844                     ; 351 if(milis()-bat_icon_time >= 500 && p==3){
1846  0580 cd0000        	call	_milis
1848  0583 72b0007a      	subw	x,L723_bat_icon_time
1849  0587 a301f4        	cpw	x,#500
1850  058a 251b          	jrult	L363
1852  058c b67c          	ld	a,L133_p
1853  058e a103          	cp	a,#3
1854  0590 2615          	jrne	L363
1855                     ; 352 	lcd_gotoxy(0,lcd_sloupec); 
1857  0592 b664          	ld	a,_lcd_sloupec
1858  0594 5f            	clrw	x
1859  0595 97            	ld	xl,a
1860  0596 cd0000        	call	_lcd_gotoxy
1862                     ; 353 	lcd_putchar(4);
1864  0599 a604          	ld	a,#4
1865  059b cd0000        	call	_lcd_data
1867                     ; 354 	bat_icon_time=milis();
1869  059e cd0000        	call	_milis
1871  05a1 bf7a          	ldw	L723_bat_icon_time,x
1872                     ; 355 	p=4;
1874  05a3 3504007c      	mov	L133_p,#4
1875  05a7               L363:
1876                     ; 358 if(milis()-bat_icon_time >= 500 && p==4){
1878  05a7 cd0000        	call	_milis
1880  05aa 72b0007a      	subw	x,L723_bat_icon_time
1881  05ae a301f4        	cpw	x,#500
1882  05b1 2519          	jrult	L563
1884  05b3 b67c          	ld	a,L133_p
1885  05b5 a104          	cp	a,#4
1886  05b7 2613          	jrne	L563
1887                     ; 359 	lcd_gotoxy(0,lcd_sloupec); 
1889  05b9 b664          	ld	a,_lcd_sloupec
1890  05bb 5f            	clrw	x
1891  05bc 97            	ld	xl,a
1892  05bd cd0000        	call	_lcd_gotoxy
1894                     ; 360 	lcd_putchar(5);
1896  05c0 a605          	ld	a,#5
1897  05c2 cd0000        	call	_lcd_data
1899                     ; 361 	bat_icon_time=milis();
1901  05c5 cd0000        	call	_milis
1903  05c8 bf7a          	ldw	L723_bat_icon_time,x
1904                     ; 362 	p=0;
1906  05ca 3f7c          	clr	L133_p
1907  05cc               L563:
1908                     ; 364 }
1911  05cc 81            	ret
1936                     ; 367 void tlacitko_sleep(void){
1937                     	switch	.text
1938  05cd               _tlacitko_sleep:
1942                     ; 368 	if(GPIO_ReadInputPin(GPIOE,GPIO_PIN_4) == RESET && last_sleep==1){
1944  05cd 4b10          	push	#16
1945  05cf ae5014        	ldw	x,#20500
1946  05d2 cd0000        	call	_GPIO_ReadInputPin
1948  05d5 5b01          	addw	sp,#1
1949  05d7 4d            	tnz	a
1950  05d8 2608          	jrne	L773
1952  05da b677          	ld	a,_last_sleep
1953  05dc a101          	cp	a,#1
1954  05de 2602          	jrne	L773
1955                     ; 369 		last_sleep=0;
1957  05e0 3f77          	clr	_last_sleep
1958  05e2               L773:
1959                     ; 371 	if(GPIO_ReadInputPin(GPIOE,GPIO_PIN_4) != RESET){
1961  05e2 4b10          	push	#16
1962  05e4 ae5014        	ldw	x,#20500
1963  05e7 cd0000        	call	_GPIO_ReadInputPin
1965  05ea 5b01          	addw	sp,#1
1966  05ec 4d            	tnz	a
1967  05ed 2704          	jreq	L104
1968                     ; 372 		last_sleep= 1;
1970  05ef 35010077      	mov	_last_sleep,#1
1971  05f3               L104:
1972                     ; 374 }
1975  05f3 81            	ret
2004                     ; 377 void tlacitko(void){
2005                     	switch	.text
2006  05f4               _tlacitko:
2010                     ; 378 	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_0) == RESET && last==1){
2012  05f4 4b01          	push	#1
2013  05f6 ae5005        	ldw	x,#20485
2014  05f9 cd0000        	call	_GPIO_ReadInputPin
2016  05fc 5b01          	addw	sp,#1
2017  05fe 4d            	tnz	a
2018  05ff 2703          	jreq	L43
2019  0601 cc068f        	jp	L314
2020  0604               L43:
2022  0604 be4c          	ldw	x,_last
2023  0606 a30001        	cpw	x,#1
2024  0609 26f6          	jrne	L314
2025                     ; 379 		last=0;
2027  060b 5f            	clrw	x
2028  060c bf4c          	ldw	_last,x
2029                     ; 380 		if(stav==1){
2031  060e b669          	ld	a,_stav
2032  0610 a101          	cp	a,#1
2033  0612 260d          	jrne	L514
2034                     ; 381 			stav=stav_menu;
2036  0614 35020069      	mov	_stav,#2
2037                     ; 382 			lcd_clear();
2039  0618 a601          	ld	a,#1
2040  061a cd0000        	call	_lcd_command
2042                     ; 383 			kontrola=1;
2044  061d 35010066      	mov	_kontrola,#1
2045  0621               L514:
2046                     ; 385 		if(stav==2 && encoder==0 && kontrola==0){
2048  0621 b669          	ld	a,_stav
2049  0623 a102          	cp	a,#2
2050  0625 2615          	jrne	L714
2052  0627 be78          	ldw	x,_encoder
2053  0629 2611          	jrne	L714
2055  062b 3d66          	tnz	_kontrola
2056  062d 260d          	jrne	L714
2057                     ; 386 			stav=stav_manual;
2059  062f 35030069      	mov	_stav,#3
2060                     ; 387 			lcd_clear();
2062  0633 a601          	ld	a,#1
2063  0635 cd0000        	call	_lcd_command
2065                     ; 388 			kontrola=1;
2067  0638 35010066      	mov	_kontrola,#1
2068  063c               L714:
2069                     ; 390 		if(stav==2 && encoder==1 && kontrola==0){
2071  063c b669          	ld	a,_stav
2072  063e a102          	cp	a,#2
2073  0640 2618          	jrne	L124
2075  0642 be78          	ldw	x,_encoder
2076  0644 a30001        	cpw	x,#1
2077  0647 2611          	jrne	L124
2079  0649 3d66          	tnz	_kontrola
2080  064b 260d          	jrne	L124
2081                     ; 391 			stav=stav_display;
2083  064d 35010069      	mov	_stav,#1
2084                     ; 392 			lcd_clear();
2086  0651 a601          	ld	a,#1
2087  0653 cd0000        	call	_lcd_command
2089                     ; 393 			kontrola=1;
2091  0656 35010066      	mov	_kontrola,#1
2092  065a               L124:
2093                     ; 395 		if(stav==2 && encoder==2 && kontrola==0){
2095  065a b669          	ld	a,_stav
2096  065c a102          	cp	a,#2
2097  065e 2618          	jrne	L324
2099  0660 be78          	ldw	x,_encoder
2100  0662 a30002        	cpw	x,#2
2101  0665 2611          	jrne	L324
2103  0667 3d66          	tnz	_kontrola
2104  0669 260d          	jrne	L324
2105                     ; 396 			stav=stav_sleep;
2107  066b 35040069      	mov	_stav,#4
2108                     ; 397 			lcd_clear();
2110  066f a601          	ld	a,#1
2111  0671 cd0000        	call	_lcd_command
2113                     ; 398 			kontrola=1;
2115  0674 35010066      	mov	_kontrola,#1
2116  0678               L324:
2117                     ; 400 		if(stav==3 && kontrola==0){
2119  0678 b669          	ld	a,_stav
2120  067a a103          	cp	a,#3
2121  067c 2611          	jrne	L314
2123  067e 3d66          	tnz	_kontrola
2124  0680 260d          	jrne	L314
2125                     ; 401 			stav=stav_menu;
2127  0682 35020069      	mov	_stav,#2
2128                     ; 402 			lcd_clear();
2130  0686 a601          	ld	a,#1
2131  0688 cd0000        	call	_lcd_command
2133                     ; 403 			kontrola=1;
2135  068b 35010066      	mov	_kontrola,#1
2136  068f               L314:
2137                     ; 406 	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_0) != RESET){
2139  068f 4b01          	push	#1
2140  0691 ae5005        	ldw	x,#20485
2141  0694 cd0000        	call	_GPIO_ReadInputPin
2143  0697 5b01          	addw	sp,#1
2144  0699 4d            	tnz	a
2145  069a 2707          	jreq	L724
2146                     ; 407 	last = 1;
2148  069c ae0001        	ldw	x,#1
2149  069f bf4c          	ldw	_last,x
2150                     ; 408 	kontrola=0;//pøeskoèí zbylé podmínky 
2152  06a1 3f66          	clr	_kontrola
2153  06a3               L724:
2154                     ; 410 }
2157  06a3 81            	ret
2188                     ; 413 void process_enc(void){
2189                     	switch	.text
2190  06a4               _process_enc:
2194                     ; 414 	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) == RESET && minule==1){
2196  06a4 4b04          	push	#4
2197  06a6 ae5005        	ldw	x,#20485
2198  06a9 cd0000        	call	_GPIO_ReadInputPin
2200  06ac 5b01          	addw	sp,#1
2201  06ae 4d            	tnz	a
2202  06af 2663          	jrne	L144
2204  06b1 be4a          	ldw	x,_minule
2205  06b3 a30001        	cpw	x,#1
2206  06b6 265c          	jrne	L144
2207                     ; 415 		minule = 0; 
2209  06b8 5f            	clrw	x
2210  06b9 bf4a          	ldw	_minule,x
2211                     ; 417 		if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_3) == RESET){
2213  06bb 4b08          	push	#8
2214  06bd ae5005        	ldw	x,#20485
2215  06c0 cd0000        	call	_GPIO_ReadInputPin
2217  06c3 5b01          	addw	sp,#1
2218  06c5 4d            	tnz	a
2219  06c6 2623          	jrne	L344
2220                     ; 418 			encoder++;
2222  06c8 be78          	ldw	x,_encoder
2223  06ca 1c0001        	addw	x,#1
2224  06cd bf78          	ldw	_encoder,x
2225                     ; 419 			run=1;
2227  06cf 35010067      	mov	_run,#1
2228                     ; 420 			if(stav==2){lcd_clear();}
2230  06d3 b669          	ld	a,_stav
2231  06d5 a102          	cp	a,#2
2232  06d7 2605          	jrne	L544
2235  06d9 a601          	ld	a,#1
2236  06db cd0000        	call	_lcd_command
2238  06de               L544:
2239                     ; 421 			if(stav==3){last_time=milis();}
2241  06de b669          	ld	a,_stav
2242  06e0 a103          	cp	a,#3
2243  06e2 2628          	jrne	L154
2246  06e4 cd0000        	call	_milis
2248  06e7 bf40          	ldw	_last_time,x
2249  06e9 2021          	jra	L154
2250  06eb               L344:
2251                     ; 423 			encoder--;
2253  06eb be78          	ldw	x,_encoder
2254  06ed 1d0001        	subw	x,#1
2255  06f0 bf78          	ldw	_encoder,x
2256                     ; 424 			run=2;
2258  06f2 35020067      	mov	_run,#2
2259                     ; 425 			if(stav==2){lcd_clear();}
2261  06f6 b669          	ld	a,_stav
2262  06f8 a102          	cp	a,#2
2263  06fa 2605          	jrne	L354
2266  06fc a601          	ld	a,#1
2267  06fe cd0000        	call	_lcd_command
2269  0701               L354:
2270                     ; 426 			if(stav==3){last_time=milis();}
2272  0701 b669          	ld	a,_stav
2273  0703 a103          	cp	a,#3
2274  0705 2605          	jrne	L154
2277  0707 cd0000        	call	_milis
2279  070a bf40          	ldw	_last_time,x
2280  070c               L154:
2281                     ; 428 		if(encoder < 0){encoder=0;}
2283  070c 9c            	rvf
2284  070d be78          	ldw	x,_encoder
2285  070f 2e03          	jrsge	L144
2288  0711 5f            	clrw	x
2289  0712 bf78          	ldw	_encoder,x
2290  0714               L144:
2291                     ; 430 	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) != RESET){minule = 1;} 
2293  0714 4b04          	push	#4
2294  0716 ae5005        	ldw	x,#20485
2295  0719 cd0000        	call	_GPIO_ReadInputPin
2297  071c 5b01          	addw	sp,#1
2298  071e 4d            	tnz	a
2299  071f 2705          	jreq	L164
2302  0721 ae0001        	ldw	x,#1
2303  0724 bf4a          	ldw	_minule,x
2304  0726               L164:
2305                     ; 431 	}
2308  0726 81            	ret
2340                     ; 434 void servo_auto(void){
2341                     	switch	.text
2342  0727               _servo_auto:
2346                     ; 435 	if(milis()- foto_time >= 100){
2348  0727 cd0000        	call	_milis
2350  072a 72b00044      	subw	x,_foto_time
2351  072e a30064        	cpw	x,#100
2352  0731 2540          	jrult	L374
2353                     ; 436 		left = ADC_get(ADC2_CHANNEL_6);
2355  0733 a606          	ld	a,#6
2356  0735 cd0000        	call	_ADC_get
2358  0738 bf56          	ldw	_left,x
2359                     ; 437 		right = ADC_get(ADC2_CHANNEL_7);
2361  073a a607          	ld	a,#7
2362  073c cd0000        	call	_ADC_get
2364  073f bf58          	ldw	_right,x
2365                     ; 439 		if(right+40 > left && right-40 > left){//do prava
2367  0741 be58          	ldw	x,_right
2368  0743 1c0028        	addw	x,#40
2369  0746 b356          	cpw	x,_left
2370  0748 230f          	jrule	L574
2372  074a be58          	ldw	x,_right
2373  074c 1d0028        	subw	x,#40
2374  074f b356          	cpw	x,_left
2375  0751 2306          	jrule	L574
2376                     ; 440 			turn=1;
2378  0753 35010068      	mov	_turn,#1
2380  0757 201a          	jra	L374
2381  0759               L574:
2382                     ; 442 		else if(left+40 > right && left-40 > right){//do leva
2384  0759 be56          	ldw	x,_left
2385  075b 1c0028        	addw	x,#40
2386  075e b358          	cpw	x,_right
2387  0760 230f          	jrule	L105
2389  0762 be56          	ldw	x,_left
2390  0764 1d0028        	subw	x,#40
2391  0767 b358          	cpw	x,_right
2392  0769 2306          	jrule	L105
2393                     ; 443 			turn=2;
2395  076b 35020068      	mov	_turn,#2
2397  076f 2002          	jra	L374
2398  0771               L105:
2399                     ; 446 			turn=0;
2401  0771 3f68          	clr	_turn
2402  0773               L374:
2403                     ; 449 	if(turn==1 && block==1){//pravo
2405  0773 b668          	ld	a,_turn
2406  0775 a101          	cp	a,#1
2407  0777 260c          	jrne	L505
2409  0779 b66b          	ld	a,_block
2410  077b a101          	cp	a,#1
2411  077d 2606          	jrne	L505
2412                     ; 450 		TIM2_SetCompare1(1551); 
2414  077f ae060f        	ldw	x,#1551
2415  0782 cd0000        	call	_TIM2_SetCompare1
2417  0785               L505:
2418                     ; 452 	if(turn==2 && block==2){//levo
2420  0785 b668          	ld	a,_turn
2421  0787 a102          	cp	a,#2
2422  0789 260c          	jrne	L705
2424  078b b66b          	ld	a,_block
2425  078d a102          	cp	a,#2
2426  078f 2606          	jrne	L705
2427                     ; 453 		TIM2_SetCompare1(1430); 
2429  0791 ae0596        	ldw	x,#1430
2430  0794 cd0000        	call	_TIM2_SetCompare1
2432  0797               L705:
2433                     ; 455 	if(turn==0){
2435  0797 3d68          	tnz	_turn
2436  0799 2604          	jrne	L115
2437                     ; 456 		TIM2_SetCompare1(0); 
2439  079b 5f            	clrw	x
2440  079c cd0000        	call	_TIM2_SetCompare1
2442  079f               L115:
2443                     ; 458 	optic_gate();
2445  079f ad01          	call	_optic_gate
2447                     ; 459 }
2450  07a1 81            	ret
2484                     ; 463 void optic_gate(void){
2485                     	switch	.text
2486  07a2               _optic_gate:
2490                     ; 464 	gate_prevod = ADC_get(ADC2_CHANNEL_1);
2492  07a2 a601          	ld	a,#1
2493  07a4 cd0000        	call	_ADC_get
2495  07a7 bf5e          	ldw	_gate_prevod,x
2496                     ; 465 	if(gate_prevod <= 300 && block==0){
2498  07a9 be5e          	ldw	x,_gate_prevod
2499  07ab a3012d        	cpw	x,#301
2500  07ae 240a          	jruge	L335
2502  07b0 3d6b          	tnz	_block
2503  07b2 2606          	jrne	L335
2504                     ; 466 		gate++;
2506  07b4 3c6d          	inc	_gate
2507                     ; 467 		block=1;
2509  07b6 3501006b      	mov	_block,#1
2510  07ba               L335:
2511                     ; 469 	if(gate_prevod >= 350){
2513  07ba be5e          	ldw	x,_gate_prevod
2514  07bc a3015e        	cpw	x,#350
2515  07bf 2504          	jrult	L535
2516                     ; 470 		block=0;
2518  07c1 3f6b          	clr	_block
2519                     ; 471 		blokada=0;
2521  07c3 3f6e          	clr	_blokada
2522  07c5               L535:
2523                     ; 473 	if(blokada==1){gate=0;}
2525  07c5 b66e          	ld	a,_blokada
2526  07c7 a101          	cp	a,#1
2527  07c9 2602          	jrne	L735
2530  07cb 3f6d          	clr	_gate
2531  07cd               L735:
2532                     ; 476 	switch(stav_servo){
2534  07cd b66a          	ld	a,_stav_servo
2536                     ; 560 			break;
2537  07cf 4a            	dec	a
2538  07d0 2716          	jreq	L315
2539  07d2 4a            	dec	a
2540  07d3 2603          	jrne	L44
2541  07d5 cc0872        	jp	L515
2542  07d8               L44:
2543  07d8 4a            	dec	a
2544  07d9 2603          	jrne	L64
2545  07db cc08c1        	jp	L715
2546  07de               L64:
2547  07de 4a            	dec	a
2548  07df 2603          	jrne	L05
2549  07e1 cc0909        	jp	L125
2550  07e4               L05:
2551  07e4 ac410941      	jpf	L345
2552  07e8               L315:
2553                     ; 477 		case nic:
2553                     ; 478 			
2553                     ; 479 				left = ADC_get(ADC2_CHANNEL_6);
2555  07e8 a606          	ld	a,#6
2556  07ea cd0000        	call	_ADC_get
2558  07ed bf56          	ldw	_left,x
2559                     ; 480 				right = ADC_get(ADC2_CHANNEL_7);
2561  07ef a607          	ld	a,#7
2562  07f1 cd0000        	call	_ADC_get
2564  07f4 bf58          	ldw	_right,x
2565                     ; 482 				if(right+40 > left && right-40 > left){//do prava
2567  07f6 be58          	ldw	x,_right
2568  07f8 1c0028        	addw	x,#40
2569  07fb b356          	cpw	x,_left
2570  07fd 230f          	jrule	L545
2572  07ff be58          	ldw	x,_right
2573  0801 1d0028        	subw	x,#40
2574  0804 b356          	cpw	x,_left
2575  0806 2306          	jrule	L545
2576                     ; 483 					turn=1;
2578  0808 35010068      	mov	_turn,#1
2580  080c 201a          	jra	L745
2581  080e               L545:
2582                     ; 485 				else if(left+40 > right && left-40 > right){//do leva
2584  080e be56          	ldw	x,_left
2585  0810 1c0028        	addw	x,#40
2586  0813 b358          	cpw	x,_right
2587  0815 230f          	jrule	L155
2589  0817 be56          	ldw	x,_left
2590  0819 1d0028        	subw	x,#40
2591  081c b358          	cpw	x,_right
2592  081e 2306          	jrule	L155
2593                     ; 486 					turn=2;
2595  0820 35020068      	mov	_turn,#2
2597  0824 2002          	jra	L745
2598  0826               L155:
2599                     ; 489 					turn=0;
2601  0826 3f68          	clr	_turn
2602  0828               L745:
2603                     ; 492 			if(turn==1){//pravo
2605  0828 b668          	ld	a,_turn
2606  082a a101          	cp	a,#1
2607  082c 2606          	jrne	L555
2608                     ; 493 				TIM2_SetCompare1(1551); 
2610  082e ae060f        	ldw	x,#1551
2611  0831 cd0000        	call	_TIM2_SetCompare1
2613  0834               L555:
2614                     ; 495 			if(turn==2){//levo
2616  0834 b668          	ld	a,_turn
2617  0836 a102          	cp	a,#2
2618  0838 2606          	jrne	L755
2619                     ; 496 				TIM2_SetCompare1(1430); 
2621  083a ae0596        	ldw	x,#1430
2622  083d cd0000        	call	_TIM2_SetCompare1
2624  0840               L755:
2625                     ; 498 			if(turn==0){
2627  0840 3d68          	tnz	_turn
2628  0842 2604          	jrne	L165
2629                     ; 499 				TIM2_SetCompare1(0); 
2631  0844 5f            	clrw	x
2632  0845 cd0000        	call	_TIM2_SetCompare1
2634  0848               L165:
2635                     ; 501 			if(turn==1 && gate==1){
2637  0848 b668          	ld	a,_turn
2638  084a a101          	cp	a,#1
2639  084c 260a          	jrne	L365
2641  084e b66d          	ld	a,_gate
2642  0850 a101          	cp	a,#1
2643  0852 2604          	jrne	L365
2644                     ; 502 				stav_servo=pravo;
2646  0854 3502006a      	mov	_stav_servo,#2
2647  0858               L365:
2648                     ; 504 			if(turn==2 && gate==1){
2650  0858 b668          	ld	a,_turn
2651  085a a102          	cp	a,#2
2652  085c 2703          	jreq	L25
2653  085e cc0941        	jp	L345
2654  0861               L25:
2656  0861 b66d          	ld	a,_gate
2657  0863 a101          	cp	a,#1
2658  0865 2703          	jreq	L45
2659  0867 cc0941        	jp	L345
2660  086a               L45:
2661                     ; 505 				stav_servo=levo;
2663  086a 3503006a      	mov	_stav_servo,#3
2664  086e ac410941      	jpf	L345
2665  0872               L515:
2666                     ; 509 		case pravo:
2666                     ; 510 			TIM2_SetCompare1(0);
2668  0872 5f            	clrw	x
2669  0873 cd0000        	call	_TIM2_SetCompare1
2671                     ; 512 				left = ADC_get(ADC2_CHANNEL_6);
2673  0876 a606          	ld	a,#6
2674  0878 cd0000        	call	_ADC_get
2676  087b bf56          	ldw	_left,x
2677                     ; 513 				right = ADC_get(ADC2_CHANNEL_7);
2679  087d a607          	ld	a,#7
2680  087f cd0000        	call	_ADC_get
2682  0882 bf58          	ldw	_right,x
2683                     ; 515 				if(right+150 > left && right-150 > left){//do prava
2685  0884 be58          	ldw	x,_right
2686  0886 1c0096        	addw	x,#150
2687  0889 b356          	cpw	x,_left
2688  088b 2311          	jrule	L765
2690  088d be58          	ldw	x,_right
2691  088f 1d0096        	subw	x,#150
2692  0892 b356          	cpw	x,_left
2693  0894 2308          	jrule	L765
2694                     ; 516 					stav_servo = presun;
2696  0896 3504006a      	mov	_stav_servo,#4
2697                     ; 517 					strana=1;
2699  089a 3501006c      	mov	_strana,#1
2700  089e               L765:
2701                     ; 519 				if(left+40 > right && left-40 > right){//do leva
2703  089e be56          	ldw	x,_left
2704  08a0 1c0028        	addw	x,#40
2705  08a3 b358          	cpw	x,_right
2706  08a5 2203          	jrugt	L65
2707  08a7 cc0941        	jp	L345
2708  08aa               L65:
2710  08aa be56          	ldw	x,_left
2711  08ac 1d0028        	subw	x,#40
2712  08af b358          	cpw	x,_right
2713  08b1 2203          	jrugt	L06
2714  08b3 cc0941        	jp	L345
2715  08b6               L06:
2716                     ; 520 					stav_servo = nic;
2718  08b6 3501006a      	mov	_stav_servo,#1
2719                     ; 521 					blokada=1;
2721  08ba 3501006e      	mov	_blokada,#1
2722  08be cc0941        	jra	L345
2723  08c1               L715:
2724                     ; 526 		case levo:
2724                     ; 527 			TIM2_SetCompare1(0);
2726  08c1 5f            	clrw	x
2727  08c2 cd0000        	call	_TIM2_SetCompare1
2729                     ; 529 				left = ADC_get(ADC2_CHANNEL_6);
2731  08c5 a606          	ld	a,#6
2732  08c7 cd0000        	call	_ADC_get
2734  08ca bf56          	ldw	_left,x
2735                     ; 530 				right = ADC_get(ADC2_CHANNEL_7);
2737  08cc a607          	ld	a,#7
2738  08ce cd0000        	call	_ADC_get
2740  08d1 bf58          	ldw	_right,x
2741                     ; 532 				if(right+40 > left && right-40 > left){//do prava
2743  08d3 be58          	ldw	x,_right
2744  08d5 1c0028        	addw	x,#40
2745  08d8 b356          	cpw	x,_left
2746  08da 2311          	jrule	L375
2748  08dc be58          	ldw	x,_right
2749  08de 1d0028        	subw	x,#40
2750  08e1 b356          	cpw	x,_left
2751  08e3 2308          	jrule	L375
2752                     ; 533 					stav_servo = nic;
2754  08e5 3501006a      	mov	_stav_servo,#1
2755                     ; 534 					blokada=1;
2757  08e9 3501006e      	mov	_blokada,#1
2758  08ed               L375:
2759                     ; 536 				if(left+150 > right && left-150 > right){//do leva
2761  08ed be56          	ldw	x,_left
2762  08ef 1c0096        	addw	x,#150
2763  08f2 b358          	cpw	x,_right
2764  08f4 234b          	jrule	L345
2766  08f6 be56          	ldw	x,_left
2767  08f8 1d0096        	subw	x,#150
2768  08fb b358          	cpw	x,_right
2769  08fd 2342          	jrule	L345
2770                     ; 537 					stav_servo = presun;
2772  08ff 3504006a      	mov	_stav_servo,#4
2773                     ; 538 					strana=2;
2775  0903 3502006c      	mov	_strana,#2
2776  0907 2038          	jra	L345
2777  0909               L125:
2778                     ; 543 		case presun:
2778                     ; 544 			if(strana==1){
2780  0909 b66c          	ld	a,_strana
2781  090b a101          	cp	a,#1
2782  090d 2616          	jrne	L775
2783                     ; 545 				TIM2_SetCompare1(1430); //do leva
2785  090f ae0596        	ldw	x,#1430
2786  0912 cd0000        	call	_TIM2_SetCompare1
2788                     ; 546 				if(gate==2){
2790  0915 b66d          	ld	a,_gate
2791  0917 a102          	cp	a,#2
2792  0919 260a          	jrne	L775
2793                     ; 547 					TIM2_SetCompare1(0); 
2795  091b 5f            	clrw	x
2796  091c cd0000        	call	_TIM2_SetCompare1
2798                     ; 548 					stav_servo = levo;
2800  091f 3503006a      	mov	_stav_servo,#3
2801                     ; 549 					gate=0;
2803  0923 3f6d          	clr	_gate
2804  0925               L775:
2805                     ; 552 			if(strana==2){
2807  0925 b66c          	ld	a,_strana
2808  0927 a102          	cp	a,#2
2809  0929 2616          	jrne	L345
2810                     ; 553 				TIM2_SetCompare1(1551); //do prava
2812  092b ae060f        	ldw	x,#1551
2813  092e cd0000        	call	_TIM2_SetCompare1
2815                     ; 554 				if(gate==2){
2817  0931 b66d          	ld	a,_gate
2818  0933 a102          	cp	a,#2
2819  0935 260a          	jrne	L345
2820                     ; 555 					TIM2_SetCompare1(0); 
2822  0937 5f            	clrw	x
2823  0938 cd0000        	call	_TIM2_SetCompare1
2825                     ; 556 					stav_servo = pravo;
2827  093b 3502006a      	mov	_stav_servo,#2
2828                     ; 557 					gate=0;
2830  093f 3f6d          	clr	_gate
2831  0941               L345:
2832                     ; 562 }
2835  0941 81            	ret
2862                     ; 566 void servo_manual(void){
2863                     	switch	.text
2864  0942               _servo_manual:
2868                     ; 567 	if(run==1){
2870  0942 b667          	ld	a,_run
2871  0944 a101          	cp	a,#1
2872  0946 2606          	jrne	L716
2873                     ; 568 		TIM2_SetCompare1(1430);
2875  0948 ae0596        	ldw	x,#1430
2876  094b cd0000        	call	_TIM2_SetCompare1
2878  094e               L716:
2879                     ; 570 	if(run==2){
2881  094e b667          	ld	a,_run
2882  0950 a102          	cp	a,#2
2883  0952 2606          	jrne	L126
2884                     ; 571 		TIM2_SetCompare1(1551);
2886  0954 ae060f        	ldw	x,#1551
2887  0957 cd0000        	call	_TIM2_SetCompare1
2889  095a               L126:
2890                     ; 573 	if(milis() - last_time >= 25){
2892  095a cd0000        	call	_milis
2894  095d 72b00040      	subw	x,_last_time
2895  0961 a30019        	cpw	x,#25
2896  0964 2506          	jrult	L326
2897                     ; 574 			run=0;
2899  0966 3f67          	clr	_run
2900                     ; 575 			TIM2_SetCompare1(0);
2902  0968 5f            	clrw	x
2903  0969 cd0000        	call	_TIM2_SetCompare1
2905  096c               L326:
2906                     ; 577 }
2909  096c 81            	ret
2936                     ; 580 void init_pwm(void){
2937                     	switch	.text
2938  096d               _init_pwm:
2942                     ; 581 TIM2_TimeBaseInit(TIM2_PRESCALER_16,19999);
2944  096d ae4e1f        	ldw	x,#19999
2945  0970 89            	pushw	x
2946  0971 a604          	ld	a,#4
2947  0973 cd0000        	call	_TIM2_TimeBaseInit
2949  0976 85            	popw	x
2950                     ; 583 TIM2_OC1Init( 	
2950                     ; 584 	TIM2_OCMODE_PWM1, 				
2950                     ; 585 	TIM2_OUTPUTSTATE_ENABLE,	
2950                     ; 586 	0,		
2950                     ; 587 	TIM2_OCPOLARITY_HIGH			
2950                     ; 588 	);
2952  0977 4b00          	push	#0
2953  0979 5f            	clrw	x
2954  097a 89            	pushw	x
2955  097b ae6011        	ldw	x,#24593
2956  097e cd0000        	call	_TIM2_OC1Init
2958  0981 5b03          	addw	sp,#3
2959                     ; 590 TIM2_OC1PreloadConfig(ENABLE);
2961  0983 a601          	ld	a,#1
2962  0985 cd0000        	call	_TIM2_OC1PreloadConfig
2964                     ; 591 TIM2_Cmd(ENABLE);
2966  0988 a601          	ld	a,#1
2967  098a cd0000        	call	_TIM2_Cmd
2969                     ; 592 }
2972  098d 81            	ret
3001                     ; 595 void ADC_init(void){
3002                     	switch	.text
3003  098e               _ADC_init:
3007                     ; 596 ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL1,DISABLE);//optická brána PB1
3009  098e ae0100        	ldw	x,#256
3010  0991 cd0000        	call	_ADC2_SchmittTriggerConfig
3012                     ; 597 ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL4,DISABLE);//Baterie 1
3014  0994 ae0400        	ldw	x,#1024
3015  0997 cd0000        	call	_ADC2_SchmittTriggerConfig
3017                     ; 598 ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL6,DISABLE);//levý foto PB6
3019  099a ae0600        	ldw	x,#1536
3020  099d cd0000        	call	_ADC2_SchmittTriggerConfig
3022                     ; 599 ADC2_SchmittTriggerConfig(ADC2_SCHMITTTRIG_CHANNEL7,DISABLE);//pravý foto PB7
3024  09a0 ae0700        	ldw	x,#1792
3025  09a3 cd0000        	call	_ADC2_SchmittTriggerConfig
3027                     ; 600 ADC2_PrescalerConfig(ADC2_PRESSEL_FCPU_D4);
3029  09a6 a620          	ld	a,#32
3030  09a8 cd0000        	call	_ADC2_PrescalerConfig
3032                     ; 601 ADC2_AlignConfig(ADC2_ALIGN_RIGHT);
3034  09ab a608          	ld	a,#8
3035  09ad cd0000        	call	_ADC2_AlignConfig
3037                     ; 602 ADC2_Select_Channel(ADC2_CHANNEL_6);
3039  09b0 a606          	ld	a,#6
3040  09b2 cd0000        	call	_ADC2_Select_Channel
3042                     ; 603 ADC2_Cmd(ENABLE);
3044  09b5 a601          	ld	a,#1
3045  09b7 cd0000        	call	_ADC2_Cmd
3047                     ; 604 ADC2_Startup_Wait();
3049  09ba cd0000        	call	_ADC2_Startup_Wait
3051                     ; 605 }
3054  09bd 81            	ret
3089                     ; 617 void assert_failed(u8* file, u32 line)
3089                     ; 618 { 
3090                     	switch	.text
3091  09be               _assert_failed:
3095  09be               L366:
3096  09be 20fe          	jra	L366
3481                     	xdef	_main
3482                     	xdef	f_AWU_IRQHandler
3483                     	xdef	f_EXTI_PORTE_IRQHandler
3484                     	switch	.ubsct
3485  0000               _text:
3486  0000 000000000000  	ds.b	24
3487                     	xdef	_text
3488                     	xdef	_encoder
3489                     	xdef	_last_sleep
3490                     	xdef	_wake
3491                     	xdef	_sleep
3492                     	xdef	_podminka2
3493                     	xdef	_podminka
3494                     	xdef	_spanek
3495                     	xdef	_zakaz
3496                     	xdef	_pocitadlo
3497                     	xdef	_volno
3498                     	xdef	_blokada
3499                     	xdef	_gate
3500                     	xdef	_strana
3501                     	xdef	_block
3502                     	xdef	_stav_servo
3503                     	xdef	_stav
3504                     	xdef	_turn
3505                     	xdef	_run
3506                     	xdef	_kontrola
3507                     	xdef	_pointer
3508                     	xdef	_lcd_sloupec
3509                     	xdef	_bat2
3510                     	xdef	_bat1
3511                     	xdef	_slot
3512                     	xdef	_gate_prevod
3513                     	xdef	_a
3514                     	xdef	_volt
3515                     	xdef	_right
3516                     	xdef	_left
3517                     	xdef	_prevod
3518                     	xdef	_volt1
3519                     	xdef	_y
3520                     	xdef	_x
3521                     	xdef	_last
3522                     	xdef	_minule
3523                     	xdef	_wake_time
3524                     	xdef	_bat_time
3525                     	xdef	_foto_time
3526                     	xdef	_volt_time
3527                     	xdef	_last_time
3528                     	xdef	_ADC_init
3529                     	xdef	_init_pwm
3530                     	xdef	_tlacitko_sleep
3531                     	xdef	_tlacitko
3532                     	xdef	_blick_bat
3533                     	xdef	_optic_gate
3534                     	xdef	_power
3535                     	xdef	_voltage
3536                     	xdef	_servo_auto
3537                     	xdef	_servo_manual
3538                     	xdef	_process_enc
3539                     	xdef	_battery_full
3540                     	xdef	_battery_full1
3541                     	xdef	_battery_low1
3542                     	xdef	_battery_low
3543                     	xdef	_battery
3544                     	xdef	_point
3545                     	xdef	_cross
3546                     	xdef	_time
3547                     	xref	_ADC2_Startup_Wait
3548                     	xref	_ADC2_AlignConfig
3549                     	xref	_ADC2_Select_Channel
3550                     	xref	_ADC_get
3551                     	xdef	_strcat
3552                     	xref	_sprintf
3553                     	xref	_lcd_store_symbol
3554                     	xref	_lcd_puts
3555                     	xref	_lcd_gotoxy
3556                     	xref	_lcd_init
3557                     	xref	_lcd_data
3558                     	xref	_lcd_command
3559                     	xref	_init_milis
3560                     	xref	_milis
3561                     	xdef	_assert_failed
3562                     	xref	_TIM2_SetCompare1
3563                     	xref	_TIM2_OC1PreloadConfig
3564                     	xref	_TIM2_Cmd
3565                     	xref	_TIM2_OC1Init
3566                     	xref	_TIM2_TimeBaseInit
3567                     	xref	_GPIO_ReadInputPin
3568                     	xref	_GPIO_WriteLow
3569                     	xref	_GPIO_WriteHigh
3570                     	xref	_GPIO_Init
3571                     	xref	_EXTI_SetTLISensitivity
3572                     	xref	_EXTI_SetExtIntSensitivity
3573                     	xref	_CLK_HSIPrescalerConfig
3574                     	xref	_AWU_GetFlagStatus
3575                     	xref	_AWU_LSICalibrationConfig
3576                     	xref	_AWU_Init
3577                     	xref	_ADC2_SchmittTriggerConfig
3578                     	xref	_ADC2_PrescalerConfig
3579                     	xref	_ADC2_Cmd
3580                     .const:	section	.text
3581  0000               L562:
3582  0000 537469736b20  	dc.b	"Stisk > exit",0
3583  000d               L362:
3584  000d 4e6173746176  	dc.b	"Nastavte pozici",0
3585  001d               L752:
3586  001d 536c65657000  	dc.b	"Sleep",0
3587  0023               L352:
3588  0023 4175746f6d61  	dc.b	"Automat",0
3589  002b               L152:
3590  002b 4d616e75616c  	dc.b	"Manual",0
3591  0032               L542:
3592  0032 2500          	dc.b	"%",0
3593  0034               L342:
3594  0034 4e616269746f  	dc.b	"Nabito %u",0
3595  003e               L532:
3596  003e 636879626920  	dc.b	"chybi baterie",0
3597  004c               L332:
3598  004c 257300        	dc.b	"%s",0
3599                     	xref.b	c_x
3600                     	xref.b	c_y
3620                     	xref	c_bmulx
3621                     	end
