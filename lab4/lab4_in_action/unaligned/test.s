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
  25              		.file 1 "C:/Users/levholm/Documents/basics_io/unaligned/startup.c"
   1:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** /*
   2:C:/Users/levholm/Documents/basics_io/unaligned\startup.c ****  * 	startup.c
   3:C:/Users/levholm/Documents/basics_io/unaligned\startup.c ****  *
   4:C:/Users/levholm/Documents/basics_io/unaligned\startup.c ****  */
   5:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** #include "sys_delay.h"
   6:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** #include "gpio.h"
   7:C:/Users/levholm/Documents/basics_io/unaligned\startup.c ****  
   8:C:/Users/levholm/Documents/basics_io/unaligned\startup.c ****  #ifdef SIMULATOR
   9:C:/Users/levholm/Documents/basics_io/unaligned\startup.c ****  #define DELAY_COUNT 100
  10:C:/Users/levholm/Documents/basics_io/unaligned\startup.c ****  #else
  11:C:/Users/levholm/Documents/basics_io/unaligned\startup.c ****  #define DELAY_COUNT 1000000
  12:C:/Users/levholm/Documents/basics_io/unaligned\startup.c ****  #endif
  13:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  14:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 
  15:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** void startup ( void )
  16:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** {
  26              		.loc 1 16 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  17:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** __asm volatile(
  31              		.loc 1 17 0
  32              		.syntax divided
  33              	@ 17 "C:/Users/levholm/Documents/basics_io/unaligned/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  18:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  19:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	" MOV SP,R0\n"
  20:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	" BL main\n"				/* call main */
  21:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	".L1: B .L1\n"				/* never return */
  22:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	) ;
  23:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** }
  40              		.loc 1 23 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.bss
  48              		.align	2
  49              	systick_flag:
  50 0000 00000000 		.space	4
  52              		.align	2
  53              	delay_count:
  54 0004 00000000 		.space	4
  56              		.text
  57              		.align	1
  58              		.global	systick_irq_handler
  59              		.syntax unified
  60              		.code	16
  61              		.thumb_func
  62              		.fpu softvfp
  64              	systick_irq_handler:
  65              	.LFB1:
  24:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 
  25:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** static int systick_flag;
  26:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** static int delay_count;
  27:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 
  28:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** void systick_irq_handler ( void )
  29:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** {
  66              		.loc 1 29 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 0
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0000 80B5     		push	{r7, lr}
  71              		.cfi_def_cfa_offset 8
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0002 00AF     		add	r7, sp, #0
  75              		.cfi_def_cfa_register 7
  30:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	delay_count--;
  76              		.loc 1 30 0
  77 0004 084B     		ldr	r3, .L6
  78 0006 1B68     		ldr	r3, [r3]
  79 0008 5A1E     		subs	r2, r3, #1
  80 000a 074B     		ldr	r3, .L6
  81 000c 1A60     		str	r2, [r3]
  31:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	if(delay_count > 0)
  82              		.loc 1 31 0
  83 000e 064B     		ldr	r3, .L6
  84 0010 1B68     		ldr	r3, [r3]
  85 0012 002B     		cmp	r3, #0
  86 0014 02DD     		ble	.L3
  32:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 		delay_250ns();
  87              		.loc 1 32 0
  88 0016 FFF7FEFF 		bl	delay_250ns
  33:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	else
  34:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 		systick_flag = 1;
  35:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** }
  89              		.loc 1 35 0
  90 001a 02E0     		b	.L5
  91              	.L3:
  34:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** }
  92              		.loc 1 34 0
  93 001c 034B     		ldr	r3, .L6+4
  94 001e 0122     		movs	r2, #1
  95 0020 1A60     		str	r2, [r3]
  96              	.L5:
  97              		.loc 1 35 0
  98 0022 C046     		nop
  99 0024 BD46     		mov	sp, r7
 100              		@ sp needed
 101 0026 80BD     		pop	{r7, pc}
 102              	.L7:
 103              		.align	2
 104              	.L6:
 105 0028 04000000 		.word	delay_count
 106 002c 00000000 		.word	systick_flag
 107              		.cfi_endproc
 108              	.LFE1:
 110              		.align	1
 111              		.global	delay
 112              		.syntax unified
 113              		.code	16
 114              		.thumb_func
 115              		.fpu softvfp
 117              	delay:
 118              	.LFB2:
  36:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 
  37:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** void delay(unsigned int count)
  38:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** {
 119              		.loc 1 38 0
 120              		.cfi_startproc
 121              		@ args = 0, pretend = 0, frame = 8
 122              		@ frame_needed = 1, uses_anonymous_args = 0
 123 0030 80B5     		push	{r7, lr}
 124              		.cfi_def_cfa_offset 8
 125              		.cfi_offset 7, -8
 126              		.cfi_offset 14, -4
 127 0032 82B0     		sub	sp, sp, #8
 128              		.cfi_def_cfa_offset 16
 129 0034 00AF     		add	r7, sp, #0
 130              		.cfi_def_cfa_register 7
 131 0036 7860     		str	r0, [r7, #4]
  39:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	delay_count = count;
 132              		.loc 1 39 0
 133 0038 7A68     		ldr	r2, [r7, #4]
 134 003a 054B     		ldr	r3, .L9
 135 003c 1A60     		str	r2, [r3]
  40:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	systick_flag = 0;
 136              		.loc 1 40 0
 137 003e 054B     		ldr	r3, .L9+4
 138 0040 0022     		movs	r2, #0
 139 0042 1A60     		str	r2, [r3]
  41:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 
  42:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	delay_250ns();
 140              		.loc 1 42 0
 141 0044 FFF7FEFF 		bl	delay_250ns
  43:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** }
 142              		.loc 1 43 0
 143 0048 C046     		nop
 144 004a BD46     		mov	sp, r7
 145 004c 02B0     		add	sp, sp, #8
 146              		@ sp needed
 147 004e 80BD     		pop	{r7, pc}
 148              	.L10:
 149              		.align	2
 150              	.L9:
 151 0050 04000000 		.word	delay_count
 152 0054 00000000 		.word	systick_flag
 153              		.cfi_endproc
 154              	.LFE2:
 156              		.align	1
 157              		.global	init_app
 158              		.syntax unified
 159              		.code	16
 160              		.thumb_func
 161              		.fpu softvfp
 163              	init_app:
 164              	.LFB3:
  44:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 
  45:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** void init_app( void )
  46:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** {
 165              		.loc 1 46 0
 166              		.cfi_startproc
 167              		@ args = 0, pretend = 0, frame = 0
 168              		@ frame_needed = 1, uses_anonymous_args = 0
 169 0058 80B5     		push	{r7, lr}
 170              		.cfi_def_cfa_offset 8
 171              		.cfi_offset 7, -8
 172              		.cfi_offset 14, -4
 173 005a 00AF     		add	r7, sp, #0
 174              		.cfi_def_cfa_register 7
  47:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	/* Starta klockor port D och E */
  48:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	*((unsigned long *) 0x40023830) =0x18;
 175              		.loc 1 48 0
 176 005c 084B     		ldr	r3, .L12
 177 005e 1822     		movs	r2, #24
 178 0060 1A60     		str	r2, [r3]
  49:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	__asm volatile( " LDR R0,=0x08000209\n BLX R0\n");
 179              		.loc 1 49 0
 180              		.syntax divided
 181              	@ 49 "C:/Users/levholm/Documents/basics_io/unaligned/startup.c" 1
 182 0062 1E48     		 LDR R0,=0x08000209
 183 0064 8047     	 BLX R0
 184              	
 185              	@ 0 "" 2
  50:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	*((unsigned long *) 0xE000ED08 ) = 0x2001C000;
 186              		.loc 1 50 0
 187              		.thumb
 188              		.syntax unified
 189 0066 074B     		ldr	r3, .L12+4
 190 0068 074A     		ldr	r2, .L12+8
 191 006a 1A60     		str	r2, [r3]
  51:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	/* Initiera port D */
  52:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	/* Initiera undantagsvektor */
  53:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	*((void (**)(void) ) 0x2001C03C ) = systick_irq_handler;
 192              		.loc 1 53 0
 193 006c 074B     		ldr	r3, .L12+12
 194 006e 084A     		ldr	r2, .L12+16
 195 0070 1A60     		str	r2, [r3]
  54:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	GPIO_D->moder = 0x5555;
 196              		.loc 1 54 0
 197 0072 084B     		ldr	r3, .L12+20
 198 0074 084A     		ldr	r2, .L12+24
 199 0076 1A60     		str	r2, [r3]
  55:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** }
 200              		.loc 1 55 0
 201 0078 C046     		nop
 202 007a BD46     		mov	sp, r7
 203              		@ sp needed
 204 007c 80BD     		pop	{r7, pc}
 205              	.L13:
 206 007e C046     		.align	2
 207              	.L12:
 208 0080 30380240 		.word	1073887280
 209 0084 08ED00E0 		.word	-536810232
 210 0088 00C00120 		.word	536985600
 211 008c 3CC00120 		.word	536985660
 212 0090 00000000 		.word	systick_irq_handler
 213 0094 000C0240 		.word	1073875968
 214 0098 55550000 		.word	21845
 215              		.cfi_endproc
 216              	.LFE3:
 218              		.align	1
 219              		.global	main
 220              		.syntax unified
 221              		.code	16
 222              		.thumb_func
 223              		.fpu softvfp
 225              	main:
 226              	.LFB4:
  56:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 
  57:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** void main(void)
  58:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** {
 227              		.loc 1 58 0
 228              		.cfi_startproc
 229              		@ args = 0, pretend = 0, frame = 0
 230              		@ frame_needed = 1, uses_anonymous_args = 0
 231 009c 80B5     		push	{r7, lr}
 232              		.cfi_def_cfa_offset 8
 233              		.cfi_offset 7, -8
 234              		.cfi_offset 14, -4
 235 009e 00AF     		add	r7, sp, #0
 236              		.cfi_def_cfa_register 7
  59:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	init_app();
 237              		.loc 1 59 0
 238 00a0 FFF7FEFF 		bl	init_app
  60:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	GPIO_D -> odrLow = 0;
 239              		.loc 1 60 0
 240 00a4 0A4B     		ldr	r3, .L20
 241 00a6 0022     		movs	r2, #0
 242 00a8 1A75     		strb	r2, [r3, #20]
  61:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	delay( DELAY_COUNT );
 243              		.loc 1 61 0
 244 00aa 0A4B     		ldr	r3, .L20+4
 245 00ac 1800     		movs	r0, r3
 246 00ae FFF7FEFF 		bl	delay
  62:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	GPIO_D -> odrLow = 0xFF;
 247              		.loc 1 62 0
 248 00b2 074B     		ldr	r3, .L20
 249 00b4 FF22     		movs	r2, #255
 250 00b6 1A75     		strb	r2, [r3, #20]
 251              	.L17:
  63:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	while(1)
  64:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	{
  65:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 		if( systick_flag )
 252              		.loc 1 65 0
 253 00b8 074B     		ldr	r3, .L20+8
 254 00ba 1B68     		ldr	r3, [r3]
 255 00bc 002B     		cmp	r3, #0
 256 00be 00D1     		bne	.L19
 257 00c0 FAE7     		b	.L17
 258              	.L19:
  66:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 			break;
 259              		.loc 1 66 0
 260 00c2 C046     		nop
  67:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 			/* Här placeras kod som kan utföras under väntetiden */
  68:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	}
  69:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	/* Här finns den kod som "väntar" på timeout */
  70:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** 	GPIO_D -> odrLow = 0;
 261              		.loc 1 70 0
 262 00c4 024B     		ldr	r3, .L20
 263 00c6 0022     		movs	r2, #0
 264 00c8 1A75     		strb	r2, [r3, #20]
  71:C:/Users/levholm/Documents/basics_io/unaligned\startup.c **** }
 265              		.loc 1 71 0
 266 00ca C046     		nop
 267 00cc BD46     		mov	sp, r7
 268              		@ sp needed
 269 00ce 80BD     		pop	{r7, pc}
 270              	.L21:
 271              		.align	2
 272              	.L20:
 273 00d0 000C0240 		.word	1073875968
 274 00d4 40420F00 		.word	1000000
 275 00d8 00000000 		.word	systick_flag
 276              		.cfi_endproc
 277              	.LFE4:
 279              	.Letext0:
 280              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 281              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 282              		.file 4 "C:/Users/levholm/Documents/basics_io/unaligned/gpio.h"
