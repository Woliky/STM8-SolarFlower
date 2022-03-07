   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  76                     ; 13 void lcd_store_symbol(uint8_t pos, uint8_t* charmap){
  78                     	switch	.text
  79  0000               _lcd_store_symbol:
  81  0000 88            	push	a
  82  0001 88            	push	a
  83       00000001      OFST:	set	1
  86                     ; 15 if(pos>7) return;
  88  0002 a108          	cp	a,#8
  89  0004 2424          	jruge	L6
  92                     ; 16 lcd_command(0x40 | pos*8);
  94  0006 7b02          	ld	a,(OFST+1,sp)
  95  0008 48            	sll	a
  96  0009 48            	sll	a
  97  000a 48            	sll	a
  98  000b aa40          	or	a,#64
  99  000d cd0283        	call	_lcd_command
 101                     ; 17 for(i=0;i<8;i++){
 103  0010 0f01          	clr	(OFST+0,sp)
 105  0012               L54:
 106                     ; 18 lcd_data(charmap[i]);
 108  0012 7b01          	ld	a,(OFST+0,sp)
 109  0014 5f            	clrw	x
 110  0015 97            	ld	xl,a
 111  0016 72fb05        	addw	x,(OFST+4,sp)
 112  0019 f6            	ld	a,(x)
 113  001a cd02ad        	call	_lcd_data
 115                     ; 17 for(i=0;i<8;i++){
 117  001d 0c01          	inc	(OFST+0,sp)
 121  001f 7b01          	ld	a,(OFST+0,sp)
 122  0021 a108          	cp	a,#8
 123  0023 25ed          	jrult	L54
 124                     ; 20 lcd_command(LCD_SET_DDRAM | 0); // other funtions (like lcd_puts) relies that address counter points into DDRAM
 126  0025 a680          	ld	a,#128
 127  0027 cd0283        	call	_lcd_command
 129                     ; 21 }
 130  002a               L6:
 133  002a 85            	popw	x
 134  002b 81            	ret
 170                     ; 25 void lcd_puts(char* text){
 171                     	switch	.text
 172  002c               _lcd_puts:
 174  002c 89            	pushw	x
 175       00000000      OFST:	set	0
 178  002d 200d          	jra	L37
 179  002f               L17:
 180                     ; 27 		lcd_data(*text);
 182  002f 1e01          	ldw	x,(OFST+1,sp)
 183  0031 f6            	ld	a,(x)
 184  0032 cd02ad        	call	_lcd_data
 186                     ; 28 		text++;
 188  0035 1e01          	ldw	x,(OFST+1,sp)
 189  0037 1c0001        	addw	x,#1
 190  003a 1f01          	ldw	(OFST+1,sp),x
 191  003c               L37:
 192                     ; 26 	while(*text){
 194  003c 1e01          	ldw	x,(OFST+1,sp)
 195  003e 7d            	tnz	(x)
 196  003f 26ee          	jrne	L17
 197                     ; 30 }
 200  0041 85            	popw	x
 201  0042 81            	ret
 235                     ; 32 void lcd_init(void){
 236                     	switch	.text
 237  0043               _lcd_init:
 241                     ; 33 	lcd_init_hw();
 243  0043 cd00d7        	call	_lcd_init_hw
 245                     ; 35 	lcd_bus_outputs();
 247  0046 cd00fb        	call	_lcd_bus_outputs
 249                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
 253  0049 ae04eb        	ldw	x,#1259
 255  004c 9d            nop
 256  004d                L41:
 257  004d 5a             decw X
 258  004e 26fd           jrne L41
 259  0050 9d             nop
 260                      
 262  0051               L101:
 263                     ; 38 	lcd_bus_set(0b0011);
 265  0051 a603          	ld	a,#3
 266  0053 cd01a3        	call	_lcd_bus_set
 268                     ; 39 	lcd_e_tick();
 270  0056 cd0260        	call	_lcd_e_tick
 272                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
 276  0059 ae0188        	ldw	x,#392
 278  005c 9d            nop
 279  005d                L61:
 280  005d 5a             decw X
 281  005e 26fd           jrne L61
 282  0060 9d             nop
 283                      
 285  0061               L501:
 286                     ; 42 	lcd_bus_set(0b0011);
 288  0061 a603          	ld	a,#3
 289  0063 cd01a3        	call	_lcd_bus_set
 291                     ; 43 	lcd_e_tick();
 293  0066 cd0260        	call	_lcd_e_tick
 295                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
 299  0069 ae0216        	ldw	x,#534
 301  006c 9d            nop
 302  006d                L02:
 303  006d 5a             decw X
 304  006e 26fd           jrne L02
 305  0070 9d             nop
 306                      
 308  0071               L111:
 309                     ; 46 	lcd_bus_set(0b0011);
 311  0071 a603          	ld	a,#3
 312  0073 cd01a3        	call	_lcd_bus_set
 314                     ; 47 	lcd_e_tick();
 316  0076 cd0260        	call	_lcd_e_tick
 318                     ; 48 	lcd_bus_set(0b0010);
 320  0079 a602          	ld	a,#2
 321  007b cd01a3        	call	_lcd_bus_set
 323                     ; 49 	lcd_e_tick();
 325  007e cd0260        	call	_lcd_e_tick
 327                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
 331  0081 ae00d6        	ldw	x,#214
 333  0084 9d            nop
 334  0085                L22:
 335  0085 5a             decw X
 336  0086 26fd           jrne L22
 337  0088 9d             nop
 338                      
 340  0089               L511:
 341                     ; 55 	lcd_command(LCD_FUNCTION_SET | LCD_4BITS | LCD_2LINES | USED_FONT);
 343  0089 a628          	ld	a,#40
 344  008b cd0283        	call	_lcd_command
 346                     ; 57 	lcd_command(LCD_ENTRY_MODE_SET | LCD_INCREMENT | LCD_DISPLAY_NOSHIFT);
 348  008e a606          	ld	a,#6
 349  0090 cd0283        	call	_lcd_command
 351                     ; 58 	lcd_command(LCD_DISPLAY_ONOFF | LCD_ON | LCD_CURSOR_OFF | LCD_BLINK_OFF);
 353  0093 a60c          	ld	a,#12
 354  0095 cd0283        	call	_lcd_command
 356                     ; 59 	lcd_command(LCD_CURSOR_OR_DISPLAY_SHIFT | LCD_CURSOR_SHIFT | LCD_SHIFT_RIGHT);
 358  0098 a614          	ld	a,#20
 359  009a cd0283        	call	_lcd_command
 361                     ; 60 	lcd_command(LCD_DISPLAY_CLEAR);
 363  009d a601          	ld	a,#1
 364  009f cd0283        	call	_lcd_command
 366                     ; 61 	lcd_command(LCD_RETURN_HOME);
 368  00a2 a602          	ld	a,#2
 369  00a4 cd0283        	call	_lcd_command
 371                     ; 62 }
 374  00a7 81            	ret
 427                     ; 64 void lcd_gotoxy(uint8_t column, uint8_t line){
 428                     	switch	.text
 429  00a8               _lcd_gotoxy:
 431  00a8 89            	pushw	x
 432  00a9 88            	push	a
 433       00000001      OFST:	set	1
 436                     ; 65 	uint8_t tmp=0;
 438  00aa 0f01          	clr	(OFST+0,sp)
 440                     ; 77 	if(column > (LCD_COLUMNS-1)){column=LCD_COLUMNS-1;}
 442  00ac 9e            	ld	a,xh
 443  00ad a110          	cp	a,#16
 444  00af 2504          	jrult	L551
 447  00b1 a60f          	ld	a,#15
 448  00b3 6b02          	ld	(OFST+1,sp),a
 449  00b5               L551:
 450                     ; 78 	if(line == 0){tmp=0x00;}
 452  00b5 0d03          	tnz	(OFST+2,sp)
 453  00b7 2604          	jrne	L751
 456  00b9 0f01          	clr	(OFST+0,sp)
 459  00bb 200a          	jra	L161
 460  00bd               L751:
 461                     ; 79 	else if(line==1){tmp = 0x40;}
 463  00bd 7b03          	ld	a,(OFST+2,sp)
 464  00bf a101          	cp	a,#1
 465  00c1 2604          	jrne	L161
 468  00c3 a640          	ld	a,#64
 469  00c5 6b01          	ld	(OFST+0,sp),a
 471  00c7               L161:
 472                     ; 80 	tmp = tmp + column;
 474  00c7 7b01          	ld	a,(OFST+0,sp)
 475  00c9 1b02          	add	a,(OFST+1,sp)
 476  00cb 6b01          	ld	(OFST+0,sp),a
 478                     ; 87 	lcd_command(LCD_SET_DDRAM | tmp);
 480  00cd 7b01          	ld	a,(OFST+0,sp)
 481  00cf aa80          	or	a,#128
 482  00d1 cd0283        	call	_lcd_command
 484                     ; 88 }
 487  00d4 5b03          	addw	sp,#3
 488  00d6 81            	ret
 513                     ; 91 void lcd_init_hw(void){
 514                     	switch	.text
 515  00d7               _lcd_init_hw:
 519                     ; 110  GPIO_Init(LCD_RS_PORT,LCD_RS_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 521  00d7 4bc0          	push	#192
 522  00d9 4b80          	push	#128
 523  00db ae5019        	ldw	x,#20505
 524  00de cd0000        	call	_GPIO_Init
 526  00e1 85            	popw	x
 527                     ; 111  GPIO_Init(LCD_RW_PORT,LCD_RW_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 529  00e2 4bc0          	push	#192
 530  00e4 4b40          	push	#64
 531  00e6 ae5019        	ldw	x,#20505
 532  00e9 cd0000        	call	_GPIO_Init
 534  00ec 85            	popw	x
 535                     ; 112  GPIO_Init(LCD_E_PORT,LCD_E_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
 537  00ed 4bd0          	push	#208
 538  00ef 4b20          	push	#32
 539  00f1 ae5019        	ldw	x,#20505
 540  00f4 cd0000        	call	_GPIO_Init
 542  00f7 85            	popw	x
 543                     ; 115  lcd_bus_outputs();
 545  00f8 ad01          	call	_lcd_bus_outputs
 547                     ; 116 }
 550  00fa 81            	ret
 574                     ; 119 void lcd_bus_outputs(void){
 575                     	switch	.text
 576  00fb               _lcd_bus_outputs:
 580                     ; 123  GPIO_Init(LCD_D4_PORT,LCD_D4_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 582  00fb 4bc0          	push	#192
 583  00fd 4b10          	push	#16
 584  00ff ae5019        	ldw	x,#20505
 585  0102 cd0000        	call	_GPIO_Init
 587  0105 85            	popw	x
 588                     ; 124  GPIO_Init(LCD_D5_PORT,LCD_D5_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 590  0106 4bc0          	push	#192
 591  0108 4b08          	push	#8
 592  010a ae5019        	ldw	x,#20505
 593  010d cd0000        	call	_GPIO_Init
 595  0110 85            	popw	x
 596                     ; 125  GPIO_Init(LCD_D6_PORT,LCD_D6_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 598  0111 4bc0          	push	#192
 599  0113 4b01          	push	#1
 600  0115 ae5019        	ldw	x,#20505
 601  0118 cd0000        	call	_GPIO_Init
 603  011b 85            	popw	x
 604                     ; 126  GPIO_Init(LCD_D7_PORT,LCD_D7_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 606  011c 4bc0          	push	#192
 607  011e 4b04          	push	#4
 608  0120 ae500f        	ldw	x,#20495
 609  0123 cd0000        	call	_GPIO_Init
 611  0126 85            	popw	x
 612                     ; 128 }
 615  0127 81            	ret
 639                     ; 131 void lcd_bus_inputs(void){
 640                     	switch	.text
 641  0128               _lcd_bus_inputs:
 645                     ; 139  GPIO_Init(LCD_D4_PORT,LCD_D4_PIN,GPIO_MODE_IN_FL_NO_IT);
 647  0128 4b00          	push	#0
 648  012a 4b10          	push	#16
 649  012c ae5019        	ldw	x,#20505
 650  012f cd0000        	call	_GPIO_Init
 652  0132 85            	popw	x
 653                     ; 140  GPIO_Init(LCD_D5_PORT,LCD_D5_PIN,GPIO_MODE_IN_FL_NO_IT);
 655  0133 4b00          	push	#0
 656  0135 4b08          	push	#8
 657  0137 ae5019        	ldw	x,#20505
 658  013a cd0000        	call	_GPIO_Init
 660  013d 85            	popw	x
 661                     ; 141  GPIO_Init(LCD_D6_PORT,LCD_D6_PIN,GPIO_MODE_IN_FL_NO_IT);
 663  013e 4b00          	push	#0
 664  0140 4b01          	push	#1
 665  0142 ae5019        	ldw	x,#20505
 666  0145 cd0000        	call	_GPIO_Init
 668  0148 85            	popw	x
 669                     ; 142  GPIO_Init(LCD_D7_PORT,LCD_D7_PIN,GPIO_MODE_IN_FL_NO_IT); 
 671  0149 4b00          	push	#0
 672  014b 4b04          	push	#4
 673  014d ae500f        	ldw	x,#20495
 674  0150 cd0000        	call	_GPIO_Init
 676  0153 85            	popw	x
 677                     ; 144 }
 680  0154 81            	ret
 704                     ; 147 void lcd_deinit_hw(void){
 705                     	switch	.text
 706  0155               _lcd_deinit_hw:
 710                     ; 148 	GPIO_Init(LCD_RS_PORT,LCD_RS_PIN,GPIO_MODE_IN_FL_NO_IT);
 712  0155 4b00          	push	#0
 713  0157 4b80          	push	#128
 714  0159 ae5019        	ldw	x,#20505
 715  015c cd0000        	call	_GPIO_Init
 717  015f 85            	popw	x
 718                     ; 149 	GPIO_Init(LCD_RW_PORT,LCD_RW_PIN,GPIO_MODE_IN_FL_NO_IT);
 720  0160 4b00          	push	#0
 721  0162 4b40          	push	#64
 722  0164 ae5019        	ldw	x,#20505
 723  0167 cd0000        	call	_GPIO_Init
 725  016a 85            	popw	x
 726                     ; 150 	GPIO_Init(LCD_E_PORT,LCD_E_PIN,GPIO_MODE_IN_FL_NO_IT);
 728  016b 4b00          	push	#0
 729  016d 4b20          	push	#32
 730  016f ae5019        	ldw	x,#20505
 731  0172 cd0000        	call	_GPIO_Init
 733  0175 85            	popw	x
 734                     ; 151 	GPIO_Init(LCD_D4_PORT,LCD_D4_PIN,GPIO_MODE_IN_FL_NO_IT);
 736  0176 4b00          	push	#0
 737  0178 4b10          	push	#16
 738  017a ae5019        	ldw	x,#20505
 739  017d cd0000        	call	_GPIO_Init
 741  0180 85            	popw	x
 742                     ; 152 	GPIO_Init(LCD_D5_PORT,LCD_D5_PIN,GPIO_MODE_IN_FL_NO_IT);
 744  0181 4b00          	push	#0
 745  0183 4b08          	push	#8
 746  0185 ae5019        	ldw	x,#20505
 747  0188 cd0000        	call	_GPIO_Init
 749  018b 85            	popw	x
 750                     ; 153 	GPIO_Init(LCD_D6_PORT,LCD_D6_PIN,GPIO_MODE_IN_FL_NO_IT);
 752  018c 4b00          	push	#0
 753  018e 4b01          	push	#1
 754  0190 ae5019        	ldw	x,#20505
 755  0193 cd0000        	call	_GPIO_Init
 757  0196 85            	popw	x
 758                     ; 154 	GPIO_Init(LCD_D7_PORT,LCD_D7_PIN,GPIO_MODE_IN_FL_NO_IT); 
 760  0197 4b00          	push	#0
 761  0199 4b04          	push	#4
 762  019b ae500f        	ldw	x,#20495
 763  019e cd0000        	call	_GPIO_Init
 765  01a1 85            	popw	x
 766                     ; 155 }
 769  01a2 81            	ret
 805                     ; 158 void lcd_bus_set(uint8_t data){
 806                     	switch	.text
 807  01a3               _lcd_bus_set:
 809  01a3 88            	push	a
 810       00000000      OFST:	set	0
 813                     ; 159 	if(data & (1<<0)){LCD_D4_H;}else{LCD_D4_L;}
 815  01a4 a501          	bcp	a,#1
 816  01a6 270b          	jreq	L342
 819  01a8 4b10          	push	#16
 820  01aa ae5019        	ldw	x,#20505
 821  01ad cd0000        	call	_GPIO_WriteHigh
 823  01b0 84            	pop	a
 825  01b1 2009          	jra	L542
 826  01b3               L342:
 829  01b3 4b10          	push	#16
 830  01b5 ae5019        	ldw	x,#20505
 831  01b8 cd0000        	call	_GPIO_WriteLow
 833  01bb 84            	pop	a
 834  01bc               L542:
 835                     ; 160 	if(data & (1<<1)){LCD_D5_H;}else{LCD_D5_L;}
 837  01bc 7b01          	ld	a,(OFST+1,sp)
 838  01be a502          	bcp	a,#2
 839  01c0 270b          	jreq	L742
 842  01c2 4b08          	push	#8
 843  01c4 ae5019        	ldw	x,#20505
 844  01c7 cd0000        	call	_GPIO_WriteHigh
 846  01ca 84            	pop	a
 848  01cb 2009          	jra	L152
 849  01cd               L742:
 852  01cd 4b08          	push	#8
 853  01cf ae5019        	ldw	x,#20505
 854  01d2 cd0000        	call	_GPIO_WriteLow
 856  01d5 84            	pop	a
 857  01d6               L152:
 858                     ; 161 	if(data & (1<<2)){LCD_D6_H;}else{LCD_D6_L;}
 860  01d6 7b01          	ld	a,(OFST+1,sp)
 861  01d8 a504          	bcp	a,#4
 862  01da 270b          	jreq	L352
 865  01dc 4b01          	push	#1
 866  01de ae5019        	ldw	x,#20505
 867  01e1 cd0000        	call	_GPIO_WriteHigh
 869  01e4 84            	pop	a
 871  01e5 2009          	jra	L552
 872  01e7               L352:
 875  01e7 4b01          	push	#1
 876  01e9 ae5019        	ldw	x,#20505
 877  01ec cd0000        	call	_GPIO_WriteLow
 879  01ef 84            	pop	a
 880  01f0               L552:
 881                     ; 162 	if(data & (1<<3)){LCD_D7_H;}else{LCD_D7_L;}
 883  01f0 7b01          	ld	a,(OFST+1,sp)
 884  01f2 a508          	bcp	a,#8
 885  01f4 270b          	jreq	L752
 888  01f6 4b04          	push	#4
 889  01f8 ae500f        	ldw	x,#20495
 890  01fb cd0000        	call	_GPIO_WriteHigh
 892  01fe 84            	pop	a
 894  01ff 2009          	jra	L162
 895  0201               L752:
 898  0201 4b04          	push	#4
 899  0203 ae500f        	ldw	x,#20495
 900  0206 cd0000        	call	_GPIO_WriteLow
 902  0209 84            	pop	a
 903  020a               L162:
 904                     ; 163 }
 907  020a 84            	pop	a
 908  020b 81            	ret
 943                     ; 166 uint8_t lcd_bus_read(void){
 944                     	switch	.text
 945  020c               _lcd_bus_read:
 947  020c 88            	push	a
 948       00000001      OFST:	set	1
 951                     ; 167 	uint8_t tmp=0;
 953  020d 0f01          	clr	(OFST+0,sp)
 955                     ; 168 	if(GPIO_ReadInputPin(LCD_D4_PORT,LCD_D4_PIN)){tmp |= 1<<0;}
 957  020f 4b10          	push	#16
 958  0211 ae5019        	ldw	x,#20505
 959  0214 cd0000        	call	_GPIO_ReadInputPin
 961  0217 5b01          	addw	sp,#1
 962  0219 4d            	tnz	a
 963  021a 2706          	jreq	L103
 966  021c 7b01          	ld	a,(OFST+0,sp)
 967  021e aa01          	or	a,#1
 968  0220 6b01          	ld	(OFST+0,sp),a
 970  0222               L103:
 971                     ; 169 	if(GPIO_ReadInputPin(LCD_D5_PORT,LCD_D5_PIN)){tmp |= 1<<1;}
 973  0222 4b08          	push	#8
 974  0224 ae5019        	ldw	x,#20505
 975  0227 cd0000        	call	_GPIO_ReadInputPin
 977  022a 5b01          	addw	sp,#1
 978  022c 4d            	tnz	a
 979  022d 2706          	jreq	L303
 982  022f 7b01          	ld	a,(OFST+0,sp)
 983  0231 aa02          	or	a,#2
 984  0233 6b01          	ld	(OFST+0,sp),a
 986  0235               L303:
 987                     ; 170 	if(GPIO_ReadInputPin(LCD_D6_PORT,LCD_D6_PIN)){tmp |= 1<<2;}
 989  0235 4b01          	push	#1
 990  0237 ae5019        	ldw	x,#20505
 991  023a cd0000        	call	_GPIO_ReadInputPin
 993  023d 5b01          	addw	sp,#1
 994  023f 4d            	tnz	a
 995  0240 2706          	jreq	L503
 998  0242 7b01          	ld	a,(OFST+0,sp)
 999  0244 aa04          	or	a,#4
1000  0246 6b01          	ld	(OFST+0,sp),a
1002  0248               L503:
1003                     ; 171 	if(GPIO_ReadInputPin(LCD_D7_PORT,LCD_D7_PIN)){tmp |= 1<<3;}
1005  0248 4b04          	push	#4
1006  024a ae500f        	ldw	x,#20495
1007  024d cd0000        	call	_GPIO_ReadInputPin
1009  0250 5b01          	addw	sp,#1
1010  0252 4d            	tnz	a
1011  0253 2706          	jreq	L703
1014  0255 7b01          	ld	a,(OFST+0,sp)
1015  0257 aa08          	or	a,#8
1016  0259 6b01          	ld	(OFST+0,sp),a
1018  025b               L703:
1019                     ; 172 	return tmp;
1021  025b 7b01          	ld	a,(OFST+0,sp)
1024  025d 5b01          	addw	sp,#1
1025  025f 81            	ret
1054                     ; 176 void lcd_e_tick(void){
1055                     	switch	.text
1056  0260               _lcd_e_tick:
1060                     ; 177 	LCD_E_H;
1062  0260 4b20          	push	#32
1063  0262 ae5019        	ldw	x,#20505
1064  0265 cd0000        	call	_GPIO_WriteHigh
1066  0268 84            	pop	a
1067                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1071  0269 ae0006        	ldw	x,#6
1073  026c 9d            nop
1074  026d                L44:
1075  026d 5a             decw X
1076  026e 26fd           jrne L44
1077  0270 9d             nop
1078                      
1080  0271               L313:
1081                     ; 179 	LCD_E_L;
1083  0271 4b20          	push	#32
1084  0273 ae5019        	ldw	x,#20505
1085  0276 cd0000        	call	_GPIO_WriteLow
1087  0279 84            	pop	a
1088                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1092  027a ae0006        	ldw	x,#6
1094  027d 9d            nop
1095  027e                L64:
1096  027e 5a             decw X
1097  027f 26fd           jrne L64
1098  0281 9d             nop
1099                      
1101  0282               L713:
1102                     ; 181 }
1105  0282 81            	ret
1146                     ; 184 void lcd_command(uint8_t command){
1147                     	switch	.text
1148  0283               _lcd_command:
1150  0283 88            	push	a
1151       00000000      OFST:	set	0
1154                     ; 185 	LCD_RS_L;
1156  0284 4b80          	push	#128
1157  0286 ae5019        	ldw	x,#20505
1158  0289 cd0000        	call	_GPIO_WriteLow
1160  028c 84            	pop	a
1161                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1165  028d ae0006        	ldw	x,#6
1167  0290 9d            nop
1168  0291                L25:
1169  0291 5a             decw X
1170  0292 26fd           jrne L25
1171  0294 9d             nop
1172                      
1174  0295               L333:
1175                     ; 187 	lcd_bus_set((command >> 4) & 0b1111);
1177  0295 7b01          	ld	a,(OFST+1,sp)
1178  0297 4e            	swap	a
1179  0298 a40f          	and	a,#15
1180  029a cd01a3        	call	_lcd_bus_set
1182                     ; 188 	lcd_e_tick();
1184  029d adc1          	call	_lcd_e_tick
1186                     ; 189 	lcd_bus_set(command & 0b1111);
1188  029f 7b01          	ld	a,(OFST+1,sp)
1189  02a1 a40f          	and	a,#15
1190  02a3 cd01a3        	call	_lcd_bus_set
1192                     ; 190 	lcd_e_tick();
1194  02a6 adb8          	call	_lcd_e_tick
1196                     ; 191 	lcd_busy_wait();
1198  02a8 cd03a2        	call	_lcd_busy_wait
1200                     ; 192 }
1203  02ab 84            	pop	a
1204  02ac 81            	ret
1245                     ; 195 void lcd_data(uint8_t data){
1246                     	switch	.text
1247  02ad               _lcd_data:
1249  02ad 88            	push	a
1250       00000000      OFST:	set	0
1253                     ; 196 	LCD_RS_H;
1255  02ae 4b80          	push	#128
1256  02b0 ae5019        	ldw	x,#20505
1257  02b3 cd0000        	call	_GPIO_WriteHigh
1259  02b6 84            	pop	a
1260                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1264  02b7 ae0006        	ldw	x,#6
1266  02ba 9d            nop
1267  02bb                L65:
1268  02bb 5a             decw X
1269  02bc 26fd           jrne L65
1270  02be 9d             nop
1271                      
1273  02bf               L553:
1274                     ; 198 	lcd_bus_set((data >> 4) & 0b1111);
1276  02bf 7b01          	ld	a,(OFST+1,sp)
1277  02c1 4e            	swap	a
1278  02c2 a40f          	and	a,#15
1279  02c4 cd01a3        	call	_lcd_bus_set
1281                     ; 199 	lcd_e_tick();
1283  02c7 ad97          	call	_lcd_e_tick
1285                     ; 200 	lcd_bus_set(data & 0b1111);
1287  02c9 7b01          	ld	a,(OFST+1,sp)
1288  02cb a40f          	and	a,#15
1289  02cd cd01a3        	call	_lcd_bus_set
1291                     ; 201 	lcd_e_tick();
1293  02d0 ad8e          	call	_lcd_e_tick
1295                     ; 202 	lcd_busy_wait();
1297  02d2 cd03a2        	call	_lcd_busy_wait
1299                     ; 203 }
1302  02d5 84            	pop	a
1303  02d6 81            	ret
1349                     ; 206 uint8_t lcd_read(void){
1350                     	switch	.text
1351  02d7               _lcd_read:
1353  02d7 88            	push	a
1354       00000001      OFST:	set	1
1357                     ; 207 	uint8_t tmp=0;
1359                     ; 208 	LCD_RS_L;
1361  02d8 4b80          	push	#128
1362  02da ae5019        	ldw	x,#20505
1363  02dd cd0000        	call	_GPIO_WriteLow
1365  02e0 84            	pop	a
1366                     ; 209 	lcd_bus_inputs();
1368  02e1 cd0128        	call	_lcd_bus_inputs
1370                     ; 210 	LCD_RW_H;
1372  02e4 4b40          	push	#64
1373  02e6 ae5019        	ldw	x,#20505
1374  02e9 cd0000        	call	_GPIO_WriteHigh
1376  02ec 84            	pop	a
1377                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1381  02ed ae0006        	ldw	x,#6
1383  02f0 9d            nop
1384  02f1                L26:
1385  02f1 5a             decw X
1386  02f2 26fd           jrne L26
1387  02f4 9d             nop
1388                      
1390  02f5               L773:
1391                     ; 212 	LCD_E_H;
1393  02f5 4b20          	push	#32
1394  02f7 ae5019        	ldw	x,#20505
1395  02fa cd0000        	call	_GPIO_WriteHigh
1397  02fd 84            	pop	a
1398                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1402  02fe ae0006        	ldw	x,#6
1404  0301 9d            nop
1405  0302                L46:
1406  0302 5a             decw X
1407  0303 26fd           jrne L46
1408  0305 9d             nop
1409                      
1411  0306               L304:
1412                     ; 214 	tmp = lcd_bus_read()<<4;
1414  0306 cd020c        	call	_lcd_bus_read
1416  0309 97            	ld	xl,a
1417  030a a610          	ld	a,#16
1418  030c 42            	mul	x,a
1419  030d 9f            	ld	a,xl
1420  030e 6b01          	ld	(OFST+0,sp),a
1422                     ; 215 	LCD_E_L;
1424  0310 4b20          	push	#32
1425  0312 ae5019        	ldw	x,#20505
1426  0315 cd0000        	call	_GPIO_WriteLow
1428  0318 84            	pop	a
1429                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1433  0319 ae0006        	ldw	x,#6
1435  031c 9d            nop
1436  031d                L66:
1437  031d 5a             decw X
1438  031e 26fd           jrne L66
1439  0320 9d             nop
1440                      
1442  0321               L704:
1443                     ; 217 	LCD_E_H;
1445  0321 4b20          	push	#32
1446  0323 ae5019        	ldw	x,#20505
1447  0326 cd0000        	call	_GPIO_WriteHigh
1449  0329 84            	pop	a
1450                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1454  032a ae0006        	ldw	x,#6
1456  032d 9d            nop
1457  032e                L07:
1458  032e 5a             decw X
1459  032f 26fd           jrne L07
1460  0331 9d             nop
1461                      
1463  0332               L314:
1464                     ; 219 	tmp |= lcd_bus_read();
1466  0332 cd020c        	call	_lcd_bus_read
1468  0335 1a01          	or	a,(OFST+0,sp)
1469  0337 6b01          	ld	(OFST+0,sp),a
1471                     ; 220 	LCD_E_L;
1473  0339 4b20          	push	#32
1474  033b ae5019        	ldw	x,#20505
1475  033e cd0000        	call	_GPIO_WriteLow
1477  0341 84            	pop	a
1478                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1482  0342 ae0006        	ldw	x,#6
1484  0345 9d            nop
1485  0346                L27:
1486  0346 5a             decw X
1487  0347 26fd           jrne L27
1488  0349 9d             nop
1489                      
1491  034a               L714:
1492                     ; 222 	LCD_RW_L;
1494  034a 4b40          	push	#64
1495  034c ae5019        	ldw	x,#20505
1496  034f cd0000        	call	_GPIO_WriteLow
1498  0352 84            	pop	a
1499                     ; 223 	lcd_bus_outputs();
1501  0353 cd00fb        	call	_lcd_bus_outputs
1503                     ; 224 	return tmp;
1505  0356 7b01          	ld	a,(OFST+0,sp)
1508  0358 5b01          	addw	sp,#1
1509  035a 81            	ret
1534                     ; 229 void lcd_bus_sleep(void){
1535                     	switch	.text
1536  035b               _lcd_bus_sleep:
1540                     ; 230 LCD_RS_H;
1542  035b 4b80          	push	#128
1543  035d ae5019        	ldw	x,#20505
1544  0360 cd0000        	call	_GPIO_WriteHigh
1546  0363 84            	pop	a
1547                     ; 231 LCD_RW_H;
1549  0364 4b40          	push	#64
1550  0366 ae5019        	ldw	x,#20505
1551  0369 cd0000        	call	_GPIO_WriteHigh
1553  036c 84            	pop	a
1554                     ; 232 lcd_bus_inputs();
1556  036d cd0128        	call	_lcd_bus_inputs
1558                     ; 233 }
1561  0370 81            	ret
1587                     ; 236 void lcd_bus_wakeup(void){
1588                     	switch	.text
1589  0371               _lcd_bus_wakeup:
1593                     ; 237 LCD_RW_L;
1595  0371 4b40          	push	#64
1596  0373 ae5019        	ldw	x,#20505
1597  0376 cd0000        	call	_GPIO_WriteLow
1599  0379 84            	pop	a
1600                     ; 238 LCD_D4_H;
1602  037a 4b10          	push	#16
1603  037c ae5019        	ldw	x,#20505
1604  037f cd0000        	call	_GPIO_WriteHigh
1606  0382 84            	pop	a
1607                     ; 239 LCD_D5_H;
1609  0383 4b08          	push	#8
1610  0385 ae5019        	ldw	x,#20505
1611  0388 cd0000        	call	_GPIO_WriteHigh
1613  038b 84            	pop	a
1614                     ; 240 LCD_D6_H;
1616  038c 4b01          	push	#1
1617  038e ae5019        	ldw	x,#20505
1618  0391 cd0000        	call	_GPIO_WriteHigh
1620  0394 84            	pop	a
1621                     ; 241 LCD_D7_H;
1623  0395 4b04          	push	#4
1624  0397 ae500f        	ldw	x,#20495
1625  039a cd0000        	call	_GPIO_WriteHigh
1627  039d 84            	pop	a
1628                     ; 242 lcd_bus_outputs();
1630  039e cd00fb        	call	_lcd_bus_outputs
1632                     ; 243 }	
1635  03a1 81            	ret
1670                     ; 246 uint8_t lcd_busy_wait(void){
1671                     	switch	.text
1672  03a2               _lcd_busy_wait:
1674  03a2 89            	pushw	x
1675       00000002      OFST:	set	2
1678                     ; 247 	uint16_t timeout=LCD_BUSY_TIMEOUT;
1680  03a3 ae01f4        	ldw	x,#500
1681  03a6 1f01          	ldw	(OFST-1,sp),x
1684  03a8 2007          	jra	L105
1685  03aa               L574:
1686                     ; 249 		timeout--;
1688  03aa 1e01          	ldw	x,(OFST-1,sp)
1689  03ac 1d0001        	subw	x,#1
1690  03af 1f01          	ldw	(OFST-1,sp),x
1692  03b1               L105:
1693                     ; 248 	while(timeout && lcd_busy()){
1695  03b1 1e01          	ldw	x,(OFST-1,sp)
1696  03b3 2707          	jreq	L505
1698  03b5 cd02d7        	call	_lcd_read
1700  03b8 a580          	bcp	a,#128
1701  03ba 26ee          	jrne	L574
1702  03bc               L505:
1703                     ; 251 	if(timeout==0){return 1;} // error, busy still ==1
1705  03bc 1e01          	ldw	x,(OFST-1,sp)
1706  03be 2604          	jrne	L705
1709  03c0 a601          	ld	a,#1
1711  03c2 2001          	jra	L201
1712  03c4               L705:
1713                     ; 252 	else{return 0;}
1715  03c4 4f            	clr	a
1717  03c5               L201:
1719  03c5 85            	popw	x
1720  03c6 81            	ret
1733                     	xdef	_lcd_store_symbol
1734                     	xdef	_lcd_puts
1735                     	xdef	_lcd_gotoxy
1736                     	xdef	_lcd_init
1737                     	xdef	_lcd_bus_wakeup
1738                     	xdef	_lcd_bus_sleep
1739                     	xdef	_lcd_busy_wait
1740                     	xdef	_lcd_read
1741                     	xdef	_lcd_data
1742                     	xdef	_lcd_command
1743                     	xdef	_lcd_e_tick
1744                     	xdef	_lcd_bus_read
1745                     	xdef	_lcd_bus_inputs
1746                     	xdef	_lcd_bus_outputs
1747                     	xdef	_lcd_deinit_hw
1748                     	xdef	_lcd_init_hw
1749                     	xdef	_lcd_bus_set
1750                     	xref	_GPIO_ReadInputPin
1751                     	xref	_GPIO_WriteLow
1752                     	xref	_GPIO_WriteHigh
1753                     	xref	_GPIO_Init
1772                     	end
