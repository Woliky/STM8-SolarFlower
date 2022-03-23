   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  44                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 54 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 58 }
  53  0000 80            	iret
  75                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 67 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 71 }
  84  0001 80            	iret
 106                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 79 
 106                     ; 80 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 84 }
 115  0002 80            	iret
 137                     ; 105 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 137                     ; 106 {
 138                     	switch	.text
 139  0003               f_CLK_IRQHandler:
 143                     ; 110 }
 146  0003 80            	iret
 169                     ; 117 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 169                     ; 118 {
 170                     	switch	.text
 171  0004               f_EXTI_PORTA_IRQHandler:
 175                     ; 122 }
 178  0004 80            	iret
 201                     ; 129 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 201                     ; 130 {
 202                     	switch	.text
 203  0005               f_EXTI_PORTB_IRQHandler:
 207                     ; 134 }
 210  0005 80            	iret
 233                     ; 141 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 233                     ; 142 {
 234                     	switch	.text
 235  0006               f_EXTI_PORTC_IRQHandler:
 239                     ; 146 }
 242  0006 80            	iret
 265                     ; 153 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 265                     ; 154 {
 266                     	switch	.text
 267  0007               f_EXTI_PORTD_IRQHandler:
 271                     ; 158 }
 274  0007 80            	iret
 296                     ; 191  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 296                     ; 192  {
 297                     	switch	.text
 298  0008               f_CAN_RX_IRQHandler:
 302                     ; 196  }
 305  0008 80            	iret
 327                     ; 203  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 327                     ; 204  {
 328                     	switch	.text
 329  0009               f_CAN_TX_IRQHandler:
 333                     ; 208  }
 336  0009 80            	iret
 358                     ; 216 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 217 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 364                     ; 221 }
 367  000a 80            	iret
 390                     ; 228 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 390                     ; 229 {
 391                     	switch	.text
 392  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 396                     ; 233 }
 399  000b 80            	iret
 422                     ; 240 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 422                     ; 241 {
 423                     	switch	.text
 424  000c               f_TIM1_CAP_COM_IRQHandler:
 428                     ; 245 }
 431  000c 80            	iret
 454                     ; 278  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 454                     ; 279  {
 455                     	switch	.text
 456  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 460                     ; 283  }
 463  000d 80            	iret
 486                     ; 290  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 486                     ; 291  {
 487                     	switch	.text
 488  000e               f_TIM2_CAP_COM_IRQHandler:
 492                     ; 295  }
 495  000e 80            	iret
 518                     ; 305  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 518                     ; 306  {
 519                     	switch	.text
 520  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 524                     ; 310  }
 527  000f 80            	iret
 550                     ; 317  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 550                     ; 318  {
 551                     	switch	.text
 552  0010               f_TIM3_CAP_COM_IRQHandler:
 556                     ; 322  }
 559  0010 80            	iret
 582                     ; 332  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 582                     ; 333  {
 583                     	switch	.text
 584  0011               f_UART1_TX_IRQHandler:
 588                     ; 337  }
 591  0011 80            	iret
 614                     ; 344  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 614                     ; 345  {
 615                     	switch	.text
 616  0012               f_UART1_RX_IRQHandler:
 620                     ; 349  }
 623  0012 80            	iret
 645                     ; 383 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 645                     ; 384 {
 646                     	switch	.text
 647  0013               f_I2C_IRQHandler:
 651                     ; 388 }
 654  0013 80            	iret
 677                     ; 422  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 677                     ; 423  {
 678                     	switch	.text
 679  0014               f_UART3_TX_IRQHandler:
 683                     ; 427  }
 686  0014 80            	iret
 709                     ; 434  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 709                     ; 435  {
 710                     	switch	.text
 711  0015               f_UART3_RX_IRQHandler:
 715                     ; 439  }
 718  0015 80            	iret
 740                     ; 448  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 740                     ; 449  {
 741                     	switch	.text
 742  0016               f_ADC2_IRQHandler:
 746                     ; 453  }
 749  0016 80            	iret
 772                     ; 501 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 772                     ; 502 {
 773                     	switch	.text
 774  0017               f_EEPROM_EEC_IRQHandler:
 778                     ; 506 }
 781  0017 80            	iret
 793                     	xdef	f_EEPROM_EEC_IRQHandler
 794                     	xdef	f_ADC2_IRQHandler
 795                     	xdef	f_UART3_TX_IRQHandler
 796                     	xdef	f_UART3_RX_IRQHandler
 797                     	xdef	f_I2C_IRQHandler
 798                     	xdef	f_UART1_RX_IRQHandler
 799                     	xdef	f_UART1_TX_IRQHandler
 800                     	xdef	f_TIM3_CAP_COM_IRQHandler
 801                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 802                     	xdef	f_TIM2_CAP_COM_IRQHandler
 803                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 804                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 805                     	xdef	f_TIM1_CAP_COM_IRQHandler
 806                     	xdef	f_SPI_IRQHandler
 807                     	xdef	f_CAN_TX_IRQHandler
 808                     	xdef	f_CAN_RX_IRQHandler
 809                     	xdef	f_EXTI_PORTD_IRQHandler
 810                     	xdef	f_EXTI_PORTC_IRQHandler
 811                     	xdef	f_EXTI_PORTB_IRQHandler
 812                     	xdef	f_EXTI_PORTA_IRQHandler
 813                     	xdef	f_CLK_IRQHandler
 814                     	xdef	f_TLI_IRQHandler
 815                     	xdef	f_TRAP_IRQHandler
 816                     	xdef	f_NonHandledInterrupt
 835                     	end
