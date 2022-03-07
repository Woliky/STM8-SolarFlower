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
 347  0042               _minule:
 348  0042 0001          	dc.w	1
 349  0044               _last:
 350  0044 0001          	dc.w	1
 351  0046               _x:
 352  0046 0046          	dc.w	70
 353  0048               _y:
 354  0048 00b4          	dc.w	180
 355  004a               _stav:
 356  004a 01            	dc.b	1
 357  004b               _bat1:
 358  004b 01            	dc.b	1
 359  004c               _bat2:
 360  004c 01            	dc.b	1
 361  004d               _lcd_sloupec:
 362  004d 00            	dc.b	0
 363  004e               _pointer:
 364  004e 00            	dc.b	0
 365  004f               _kontrola:
 366  004f 00            	dc.b	0
 367  0050               _encoder:
 368  0050 0000          	dc.w	0
 427                     ; 23 void main(void){
 428                     	switch	.text
 429  0048               _main:
 433                     ; 24 CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z interního RC oscilátoru
 435  0048 4f            	clr	a
 436  0049 cd0000        	call	_CLK_HSIPrescalerConfig
 438                     ; 26 init_milis(); // milis kvuli delay_ms()
 440  004c cd0000        	call	_init_milis
 442                     ; 27 lcd_init();		// inicializace displeje
 444  004f cd0000        	call	_lcd_init
 446                     ; 29 GPIO_Init(GPIOB,GPIO_PIN_2,GPIO_MODE_IN_PU_NO_IT);  // vstup, s vnitoním pullup rezistorem
 448  0052 4b40          	push	#64
 449  0054 4b04          	push	#4
 450  0056 ae5005        	ldw	x,#20485
 451  0059 cd0000        	call	_GPIO_Init
 453  005c 85            	popw	x
 454                     ; 30 GPIO_Init(GPIOB,GPIO_PIN_3,GPIO_MODE_IN_PU_NO_IT);
 456  005d 4b40          	push	#64
 457  005f 4b08          	push	#8
 458  0061 ae5005        	ldw	x,#20485
 459  0064 cd0000        	call	_GPIO_Init
 461  0067 85            	popw	x
 462                     ; 31 GPIO_Init(GPIOB,GPIO_PIN_0,GPIO_MODE_IN_PU_NO_IT);
 464  0068 4b40          	push	#64
 465  006a 4b01          	push	#1
 466  006c ae5005        	ldw	x,#20485
 467  006f cd0000        	call	_GPIO_Init
 469  0072 85            	popw	x
 470                     ; 33 lcd_store_symbol(0,time);
 472  0073 ae0000        	ldw	x,#_time
 473  0076 89            	pushw	x
 474  0077 4f            	clr	a
 475  0078 cd0000        	call	_lcd_store_symbol
 477  007b 85            	popw	x
 478                     ; 34 lcd_store_symbol(3,battery);
 480  007c ae0018        	ldw	x,#_battery
 481  007f 89            	pushw	x
 482  0080 a603          	ld	a,#3
 483  0082 cd0000        	call	_lcd_store_symbol
 485  0085 85            	popw	x
 486                     ; 35 lcd_store_symbol(1,battery_low);
 488  0086 ae0020        	ldw	x,#_battery_low
 489  0089 89            	pushw	x
 490  008a a601          	ld	a,#1
 491  008c cd0000        	call	_lcd_store_symbol
 493  008f 85            	popw	x
 494                     ; 36 lcd_store_symbol(2,battery_low1);
 496  0090 ae0028        	ldw	x,#_battery_low1
 497  0093 89            	pushw	x
 498  0094 a602          	ld	a,#2
 499  0096 cd0000        	call	_lcd_store_symbol
 501  0099 85            	popw	x
 502                     ; 37 lcd_store_symbol(4,battery_full1);
 504  009a ae0030        	ldw	x,#_battery_full1
 505  009d 89            	pushw	x
 506  009e a604          	ld	a,#4
 507  00a0 cd0000        	call	_lcd_store_symbol
 509  00a3 85            	popw	x
 510                     ; 38 lcd_store_symbol(5,battery_full);
 512  00a4 ae0038        	ldw	x,#_battery_full
 513  00a7 89            	pushw	x
 514  00a8 a605          	ld	a,#5
 515  00aa cd0000        	call	_lcd_store_symbol
 517  00ad 85            	popw	x
 518                     ; 39 lcd_store_symbol(6,cross);
 520  00ae ae0008        	ldw	x,#_cross
 521  00b1 89            	pushw	x
 522  00b2 a606          	ld	a,#6
 523  00b4 cd0000        	call	_lcd_store_symbol
 525  00b7 85            	popw	x
 526                     ; 40 lcd_store_symbol(7,point);
 528  00b8 ae0010        	ldw	x,#_point
 529  00bb 89            	pushw	x
 530  00bc a607          	ld	a,#7
 531  00be cd0000        	call	_lcd_store_symbol
 533  00c1 85            	popw	x
 534                     ; 42 lcd_clear();
 536  00c2 a601          	ld	a,#1
 537  00c4 cd0000        	call	_lcd_command
 539  00c7               L751:
 540                     ; 45 		switch(stav){
 542  00c7 b64a          	ld	a,_stav
 544                     ; 122 			break;
 545  00c9 4a            	dec	a
 546  00ca 270e          	jreq	L331
 547  00cc 4a            	dec	a
 548  00cd 2603          	jrne	L01
 549  00cf cc01ba        	jp	L531
 550  00d2               L01:
 551  00d2 4a            	dec	a
 552  00d3 2603          	jrne	L21
 553  00d5 cc0240        	jp	L731
 554  00d8               L21:
 555  00d8 20ed          	jra	L751
 556  00da               L331:
 557                     ; 46 			case stav_display:
 557                     ; 47 				//první slot pro baterii
 557                     ; 48 				if(bat1 == 0){
 559  00da 3d4b          	tnz	_bat1
 560  00dc 2632          	jrne	L761
 561                     ; 49 					sprintf(text,"%s","chybi baterie");
 563  00de ae002d        	ldw	x,#L371
 564  00e1 89            	pushw	x
 565  00e2 ae003b        	ldw	x,#L171
 566  00e5 89            	pushw	x
 567  00e6 ae0000        	ldw	x,#_text
 568  00e9 cd0000        	call	_sprintf
 570  00ec 5b04          	addw	sp,#4
 571                     ; 50 					lcd_gotoxy(3,0); 
 573  00ee ae0300        	ldw	x,#768
 574  00f1 cd0000        	call	_lcd_gotoxy
 576                     ; 51 					lcd_puts(text);
 578  00f4 ae0000        	ldw	x,#_text
 579  00f7 cd0000        	call	_lcd_puts
 581                     ; 53 					lcd_gotoxy(1,0); 
 583  00fa ae0100        	ldw	x,#256
 584  00fd cd0000        	call	_lcd_gotoxy
 586                     ; 54 					lcd_putchar(6);
 588  0100 a606          	ld	a,#6
 589  0102 cd0000        	call	_lcd_data
 591                     ; 55 					lcd_gotoxy(0,0); 
 593  0105 5f            	clrw	x
 594  0106 cd0000        	call	_lcd_gotoxy
 596                     ; 56 					lcd_putchar(1);
 598  0109 a601          	ld	a,#1
 599  010b cd0000        	call	_lcd_data
 602  010e 202b          	jra	L571
 603  0110               L761:
 604                     ; 58 					lcd_sloupec=0;
 606  0110 3f4d          	clr	_lcd_sloupec
 607                     ; 59 					blick_bat();
 609  0112 cd0271        	call	_blick_bat
 611                     ; 60 					sprintf(text,"Nabito %u",x); 
 613  0115 be46          	ldw	x,_x
 614  0117 89            	pushw	x
 615  0118 ae0023        	ldw	x,#L771
 616  011b 89            	pushw	x
 617  011c ae0000        	ldw	x,#_text
 618  011f cd0000        	call	_sprintf
 620  0122 5b04          	addw	sp,#4
 621                     ; 61 					strcat(text, "%");
 623  0124 ae0021        	ldw	x,#L102
 624  0127 89            	pushw	x
 625  0128 ae0000        	ldw	x,#_text
 626  012b cd0000        	call	_strcat
 628  012e 85            	popw	x
 629                     ; 62 					lcd_gotoxy(1,0); 
 631  012f ae0100        	ldw	x,#256
 632  0132 cd0000        	call	_lcd_gotoxy
 634                     ; 63 					lcd_puts(text);
 636  0135 ae0000        	ldw	x,#_text
 637  0138 cd0000        	call	_lcd_puts
 639  013b               L571:
 640                     ; 67 				if(bat2 == 0){
 642  013b 3d4c          	tnz	_bat2
 643  013d 2634          	jrne	L302
 644                     ; 68 					sprintf(text,"%s","chybi baterie");
 646  013f ae002d        	ldw	x,#L371
 647  0142 89            	pushw	x
 648  0143 ae003b        	ldw	x,#L171
 649  0146 89            	pushw	x
 650  0147 ae0000        	ldw	x,#_text
 651  014a cd0000        	call	_sprintf
 653  014d 5b04          	addw	sp,#4
 654                     ; 69 					lcd_gotoxy(3,1); 
 656  014f ae0301        	ldw	x,#769
 657  0152 cd0000        	call	_lcd_gotoxy
 659                     ; 70 					lcd_puts(text);
 661  0155 ae0000        	ldw	x,#_text
 662  0158 cd0000        	call	_lcd_puts
 664                     ; 72 					lcd_gotoxy(1,1); 
 666  015b ae0101        	ldw	x,#257
 667  015e cd0000        	call	_lcd_gotoxy
 669                     ; 73 					lcd_putchar(6);
 671  0161 a606          	ld	a,#6
 672  0163 cd0000        	call	_lcd_data
 674                     ; 74 					lcd_gotoxy(0,1); 
 676  0166 ae0001        	ldw	x,#1
 677  0169 cd0000        	call	_lcd_gotoxy
 679                     ; 75 					lcd_putchar(1);
 681  016c a601          	ld	a,#1
 682  016e cd0000        	call	_lcd_data
 685  0171 2040          	jra	L502
 686  0173               L302:
 687                     ; 77 					lcd_sloupec=1;
 689  0173 3501004d      	mov	_lcd_sloupec,#1
 690                     ; 78 					if(bat1 == 1){
 692  0177 b64b          	ld	a,_bat1
 693  0179 a101          	cp	a,#1
 694  017b 260d          	jrne	L702
 695                     ; 79 						lcd_gotoxy(0,1); 
 697  017d ae0001        	ldw	x,#1
 698  0180 cd0000        	call	_lcd_gotoxy
 700                     ; 80 						lcd_putchar(3);
 702  0183 a603          	ld	a,#3
 703  0185 cd0000        	call	_lcd_data
 706  0188 2003          	jra	L112
 707  018a               L702:
 708                     ; 81 					}else{blick_bat();}
 710  018a cd0271        	call	_blick_bat
 712  018d               L112:
 713                     ; 83 					sprintf(text,"Nabito %u",x); 
 715  018d be46          	ldw	x,_x
 716  018f 89            	pushw	x
 717  0190 ae0023        	ldw	x,#L771
 718  0193 89            	pushw	x
 719  0194 ae0000        	ldw	x,#_text
 720  0197 cd0000        	call	_sprintf
 722  019a 5b04          	addw	sp,#4
 723                     ; 84 					strcat(text, "%");
 725  019c ae0021        	ldw	x,#L102
 726  019f 89            	pushw	x
 727  01a0 ae0000        	ldw	x,#_text
 728  01a3 cd0000        	call	_strcat
 730  01a6 85            	popw	x
 731                     ; 86 					lcd_gotoxy(1,1); 
 733  01a7 ae0101        	ldw	x,#257
 734  01aa cd0000        	call	_lcd_gotoxy
 736                     ; 87 					lcd_puts(text);
 738  01ad ae0000        	ldw	x,#_text
 739  01b0 cd0000        	call	_lcd_puts
 741  01b3               L502:
 742                     ; 89 				tlacitko();
 744  01b3 cd0331        	call	_tlacitko
 746                     ; 90 				break;
 748  01b6 acc700c7      	jpf	L751
 749  01ba               L531:
 750                     ; 92 			case stav_menu:
 750                     ; 93 				process_enc();
 752  01ba cd03a2        	call	_process_enc
 754                     ; 94 				if(encoder <= 1){
 756  01bd 9c            	rvf
 757  01be be50          	ldw	x,_encoder
 758  01c0 a30002        	cpw	x,#2
 759  01c3 2e38          	jrsge	L312
 760                     ; 95 					sprintf(text,"%s","Manual");
 762  01c5 ae001a        	ldw	x,#L512
 763  01c8 89            	pushw	x
 764  01c9 ae003b        	ldw	x,#L171
 765  01cc 89            	pushw	x
 766  01cd ae0000        	ldw	x,#_text
 767  01d0 cd0000        	call	_sprintf
 769  01d3 5b04          	addw	sp,#4
 770                     ; 96 					lcd_gotoxy(1,0); 
 772  01d5 ae0100        	ldw	x,#256
 773  01d8 cd0000        	call	_lcd_gotoxy
 775                     ; 97 					lcd_puts(text);
 777  01db ae0000        	ldw	x,#_text
 778  01de cd0000        	call	_lcd_puts
 780                     ; 99 					sprintf(text,"%s","Automat");
 782  01e1 ae0012        	ldw	x,#L712
 783  01e4 89            	pushw	x
 784  01e5 ae003b        	ldw	x,#L171
 785  01e8 89            	pushw	x
 786  01e9 ae0000        	ldw	x,#_text
 787  01ec cd0000        	call	_sprintf
 789  01ef 5b04          	addw	sp,#4
 790                     ; 100 					lcd_gotoxy(1,1); 
 792  01f1 ae0101        	ldw	x,#257
 793  01f4 cd0000        	call	_lcd_gotoxy
 795                     ; 101 					lcd_puts(text);
 797  01f7 ae0000        	ldw	x,#_text
 798  01fa cd0000        	call	_lcd_puts
 800  01fd               L312:
 801                     ; 103 				if(encoder == 2){
 803  01fd be50          	ldw	x,_encoder
 804  01ff a30002        	cpw	x,#2
 805  0202 261c          	jrne	L122
 806                     ; 104 					sprintf(text,"%s","Sleep");
 808  0204 ae000c        	ldw	x,#L322
 809  0207 89            	pushw	x
 810  0208 ae003b        	ldw	x,#L171
 811  020b 89            	pushw	x
 812  020c ae0000        	ldw	x,#_text
 813  020f cd0000        	call	_sprintf
 815  0212 5b04          	addw	sp,#4
 816                     ; 105 					lcd_gotoxy(1,0); 
 818  0214 ae0100        	ldw	x,#256
 819  0217 cd0000        	call	_lcd_gotoxy
 821                     ; 106 					lcd_puts(text);
 823  021a ae0000        	ldw	x,#_text
 824  021d cd0000        	call	_lcd_puts
 826  0220               L122:
 827                     ; 108 				if(encoder >= 3 ){
 829  0220 9c            	rvf
 830  0221 be50          	ldw	x,_encoder
 831  0223 a30003        	cpw	x,#3
 832  0226 2f05          	jrslt	L522
 833                     ; 109 					encoder=2;
 835  0228 ae0002        	ldw	x,#2
 836  022b bf50          	ldw	_encoder,x
 837  022d               L522:
 838                     ; 111 				lcd_gotoxy(0,encoder); 
 840  022d b651          	ld	a,_encoder+1
 841  022f 5f            	clrw	x
 842  0230 97            	ld	xl,a
 843  0231 cd0000        	call	_lcd_gotoxy
 845                     ; 112 				lcd_putchar(7);
 847  0234 a607          	ld	a,#7
 848  0236 cd0000        	call	_lcd_data
 850                     ; 113 				tlacitko();
 852  0239 cd0331        	call	_tlacitko
 854                     ; 114 				break;
 856  023c acc700c7      	jpf	L751
 857  0240               L731:
 858                     ; 116 		case stav_manual:
 858                     ; 117 			sprintf(text,"pozice %u",y); 
 860  0240 be48          	ldw	x,_y
 861  0242 89            	pushw	x
 862  0243 ae0002        	ldw	x,#L722
 863  0246 89            	pushw	x
 864  0247 ae0000        	ldw	x,#_text
 865  024a cd0000        	call	_sprintf
 867  024d 5b04          	addw	sp,#4
 868                     ; 118 			strcat(text, "°");
 870  024f ae0000        	ldw	x,#L132
 871  0252 89            	pushw	x
 872  0253 ae0000        	ldw	x,#_text
 873  0256 cd0000        	call	_strcat
 875  0259 85            	popw	x
 876                     ; 119 			lcd_gotoxy(1,0); 
 878  025a ae0100        	ldw	x,#256
 879  025d cd0000        	call	_lcd_gotoxy
 881                     ; 120 			lcd_puts(text);
 883  0260 ae0000        	ldw	x,#_text
 884  0263 cd0000        	call	_lcd_puts
 886                     ; 121 			tlacitko();
 888  0266 cd0331        	call	_tlacitko
 890                     ; 122 			break;
 892  0269 acc700c7      	jpf	L751
 893  026d               L561:
 895  026d acc700c7      	jpf	L751
 898                     	bsct
 899  0052               L332_bat_icon_time:
 900  0052 0000          	dc.w	0
 901  0054               L532_p:
 902  0054 00            	dc.b	0
 947                     ; 127 void blick_bat(void){
 948                     	switch	.text
 949  0271               _blick_bat:
 953                     ; 132 if(milis()-bat_icon_time >= 500 && p==0){
 955  0271 cd0000        	call	_milis
 957  0274 72b00052      	subw	x,L332_bat_icon_time
 958  0278 a301f4        	cpw	x,#500
 959  027b 2519          	jrult	L162
 961  027d 3d54          	tnz	L532_p
 962  027f 2615          	jrne	L162
 963                     ; 133 	lcd_gotoxy(0,lcd_sloupec); 
 965  0281 b64d          	ld	a,_lcd_sloupec
 966  0283 5f            	clrw	x
 967  0284 97            	ld	xl,a
 968  0285 cd0000        	call	_lcd_gotoxy
 970                     ; 134 	lcd_putchar(1);
 972  0288 a601          	ld	a,#1
 973  028a cd0000        	call	_lcd_data
 975                     ; 135 	bat_icon_time=milis();
 977  028d cd0000        	call	_milis
 979  0290 bf52          	ldw	L332_bat_icon_time,x
 980                     ; 136 	p=1;
 982  0292 35010054      	mov	L532_p,#1
 983  0296               L162:
 984                     ; 139 if(milis()-bat_icon_time >= 500 && p==1){
 986  0296 cd0000        	call	_milis
 988  0299 72b00052      	subw	x,L332_bat_icon_time
 989  029d a301f4        	cpw	x,#500
 990  02a0 251b          	jrult	L362
 992  02a2 b654          	ld	a,L532_p
 993  02a4 a101          	cp	a,#1
 994  02a6 2615          	jrne	L362
 995                     ; 140 	lcd_gotoxy(0,lcd_sloupec); 
 997  02a8 b64d          	ld	a,_lcd_sloupec
 998  02aa 5f            	clrw	x
 999  02ab 97            	ld	xl,a
1000  02ac cd0000        	call	_lcd_gotoxy
1002                     ; 141 	lcd_putchar(2);
1004  02af a602          	ld	a,#2
1005  02b1 cd0000        	call	_lcd_data
1007                     ; 142 	bat_icon_time=milis();
1009  02b4 cd0000        	call	_milis
1011  02b7 bf52          	ldw	L332_bat_icon_time,x
1012                     ; 143 	p=2;
1014  02b9 35020054      	mov	L532_p,#2
1015  02bd               L362:
1016                     ; 146 if(milis()-bat_icon_time >= 500 && p==2){
1018  02bd cd0000        	call	_milis
1020  02c0 72b00052      	subw	x,L332_bat_icon_time
1021  02c4 a301f4        	cpw	x,#500
1022  02c7 251b          	jrult	L562
1024  02c9 b654          	ld	a,L532_p
1025  02cb a102          	cp	a,#2
1026  02cd 2615          	jrne	L562
1027                     ; 147 	lcd_gotoxy(0,lcd_sloupec); 
1029  02cf b64d          	ld	a,_lcd_sloupec
1030  02d1 5f            	clrw	x
1031  02d2 97            	ld	xl,a
1032  02d3 cd0000        	call	_lcd_gotoxy
1034                     ; 148 	lcd_putchar(3);
1036  02d6 a603          	ld	a,#3
1037  02d8 cd0000        	call	_lcd_data
1039                     ; 149 	bat_icon_time=milis();
1041  02db cd0000        	call	_milis
1043  02de bf52          	ldw	L332_bat_icon_time,x
1044                     ; 150 	p=3;
1046  02e0 35030054      	mov	L532_p,#3
1047  02e4               L562:
1048                     ; 153 if(milis()-bat_icon_time >= 500 && p==3){
1050  02e4 cd0000        	call	_milis
1052  02e7 72b00052      	subw	x,L332_bat_icon_time
1053  02eb a301f4        	cpw	x,#500
1054  02ee 251b          	jrult	L762
1056  02f0 b654          	ld	a,L532_p
1057  02f2 a103          	cp	a,#3
1058  02f4 2615          	jrne	L762
1059                     ; 154 	lcd_gotoxy(0,lcd_sloupec); 
1061  02f6 b64d          	ld	a,_lcd_sloupec
1062  02f8 5f            	clrw	x
1063  02f9 97            	ld	xl,a
1064  02fa cd0000        	call	_lcd_gotoxy
1066                     ; 155 	lcd_putchar(4);
1068  02fd a604          	ld	a,#4
1069  02ff cd0000        	call	_lcd_data
1071                     ; 156 	bat_icon_time=milis();
1073  0302 cd0000        	call	_milis
1075  0305 bf52          	ldw	L332_bat_icon_time,x
1076                     ; 157 	p=4;
1078  0307 35040054      	mov	L532_p,#4
1079  030b               L762:
1080                     ; 160 if(milis()-bat_icon_time >= 500 && p==4){
1082  030b cd0000        	call	_milis
1084  030e 72b00052      	subw	x,L332_bat_icon_time
1085  0312 a301f4        	cpw	x,#500
1086  0315 2519          	jrult	L172
1088  0317 b654          	ld	a,L532_p
1089  0319 a104          	cp	a,#4
1090  031b 2613          	jrne	L172
1091                     ; 161 	lcd_gotoxy(0,lcd_sloupec); 
1093  031d b64d          	ld	a,_lcd_sloupec
1094  031f 5f            	clrw	x
1095  0320 97            	ld	xl,a
1096  0321 cd0000        	call	_lcd_gotoxy
1098                     ; 162 	lcd_putchar(5);
1100  0324 a605          	ld	a,#5
1101  0326 cd0000        	call	_lcd_data
1103                     ; 163 	bat_icon_time=milis();
1105  0329 cd0000        	call	_milis
1107  032c bf52          	ldw	L332_bat_icon_time,x
1108                     ; 164 	p=0;
1110  032e 3f54          	clr	L532_p
1111  0330               L172:
1112                     ; 166 }
1115  0330 81            	ret
1144                     ; 169 void tlacitko(void){
1145                     	switch	.text
1146  0331               _tlacitko:
1150                     ; 170 	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_0) == RESET && last==1){
1152  0331 4b01          	push	#1
1153  0333 ae5005        	ldw	x,#20485
1154  0336 cd0000        	call	_GPIO_ReadInputPin
1156  0339 5b01          	addw	sp,#1
1157  033b 4d            	tnz	a
1158  033c 264f          	jrne	L303
1160  033e be44          	ldw	x,_last
1161  0340 a30001        	cpw	x,#1
1162  0343 2648          	jrne	L303
1163                     ; 171 		last=0;
1165  0345 5f            	clrw	x
1166  0346 bf44          	ldw	_last,x
1167                     ; 172 		if(stav==1){
1169  0348 b64a          	ld	a,_stav
1170  034a a101          	cp	a,#1
1171  034c 260d          	jrne	L503
1172                     ; 173 			stav=stav_menu;
1174  034e 3502004a      	mov	_stav,#2
1175                     ; 174 			lcd_clear();
1177  0352 a601          	ld	a,#1
1178  0354 cd0000        	call	_lcd_command
1180                     ; 175 			kontrola=1;
1182  0357 3501004f      	mov	_kontrola,#1
1183  035b               L503:
1184                     ; 177 		if(stav==2 && encoder==0 && kontrola==0){
1186  035b b64a          	ld	a,_stav
1187  035d a102          	cp	a,#2
1188  035f 2615          	jrne	L703
1190  0361 be50          	ldw	x,_encoder
1191  0363 2611          	jrne	L703
1193  0365 3d4f          	tnz	_kontrola
1194  0367 260d          	jrne	L703
1195                     ; 178 			stav=stav_manual;
1197  0369 3503004a      	mov	_stav,#3
1198                     ; 179 			lcd_clear();
1200  036d a601          	ld	a,#1
1201  036f cd0000        	call	_lcd_command
1203                     ; 180 			kontrola=1;
1205  0372 3501004f      	mov	_kontrola,#1
1206  0376               L703:
1207                     ; 182 		if(stav==3 && kontrola==0){
1209  0376 b64a          	ld	a,_stav
1210  0378 a103          	cp	a,#3
1211  037a 2611          	jrne	L303
1213  037c 3d4f          	tnz	_kontrola
1214  037e 260d          	jrne	L303
1215                     ; 183 			stav=stav_menu;
1217  0380 3502004a      	mov	_stav,#2
1218                     ; 184 			lcd_clear();
1220  0384 a601          	ld	a,#1
1221  0386 cd0000        	call	_lcd_command
1223                     ; 185 			kontrola=1;
1225  0389 3501004f      	mov	_kontrola,#1
1226  038d               L303:
1227                     ; 188 	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_0) != RESET){
1229  038d 4b01          	push	#1
1230  038f ae5005        	ldw	x,#20485
1231  0392 cd0000        	call	_GPIO_ReadInputPin
1233  0395 5b01          	addw	sp,#1
1234  0397 4d            	tnz	a
1235  0398 2707          	jreq	L313
1236                     ; 189 	last = 1;
1238  039a ae0001        	ldw	x,#1
1239  039d bf44          	ldw	_last,x
1240                     ; 190 	kontrola=0;
1242  039f 3f4f          	clr	_kontrola
1243  03a1               L313:
1244                     ; 192 }
1247  03a1 81            	ret
1275                     ; 195 void process_enc(void){
1276                     	switch	.text
1277  03a2               _process_enc:
1281                     ; 198 	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) == RESET && minule==1){
1283  03a2 4b04          	push	#4
1284  03a4 ae5005        	ldw	x,#20485
1285  03a7 cd0000        	call	_GPIO_ReadInputPin
1287  03aa 5b01          	addw	sp,#1
1288  03ac 4d            	tnz	a
1289  03ad 2649          	jrne	L523
1291  03af be42          	ldw	x,_minule
1292  03b1 a30001        	cpw	x,#1
1293  03b4 2642          	jrne	L523
1294                     ; 199 		minule = 0; // nyní je pin v log.0
1296  03b6 5f            	clrw	x
1297  03b7 bf42          	ldw	_minule,x
1298                     ; 201 	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_3) == RESET){
1300  03b9 4b08          	push	#8
1301  03bb ae5005        	ldw	x,#20485
1302  03be cd0000        	call	_GPIO_ReadInputPin
1304  03c1 5b01          	addw	sp,#1
1305  03c3 4d            	tnz	a
1306  03c4 2616          	jrne	L723
1307                     ; 203 			if(stav=2){lcd_clear();}
1309  03c6 3502004a      	mov	_stav,#2
1310  03ca 3d4a          	tnz	_stav
1311  03cc 2705          	jreq	L133
1314  03ce a601          	ld	a,#1
1315  03d0 cd0000        	call	_lcd_command
1317  03d3               L133:
1318                     ; 204 			encoder++;
1320  03d3 be50          	ldw	x,_encoder
1321  03d5 1c0001        	addw	x,#1
1322  03d8 bf50          	ldw	_encoder,x
1324  03da 2014          	jra	L333
1325  03dc               L723:
1326                     ; 207 			if(stav=2){lcd_clear();}
1328  03dc 3502004a      	mov	_stav,#2
1329  03e0 3d4a          	tnz	_stav
1330  03e2 2705          	jreq	L533
1333  03e4 a601          	ld	a,#1
1334  03e6 cd0000        	call	_lcd_command
1336  03e9               L533:
1337                     ; 208 			encoder--;
1339  03e9 be50          	ldw	x,_encoder
1340  03eb 1d0001        	subw	x,#1
1341  03ee bf50          	ldw	_encoder,x
1342  03f0               L333:
1343                     ; 210 	if(encoder < 0){encoder=0;}
1345  03f0 9c            	rvf
1346  03f1 be50          	ldw	x,_encoder
1347  03f3 2e03          	jrsge	L523
1350  03f5 5f            	clrw	x
1351  03f6 bf50          	ldw	_encoder,x
1352  03f8               L523:
1353                     ; 212 	if(GPIO_ReadInputPin(GPIOB,GPIO_PIN_2) != RESET){minule = 1;} // pokud je vstup A v log.1
1355  03f8 4b04          	push	#4
1356  03fa ae5005        	ldw	x,#20485
1357  03fd cd0000        	call	_GPIO_ReadInputPin
1359  0400 5b01          	addw	sp,#1
1360  0402 4d            	tnz	a
1361  0403 2705          	jreq	L143
1364  0405 ae0001        	ldw	x,#1
1365  0408 bf42          	ldw	_minule,x
1366  040a               L143:
1367                     ; 213 	}
1370  040a 81            	ret
1405                     ; 227 void assert_failed(u8* file, u32 line)
1405                     ; 228 { 
1406                     	switch	.text
1407  040b               _assert_failed:
1411  040b               L163:
1412  040b 20fe          	jra	L163
1545                     	xdef	_main
1546                     	switch	.ubsct
1547  0000               _text:
1548  0000 000000000000  	ds.b	24
1549                     	xdef	_text
1550                     	xdef	_encoder
1551                     	xdef	_kontrola
1552                     	xdef	_pointer
1553                     	xdef	_lcd_sloupec
1554                     	xdef	_bat2
1555                     	xdef	_bat1
1556                     	xdef	_stav
1557                     	xdef	_y
1558                     	xdef	_x
1559                     	xdef	_last
1560                     	xdef	_minule
1561                     	xdef	_last_time
1562                     	xdef	_tlacitko
1563                     	xdef	_blick_bat
1564                     	xdef	_process_enc
1565                     	xdef	_battery_full
1566                     	xdef	_battery_full1
1567                     	xdef	_battery_low1
1568                     	xdef	_battery_low
1569                     	xdef	_battery
1570                     	xdef	_point
1571                     	xdef	_cross
1572                     	xdef	_time
1573                     	xdef	_strcat
1574                     	xref	_sprintf
1575                     	xref	_lcd_store_symbol
1576                     	xref	_lcd_puts
1577                     	xref	_lcd_gotoxy
1578                     	xref	_lcd_init
1579                     	xref	_lcd_data
1580                     	xref	_lcd_command
1581                     	xref	_init_milis
1582                     	xref	_milis
1583                     	xdef	_assert_failed
1584                     	xref	_GPIO_ReadInputPin
1585                     	xref	_GPIO_Init
1586                     	xref	_CLK_HSIPrescalerConfig
1587                     .const:	section	.text
1588  0000               L132:
1589  0000 b000          	dc.b	176,0
1590  0002               L722:
1591  0002 706f7a696365  	dc.b	"pozice %u",0
1592  000c               L322:
1593  000c 536c65657000  	dc.b	"Sleep",0
1594  0012               L712:
1595  0012 4175746f6d61  	dc.b	"Automat",0
1596  001a               L512:
1597  001a 4d616e75616c  	dc.b	"Manual",0
1598  0021               L102:
1599  0021 2500          	dc.b	"%",0
1600  0023               L771:
1601  0023 4e616269746f  	dc.b	"Nabito %u",0
1602  002d               L371:
1603  002d 636879626920  	dc.b	"chybi baterie",0
1604  003b               L171:
1605  003b 257300        	dc.b	"%s",0
1625                     	end
