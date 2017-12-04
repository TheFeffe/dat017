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
  25              		.file 1 "C:/Users/levholm/dat017/lab3/graphicdisplay/startup.c"
   1:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** /*
   2:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c ****  * 	startup.c
   3:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c ****  *
   4:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c ****  */
   5:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c ****  
   6:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** #include "sys_delay.h"
   7:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** #include "gpio.h"
   8:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c ****  
   9:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  10:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 
  11:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** void startup ( void )
  12:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** {
  26              		.loc 1 12 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  13:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	asm volatile(
  31              		.loc 1 13 0
  32              		.syntax divided
  33              	@ 13 "C:/Users/levholm/dat017/lab3/graphicdisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  14:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		" LDR R0,=0x2001C000\n"		/* set stack */
  15:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		" MOV SP,R0\n"
  16:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		" BL main\n"				/* call main */
  17:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		".L1: B .L1\n"				/* never return */
  18:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	);
  19:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** }
  40              		.loc 1 19 0
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
  20:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 
  21:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** #define TARGET_FPS 30
  22:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 
  23:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** void init_app(void){
  57              		.loc 1 23 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  24:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	//#ifdef USBDM
  25:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		*((unsigned long *) 0x40023830) =0x18;
  67              		.loc 1 25 0
  68 0004 0A4B     		ldr	r3, .L3
  69 0006 1822     		movs	r2, #24
  70 0008 1A60     		str	r2, [r3]
  26:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		__asm volatile( " LDR R0,=0x08000209\n BLX R0\n");
  71              		.loc 1 26 0
  72              		.syntax divided
  73              	@ 26 "C:/Users/levholm/dat017/lab3/graphicdisplay/startup.c" 1
  74 000a 6B48     		 LDR R0,=0x08000209
  75 000c 8047     	 BLX R0
  76              	
  77              	@ 0 "" 2
  27:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	//#endif
  28:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	
  29:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	GPIO_D -> moder = 0x55005555;
  78              		.loc 1 29 0
  79              		.thumb
  80              		.syntax unified
  81 000e 094B     		ldr	r3, .L3+4
  82 0010 094A     		ldr	r2, .L3+8
  83 0012 1A60     		str	r2, [r3]
  30:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	GPIO_D -> otyper = 0x70;
  84              		.loc 1 30 0
  85 0014 074B     		ldr	r3, .L3+4
  86 0016 7022     		movs	r2, #112
  87 0018 9A80     		strh	r2, [r3, #4]
  31:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	GPIO_D -> pupdr = 0x00AA0000;
  88              		.loc 1 31 0
  89 001a 064B     		ldr	r3, .L3+4
  90 001c AA22     		movs	r2, #170
  91 001e 1204     		lsls	r2, r2, #16
  92 0020 DA60     		str	r2, [r3, #12]
  32:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	setup_for_seg_disp(GPIO_D);
  93              		.loc 1 32 0
  94 0022 044B     		ldr	r3, .L3+4
  95 0024 1800     		movs	r0, r3
  96 0026 FFF7FEFF 		bl	setup_for_seg_disp
  33:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	//setup_for_ascii_display();
  34:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** }
  97              		.loc 1 34 0
  98 002a C046     		nop
  99 002c BD46     		mov	sp, r7
 100              		@ sp needed
 101 002e 80BD     		pop	{r7, pc}
 102              	.L4:
 103              		.align	2
 104              	.L3:
 105 0030 30380240 		.word	1073887280
 106 0034 000C0240 		.word	1073875968
 107 0038 55550055 		.word	1426085205
 108              		.cfi_endproc
 109              	.LFE1:
 111              		.global	running
 112              		.data
 113              		.align	2
 116              	running:
 117 0000 01000000 		.word	1
 118              		.text
 119              		.align	1
 120              		.global	main
 121              		.syntax unified
 122              		.code	16
 123              		.thumb_func
 124              		.fpu softvfp
 126              	main:
 127              	.LFB2:
  35:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** int running = 1;
  36:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 
  37:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** int main(int argc, char **argv)
  38:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** {
 128              		.loc 1 38 0
 129              		.cfi_startproc
 130              		@ args = 0, pretend = 0, frame = 40
 131              		@ frame_needed = 1, uses_anonymous_args = 0
 132 003c 90B5     		push	{r4, r7, lr}
 133              		.cfi_def_cfa_offset 12
 134              		.cfi_offset 4, -12
 135              		.cfi_offset 7, -8
 136              		.cfi_offset 14, -4
 137 003e 8BB0     		sub	sp, sp, #44
 138              		.cfi_def_cfa_offset 56
 139 0040 00AF     		add	r7, sp, #0
 140              		.cfi_def_cfa_register 7
 141 0042 7860     		str	r0, [r7, #4]
 142 0044 3960     		str	r1, [r7]
  39:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	char c;
  40:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	unsigned i;
  41:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c ****  	init_app();
 143              		.loc 1 41 0
 144 0046 FFF7FEFF 		bl	init_app
  42:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	graphic_initialize();
 145              		.loc 1 42 0
 146 004a FFF7FEFF 		bl	graphic_initialize
  43:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	graphic_clear_screen();
 147              		.loc 1 43 0
 148 004e FFF7FEFF 		bl	graphic_clear_screen
  44:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	
  45:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 
  46:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	/*while(1)
  47:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	{
  48:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		clear_backBuffer();
  49:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		
  50:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		// DO STUFF.
  51:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		
  52:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		graphic_draw_screen();
  53:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		delay_milli(40);
  54:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	}*/
  55:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 128; i++ )
 149              		.loc 1 55 0
 150 0052 0023     		movs	r3, #0
 151 0054 7B62     		str	r3, [r7, #36]
 152 0056 08E0     		b	.L6
 153              	.L7:
  56:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		pixel(i, 10, 1);
 154              		.loc 1 56 0 discriminator 3
 155 0058 7B6A     		ldr	r3, [r7, #36]
 156 005a 0122     		movs	r2, #1
 157 005c 0A21     		movs	r1, #10
 158 005e 1800     		movs	r0, r3
 159 0060 FFF7FEFF 		bl	pixel
  55:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		pixel(i, 10, 1);
 160              		.loc 1 55 0 discriminator 3
 161 0064 7B6A     		ldr	r3, [r7, #36]
 162 0066 0133     		adds	r3, r3, #1
 163 0068 7B62     		str	r3, [r7, #36]
 164              	.L6:
  55:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		pixel(i, 10, 1);
 165              		.loc 1 55 0 is_stmt 0 discriminator 1
 166 006a 7B6A     		ldr	r3, [r7, #36]
 167 006c 7F2B     		cmp	r3, #127
 168 006e F3D9     		bls	.L7
  57:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 64; i++ )
 169              		.loc 1 57 0 is_stmt 1
 170 0070 0023     		movs	r3, #0
 171 0072 7B62     		str	r3, [r7, #36]
 172 0074 08E0     		b	.L8
 173              	.L9:
  58:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		pixel(10, i, 1);
 174              		.loc 1 58 0 discriminator 3
 175 0076 7B6A     		ldr	r3, [r7, #36]
 176 0078 0122     		movs	r2, #1
 177 007a 1900     		movs	r1, r3
 178 007c 0A20     		movs	r0, #10
 179 007e FFF7FEFF 		bl	pixel
  57:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 64; i++ )
 180              		.loc 1 57 0 discriminator 3
 181 0082 7B6A     		ldr	r3, [r7, #36]
 182 0084 0133     		adds	r3, r3, #1
 183 0086 7B62     		str	r3, [r7, #36]
 184              	.L8:
  57:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 64; i++ )
 185              		.loc 1 57 0 is_stmt 0 discriminator 1
 186 0088 7B6A     		ldr	r3, [r7, #36]
 187 008a 3F2B     		cmp	r3, #63
 188 008c F3D9     		bls	.L9
  59:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** //	graphic_draw_screen();
  60:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	delay_milli( 500 );
 189              		.loc 1 60 0 is_stmt 1
 190 008e FA23     		movs	r3, #250
 191 0090 5B00     		lsls	r3, r3, #1
 192 0092 1800     		movs	r0, r3
 193 0094 FFF7FEFF 		bl	delay_milli
  61:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 128; i++ )
 194              		.loc 1 61 0
 195 0098 0023     		movs	r3, #0
 196 009a 7B62     		str	r3, [r7, #36]
 197 009c 08E0     		b	.L10
 198              	.L11:
  62:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		pixel(i, 10, 0);
 199              		.loc 1 62 0 discriminator 3
 200 009e 7B6A     		ldr	r3, [r7, #36]
 201 00a0 0022     		movs	r2, #0
 202 00a2 0A21     		movs	r1, #10
 203 00a4 1800     		movs	r0, r3
 204 00a6 FFF7FEFF 		bl	pixel
  61:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 128; i++ )
 205              		.loc 1 61 0 discriminator 3
 206 00aa 7B6A     		ldr	r3, [r7, #36]
 207 00ac 0133     		adds	r3, r3, #1
 208 00ae 7B62     		str	r3, [r7, #36]
 209              	.L10:
  61:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 128; i++ )
 210              		.loc 1 61 0 is_stmt 0 discriminator 1
 211 00b0 7B6A     		ldr	r3, [r7, #36]
 212 00b2 7F2B     		cmp	r3, #127
 213 00b4 F3D9     		bls	.L11
  63:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 64; i++ )
 214              		.loc 1 63 0 is_stmt 1
 215 00b6 0023     		movs	r3, #0
 216 00b8 7B62     		str	r3, [r7, #36]
 217 00ba 08E0     		b	.L12
 218              	.L13:
  64:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		pixel(10, i, 0);
 219              		.loc 1 64 0 discriminator 3
 220 00bc 7B6A     		ldr	r3, [r7, #36]
 221 00be 0022     		movs	r2, #0
 222 00c0 1900     		movs	r1, r3
 223 00c2 0A20     		movs	r0, #10
 224 00c4 FFF7FEFF 		bl	pixel
  63:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 64; i++ )
 225              		.loc 1 63 0 discriminator 3
 226 00c8 7B6A     		ldr	r3, [r7, #36]
 227 00ca 0133     		adds	r3, r3, #1
 228 00cc 7B62     		str	r3, [r7, #36]
 229              	.L12:
  63:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	for( i = 0; i < 64; i++ )
 230              		.loc 1 63 0 is_stmt 0 discriminator 1
 231 00ce 7B6A     		ldr	r3, [r7, #36]
 232 00d0 3F2B     		cmp	r3, #63
 233 00d2 F3D9     		bls	.L13
  65:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 	//	graphic_draw_screen();
  66:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		delay_milli(500);
 234              		.loc 1 66 0 is_stmt 1
 235 00d4 FA23     		movs	r3, #250
 236 00d6 5B00     		lsls	r3, r3, #1
 237 00d8 1800     		movs	r0, r3
 238 00da FFF7FEFF 		bl	delay_milli
  67:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		graphic_clear_screen();
 239              		.loc 1 67 0
 240 00de FFF7FEFF 		bl	graphic_clear_screen
  68:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		
  69:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		
  70:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		int ballx = 20;
 241              		.loc 1 70 0
 242 00e2 1423     		movs	r3, #20
 243 00e4 3B62     		str	r3, [r7, #32]
  71:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		int bally = 20;
 244              		.loc 1 71 0
 245 00e6 1423     		movs	r3, #20
 246 00e8 FB61     		str	r3, [r7, #28]
  72:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		int velocix = 1;
 247              		.loc 1 72 0
 248 00ea 0123     		movs	r3, #1
 249 00ec BB61     		str	r3, [r7, #24]
  73:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		int velociy = 1;
 250              		.loc 1 73 0
 251 00ee 0123     		movs	r3, #1
 252 00f0 7B61     		str	r3, [r7, #20]
  74:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		int speedx = 2;
 253              		.loc 1 74 0
 254 00f2 0223     		movs	r3, #2
 255 00f4 3B61     		str	r3, [r7, #16]
  75:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		int speedy = 2;
 256              		.loc 1 75 0
 257 00f6 0223     		movs	r3, #2
 258 00f8 FB60     		str	r3, [r7, #12]
  76:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		
  77:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		while(running){
 259              		.loc 1 77 0
 260 00fa 52E0     		b	.L14
 261              	.L24:
  78:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			
  79:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			graphic_clear_screen();
 262              		.loc 1 79 0
 263 00fc FFF7FEFF 		bl	graphic_clear_screen
  80:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 				
  81:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			pixel(ballx, bally, 1);
 264              		.loc 1 81 0
 265 0100 F969     		ldr	r1, [r7, #28]
 266 0102 3B6A     		ldr	r3, [r7, #32]
 267 0104 0122     		movs	r2, #1
 268 0106 1800     		movs	r0, r3
 269 0108 FFF7FEFF 		bl	pixel
  82:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			delay_milli(40);
 270              		.loc 1 82 0
 271 010c 2820     		movs	r0, #40
 272 010e FFF7FEFF 		bl	delay_milli
  83:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			
  84:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			//ballx+=speedx*velocix;
  85:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			//bally+=speedy*velociy;
  86:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			c=keyb();
 273              		.loc 1 86 0
 274 0112 0B23     		movs	r3, #11
 275 0114 FC18     		adds	r4, r7, r3
 276 0116 FFF7FEFF 		bl	keyb
 277 011a 0300     		movs	r3, r0
 278 011c 2370     		strb	r3, [r4]
  87:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			switch(c)
 279              		.loc 1 87 0
 280 011e 0B23     		movs	r3, #11
 281 0120 FB18     		adds	r3, r7, r3
 282 0122 1B78     		ldrb	r3, [r3]
 283 0124 042B     		cmp	r3, #4
 284 0126 0BD0     		beq	.L16
 285 0128 02DC     		bgt	.L17
 286 012a 022B     		cmp	r3, #2
 287 012c 0CD0     		beq	.L18
 288 012e 12E0     		b	.L15
 289              	.L17:
 290 0130 062B     		cmp	r3, #6
 291 0132 02D0     		beq	.L19
 292 0134 082B     		cmp	r3, #8
 293 0136 0BD0     		beq	.L20
 294 0138 0DE0     		b	.L15
 295              	.L19:
  88:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			{
  89:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 				case 6: velocix=1; break;
 296              		.loc 1 89 0
 297 013a 0123     		movs	r3, #1
 298 013c BB61     		str	r3, [r7, #24]
 299 013e 0AE0     		b	.L15
 300              	.L16:
  90:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 				case 4: velocix=-1; break;
 301              		.loc 1 90 0
 302 0140 0123     		movs	r3, #1
 303 0142 5B42     		rsbs	r3, r3, #0
 304 0144 BB61     		str	r3, [r7, #24]
 305 0146 06E0     		b	.L15
 306              	.L18:
  91:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 				case 2: velociy=-1; break;
 307              		.loc 1 91 0
 308 0148 0123     		movs	r3, #1
 309 014a 5B42     		rsbs	r3, r3, #0
 310 014c 7B61     		str	r3, [r7, #20]
 311 014e 02E0     		b	.L15
 312              	.L20:
  92:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 				case 8: velociy=1; break;
 313              		.loc 1 92 0
 314 0150 0123     		movs	r3, #1
 315 0152 7B61     		str	r3, [r7, #20]
 316 0154 C046     		nop
 317              	.L15:
  93:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			}
  94:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			ballx+=speedx*velocix;
 318              		.loc 1 94 0
 319 0156 3B69     		ldr	r3, [r7, #16]
 320 0158 BA69     		ldr	r2, [r7, #24]
 321 015a 5343     		muls	r3, r2
 322 015c 3A6A     		ldr	r2, [r7, #32]
 323 015e D318     		adds	r3, r2, r3
 324 0160 3B62     		str	r3, [r7, #32]
  95:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			bally+=speedy*velociy;
 325              		.loc 1 95 0
 326 0162 FB68     		ldr	r3, [r7, #12]
 327 0164 7A69     		ldr	r2, [r7, #20]
 328 0166 5343     		muls	r3, r2
 329 0168 FA69     		ldr	r2, [r7, #28]
 330 016a D318     		adds	r3, r2, r3
 331 016c FB61     		str	r3, [r7, #28]
  96:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			if(ballx+speedx>=128||ballx-speedx<=0){
 332              		.loc 1 96 0
 333 016e 3A6A     		ldr	r2, [r7, #32]
 334 0170 3B69     		ldr	r3, [r7, #16]
 335 0172 D318     		adds	r3, r2, r3
 336 0174 7F2B     		cmp	r3, #127
 337 0176 04DC     		bgt	.L21
 338              		.loc 1 96 0 is_stmt 0 discriminator 1
 339 0178 3A6A     		ldr	r2, [r7, #32]
 340 017a 3B69     		ldr	r3, [r7, #16]
 341 017c D31A     		subs	r3, r2, r3
 342 017e 002B     		cmp	r3, #0
 343 0180 02DC     		bgt	.L22
 344              	.L21:
  97:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 				velocix*=-1;
 345              		.loc 1 97 0 is_stmt 1
 346 0182 BB69     		ldr	r3, [r7, #24]
 347 0184 5B42     		rsbs	r3, r3, #0
 348 0186 BB61     		str	r3, [r7, #24]
 349              	.L22:
  98:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			}
  99:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			if(bally+speedy>=64||bally-speedy<=0){
 350              		.loc 1 99 0
 351 0188 FA69     		ldr	r2, [r7, #28]
 352 018a FB68     		ldr	r3, [r7, #12]
 353 018c D318     		adds	r3, r2, r3
 354 018e 3F2B     		cmp	r3, #63
 355 0190 04DC     		bgt	.L23
 356              		.loc 1 99 0 is_stmt 0 discriminator 1
 357 0192 FA69     		ldr	r2, [r7, #28]
 358 0194 FB68     		ldr	r3, [r7, #12]
 359 0196 D31A     		subs	r3, r2, r3
 360 0198 002B     		cmp	r3, #0
 361 019a 02DC     		bgt	.L14
 362              	.L23:
 100:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 				velociy*=-1;
 363              		.loc 1 100 0 is_stmt 1
 364 019c 7B69     		ldr	r3, [r7, #20]
 365 019e 5B42     		rsbs	r3, r3, #0
 366 01a0 7B61     		str	r3, [r7, #20]
 367              	.L14:
  77:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			
 368              		.loc 1 77 0
 369 01a2 044B     		ldr	r3, .L26
 370 01a4 1B68     		ldr	r3, [r3]
 371 01a6 002B     		cmp	r3, #0
 372 01a8 A8D1     		bne	.L24
 373 01aa 0023     		movs	r3, #0
 101:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			}
 102:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 			
 103:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		}
 104:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 		
 105:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** 				
 106:C:/Users/levholm/dat017/lab3/graphicdisplay\startup.c **** }
 374              		.loc 1 106 0
 375 01ac 1800     		movs	r0, r3
 376 01ae BD46     		mov	sp, r7
 377 01b0 0BB0     		add	sp, sp, #44
 378              		@ sp needed
 379 01b2 90BD     		pop	{r4, r7, pc}
 380              	.L27:
 381              		.align	2
 382              	.L26:
 383 01b4 00000000 		.word	running
 384              		.cfi_endproc
 385              	.LFE2:
 387              	.Letext0:
 388              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 389              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 390              		.file 4 "C:/Users/levholm/dat017/lab3/graphicdisplay/gpio.h"
