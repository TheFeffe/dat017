   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "E:/DAT017/CodeLite files/Moplaborationer/delay/startup.c"
   1:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** #include "gpio.h"
   2:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** #include "sys_delay.h"
   3:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 
   4:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** /*
   5:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c ****  * 	startup.c
   6:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c ****  *
   7:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c ****  */
   8:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   9:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 
  10:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** void startup ( void )
  11:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** {
  26              		.loc 1 11 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  12:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** __asm volatile(
  31              		.loc 1 12 0
  32              		.syntax divided
  33              	@ 12 "E:/DAT017/CodeLite files/Moplaborationer/delay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  13:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  14:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 	" MOV SP,R0\n"
  15:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 	" BL main\n"				/* call main */
  16:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 	"_exit: B .\n"				/* never return */
  17:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 	) ;
  18:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** }
  40              		.loc 1 18 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	init_app
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	init_app:
  56              	.LFB1:
  19:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 
  20:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** void init_app( void )
  21:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** {
  57              		.loc 1 21 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  22:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 	setup_for_seg_disp(GPIO_D);
  67              		.loc 1 22 0
  68 0004 034B     		ldr	r3, .L3
  69 0006 1800     		movs	r0, r3
  70 0008 FFF7FEFF 		bl	setup_for_seg_disp
  23:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** }
  71              		.loc 1 23 0
  72 000c C046     		nop
  73 000e BD46     		mov	sp, r7
  74              		@ sp needed
  75 0010 80BD     		pop	{r7, pc}
  76              	.L4:
  77 0012 C046     		.align	2
  78              	.L3:
  79 0014 000C0240 		.word	1073875968
  80              		.cfi_endproc
  81              	.LFE1:
  83              		.align	1
  84              		.global	main
  85              		.syntax unified
  86              		.code	16
  87              		.thumb_func
  88              		.fpu softvfp
  90              	main:
  91              	.LFB2:
  24:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 
  25:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** void main(void)
  26:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** {
  92              		.loc 1 26 0
  93              		.cfi_startproc
  94              		@ args = 0, pretend = 0, frame = 0
  95              		@ frame_needed = 1, uses_anonymous_args = 0
  96 0018 80B5     		push	{r7, lr}
  97              		.cfi_def_cfa_offset 8
  98              		.cfi_offset 7, -8
  99              		.cfi_offset 14, -4
 100 001a 00AF     		add	r7, sp, #0
 101              		.cfi_def_cfa_register 7
  27:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 	init_app();
 102              		.loc 1 27 0
 103 001c FFF7FEFF 		bl	init_app
 104              	.L6:
  28:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 	while(1)
  29:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 	{
  30:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 		GPIO_D->odrLow = 0;
 105              		.loc 1 30 0 discriminator 1
 106 0020 084B     		ldr	r3, .L7
 107 0022 0022     		movs	r2, #0
 108 0024 1A75     		strb	r2, [r3, #20]
  31:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 		//out7seg(GPIO_D, 0x0);
  32:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 		delay_milli(500);
 109              		.loc 1 32 0 discriminator 1
 110 0026 FA23     		movs	r3, #250
 111 0028 5B00     		lsls	r3, r3, #1
 112 002a 1800     		movs	r0, r3
 113 002c FFF7FEFF 		bl	delay_milli
  33:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 		GPIO_D->odrLow = 0xFF;
 114              		.loc 1 33 0 discriminator 1
 115 0030 044B     		ldr	r3, .L7
 116 0032 FF22     		movs	r2, #255
 117 0034 1A75     		strb	r2, [r3, #20]
  34:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 		//out7seg(GPIO_D, 0x0F);
  35:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 		delay_milli(500);
 118              		.loc 1 35 0 discriminator 1
 119 0036 FA23     		movs	r3, #250
 120 0038 5B00     		lsls	r3, r3, #1
 121 003a 1800     		movs	r0, r3
 122 003c FFF7FEFF 		bl	delay_milli
  30:E:/DAT017/CodeLite files/Moplaborationer/delay\startup.c **** 		//out7seg(GPIO_D, 0x0);
 123              		.loc 1 30 0 discriminator 1
 124 0040 EEE7     		b	.L6
 125              	.L8:
 126 0042 C046     		.align	2
 127              	.L7:
 128 0044 000C0240 		.word	1073875968
 129              		.cfi_endproc
 130              	.LFE2:
 132              	.Letext0:
 133              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 134              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 135              		.file 4 "E:/DAT017/CodeLite files/Moplaborationer/delay/gpio.h"
