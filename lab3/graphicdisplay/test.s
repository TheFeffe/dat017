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
  11              		.file	"gpio.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	setup_for_keypad
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	setup_for_keypad:
  23              	.LFB0:
  24              		.file 1 "/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c"
   1:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** #include "gpio.h"
   2:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** #include "sys_delay.h"
   3:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
   4:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void setup_for_keypad(GPIO* _gpio)
   5:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
  25              		.loc 1 5 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 8
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 82B0     		sub	sp, sp, #8
  34              		.cfi_def_cfa_offset 16
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 7860     		str	r0, [r7, #4]
   6:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt pinnar 15-12 till utportar
   7:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// och pinnar 11-8 till inportar.
   8:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     _gpio->moder &= 0x0000FFFF;
  38              		.loc 1 8 0
  39 0008 7B68     		ldr	r3, [r7, #4]
  40 000a 1B68     		ldr	r3, [r3]
  41 000c 1B04     		lsls	r3, r3, #16
  42 000e 1A0C     		lsrs	r2, r3, #16
  43 0010 7B68     		ldr	r3, [r7, #4]
  44 0012 1A60     		str	r2, [r3]
   9:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     _gpio->moder |= 0x5500FFFF;
  45              		.loc 1 9 0
  46 0014 7B68     		ldr	r3, [r7, #4]
  47 0016 1B68     		ldr	r3, [r3]
  48 0018 114A     		ldr	r2, .L2
  49 001a 1A43     		orrs	r2, r3
  50 001c 7B68     		ldr	r3, [r7, #4]
  51 001e 1A60     		str	r2, [r3]
  10:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
  11:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt pinnar 15-12 till "push-pull"
  12:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// och pinnar 11-8 till "open drain".
  13:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     _gpio->otyper &= 0xFFFF00FF;
  52              		.loc 1 13 0
  53 0020 7B68     		ldr	r3, [r7, #4]
  54 0022 9B88     		ldrh	r3, [r3, #4]
  55 0024 FF22     		movs	r2, #255
  56 0026 1340     		ands	r3, r2
  57 0028 9AB2     		uxth	r2, r3
  58 002a 7B68     		ldr	r3, [r7, #4]
  59 002c 9A80     		strh	r2, [r3, #4]
  14:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     _gpio->otyper |= 0x00000F00;
  60              		.loc 1 14 0
  61 002e 7B68     		ldr	r3, [r7, #4]
  62 0030 9B88     		ldrh	r3, [r3, #4]
  63 0032 F022     		movs	r2, #240
  64 0034 1201     		lsls	r2, r2, #4
  65 0036 1343     		orrs	r3, r2
  66 0038 9AB2     		uxth	r2, r3
  67 003a 7B68     		ldr	r3, [r7, #4]
  68 003c 9A80     		strh	r2, [r3, #4]
  15:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
  16:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt pinnar 15-12 till "floating"
  17:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// och pinnar 11-8 till "pull-down"
  18:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     _gpio->pupdr &= 0x0000FFFF;
  69              		.loc 1 18 0
  70 003e 7B68     		ldr	r3, [r7, #4]
  71 0040 DB68     		ldr	r3, [r3, #12]
  72 0042 1B04     		lsls	r3, r3, #16
  73 0044 1A0C     		lsrs	r2, r3, #16
  74 0046 7B68     		ldr	r3, [r7, #4]
  75 0048 DA60     		str	r2, [r3, #12]
  19:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     _gpio->pupdr |= 0x00AA0000;
  76              		.loc 1 19 0
  77 004a 7B68     		ldr	r3, [r7, #4]
  78 004c DB68     		ldr	r3, [r3, #12]
  79 004e AA22     		movs	r2, #170
  80 0050 1204     		lsls	r2, r2, #16
  81 0052 1A43     		orrs	r2, r3
  82 0054 7B68     		ldr	r3, [r7, #4]
  83 0056 DA60     		str	r2, [r3, #12]
  20:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
  84              		.loc 1 20 0
  85 0058 C046     		nop
  86 005a BD46     		mov	sp, r7
  87 005c 02B0     		add	sp, sp, #8
  88              		@ sp needed
  89 005e 80BD     		pop	{r7, pc}
  90              	.L3:
  91              		.align	2
  92              	.L2:
  93 0060 FFFF0055 		.word	1426128895
  94              		.cfi_endproc
  95              	.LFE0:
  97              		.align	1
  98              		.global	setup_for_seg_disp
  99              		.syntax unified
 100              		.code	16
 101              		.thumb_func
 102              		.fpu softvfp
 104              	setup_for_seg_disp:
 105              	.LFB1:
  21:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
  22:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void setup_for_seg_disp(GPIO* _gpio) 
  23:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 106              		.loc 1 23 0
 107              		.cfi_startproc
 108              		@ args = 0, pretend = 0, frame = 8
 109              		@ frame_needed = 1, uses_anonymous_args = 0
 110 0064 80B5     		push	{r7, lr}
 111              		.cfi_def_cfa_offset 8
 112              		.cfi_offset 7, -8
 113              		.cfi_offset 14, -4
 114 0066 82B0     		sub	sp, sp, #8
 115              		.cfi_def_cfa_offset 16
 116 0068 00AF     		add	r7, sp, #0
 117              		.cfi_def_cfa_register 7
 118 006a 7860     		str	r0, [r7, #4]
  24:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt pinnar 7-0 till utportar
  25:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	_gpio->moder &= 0xFFFF0000;
 119              		.loc 1 25 0
 120 006c 7B68     		ldr	r3, [r7, #4]
 121 006e 1B68     		ldr	r3, [r3]
 122 0070 1B0C     		lsrs	r3, r3, #16
 123 0072 1A04     		lsls	r2, r3, #16
 124 0074 7B68     		ldr	r3, [r7, #4]
 125 0076 1A60     		str	r2, [r3]
  26:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	_gpio->moder |= 0x00005555;
 126              		.loc 1 26 0
 127 0078 7B68     		ldr	r3, [r7, #4]
 128 007a 1B68     		ldr	r3, [r3]
 129 007c 034A     		ldr	r2, .L5
 130 007e 1A43     		orrs	r2, r3
 131 0080 7B68     		ldr	r3, [r7, #4]
 132 0082 1A60     		str	r2, [r3]
  27:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
  28:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt pinnar 7-0 till "push-pull"
  29:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//_gpio->otyper &= 0xFFFFFF00;
  30:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//_gpio->otyper |= 0x000000FF;
  31:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
  32:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätter pinnar 4-0 till "pull-down"
  33:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//_gpio->pupdr &= 0xFFFFFF00;
  34:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//_gpio->pupdr |= 0x000000AA;
  35:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 133              		.loc 1 35 0
 134 0084 C046     		nop
 135 0086 BD46     		mov	sp, r7
 136 0088 02B0     		add	sp, sp, #8
 137              		@ sp needed
 138 008a 80BD     		pop	{r7, pc}
 139              	.L6:
 140              		.align	2
 141              	.L5:
 142 008c 55550000 		.word	21845
 143              		.cfi_endproc
 144              	.LFE1:
 146              		.section	.rodata
 147              		.align	2
 148              	.LC0:
 149 0000 01       		.byte	1
 150 0001 02       		.byte	2
 151 0002 03       		.byte	3
 152 0003 0A       		.byte	10
 153 0004 04       		.byte	4
 154 0005 05       		.byte	5
 155 0006 06       		.byte	6
 156 0007 0B       		.byte	11
 157 0008 07       		.byte	7
 158 0009 08       		.byte	8
 159 000a 09       		.byte	9
 160 000b 0C       		.byte	12
 161 000c 0E       		.byte	14
 162 000d 00       		.byte	0
 163 000e 0F       		.byte	15
 164 000f 0D       		.byte	13
 165              		.text
 166              		.align	1
 167              		.global	keyb
 168              		.syntax unified
 169              		.code	16
 170              		.thumb_func
 171              		.fpu softvfp
 173              	keyb:
 174              	.LFB2:
  36:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
  37:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** unsigned char keyb(void)
  38:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 175              		.loc 1 38 0
 176              		.cfi_startproc
 177              		@ args = 0, pretend = 0, frame = 24
 178              		@ frame_needed = 1, uses_anonymous_args = 0
 179 0090 90B5     		push	{r4, r7, lr}
 180              		.cfi_def_cfa_offset 12
 181              		.cfi_offset 4, -12
 182              		.cfi_offset 7, -8
 183              		.cfi_offset 14, -4
 184 0092 87B0     		sub	sp, sp, #28
 185              		.cfi_def_cfa_offset 40
 186 0094 00AF     		add	r7, sp, #0
 187              		.cfi_def_cfa_register 7
  39:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned char keys[] = {
 188              		.loc 1 39 0
 189 0096 3B1D     		adds	r3, r7, #4
 190 0098 1F4A     		ldr	r2, .L13
 191 009a 13CA     		ldmia	r2!, {r0, r1, r4}
 192 009c 13C3     		stmia	r3!, {r0, r1, r4}
 193 009e 1268     		ldr	r2, [r2]
 194 00a0 1A60     		str	r2, [r3]
  40:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		1,  2,  3,  10,
  41:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		4,  5,  6,  11,
  42:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		7,  8,  9,  12,
  43:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		14, 0,  15, 13
  44:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	};
  45:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned char row, col;
  46:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	for(row = 0; row < 4; row++) {
 195              		.loc 1 46 0
 196 00a2 1723     		movs	r3, #23
 197 00a4 FB18     		adds	r3, r7, r3
 198 00a6 0022     		movs	r2, #0
 199 00a8 1A70     		strb	r2, [r3]
 200 00aa 2AE0     		b	.L8
 201              	.L11:
  47:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		deactivate_rows(GPIO_D);
 202              		.loc 1 47 0
 203 00ac 1B4B     		ldr	r3, .L13+4
 204 00ae 1800     		movs	r0, r3
 205 00b0 FFF7FEFF 		bl	deactivate_rows
  48:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		activate_row(GPIO_D, row);
 206              		.loc 1 48 0
 207 00b4 1723     		movs	r3, #23
 208 00b6 FB18     		adds	r3, r7, r3
 209 00b8 1B78     		ldrb	r3, [r3]
 210 00ba 184A     		ldr	r2, .L13+4
 211 00bc 1900     		movs	r1, r3
 212 00be 1000     		movs	r0, r2
 213 00c0 FFF7FEFF 		bl	activate_row
  49:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		col = read_col(GPIO_D);
 214              		.loc 1 49 0
 215 00c4 1623     		movs	r3, #22
 216 00c6 FC18     		adds	r4, r7, r3
 217 00c8 144B     		ldr	r3, .L13+4
 218 00ca 1800     		movs	r0, r3
 219 00cc FFF7FEFF 		bl	read_col
 220 00d0 0300     		movs	r3, r0
 221 00d2 2370     		strb	r3, [r4]
  50:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		if(col != 0xFF) {
 222              		.loc 1 50 0
 223 00d4 1623     		movs	r3, #22
 224 00d6 FB18     		adds	r3, r7, r3
 225 00d8 1B78     		ldrb	r3, [r3]
 226 00da FF2B     		cmp	r3, #255
 227 00dc 0AD0     		beq	.L9
  51:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			return keys[ 4 * row + col];
 228              		.loc 1 51 0
 229 00de 1723     		movs	r3, #23
 230 00e0 FB18     		adds	r3, r7, r3
 231 00e2 1B78     		ldrb	r3, [r3]
 232 00e4 9A00     		lsls	r2, r3, #2
 233 00e6 1623     		movs	r3, #22
 234 00e8 FB18     		adds	r3, r7, r3
 235 00ea 1B78     		ldrb	r3, [r3]
 236 00ec D318     		adds	r3, r2, r3
 237 00ee 3A1D     		adds	r2, r7, #4
 238 00f0 D35C     		ldrb	r3, [r2, r3]
 239 00f2 0CE0     		b	.L12
 240              	.L9:
  46:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		deactivate_rows(GPIO_D);
 241              		.loc 1 46 0 discriminator 2
 242 00f4 1723     		movs	r3, #23
 243 00f6 FB18     		adds	r3, r7, r3
 244 00f8 1A78     		ldrb	r2, [r3]
 245 00fa 1723     		movs	r3, #23
 246 00fc FB18     		adds	r3, r7, r3
 247 00fe 0132     		adds	r2, r2, #1
 248 0100 1A70     		strb	r2, [r3]
 249              	.L8:
  46:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		deactivate_rows(GPIO_D);
 250              		.loc 1 46 0 is_stmt 0 discriminator 1
 251 0102 1723     		movs	r3, #23
 252 0104 FB18     		adds	r3, r7, r3
 253 0106 1B78     		ldrb	r3, [r3]
 254 0108 032B     		cmp	r3, #3
 255 010a CFD9     		bls	.L11
  52:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		}
  53:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
  54:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	return 0xFF;
 256              		.loc 1 54 0 is_stmt 1
 257 010c FF23     		movs	r3, #255
 258              	.L12:
  55:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 259              		.loc 1 55 0 discriminator 1
 260 010e 1800     		movs	r0, r3
 261 0110 BD46     		mov	sp, r7
 262 0112 07B0     		add	sp, sp, #28
 263              		@ sp needed
 264 0114 90BD     		pop	{r4, r7, pc}
 265              	.L14:
 266 0116 C046     		.align	2
 267              	.L13:
 268 0118 00000000 		.word	.LC0
 269 011c 000C0240 		.word	1073875968
 270              		.cfi_endproc
 271              	.LFE2:
 273              		.section	.rodata
 274              		.align	2
 275              	.LC1:
 276 0010 3F00     		.short	63
 277 0012 0600     		.short	6
 278 0014 5B00     		.short	91
 279 0016 4F00     		.short	79
 280 0018 6600     		.short	102
 281 001a 6D00     		.short	109
 282 001c 7D00     		.short	125
 283 001e 0700     		.short	7
 284 0020 7F00     		.short	127
 285 0022 6F00     		.short	111
 286 0024 7700     		.short	119
 287 0026 7C00     		.short	124
 288 0028 5800     		.short	88
 289 002a 5E00     		.short	94
 290 002c 8000     		.short	128
 291 002e 7600     		.short	118
 292              		.text
 293              		.align	1
 294              		.global	out7seg
 295              		.syntax unified
 296              		.code	16
 297              		.thumb_func
 298              		.fpu softvfp
 300              	out7seg:
 301              	.LFB3:
  56:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
  57:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void out7seg(GPIO* _gpio, unsigned char c)
  58:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 302              		.loc 1 58 0
 303              		.cfi_startproc
 304              		@ args = 0, pretend = 0, frame = 40
 305              		@ frame_needed = 1, uses_anonymous_args = 0
 306 0120 90B5     		push	{r4, r7, lr}
 307              		.cfi_def_cfa_offset 12
 308              		.cfi_offset 4, -12
 309              		.cfi_offset 7, -8
 310              		.cfi_offset 14, -4
 311 0122 8BB0     		sub	sp, sp, #44
 312              		.cfi_def_cfa_offset 56
 313 0124 00AF     		add	r7, sp, #0
 314              		.cfi_def_cfa_register 7
 315 0126 7860     		str	r0, [r7, #4]
 316 0128 0A00     		movs	r2, r1
 317 012a FB1C     		adds	r3, r7, #3
 318 012c 1A70     		strb	r2, [r3]
  59:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     unsigned short result[] = { 
 319              		.loc 1 59 0
 320 012e 0823     		movs	r3, #8
 321 0130 FB18     		adds	r3, r7, r3
 322 0132 0E4A     		ldr	r2, .L19
 323 0134 13CA     		ldmia	r2!, {r0, r1, r4}
 324 0136 13C3     		stmia	r3!, {r0, r1, r4}
 325 0138 13CA     		ldmia	r2!, {r0, r1, r4}
 326 013a 13C3     		stmia	r3!, {r0, r1, r4}
 327 013c 03CA     		ldmia	r2!, {r0, r1}
 328 013e 03C3     		stmia	r3!, {r0, r1}
  60:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x3F, // 0
  61:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x06, // 1
  62:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x5B, // 2
  63:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x4F, // 3
  64:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x66, // 4
  65:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x6D, // 5
  66:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x7D, // 6
  67:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x07, // 7
  68:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x7F, // 8
  69:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x6F, // 9
  70:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x77, // A
  71:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x7C, // B
  72:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x58, // C
  73:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x5E, // D
  74:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x80, // E
  75:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		0x76  // F
  76:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	};
  77:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
  78:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     if(c > 0xF) {
 329              		.loc 1 78 0
 330 0140 FB1C     		adds	r3, r7, #3
 331 0142 1B78     		ldrb	r3, [r3]
 332 0144 0F2B     		cmp	r3, #15
 333 0146 03D9     		bls	.L16
  79:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		_gpio->odrLow = 0x00;
 334              		.loc 1 79 0
 335 0148 7B68     		ldr	r3, [r7, #4]
 336 014a 0022     		movs	r2, #0
 337 014c 1A75     		strb	r2, [r3, #20]
  80:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     } else {
  81:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		_gpio->odrLow = result[c];
  82:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     }
  83:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 338              		.loc 1 83 0
 339 014e 08E0     		b	.L18
 340              	.L16:
  81:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c ****     }
 341              		.loc 1 81 0
 342 0150 FB1C     		adds	r3, r7, #3
 343 0152 1A78     		ldrb	r2, [r3]
 344 0154 0823     		movs	r3, #8
 345 0156 FB18     		adds	r3, r7, r3
 346 0158 5200     		lsls	r2, r2, #1
 347 015a D35A     		ldrh	r3, [r2, r3]
 348 015c DAB2     		uxtb	r2, r3
 349 015e 7B68     		ldr	r3, [r7, #4]
 350 0160 1A75     		strb	r2, [r3, #20]
 351              	.L18:
 352              		.loc 1 83 0
 353 0162 C046     		nop
 354 0164 BD46     		mov	sp, r7
 355 0166 0BB0     		add	sp, sp, #44
 356              		@ sp needed
 357 0168 90BD     		pop	{r4, r7, pc}
 358              	.L20:
 359 016a C046     		.align	2
 360              	.L19:
 361 016c 10000000 		.word	.LC1
 362              		.cfi_endproc
 363              	.LFE3:
 365              		.align	1
 366              		.global	activate_row
 367              		.syntax unified
 368              		.code	16
 369              		.thumb_func
 370              		.fpu softvfp
 372              	activate_row:
 373              	.LFB4:
  84:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
  85:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void activate_row(GPIO* _gpio, unsigned char row) 
  86:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 374              		.loc 1 86 0
 375              		.cfi_startproc
 376              		@ args = 0, pretend = 0, frame = 8
 377              		@ frame_needed = 1, uses_anonymous_args = 0
 378 0170 80B5     		push	{r7, lr}
 379              		.cfi_def_cfa_offset 8
 380              		.cfi_offset 7, -8
 381              		.cfi_offset 14, -4
 382 0172 82B0     		sub	sp, sp, #8
 383              		.cfi_def_cfa_offset 16
 384 0174 00AF     		add	r7, sp, #0
 385              		.cfi_def_cfa_register 7
 386 0176 7860     		str	r0, [r7, #4]
 387 0178 0A00     		movs	r2, r1
 388 017a FB1C     		adds	r3, r7, #3
 389 017c 1A70     		strb	r2, [r3]
  87:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	switch(row){
 390              		.loc 1 87 0
 391 017e FB1C     		adds	r3, r7, #3
 392 0180 1B78     		ldrb	r3, [r3]
 393 0182 012B     		cmp	r3, #1
 394 0184 0CD0     		beq	.L23
 395 0186 02DC     		bgt	.L24
 396 0188 002B     		cmp	r3, #0
 397 018a 05D0     		beq	.L25
  88:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case 0: _gpio->odrHigh = 0x10; break;
  89:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case 1: _gpio->odrHigh = 0x20; break;
  90:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case 2: _gpio->odrHigh = 0x40; break;
  91:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case 3: _gpio->odrHigh = 0x80; break;
  92:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
  93:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 398              		.loc 1 93 0
 399 018c 14E0     		b	.L28
 400              	.L24:
  87:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	switch(row){
 401              		.loc 1 87 0
 402 018e 022B     		cmp	r3, #2
 403 0190 0AD0     		beq	.L26
 404 0192 032B     		cmp	r3, #3
 405 0194 0CD0     		beq	.L27
 406              		.loc 1 93 0
 407 0196 0FE0     		b	.L28
 408              	.L25:
  88:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case 0: _gpio->odrHigh = 0x10; break;
 409              		.loc 1 88 0
 410 0198 7B68     		ldr	r3, [r7, #4]
 411 019a 1022     		movs	r2, #16
 412 019c 5A75     		strb	r2, [r3, #21]
 413 019e 0BE0     		b	.L22
 414              	.L23:
  89:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case 2: _gpio->odrHigh = 0x40; break;
 415              		.loc 1 89 0
 416 01a0 7B68     		ldr	r3, [r7, #4]
 417 01a2 2022     		movs	r2, #32
 418 01a4 5A75     		strb	r2, [r3, #21]
 419 01a6 07E0     		b	.L22
 420              	.L26:
  90:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case 3: _gpio->odrHigh = 0x80; break;
 421              		.loc 1 90 0
 422 01a8 7B68     		ldr	r3, [r7, #4]
 423 01aa 4022     		movs	r2, #64
 424 01ac 5A75     		strb	r2, [r3, #21]
 425 01ae 03E0     		b	.L22
 426              	.L27:
  91:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 427              		.loc 1 91 0
 428 01b0 7B68     		ldr	r3, [r7, #4]
 429 01b2 8022     		movs	r2, #128
 430 01b4 5A75     		strb	r2, [r3, #21]
 431 01b6 C046     		nop
 432              	.L22:
 433              	.L28:
 434              		.loc 1 93 0
 435 01b8 C046     		nop
 436 01ba BD46     		mov	sp, r7
 437 01bc 02B0     		add	sp, sp, #8
 438              		@ sp needed
 439 01be 80BD     		pop	{r7, pc}
 440              		.cfi_endproc
 441              	.LFE4:
 443              		.align	1
 444              		.global	deactivate_rows
 445              		.syntax unified
 446              		.code	16
 447              		.thumb_func
 448              		.fpu softvfp
 450              	deactivate_rows:
 451              	.LFB5:
  94:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
  95:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void deactivate_rows(GPIO* _gpio)
  96:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 452              		.loc 1 96 0
 453              		.cfi_startproc
 454              		@ args = 0, pretend = 0, frame = 8
 455              		@ frame_needed = 1, uses_anonymous_args = 0
 456 01c0 80B5     		push	{r7, lr}
 457              		.cfi_def_cfa_offset 8
 458              		.cfi_offset 7, -8
 459              		.cfi_offset 14, -4
 460 01c2 82B0     		sub	sp, sp, #8
 461              		.cfi_def_cfa_offset 16
 462 01c4 00AF     		add	r7, sp, #0
 463              		.cfi_def_cfa_register 7
 464 01c6 7860     		str	r0, [r7, #4]
  97:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	_gpio->odrHigh = 0x00;
 465              		.loc 1 97 0
 466 01c8 7B68     		ldr	r3, [r7, #4]
 467 01ca 0022     		movs	r2, #0
 468 01cc 5A75     		strb	r2, [r3, #21]
  98:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 469              		.loc 1 98 0
 470 01ce C046     		nop
 471 01d0 BD46     		mov	sp, r7
 472 01d2 02B0     		add	sp, sp, #8
 473              		@ sp needed
 474 01d4 80BD     		pop	{r7, pc}
 475              		.cfi_endproc
 476              	.LFE5:
 478              		.align	1
 479              		.global	read_col
 480              		.syntax unified
 481              		.code	16
 482              		.thumb_func
 483              		.fpu softvfp
 485              	read_col:
 486              	.LFB6:
  99:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 100:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** unsigned char read_col(GPIO* _gpio)
 101:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 487              		.loc 1 101 0
 488              		.cfi_startproc
 489              		@ args = 0, pretend = 0, frame = 8
 490              		@ frame_needed = 1, uses_anonymous_args = 0
 491 01d6 80B5     		push	{r7, lr}
 492              		.cfi_def_cfa_offset 8
 493              		.cfi_offset 7, -8
 494              		.cfi_offset 14, -4
 495 01d8 82B0     		sub	sp, sp, #8
 496              		.cfi_def_cfa_offset 16
 497 01da 00AF     		add	r7, sp, #0
 498              		.cfi_def_cfa_register 7
 499 01dc 7860     		str	r0, [r7, #4]
 102:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if(_gpio->idrHigh & 0x01) return 0;
 500              		.loc 1 102 0
 501 01de 7B68     		ldr	r3, [r7, #4]
 502 01e0 5B7C     		ldrb	r3, [r3, #17]
 503 01e2 1A00     		movs	r2, r3
 504 01e4 0123     		movs	r3, #1
 505 01e6 1340     		ands	r3, r2
 506 01e8 01D0     		beq	.L31
 507              		.loc 1 102 0 is_stmt 0 discriminator 1
 508 01ea 0023     		movs	r3, #0
 509 01ec 18E0     		b	.L32
 510              	.L31:
 103:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if(_gpio->idrHigh & 0x02) return 1;
 511              		.loc 1 103 0 is_stmt 1
 512 01ee 7B68     		ldr	r3, [r7, #4]
 513 01f0 5B7C     		ldrb	r3, [r3, #17]
 514 01f2 1A00     		movs	r2, r3
 515 01f4 0223     		movs	r3, #2
 516 01f6 1340     		ands	r3, r2
 517 01f8 01D0     		beq	.L33
 518              		.loc 1 103 0 is_stmt 0 discriminator 1
 519 01fa 0123     		movs	r3, #1
 520 01fc 10E0     		b	.L32
 521              	.L33:
 104:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if(_gpio->idrHigh & 0x04) return 2;
 522              		.loc 1 104 0 is_stmt 1
 523 01fe 7B68     		ldr	r3, [r7, #4]
 524 0200 5B7C     		ldrb	r3, [r3, #17]
 525 0202 1A00     		movs	r2, r3
 526 0204 0423     		movs	r3, #4
 527 0206 1340     		ands	r3, r2
 528 0208 01D0     		beq	.L34
 529              		.loc 1 104 0 is_stmt 0 discriminator 1
 530 020a 0223     		movs	r3, #2
 531 020c 08E0     		b	.L32
 532              	.L34:
 105:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if(_gpio->idrHigh & 0x08) return 3;
 533              		.loc 1 105 0 is_stmt 1
 534 020e 7B68     		ldr	r3, [r7, #4]
 535 0210 5B7C     		ldrb	r3, [r3, #17]
 536 0212 1A00     		movs	r2, r3
 537 0214 0823     		movs	r3, #8
 538 0216 1340     		ands	r3, r2
 539 0218 01D0     		beq	.L35
 540              		.loc 1 105 0 is_stmt 0 discriminator 1
 541 021a 0323     		movs	r3, #3
 542 021c 00E0     		b	.L32
 543              	.L35:
 106:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	return 0xFF;
 544              		.loc 1 106 0 is_stmt 1
 545 021e FF23     		movs	r3, #255
 546              	.L32:
 107:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 547              		.loc 1 107 0
 548 0220 1800     		movs	r0, r3
 549 0222 BD46     		mov	sp, r7
 550 0224 02B0     		add	sp, sp, #8
 551              		@ sp needed
 552 0226 80BD     		pop	{r7, pc}
 553              		.cfi_endproc
 554              	.LFE6:
 556              		.align	1
 557              		.global	setup_for_ascii_display
 558              		.syntax unified
 559              		.code	16
 560              		.thumb_func
 561              		.fpu softvfp
 563              	setup_for_ascii_display:
 564              	.LFB7:
 108:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 109:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void setup_for_ascii_display()
 110:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 565              		.loc 1 110 0
 566              		.cfi_startproc
 567              		@ args = 0, pretend = 0, frame = 0
 568              		@ frame_needed = 1, uses_anonymous_args = 0
 569 0228 80B5     		push	{r7, lr}
 570              		.cfi_def_cfa_offset 8
 571              		.cfi_offset 7, -8
 572              		.cfi_offset 14, -4
 573 022a 00AF     		add	r7, sp, #0
 574              		.cfi_def_cfa_register 7
 111:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt alla pinnar till utportar.
 112:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->moder = 0x55555555;
 575              		.loc 1 112 0
 576 022c 034B     		ldr	r3, .L37
 577 022e 044A     		ldr	r2, .L37+4
 578 0230 1A60     		str	r2, [r3]
 113:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 114:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt utportar till "push/pull".
 115:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//GPIO_E->otyper = 0x00000000;
 116:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 117:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt utportars hastighet till medium.
 118:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//GPIO_E->ospeedr = 0x55555555;
 119:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 120:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt utportart hastighet till low.
 121:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//GPIO_E->ospeedr = 0x00000000;
 122:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 123:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// inportar är "pull-up"
 124:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//GPIO_E->pupdr = 0x55550000;
 125:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 126:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_init();
 579              		.loc 1 126 0
 580 0232 FFF7FEFF 		bl	ascii_init
 127:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 581              		.loc 1 127 0
 582 0236 C046     		nop
 583 0238 BD46     		mov	sp, r7
 584              		@ sp needed
 585 023a 80BD     		pop	{r7, pc}
 586              	.L38:
 587              		.align	2
 588              	.L37:
 589 023c 00100240 		.word	1073876992
 590 0240 55555555 		.word	1431655765
 591              		.cfi_endproc
 592              	.LFE7:
 594              		.align	1
 595              		.global	ascii_init
 596              		.syntax unified
 597              		.code	16
 598              		.thumb_func
 599              		.fpu softvfp
 601              	ascii_init:
 602              	.LFB8:
 128:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 129:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void ascii_init(void)
 130:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 603              		.loc 1 130 0
 604              		.cfi_startproc
 605              		@ args = 0, pretend = 0, frame = 0
 606              		@ frame_needed = 1, uses_anonymous_args = 0
 607 0244 80B5     		push	{r7, lr}
 608              		.cfi_def_cfa_offset 8
 609              		.cfi_offset 7, -8
 610              		.cfi_offset 14, -4
 611 0246 00AF     		add	r7, sp, #0
 612              		.cfi_def_cfa_register 7
 131:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 613              		.loc 1 131 0
 614 0248 C046     		nop
 615              	.L40:
 616              		.loc 1 131 0 is_stmt 0 discriminator 1
 617 024a FFF7FEFF 		bl	ascii_read_status
 618 024e 0300     		movs	r3, r0
 619 0250 1A00     		movs	r2, r3
 620 0252 8023     		movs	r3, #128
 621 0254 1340     		ands	r3, r2
 622 0256 802B     		cmp	r3, #128
 623 0258 F7D0     		beq	.L40
 132:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 133:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(20);
 624              		.loc 1 133 0 is_stmt 1
 625 025a 1420     		movs	r0, #20
 626 025c FFF7FEFF 		bl	delay_mikro
 134:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Function Set - 2 rader, 5x8 punkters tecken.
 135:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_write_cmd(0x38);
 627              		.loc 1 135 0
 628 0260 3820     		movs	r0, #56
 629 0262 FFF7FEFF 		bl	ascii_write_cmd
 136:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(39);
 630              		.loc 1 136 0
 631 0266 2720     		movs	r0, #39
 632 0268 FFF7FEFF 		bl	delay_mikro
 137:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 138:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 139:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 633              		.loc 1 139 0
 634 026c C046     		nop
 635              	.L41:
 636              		.loc 1 139 0 is_stmt 0 discriminator 1
 637 026e FFF7FEFF 		bl	ascii_read_status
 638 0272 0300     		movs	r3, r0
 639 0274 1A00     		movs	r2, r3
 640 0276 8023     		movs	r3, #128
 641 0278 1340     		ands	r3, r2
 642 027a 802B     		cmp	r3, #128
 643 027c F7D0     		beq	.L41
 140:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 141:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(20);
 644              		.loc 1 141 0 is_stmt 1
 645 027e 1420     		movs	r0, #20
 646 0280 FFF7FEFF 		bl	delay_mikro
 142:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Tänd display, tänd markör ("cursor"), konstant visning.
 143:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_write_cmd(0x0E);
 647              		.loc 1 143 0
 648 0284 0E20     		movs	r0, #14
 649 0286 FFF7FEFF 		bl	ascii_write_cmd
 144:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(39);
 650              		.loc 1 144 0
 651 028a 2720     		movs	r0, #39
 652 028c FFF7FEFF 		bl	delay_mikro
 145:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 146:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 653              		.loc 1 146 0
 654 0290 C046     		nop
 655              	.L42:
 656              		.loc 1 146 0 is_stmt 0 discriminator 1
 657 0292 FFF7FEFF 		bl	ascii_read_status
 658 0296 0300     		movs	r3, r0
 659 0298 1A00     		movs	r2, r3
 660 029a 8023     		movs	r3, #128
 661 029c 1340     		ands	r3, r2
 662 029e 802B     		cmp	r3, #128
 663 02a0 F7D0     		beq	.L42
 147:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 148:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(20);
 664              		.loc 1 148 0 is_stmt 1
 665 02a2 1420     		movs	r0, #20
 666 02a4 FFF7FEFF 		bl	delay_mikro
 149:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Clear display.
 150:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_write_cmd(0x01);
 667              		.loc 1 150 0
 668 02a8 0120     		movs	r0, #1
 669 02aa FFF7FEFF 		bl	ascii_write_cmd
 151:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(39);
 670              		.loc 1 151 0
 671 02ae 2720     		movs	r0, #39
 672 02b0 FFF7FEFF 		bl	delay_mikro
 152:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 153:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 673              		.loc 1 153 0
 674 02b4 C046     		nop
 675              	.L43:
 676              		.loc 1 153 0 is_stmt 0 discriminator 1
 677 02b6 FFF7FEFF 		bl	ascii_read_status
 678 02ba 0300     		movs	r3, r0
 679 02bc 1A00     		movs	r2, r3
 680 02be 8023     		movs	r3, #128
 681 02c0 1340     		ands	r3, r2
 682 02c2 802B     		cmp	r3, #128
 683 02c4 F7D0     		beq	.L43
 154:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 155:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(20);
 684              		.loc 1 155 0 is_stmt 1
 685 02c6 1420     		movs	r0, #20
 686 02c8 FFF7FEFF 		bl	delay_mikro
 156:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Adressering med "increment", inget skift av adressbuffern.
 157:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_write_cmd(0x06);
 687              		.loc 1 157 0
 688 02cc 0620     		movs	r0, #6
 689 02ce FFF7FEFF 		bl	ascii_write_cmd
 158:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(39);
 690              		.loc 1 158 0
 691 02d2 2720     		movs	r0, #39
 692 02d4 FFF7FEFF 		bl	delay_mikro
 159:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 693              		.loc 1 159 0
 694 02d8 C046     		nop
 695 02da BD46     		mov	sp, r7
 696              		@ sp needed
 697 02dc 80BD     		pop	{r7, pc}
 698              		.cfi_endproc
 699              	.LFE8:
 701              		.align	1
 702              		.global	ascii_ctrl_bit_set
 703              		.syntax unified
 704              		.code	16
 705              		.thumb_func
 706              		.fpu softvfp
 708              	ascii_ctrl_bit_set:
 709              	.LFB9:
 160:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 161:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void ascii_ctrl_bit_set(unsigned char x)
 162:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 710              		.loc 1 162 0
 711              		.cfi_startproc
 712              		@ args = 0, pretend = 0, frame = 16
 713              		@ frame_needed = 1, uses_anonymous_args = 0
 714 02de 80B5     		push	{r7, lr}
 715              		.cfi_def_cfa_offset 8
 716              		.cfi_offset 7, -8
 717              		.cfi_offset 14, -4
 718 02e0 84B0     		sub	sp, sp, #16
 719              		.cfi_def_cfa_offset 24
 720 02e2 00AF     		add	r7, sp, #0
 721              		.cfi_def_cfa_register 7
 722 02e4 0200     		movs	r2, r0
 723 02e6 FB1D     		adds	r3, r7, #7
 724 02e8 1A70     		strb	r2, [r3]
 163:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//GPIO_E->odrLow |= x;
 164:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 165:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned char c;
 166:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c = GPIO_E->odrLow;
 725              		.loc 1 166 0
 726 02ea 0D4A     		ldr	r2, .L45
 727 02ec 0F23     		movs	r3, #15
 728 02ee FB18     		adds	r3, r7, r3
 729 02f0 127D     		ldrb	r2, [r2, #20]
 730 02f2 1A70     		strb	r2, [r3]
 167:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c |= (B_SELECT | x);
 731              		.loc 1 167 0
 732 02f4 FA1D     		adds	r2, r7, #7
 733 02f6 0F23     		movs	r3, #15
 734 02f8 FB18     		adds	r3, r7, r3
 735 02fa 1278     		ldrb	r2, [r2]
 736 02fc 1B78     		ldrb	r3, [r3]
 737 02fe 1343     		orrs	r3, r2
 738 0300 DAB2     		uxtb	r2, r3
 739 0302 0F23     		movs	r3, #15
 740 0304 FB18     		adds	r3, r7, r3
 741 0306 0421     		movs	r1, #4
 742 0308 0A43     		orrs	r2, r1
 743 030a 1A70     		strb	r2, [r3]
 168:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->odrLow = c;
 744              		.loc 1 168 0
 745 030c 044A     		ldr	r2, .L45
 746 030e 0F23     		movs	r3, #15
 747 0310 FB18     		adds	r3, r7, r3
 748 0312 1B78     		ldrb	r3, [r3]
 749 0314 1375     		strb	r3, [r2, #20]
 169:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 750              		.loc 1 169 0
 751 0316 C046     		nop
 752 0318 BD46     		mov	sp, r7
 753 031a 04B0     		add	sp, sp, #16
 754              		@ sp needed
 755 031c 80BD     		pop	{r7, pc}
 756              	.L46:
 757 031e C046     		.align	2
 758              	.L45:
 759 0320 00100240 		.word	1073876992
 760              		.cfi_endproc
 761              	.LFE9:
 763              		.align	1
 764              		.global	ascii_ctrl_bit_clear
 765              		.syntax unified
 766              		.code	16
 767              		.thumb_func
 768              		.fpu softvfp
 770              	ascii_ctrl_bit_clear:
 771              	.LFB10:
 170:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 171:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void ascii_ctrl_bit_clear(unsigned char x)
 172:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 772              		.loc 1 172 0
 773              		.cfi_startproc
 774              		@ args = 0, pretend = 0, frame = 16
 775              		@ frame_needed = 1, uses_anonymous_args = 0
 776 0324 80B5     		push	{r7, lr}
 777              		.cfi_def_cfa_offset 8
 778              		.cfi_offset 7, -8
 779              		.cfi_offset 14, -4
 780 0326 84B0     		sub	sp, sp, #16
 781              		.cfi_def_cfa_offset 24
 782 0328 00AF     		add	r7, sp, #0
 783              		.cfi_def_cfa_register 7
 784 032a 0200     		movs	r2, r0
 785 032c FB1D     		adds	r3, r7, #7
 786 032e 1A70     		strb	r2, [r3]
 173:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//GPIO_E->odrLow &= (~x);
 174:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 175:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned char c;
 176:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c = GPIO_E->odrLow;
 787              		.loc 1 176 0
 788 0330 0F4A     		ldr	r2, .L48
 789 0332 0F23     		movs	r3, #15
 790 0334 FB18     		adds	r3, r7, r3
 791 0336 127D     		ldrb	r2, [r2, #20]
 792 0338 1A70     		strb	r2, [r3]
 177:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c = (B_SELECT | c & ~x);
 793              		.loc 1 177 0
 794 033a FB1D     		adds	r3, r7, #7
 795 033c 1B78     		ldrb	r3, [r3]
 796 033e 5BB2     		sxtb	r3, r3
 797 0340 DB43     		mvns	r3, r3
 798 0342 5BB2     		sxtb	r3, r3
 799 0344 0F22     		movs	r2, #15
 800 0346 BA18     		adds	r2, r7, r2
 801 0348 1278     		ldrb	r2, [r2]
 802 034a 52B2     		sxtb	r2, r2
 803 034c 1340     		ands	r3, r2
 804 034e 5BB2     		sxtb	r3, r3
 805 0350 0422     		movs	r2, #4
 806 0352 1343     		orrs	r3, r2
 807 0354 5AB2     		sxtb	r2, r3
 808 0356 0F23     		movs	r3, #15
 809 0358 FB18     		adds	r3, r7, r3
 810 035a 1A70     		strb	r2, [r3]
 178:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->odrLow = c;
 811              		.loc 1 178 0
 812 035c 044A     		ldr	r2, .L48
 813 035e 0F23     		movs	r3, #15
 814 0360 FB18     		adds	r3, r7, r3
 815 0362 1B78     		ldrb	r3, [r3]
 816 0364 1375     		strb	r3, [r2, #20]
 179:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 817              		.loc 1 179 0
 818 0366 C046     		nop
 819 0368 BD46     		mov	sp, r7
 820 036a 04B0     		add	sp, sp, #16
 821              		@ sp needed
 822 036c 80BD     		pop	{r7, pc}
 823              	.L49:
 824 036e C046     		.align	2
 825              	.L48:
 826 0370 00100240 		.word	1073876992
 827              		.cfi_endproc
 828              	.LFE10:
 830              		.align	1
 831              		.global	ascii_write_cmd
 832              		.syntax unified
 833              		.code	16
 834              		.thumb_func
 835              		.fpu softvfp
 837              	ascii_write_cmd:
 838              	.LFB11:
 180:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 181:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void ascii_write_cmd(unsigned char command)
 182:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 839              		.loc 1 182 0
 840              		.cfi_startproc
 841              		@ args = 0, pretend = 0, frame = 8
 842              		@ frame_needed = 1, uses_anonymous_args = 0
 843 0374 80B5     		push	{r7, lr}
 844              		.cfi_def_cfa_offset 8
 845              		.cfi_offset 7, -8
 846              		.cfi_offset 14, -4
 847 0376 82B0     		sub	sp, sp, #8
 848              		.cfi_def_cfa_offset 16
 849 0378 00AF     		add	r7, sp, #0
 850              		.cfi_def_cfa_register 7
 851 037a 0200     		movs	r2, r0
 852 037c FB1D     		adds	r3, r7, #7
 853 037e 1A70     		strb	r2, [r3]
 183:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Doesn't wait or check for the status flag...
 184:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_clear(B_RS);
 854              		.loc 1 184 0
 855 0380 0120     		movs	r0, #1
 856 0382 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 185:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_clear(B_RW);
 857              		.loc 1 185 0
 858 0386 0220     		movs	r0, #2
 859 0388 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 186:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_write_controller(command);
 860              		.loc 1 186 0
 861 038c FB1D     		adds	r3, r7, #7
 862 038e 1B78     		ldrb	r3, [r3]
 863 0390 1800     		movs	r0, r3
 864 0392 FFF7FEFF 		bl	ascii_write_controller
 187:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 865              		.loc 1 187 0
 866 0396 C046     		nop
 867 0398 BD46     		mov	sp, r7
 868 039a 02B0     		add	sp, sp, #8
 869              		@ sp needed
 870 039c 80BD     		pop	{r7, pc}
 871              		.cfi_endproc
 872              	.LFE11:
 874              		.align	1
 875              		.global	ascii_write_data
 876              		.syntax unified
 877              		.code	16
 878              		.thumb_func
 879              		.fpu softvfp
 881              	ascii_write_data:
 882              	.LFB12:
 188:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 189:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void ascii_write_data(unsigned char data)
 190:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 883              		.loc 1 190 0
 884              		.cfi_startproc
 885              		@ args = 0, pretend = 0, frame = 8
 886              		@ frame_needed = 1, uses_anonymous_args = 0
 887 039e 80B5     		push	{r7, lr}
 888              		.cfi_def_cfa_offset 8
 889              		.cfi_offset 7, -8
 890              		.cfi_offset 14, -4
 891 03a0 82B0     		sub	sp, sp, #8
 892              		.cfi_def_cfa_offset 16
 893 03a2 00AF     		add	r7, sp, #0
 894              		.cfi_def_cfa_register 7
 895 03a4 0200     		movs	r2, r0
 896 03a6 FB1D     		adds	r3, r7, #7
 897 03a8 1A70     		strb	r2, [r3]
 191:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_set(B_RS);
 898              		.loc 1 191 0
 899 03aa 0120     		movs	r0, #1
 900 03ac FFF7FEFF 		bl	ascii_ctrl_bit_set
 192:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_clear(B_RW);
 901              		.loc 1 192 0
 902 03b0 0220     		movs	r0, #2
 903 03b2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 193:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_write_controller(data);
 904              		.loc 1 193 0
 905 03b6 FB1D     		adds	r3, r7, #7
 906 03b8 1B78     		ldrb	r3, [r3]
 907 03ba 1800     		movs	r0, r3
 908 03bc FFF7FEFF 		bl	ascii_write_controller
 194:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 909              		.loc 1 194 0
 910 03c0 C046     		nop
 911 03c2 BD46     		mov	sp, r7
 912 03c4 02B0     		add	sp, sp, #8
 913              		@ sp needed
 914 03c6 80BD     		pop	{r7, pc}
 915              		.cfi_endproc
 916              	.LFE12:
 918              		.align	1
 919              		.global	ascii_read_status
 920              		.syntax unified
 921              		.code	16
 922              		.thumb_func
 923              		.fpu softvfp
 925              	ascii_read_status:
 926              	.LFB13:
 195:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 196:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** unsigned char ascii_read_status(void)
 197:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 927              		.loc 1 197 0
 928              		.cfi_startproc
 929              		@ args = 0, pretend = 0, frame = 8
 930              		@ frame_needed = 1, uses_anonymous_args = 0
 931 03c8 90B5     		push	{r4, r7, lr}
 932              		.cfi_def_cfa_offset 12
 933              		.cfi_offset 4, -12
 934              		.cfi_offset 7, -8
 935              		.cfi_offset 14, -4
 936 03ca 83B0     		sub	sp, sp, #12
 937              		.cfi_def_cfa_offset 24
 938 03cc 00AF     		add	r7, sp, #0
 939              		.cfi_def_cfa_register 7
 198:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned char read_value;
 199:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 200:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt pinnar 15-8 till ingångar.
 201:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->moder &= 0x0000FFFF;
 940              		.loc 1 201 0
 941 03ce 0E4B     		ldr	r3, .L54
 942 03d0 0D4A     		ldr	r2, .L54
 943 03d2 1268     		ldr	r2, [r2]
 944 03d4 1204     		lsls	r2, r2, #16
 945 03d6 120C     		lsrs	r2, r2, #16
 946 03d8 1A60     		str	r2, [r3]
 202:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 203:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_clear(B_RS);
 947              		.loc 1 203 0
 948 03da 0120     		movs	r0, #1
 949 03dc FFF7FEFF 		bl	ascii_ctrl_bit_clear
 204:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_set(B_RW);
 950              		.loc 1 204 0
 951 03e0 0220     		movs	r0, #2
 952 03e2 FFF7FEFF 		bl	ascii_ctrl_bit_set
 205:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	read_value = ascii_read_controller();
 953              		.loc 1 205 0
 954 03e6 FC1D     		adds	r4, r7, #7
 955 03e8 FFF7FEFF 		bl	ascii_read_controller
 956 03ec 0300     		movs	r3, r0
 957 03ee 2370     		strb	r3, [r4]
 206:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 207:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt pinnar 15-8 till utgångar igen.
 208:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->moder |= 0x55550000;
 958              		.loc 1 208 0
 959 03f0 054B     		ldr	r3, .L54
 960 03f2 054A     		ldr	r2, .L54
 961 03f4 1268     		ldr	r2, [r2]
 962 03f6 0549     		ldr	r1, .L54+4
 963 03f8 0A43     		orrs	r2, r1
 964 03fa 1A60     		str	r2, [r3]
 209:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 210:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	return read_value;
 965              		.loc 1 210 0
 966 03fc FB1D     		adds	r3, r7, #7
 967 03fe 1B78     		ldrb	r3, [r3]
 211:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 968              		.loc 1 211 0
 969 0400 1800     		movs	r0, r3
 970 0402 BD46     		mov	sp, r7
 971 0404 03B0     		add	sp, sp, #12
 972              		@ sp needed
 973 0406 90BD     		pop	{r4, r7, pc}
 974              	.L55:
 975              		.align	2
 976              	.L54:
 977 0408 00100240 		.word	1073876992
 978 040c 00005555 		.word	1431633920
 979              		.cfi_endproc
 980              	.LFE13:
 982              		.align	1
 983              		.global	ascii_read_data
 984              		.syntax unified
 985              		.code	16
 986              		.thumb_func
 987              		.fpu softvfp
 989              	ascii_read_data:
 990              	.LFB14:
 212:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 213:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** unsigned char ascii_read_data(void)
 214:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 991              		.loc 1 214 0
 992              		.cfi_startproc
 993              		@ args = 0, pretend = 0, frame = 8
 994              		@ frame_needed = 1, uses_anonymous_args = 0
 995 0410 90B5     		push	{r4, r7, lr}
 996              		.cfi_def_cfa_offset 12
 997              		.cfi_offset 4, -12
 998              		.cfi_offset 7, -8
 999              		.cfi_offset 14, -4
 1000 0412 83B0     		sub	sp, sp, #12
 1001              		.cfi_def_cfa_offset 24
 1002 0414 00AF     		add	r7, sp, #0
 1003              		.cfi_def_cfa_register 7
 215:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned char read_value;
 216:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 217:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt pinnar 15-8 till ingångar.
 218:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->moder &= 0x0000FFFF;
 1004              		.loc 1 218 0
 1005 0416 0E4B     		ldr	r3, .L58
 1006 0418 0D4A     		ldr	r2, .L58
 1007 041a 1268     		ldr	r2, [r2]
 1008 041c 1204     		lsls	r2, r2, #16
 1009 041e 120C     		lsrs	r2, r2, #16
 1010 0420 1A60     		str	r2, [r3]
 219:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 220:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_set(B_RS);
 1011              		.loc 1 220 0
 1012 0422 0120     		movs	r0, #1
 1013 0424 FFF7FEFF 		bl	ascii_ctrl_bit_set
 221:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_set(B_RW);
 1014              		.loc 1 221 0
 1015 0428 0220     		movs	r0, #2
 1016 042a FFF7FEFF 		bl	ascii_ctrl_bit_set
 222:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	read_value = ascii_read_controller();
 1017              		.loc 1 222 0
 1018 042e FC1D     		adds	r4, r7, #7
 1019 0430 FFF7FEFF 		bl	ascii_read_controller
 1020 0434 0300     		movs	r3, r0
 1021 0436 2370     		strb	r3, [r4]
 223:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 224:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Sätt pinnar 15-8 till utgångar igen.
 225:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->moder |= 0xFFFF0000;
 1022              		.loc 1 225 0
 1023 0438 054B     		ldr	r3, .L58
 1024 043a 054A     		ldr	r2, .L58
 1025 043c 1268     		ldr	r2, [r2]
 1026 043e 0549     		ldr	r1, .L58+4
 1027 0440 0A43     		orrs	r2, r1
 1028 0442 1A60     		str	r2, [r3]
 226:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	
 227:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	return read_value;
 1029              		.loc 1 227 0
 1030 0444 FB1D     		adds	r3, r7, #7
 1031 0446 1B78     		ldrb	r3, [r3]
 228:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1032              		.loc 1 228 0
 1033 0448 1800     		movs	r0, r3
 1034 044a BD46     		mov	sp, r7
 1035 044c 03B0     		add	sp, sp, #12
 1036              		@ sp needed
 1037 044e 90BD     		pop	{r4, r7, pc}
 1038              	.L59:
 1039              		.align	2
 1040              	.L58:
 1041 0450 00100240 		.word	1073876992
 1042 0454 0000FFFF 		.word	-65536
 1043              		.cfi_endproc
 1044              	.LFE14:
 1046              		.align	1
 1047              		.global	ascii_write_controller
 1048              		.syntax unified
 1049              		.code	16
 1050              		.thumb_func
 1051              		.fpu softvfp
 1053              	ascii_write_controller:
 1054              	.LFB15:
 229:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 230:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void ascii_write_controller(unsigned char byte)
 231:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1055              		.loc 1 231 0
 1056              		.cfi_startproc
 1057              		@ args = 0, pretend = 0, frame = 8
 1058              		@ frame_needed = 1, uses_anonymous_args = 0
 1059 0458 80B5     		push	{r7, lr}
 1060              		.cfi_def_cfa_offset 8
 1061              		.cfi_offset 7, -8
 1062              		.cfi_offset 14, -4
 1063 045a 82B0     		sub	sp, sp, #8
 1064              		.cfi_def_cfa_offset 16
 1065 045c 00AF     		add	r7, sp, #0
 1066              		.cfi_def_cfa_register 7
 1067 045e 0200     		movs	r2, r0
 1068 0460 FB1D     		adds	r3, r7, #7
 1069 0462 1A70     		strb	r2, [r3]
 232:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Delay40ns is redundant
 233:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_set(B_E);
 1070              		.loc 1 233 0
 1071 0464 4020     		movs	r0, #64
 1072 0466 FFF7FEFF 		bl	ascii_ctrl_bit_set
 234:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->odrHigh = byte;
 1073              		.loc 1 234 0
 1074 046a 064A     		ldr	r2, .L61
 1075 046c FB1D     		adds	r3, r7, #7
 1076 046e 1B78     		ldrb	r3, [r3]
 1077 0470 5375     		strb	r3, [r2, #21]
 235:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_250ns();
 1078              		.loc 1 235 0
 1079 0472 FFF7FEFF 		bl	delay_250ns
 236:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_clear(B_E);
 1080              		.loc 1 236 0
 1081 0476 4020     		movs	r0, #64
 1082 0478 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 237:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	// Delay10ns is redundant
 238:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1083              		.loc 1 238 0
 1084 047c C046     		nop
 1085 047e BD46     		mov	sp, r7
 1086 0480 02B0     		add	sp, sp, #8
 1087              		@ sp needed
 1088 0482 80BD     		pop	{r7, pc}
 1089              	.L62:
 1090              		.align	2
 1091              	.L61:
 1092 0484 00100240 		.word	1073876992
 1093              		.cfi_endproc
 1094              	.LFE15:
 1096              		.align	1
 1097              		.global	ascii_read_controller
 1098              		.syntax unified
 1099              		.code	16
 1100              		.thumb_func
 1101              		.fpu softvfp
 1103              	ascii_read_controller:
 1104              	.LFB16:
 239:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 240:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** unsigned char ascii_read_controller(void)
 241:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1105              		.loc 1 241 0
 1106              		.cfi_startproc
 1107              		@ args = 0, pretend = 0, frame = 8
 1108              		@ frame_needed = 1, uses_anonymous_args = 0
 1109 0488 80B5     		push	{r7, lr}
 1110              		.cfi_def_cfa_offset 8
 1111              		.cfi_offset 7, -8
 1112              		.cfi_offset 14, -4
 1113 048a 82B0     		sub	sp, sp, #8
 1114              		.cfi_def_cfa_offset 16
 1115 048c 00AF     		add	r7, sp, #0
 1116              		.cfi_def_cfa_register 7
 242:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned char read_value;
 243:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_set(B_E);
 1117              		.loc 1 243 0
 1118 048e 4020     		movs	r0, #64
 1119 0490 FFF7FEFF 		bl	ascii_ctrl_bit_set
 244:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_250ns();
 1120              		.loc 1 244 0
 1121 0494 FFF7FEFF 		bl	delay_250ns
 245:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_250ns();
 1122              		.loc 1 245 0
 1123 0498 FFF7FEFF 		bl	delay_250ns
 246:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	read_value = GPIO_E->idrHigh;
 1124              		.loc 1 246 0
 1125 049c 064A     		ldr	r2, .L65
 1126 049e FB1D     		adds	r3, r7, #7
 1127 04a0 527C     		ldrb	r2, [r2, #17]
 1128 04a2 1A70     		strb	r2, [r3]
 247:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_ctrl_bit_clear(B_E);
 1129              		.loc 1 247 0
 1130 04a4 4020     		movs	r0, #64
 1131 04a6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 248:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	return read_value;
 1132              		.loc 1 248 0
 1133 04aa FB1D     		adds	r3, r7, #7
 1134 04ac 1B78     		ldrb	r3, [r3]
 249:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1135              		.loc 1 249 0
 1136 04ae 1800     		movs	r0, r3
 1137 04b0 BD46     		mov	sp, r7
 1138 04b2 02B0     		add	sp, sp, #8
 1139              		@ sp needed
 1140 04b4 80BD     		pop	{r7, pc}
 1141              	.L66:
 1142 04b6 C046     		.align	2
 1143              	.L65:
 1144 04b8 00100240 		.word	1073876992
 1145              		.cfi_endproc
 1146              	.LFE16:
 1148              		.align	1
 1149              		.global	ascii_gotoxy
 1150              		.syntax unified
 1151              		.code	16
 1152              		.thumb_func
 1153              		.fpu softvfp
 1155              	ascii_gotoxy:
 1156              	.LFB17:
 250:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 251:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void ascii_gotoxy(int x, int y)
 252:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1157              		.loc 1 252 0
 1158              		.cfi_startproc
 1159              		@ args = 0, pretend = 0, frame = 16
 1160              		@ frame_needed = 1, uses_anonymous_args = 0
 1161 04bc 80B5     		push	{r7, lr}
 1162              		.cfi_def_cfa_offset 8
 1163              		.cfi_offset 7, -8
 1164              		.cfi_offset 14, -4
 1165 04be 84B0     		sub	sp, sp, #16
 1166              		.cfi_def_cfa_offset 24
 1167 04c0 00AF     		add	r7, sp, #0
 1168              		.cfi_def_cfa_register 7
 1169 04c2 7860     		str	r0, [r7, #4]
 1170 04c4 3960     		str	r1, [r7]
 253:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if(!(y == 1 || y == 2)) return;
 1171              		.loc 1 253 0
 1172 04c6 3B68     		ldr	r3, [r7]
 1173 04c8 012B     		cmp	r3, #1
 1174 04ca 02D0     		beq	.L68
 1175              		.loc 1 253 0 is_stmt 0 discriminator 1
 1176 04cc 3B68     		ldr	r3, [r7]
 1177 04ce 022B     		cmp	r3, #2
 1178 04d0 1AD1     		bne	.L71
 1179              	.L68:
 254:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned char address = x - 1;
 1180              		.loc 1 254 0 is_stmt 1
 1181 04d2 7B68     		ldr	r3, [r7, #4]
 1182 04d4 DAB2     		uxtb	r2, r3
 1183 04d6 0F23     		movs	r3, #15
 1184 04d8 FB18     		adds	r3, r7, r3
 1185 04da 013A     		subs	r2, r2, #1
 1186 04dc 1A70     		strb	r2, [r3]
 255:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if(y == 2){
 1187              		.loc 1 255 0
 1188 04de 3B68     		ldr	r3, [r7]
 1189 04e0 022B     		cmp	r3, #2
 1190 04e2 06D1     		bne	.L70
 256:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		address += 0x40;
 1191              		.loc 1 256 0
 1192 04e4 0F23     		movs	r3, #15
 1193 04e6 FB18     		adds	r3, r7, r3
 1194 04e8 0F22     		movs	r2, #15
 1195 04ea BA18     		adds	r2, r7, r2
 1196 04ec 1278     		ldrb	r2, [r2]
 1197 04ee 4032     		adds	r2, r2, #64
 1198 04f0 1A70     		strb	r2, [r3]
 1199              	.L70:
 257:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 258:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_write_cmd(0x80 | address);
 1200              		.loc 1 258 0
 1201 04f2 0F23     		movs	r3, #15
 1202 04f4 FB18     		adds	r3, r7, r3
 1203 04f6 1B78     		ldrb	r3, [r3]
 1204 04f8 8022     		movs	r2, #128
 1205 04fa 5242     		rsbs	r2, r2, #0
 1206 04fc 1343     		orrs	r3, r2
 1207 04fe DBB2     		uxtb	r3, r3
 1208 0500 1800     		movs	r0, r3
 1209 0502 FFF7FEFF 		bl	ascii_write_cmd
 1210 0506 00E0     		b	.L67
 1211              	.L71:
 253:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned char address = x - 1;
 1212              		.loc 1 253 0
 1213 0508 C046     		nop
 1214              	.L67:
 259:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1215              		.loc 1 259 0
 1216 050a BD46     		mov	sp, r7
 1217 050c 04B0     		add	sp, sp, #16
 1218              		@ sp needed
 1219 050e 80BD     		pop	{r7, pc}
 1220              		.cfi_endproc
 1221              	.LFE17:
 1223              		.align	1
 1224              		.global	ascii_write_char
 1225              		.syntax unified
 1226              		.code	16
 1227              		.thumb_func
 1228              		.fpu softvfp
 1230              	ascii_write_char:
 1231              	.LFB18:
 260:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 261:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void ascii_write_char(unsigned char c)
 262:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1232              		.loc 1 262 0
 1233              		.cfi_startproc
 1234              		@ args = 0, pretend = 0, frame = 8
 1235              		@ frame_needed = 1, uses_anonymous_args = 0
 1236 0510 80B5     		push	{r7, lr}
 1237              		.cfi_def_cfa_offset 8
 1238              		.cfi_offset 7, -8
 1239              		.cfi_offset 14, -4
 1240 0512 82B0     		sub	sp, sp, #8
 1241              		.cfi_def_cfa_offset 16
 1242 0514 00AF     		add	r7, sp, #0
 1243              		.cfi_def_cfa_register 7
 1244 0516 0200     		movs	r2, r0
 1245 0518 FB1D     		adds	r3, r7, #7
 1246 051a 1A70     		strb	r2, [r3]
 263:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 1247              		.loc 1 263 0
 1248 051c C046     		nop
 1249              	.L73:
 1250              		.loc 1 263 0 is_stmt 0 discriminator 1
 1251 051e FFF7FEFF 		bl	ascii_read_status
 1252 0522 0300     		movs	r3, r0
 1253 0524 1A00     		movs	r2, r3
 1254 0526 8023     		movs	r3, #128
 1255 0528 1340     		ands	r3, r2
 1256 052a 802B     		cmp	r3, #128
 1257 052c F7D0     		beq	.L73
 264:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 265:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(8);
 1258              		.loc 1 265 0 is_stmt 1
 1259 052e 0820     		movs	r0, #8
 1260 0530 FFF7FEFF 		bl	delay_mikro
 266:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	ascii_write_data(c);
 1261              		.loc 1 266 0
 1262 0534 FB1D     		adds	r3, r7, #7
 1263 0536 1B78     		ldrb	r3, [r3]
 1264 0538 1800     		movs	r0, r3
 1265 053a FFF7FEFF 		bl	ascii_write_data
 267:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(43);
 1266              		.loc 1 267 0
 1267 053e 2B20     		movs	r0, #43
 1268 0540 FFF7FEFF 		bl	delay_mikro
 268:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	//delay_mikro(100000);
 269:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1269              		.loc 1 269 0
 1270 0544 C046     		nop
 1271 0546 BD46     		mov	sp, r7
 1272 0548 02B0     		add	sp, sp, #8
 1273              		@ sp needed
 1274 054a 80BD     		pop	{r7, pc}
 1275              		.cfi_endproc
 1276              	.LFE18:
 1278              		.align	1
 1279              		.global	graphic_ctrl_bit_set
 1280              		.syntax unified
 1281              		.code	16
 1282              		.thumb_func
 1283              		.fpu softvfp
 1285              	graphic_ctrl_bit_set:
 1286              	.LFB19:
 270:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 271:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** #define Lab 3
 272:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 273:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** /* välj grafik-display och ettställ de bitar som är 1 i x */
 274:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void graphic_ctrl_bit_set( uint8_t x )
 275:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1287              		.loc 1 275 0
 1288              		.cfi_startproc
 1289              		@ args = 0, pretend = 0, frame = 16
 1290              		@ frame_needed = 1, uses_anonymous_args = 0
 1291 054c 80B5     		push	{r7, lr}
 1292              		.cfi_def_cfa_offset 8
 1293              		.cfi_offset 7, -8
 1294              		.cfi_offset 14, -4
 1295 054e 84B0     		sub	sp, sp, #16
 1296              		.cfi_def_cfa_offset 24
 1297 0550 00AF     		add	r7, sp, #0
 1298              		.cfi_def_cfa_register 7
 1299 0552 0200     		movs	r2, r0
 1300 0554 FB1D     		adds	r3, r7, #7
 1301 0556 1A70     		strb	r2, [r3]
 276:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	uint8_t c;
 277:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c = GPIO_E->odrLow;
 1302              		.loc 1 277 0
 1303 0558 124A     		ldr	r2, .L75
 1304 055a 0F23     		movs	r3, #15
 1305 055c FB18     		adds	r3, r7, r3
 1306 055e 127D     		ldrb	r2, [r2, #20]
 1307 0560 1A70     		strb	r2, [r3]
 278:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c &= ~B_SELECT;
 1308              		.loc 1 278 0
 1309 0562 0F23     		movs	r3, #15
 1310 0564 FB18     		adds	r3, r7, r3
 1311 0566 0F22     		movs	r2, #15
 1312 0568 BA18     		adds	r2, r7, r2
 1313 056a 1278     		ldrb	r2, [r2]
 1314 056c 0421     		movs	r1, #4
 1315 056e 8A43     		bics	r2, r1
 1316 0570 1A70     		strb	r2, [r3]
 279:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c |= (~B_SELECT & x);
 1317              		.loc 1 279 0
 1318 0572 FB1D     		adds	r3, r7, #7
 1319 0574 1B78     		ldrb	r3, [r3]
 1320 0576 5BB2     		sxtb	r3, r3
 1321 0578 0422     		movs	r2, #4
 1322 057a 9343     		bics	r3, r2
 1323 057c 5AB2     		sxtb	r2, r3
 1324 057e 0F23     		movs	r3, #15
 1325 0580 FB18     		adds	r3, r7, r3
 1326 0582 1B78     		ldrb	r3, [r3]
 1327 0584 5BB2     		sxtb	r3, r3
 1328 0586 1343     		orrs	r3, r2
 1329 0588 5AB2     		sxtb	r2, r3
 1330 058a 0F23     		movs	r3, #15
 1331 058c FB18     		adds	r3, r7, r3
 1332 058e 1A70     		strb	r2, [r3]
 280:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->odrLow = c;
 1333              		.loc 1 280 0
 1334 0590 044A     		ldr	r2, .L75
 1335 0592 0F23     		movs	r3, #15
 1336 0594 FB18     		adds	r3, r7, r3
 1337 0596 1B78     		ldrb	r3, [r3]
 1338 0598 1375     		strb	r3, [r2, #20]
 281:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1339              		.loc 1 281 0
 1340 059a C046     		nop
 1341 059c BD46     		mov	sp, r7
 1342 059e 04B0     		add	sp, sp, #16
 1343              		@ sp needed
 1344 05a0 80BD     		pop	{r7, pc}
 1345              	.L76:
 1346 05a2 C046     		.align	2
 1347              	.L75:
 1348 05a4 00100240 		.word	1073876992
 1349              		.cfi_endproc
 1350              	.LFE19:
 1352              		.align	1
 1353              		.global	graphic_ctrl_bit_clear
 1354              		.syntax unified
 1355              		.code	16
 1356              		.thumb_func
 1357              		.fpu softvfp
 1359              	graphic_ctrl_bit_clear:
 1360              	.LFB20:
 282:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 283:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** /* välj grafik-display och nollställ de bitar som är 1 i x */
 284:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void graphic_ctrl_bit_clear( uint8_t x )
 285:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1361              		.loc 1 285 0
 1362              		.cfi_startproc
 1363              		@ args = 0, pretend = 0, frame = 16
 1364              		@ frame_needed = 1, uses_anonymous_args = 0
 1365 05a8 80B5     		push	{r7, lr}
 1366              		.cfi_def_cfa_offset 8
 1367              		.cfi_offset 7, -8
 1368              		.cfi_offset 14, -4
 1369 05aa 84B0     		sub	sp, sp, #16
 1370              		.cfi_def_cfa_offset 24
 1371 05ac 00AF     		add	r7, sp, #0
 1372              		.cfi_def_cfa_register 7
 1373 05ae 0200     		movs	r2, r0
 1374 05b0 FB1D     		adds	r3, r7, #7
 1375 05b2 1A70     		strb	r2, [r3]
 286:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	uint8_t c;
 287:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c = GPIO_E->odrLow;
 1376              		.loc 1 287 0
 1377 05b4 114A     		ldr	r2, .L78
 1378 05b6 0F23     		movs	r3, #15
 1379 05b8 FB18     		adds	r3, r7, r3
 1380 05ba 127D     		ldrb	r2, [r2, #20]
 1381 05bc 1A70     		strb	r2, [r3]
 288:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c &= ~B_SELECT;
 1382              		.loc 1 288 0
 1383 05be 0F23     		movs	r3, #15
 1384 05c0 FB18     		adds	r3, r7, r3
 1385 05c2 0F22     		movs	r2, #15
 1386 05c4 BA18     		adds	r2, r7, r2
 1387 05c6 1278     		ldrb	r2, [r2]
 1388 05c8 0421     		movs	r1, #4
 1389 05ca 8A43     		bics	r2, r1
 1390 05cc 1A70     		strb	r2, [r3]
 289:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c &= ~x;
 1391              		.loc 1 289 0
 1392 05ce FB1D     		adds	r3, r7, #7
 1393 05d0 1B78     		ldrb	r3, [r3]
 1394 05d2 5BB2     		sxtb	r3, r3
 1395 05d4 DB43     		mvns	r3, r3
 1396 05d6 5BB2     		sxtb	r3, r3
 1397 05d8 0F22     		movs	r2, #15
 1398 05da BA18     		adds	r2, r7, r2
 1399 05dc 1278     		ldrb	r2, [r2]
 1400 05de 52B2     		sxtb	r2, r2
 1401 05e0 1340     		ands	r3, r2
 1402 05e2 5AB2     		sxtb	r2, r3
 1403 05e4 0F23     		movs	r3, #15
 1404 05e6 FB18     		adds	r3, r7, r3
 1405 05e8 1A70     		strb	r2, [r3]
 290:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->odrLow = c;
 1406              		.loc 1 290 0
 1407 05ea 044A     		ldr	r2, .L78
 1408 05ec 0F23     		movs	r3, #15
 1409 05ee FB18     		adds	r3, r7, r3
 1410 05f0 1B78     		ldrb	r3, [r3]
 1411 05f2 1375     		strb	r3, [r2, #20]
 291:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1412              		.loc 1 291 0
 1413 05f4 C046     		nop
 1414 05f6 BD46     		mov	sp, r7
 1415 05f8 04B0     		add	sp, sp, #16
 1416              		@ sp needed
 1417 05fa 80BD     		pop	{r7, pc}
 1418              	.L79:
 1419              		.align	2
 1420              	.L78:
 1421 05fc 00100240 		.word	1073876992
 1422              		.cfi_endproc
 1423              	.LFE20:
 1425              		.align	1
 1426              		.global	select_controller
 1427              		.syntax unified
 1428              		.code	16
 1429              		.thumb_func
 1430              		.fpu softvfp
 1432              	select_controller:
 1433              	.LFB21:
 292:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 293:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** /* konfigurera cs-signalerna */
 294:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void select_controller( uint8_t controller )
 295:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1434              		.loc 1 295 0
 1435              		.cfi_startproc
 1436              		@ args = 0, pretend = 0, frame = 8
 1437              		@ frame_needed = 1, uses_anonymous_args = 0
 1438 0600 80B5     		push	{r7, lr}
 1439              		.cfi_def_cfa_offset 8
 1440              		.cfi_offset 7, -8
 1441              		.cfi_offset 14, -4
 1442 0602 82B0     		sub	sp, sp, #8
 1443              		.cfi_def_cfa_offset 16
 1444 0604 00AF     		add	r7, sp, #0
 1445              		.cfi_def_cfa_register 7
 1446 0606 0200     		movs	r2, r0
 1447 0608 FB1D     		adds	r3, r7, #7
 1448 060a 1A70     		strb	r2, [r3]
 296:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	switch(controller){
 1449              		.loc 1 296 0
 1450 060c FB1D     		adds	r3, r7, #7
 1451 060e 1B78     		ldrb	r3, [r3]
 1452 0610 082B     		cmp	r3, #8
 1453 0612 0CD0     		beq	.L82
 1454 0614 02DC     		bgt	.L83
 1455 0616 002B     		cmp	r3, #0
 1456 0618 05D0     		beq	.L84
 297:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case 0:
 298:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_ctrl_bit_clear(B_CS1|B_CS2);
 299:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			break;
 300:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case B_CS1 :
 301:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_ctrl_bit_set(B_CS1);
 302:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_ctrl_bit_clear(B_CS2);
 303:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			break;
 304:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case B_CS2 :
 305:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_ctrl_bit_set(B_CS2);
 306:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_ctrl_bit_clear(B_CS1);
 307:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			break;
 308:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case B_CS1|B_CS2 :
 309:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_ctrl_bit_set(B_CS1|B_CS2);
 310:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			break;
 311:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 312:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1457              		.loc 1 312 0
 1458 061a 1AE0     		b	.L87
 1459              	.L83:
 296:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	switch(controller){
 1460              		.loc 1 296 0
 1461 061c 102B     		cmp	r3, #16
 1462 061e 0DD0     		beq	.L85
 1463 0620 182B     		cmp	r3, #24
 1464 0622 12D0     		beq	.L86
 1465              		.loc 1 312 0
 1466 0624 15E0     		b	.L87
 1467              	.L84:
 298:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			break;
 1468              		.loc 1 298 0
 1469 0626 1820     		movs	r0, #24
 1470 0628 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 299:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case B_CS1 :
 1471              		.loc 1 299 0
 1472 062c 11E0     		b	.L81
 1473              	.L82:
 301:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_ctrl_bit_clear(B_CS2);
 1474              		.loc 1 301 0
 1475 062e 0820     		movs	r0, #8
 1476 0630 FFF7FEFF 		bl	graphic_ctrl_bit_set
 302:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			break;
 1477              		.loc 1 302 0
 1478 0634 1020     		movs	r0, #16
 1479 0636 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 303:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case B_CS2 :
 1480              		.loc 1 303 0
 1481 063a 0AE0     		b	.L81
 1482              	.L85:
 305:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_ctrl_bit_clear(B_CS1);
 1483              		.loc 1 305 0
 1484 063c 1020     		movs	r0, #16
 1485 063e FFF7FEFF 		bl	graphic_ctrl_bit_set
 306:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			break;
 1486              		.loc 1 306 0
 1487 0642 0820     		movs	r0, #8
 1488 0644 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 307:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		case B_CS1|B_CS2 :
 1489              		.loc 1 307 0
 1490 0648 03E0     		b	.L81
 1491              	.L86:
 309:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			break;
 1492              		.loc 1 309 0
 1493 064a 1820     		movs	r0, #24
 1494 064c FFF7FEFF 		bl	graphic_ctrl_bit_set
 310:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 1495              		.loc 1 310 0
 1496 0650 C046     		nop
 1497              	.L81:
 1498              	.L87:
 1499              		.loc 1 312 0
 1500 0652 C046     		nop
 1501 0654 BD46     		mov	sp, r7
 1502 0656 02B0     		add	sp, sp, #8
 1503              		@ sp needed
 1504 0658 80BD     		pop	{r7, pc}
 1505              		.cfi_endproc
 1506              	.LFE21:
 1508              		.align	1
 1509              		.global	graphic_initialize
 1510              		.syntax unified
 1511              		.code	16
 1512              		.thumb_func
 1513              		.fpu softvfp
 1515              	graphic_initialize:
 1516              	.LFB22:
 313:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 314:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void graphic_initialize(void)
 315:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1517              		.loc 1 315 0
 1518              		.cfi_startproc
 1519              		@ args = 0, pretend = 0, frame = 0
 1520              		@ frame_needed = 1, uses_anonymous_args = 0
 1521 065a 80B5     		push	{r7, lr}
 1522              		.cfi_def_cfa_offset 8
 1523              		.cfi_offset 7, -8
 1524              		.cfi_offset 14, -4
 1525 065c 00AF     		add	r7, sp, #0
 1526              		.cfi_def_cfa_register 7
 316:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_set(B_E);
 1527              		.loc 1 316 0
 1528 065e 4020     		movs	r0, #64
 1529 0660 FFF7FEFF 		bl	graphic_ctrl_bit_set
 317:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_mikro(10);
 1530              		.loc 1 317 0
 1531 0664 0A20     		movs	r0, #10
 1532 0666 FFF7FEFF 		bl	delay_mikro
 318:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 1533              		.loc 1 318 0
 1534 066a 7820     		movs	r0, #120
 1535 066c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 319:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_milli(30);
 1536              		.loc 1 319 0
 1537 0670 1E20     		movs	r0, #30
 1538 0672 FFF7FEFF 		bl	delay_milli
 320:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_set(B_RST);
 1539              		.loc 1 320 0
 1540 0676 2020     		movs	r0, #32
 1541 0678 FFF7FEFF 		bl	graphic_ctrl_bit_set
 321:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_milli(100);
 1542              		.loc 1 321 0
 1543 067c 6420     		movs	r0, #100
 1544 067e FFF7FEFF 		bl	delay_milli
 322:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 1545              		.loc 1 322 0
 1546 0682 1821     		movs	r1, #24
 1547 0684 3E20     		movs	r0, #62
 1548 0686 00F0DFF8 		bl	graphic_write_command
 323:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_write_command(LCD_ON, B_CS1|B_CS2);
 1549              		.loc 1 323 0
 1550 068a 1821     		movs	r1, #24
 1551 068c 3F20     		movs	r0, #63
 1552 068e 00F0DBF8 		bl	graphic_write_command
 324:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 1553              		.loc 1 324 0
 1554 0692 1821     		movs	r1, #24
 1555 0694 C020     		movs	r0, #192
 1556 0696 00F0D7F8 		bl	graphic_write_command
 325:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 1557              		.loc 1 325 0
 1558 069a 1821     		movs	r1, #24
 1559 069c 4020     		movs	r0, #64
 1560 069e 00F0D3F8 		bl	graphic_write_command
 326:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 1561              		.loc 1 326 0
 1562 06a2 1821     		movs	r1, #24
 1563 06a4 B820     		movs	r0, #184
 1564 06a6 00F0CFF8 		bl	graphic_write_command
 327:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	select_controller(0);
 1565              		.loc 1 327 0
 1566 06aa 0020     		movs	r0, #0
 1567 06ac FFF7FEFF 		bl	select_controller
 328:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1568              		.loc 1 328 0
 1569 06b0 C046     		nop
 1570 06b2 BD46     		mov	sp, r7
 1571              		@ sp needed
 1572 06b4 80BD     		pop	{r7, pc}
 1573              		.cfi_endproc
 1574              	.LFE22:
 1576              		.align	1
 1577              		.syntax unified
 1578              		.code	16
 1579              		.thumb_func
 1580              		.fpu softvfp
 1582              	graphic_wait_ready:
 1583              	.LFB23:
 329:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 330:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** static void graphic_wait_ready(void)
 331:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1584              		.loc 1 331 0
 1585              		.cfi_startproc
 1586              		@ args = 0, pretend = 0, frame = 8
 1587              		@ frame_needed = 1, uses_anonymous_args = 0
 1588 06b6 80B5     		push	{r7, lr}
 1589              		.cfi_def_cfa_offset 8
 1590              		.cfi_offset 7, -8
 1591              		.cfi_offset 14, -4
 1592 06b8 82B0     		sub	sp, sp, #8
 1593              		.cfi_def_cfa_offset 16
 1594 06ba 00AF     		add	r7, sp, #0
 1595              		.cfi_def_cfa_register 7
 332:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	uint8_t c;
 333:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1596              		.loc 1 333 0
 1597 06bc 4020     		movs	r0, #64
 1598 06be FFF7FEFF 		bl	graphic_ctrl_bit_clear
 334:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->moder = 0x00005555; // 15-8 inputs, 7-0 outputs
 1599              		.loc 1 334 0
 1600 06c2 144B     		ldr	r3, .L95
 1601 06c4 144A     		ldr	r2, .L95+4
 1602 06c6 1A60     		str	r2, [r3]
 335:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_RS);
 1603              		.loc 1 335 0
 1604 06c8 0120     		movs	r0, #1
 1605 06ca FFF7FEFF 		bl	graphic_ctrl_bit_clear
 336:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_set(B_RW);
 1606              		.loc 1 336 0
 1607 06ce 0220     		movs	r0, #2
 1608 06d0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 337:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_500ns();
 1609              		.loc 1 337 0
 1610 06d4 FFF7FEFF 		bl	delay_500ns
 1611              	.L92:
 338:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	while(1) {
 339:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_set(B_E);
 1612              		.loc 1 339 0
 1613 06d8 4020     		movs	r0, #64
 1614 06da FFF7FEFF 		bl	graphic_ctrl_bit_set
 340:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_500ns();
 1615              		.loc 1 340 0
 1616 06de FFF7FEFF 		bl	delay_500ns
 341:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c = GPIO_E->idrHigh & LCD_BUSY;
 1617              		.loc 1 341 0
 1618 06e2 0C4B     		ldr	r3, .L95
 1619 06e4 5B7C     		ldrb	r3, [r3, #17]
 1620 06e6 DAB2     		uxtb	r2, r3
 1621 06e8 FB1D     		adds	r3, r7, #7
 1622 06ea 7F21     		movs	r1, #127
 1623 06ec 8A43     		bics	r2, r1
 1624 06ee 1A70     		strb	r2, [r3]
 342:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1625              		.loc 1 342 0
 1626 06f0 4020     		movs	r0, #64
 1627 06f2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 343:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_500ns();
 1628              		.loc 1 343 0
 1629 06f6 FFF7FEFF 		bl	delay_500ns
 344:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if( c == 0 ) break;
 1630              		.loc 1 344 0
 1631 06fa FB1D     		adds	r3, r7, #7
 1632 06fc 1B78     		ldrb	r3, [r3]
 1633 06fe 002B     		cmp	r3, #0
 1634 0700 00D0     		beq	.L94
 339:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_500ns();
 1635              		.loc 1 339 0
 1636 0702 E9E7     		b	.L92
 1637              	.L94:
 1638              		.loc 1 344 0
 1639 0704 C046     		nop
 345:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 346:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->moder = 0x55555555; // 15-0 outputs
 1640              		.loc 1 346 0
 1641 0706 034B     		ldr	r3, .L95
 1642 0708 044A     		ldr	r2, .L95+8
 1643 070a 1A60     		str	r2, [r3]
 347:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1644              		.loc 1 347 0
 1645 070c C046     		nop
 1646 070e BD46     		mov	sp, r7
 1647 0710 02B0     		add	sp, sp, #8
 1648              		@ sp needed
 1649 0712 80BD     		pop	{r7, pc}
 1650              	.L96:
 1651              		.align	2
 1652              	.L95:
 1653 0714 00100240 		.word	1073876992
 1654 0718 55550000 		.word	21845
 1655 071c 55555555 		.word	1431655765
 1656              		.cfi_endproc
 1657              	.LFE23:
 1659              		.align	1
 1660              		.syntax unified
 1661              		.code	16
 1662              		.thumb_func
 1663              		.fpu softvfp
 1665              	graphic_read:
 1666              	.LFB24:
 348:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 349:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** static uint8_t graphic_read(uint8_t controller)
 350:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1667              		.loc 1 350 0
 1668              		.cfi_startproc
 1669              		@ args = 0, pretend = 0, frame = 16
 1670              		@ frame_needed = 1, uses_anonymous_args = 0
 1671 0720 80B5     		push	{r7, lr}
 1672              		.cfi_def_cfa_offset 8
 1673              		.cfi_offset 7, -8
 1674              		.cfi_offset 14, -4
 1675 0722 84B0     		sub	sp, sp, #16
 1676              		.cfi_def_cfa_offset 24
 1677 0724 00AF     		add	r7, sp, #0
 1678              		.cfi_def_cfa_register 7
 1679 0726 0200     		movs	r2, r0
 1680 0728 FB1D     		adds	r3, r7, #7
 1681 072a 1A70     		strb	r2, [r3]
 351:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	uint8_t c;
 352:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1682              		.loc 1 352 0
 1683 072c 4020     		movs	r0, #64
 1684 072e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 353:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->moder = 0x00005555; // 15-8 inputs, 7-0 outputs
 1685              		.loc 1 353 0
 1686 0732 1C4B     		ldr	r3, .L101
 1687 0734 1C4A     		ldr	r2, .L101+4
 1688 0736 1A60     		str	r2, [r3]
 354:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_set(B_RS|B_RW);
 1689              		.loc 1 354 0
 1690 0738 0320     		movs	r0, #3
 1691 073a FFF7FEFF 		bl	graphic_ctrl_bit_set
 355:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	select_controller(controller);
 1692              		.loc 1 355 0
 1693 073e FB1D     		adds	r3, r7, #7
 1694 0740 1B78     		ldrb	r3, [r3]
 1695 0742 1800     		movs	r0, r3
 1696 0744 FFF7FEFF 		bl	select_controller
 356:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_500ns();
 1697              		.loc 1 356 0
 1698 0748 FFF7FEFF 		bl	delay_500ns
 357:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_set(B_E);
 1699              		.loc 1 357 0
 1700 074c 4020     		movs	r0, #64
 1701 074e FFF7FEFF 		bl	graphic_ctrl_bit_set
 358:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_500ns();
 1702              		.loc 1 358 0
 1703 0752 FFF7FEFF 		bl	delay_500ns
 359:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	c = GPIO_E->idrHigh;
 1704              		.loc 1 359 0
 1705 0756 134A     		ldr	r2, .L101
 1706 0758 0F23     		movs	r3, #15
 1707 075a FB18     		adds	r3, r7, r3
 1708 075c 527C     		ldrb	r2, [r2, #17]
 1709 075e 1A70     		strb	r2, [r3]
 360:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1710              		.loc 1 360 0
 1711 0760 4020     		movs	r0, #64
 1712 0762 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 361:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->moder = 0x55555555; // 15-0 outputs
 1713              		.loc 1 361 0
 1714 0766 0F4B     		ldr	r3, .L101
 1715 0768 104A     		ldr	r2, .L101+8
 1716 076a 1A60     		str	r2, [r3]
 362:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if( controller & B_CS1 ) {
 1717              		.loc 1 362 0
 1718 076c FB1D     		adds	r3, r7, #7
 1719 076e 1B78     		ldrb	r3, [r3]
 1720 0770 0822     		movs	r2, #8
 1721 0772 1340     		ands	r3, r2
 1722 0774 04D0     		beq	.L98
 363:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		select_controller(B_CS1);
 1723              		.loc 1 363 0
 1724 0776 0820     		movs	r0, #8
 1725 0778 FFF7FEFF 		bl	select_controller
 364:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		graphic_wait_ready();
 1726              		.loc 1 364 0
 1727 077c FFF79BFF 		bl	graphic_wait_ready
 1728              	.L98:
 365:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 366:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if( controller & B_CS2 ) {
 1729              		.loc 1 366 0
 1730 0780 FB1D     		adds	r3, r7, #7
 1731 0782 1B78     		ldrb	r3, [r3]
 1732 0784 1022     		movs	r2, #16
 1733 0786 1340     		ands	r3, r2
 1734 0788 04D0     		beq	.L99
 367:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		select_controller(B_CS2);
 1735              		.loc 1 367 0
 1736 078a 1020     		movs	r0, #16
 1737 078c FFF7FEFF 		bl	select_controller
 368:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		graphic_wait_ready();
 1738              		.loc 1 368 0
 1739 0790 FFF791FF 		bl	graphic_wait_ready
 1740              	.L99:
 369:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 370:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	return c;
 1741              		.loc 1 370 0
 1742 0794 0F23     		movs	r3, #15
 1743 0796 FB18     		adds	r3, r7, r3
 1744 0798 1B78     		ldrb	r3, [r3]
 371:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1745              		.loc 1 371 0
 1746 079a 1800     		movs	r0, r3
 1747 079c BD46     		mov	sp, r7
 1748 079e 04B0     		add	sp, sp, #16
 1749              		@ sp needed
 1750 07a0 80BD     		pop	{r7, pc}
 1751              	.L102:
 1752 07a2 C046     		.align	2
 1753              	.L101:
 1754 07a4 00100240 		.word	1073876992
 1755 07a8 55550000 		.word	21845
 1756 07ac 55555555 		.word	1431655765
 1757              		.cfi_endproc
 1758              	.LFE24:
 1760              		.align	1
 1761              		.syntax unified
 1762              		.code	16
 1763              		.thumb_func
 1764              		.fpu softvfp
 1766              	graphic_read_data:
 1767              	.LFB25:
 372:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 373:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** static uint8_t graphic_read_data(uint8_t controller)
 374:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1768              		.loc 1 374 0
 1769              		.cfi_startproc
 1770              		@ args = 0, pretend = 0, frame = 8
 1771              		@ frame_needed = 1, uses_anonymous_args = 0
 1772 07b0 80B5     		push	{r7, lr}
 1773              		.cfi_def_cfa_offset 8
 1774              		.cfi_offset 7, -8
 1775              		.cfi_offset 14, -4
 1776 07b2 82B0     		sub	sp, sp, #8
 1777              		.cfi_def_cfa_offset 16
 1778 07b4 00AF     		add	r7, sp, #0
 1779              		.cfi_def_cfa_register 7
 1780 07b6 0200     		movs	r2, r0
 1781 07b8 FB1D     		adds	r3, r7, #7
 1782 07ba 1A70     		strb	r2, [r3]
 375:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_read(controller);
 1783              		.loc 1 375 0
 1784 07bc FB1D     		adds	r3, r7, #7
 1785 07be 1B78     		ldrb	r3, [r3]
 1786 07c0 1800     		movs	r0, r3
 1787 07c2 FFF7ADFF 		bl	graphic_read
 376:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	return graphic_read(controller);
 1788              		.loc 1 376 0
 1789 07c6 FB1D     		adds	r3, r7, #7
 1790 07c8 1B78     		ldrb	r3, [r3]
 1791 07ca 1800     		movs	r0, r3
 1792 07cc FFF7A8FF 		bl	graphic_read
 1793 07d0 0300     		movs	r3, r0
 377:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1794              		.loc 1 377 0
 1795 07d2 1800     		movs	r0, r3
 1796 07d4 BD46     		mov	sp, r7
 1797 07d6 02B0     		add	sp, sp, #8
 1798              		@ sp needed
 1799 07d8 80BD     		pop	{r7, pc}
 1800              		.cfi_endproc
 1801              	.LFE25:
 1803              		.align	1
 1804              		.syntax unified
 1805              		.code	16
 1806              		.thumb_func
 1807              		.fpu softvfp
 1809              	graphic_write:
 1810              	.LFB26:
 378:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 379:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** static void graphic_write(uint8_t value, uint8_t controller)
 380:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1811              		.loc 1 380 0
 1812              		.cfi_startproc
 1813              		@ args = 0, pretend = 0, frame = 8
 1814              		@ frame_needed = 1, uses_anonymous_args = 0
 1815 07da 80B5     		push	{r7, lr}
 1816              		.cfi_def_cfa_offset 8
 1817              		.cfi_offset 7, -8
 1818              		.cfi_offset 14, -4
 1819 07dc 82B0     		sub	sp, sp, #8
 1820              		.cfi_def_cfa_offset 16
 1821 07de 00AF     		add	r7, sp, #0
 1822              		.cfi_def_cfa_register 7
 1823 07e0 0200     		movs	r2, r0
 1824 07e2 FB1D     		adds	r3, r7, #7
 1825 07e4 1A70     		strb	r2, [r3]
 1826 07e6 BB1D     		adds	r3, r7, #6
 1827 07e8 0A1C     		adds	r2, r1, #0
 1828 07ea 1A70     		strb	r2, [r3]
 381:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	GPIO_E->odrHigh = value;
 1829              		.loc 1 381 0
 1830 07ec 154A     		ldr	r2, .L109
 1831 07ee FB1D     		adds	r3, r7, #7
 1832 07f0 1B78     		ldrb	r3, [r3]
 1833 07f2 5375     		strb	r3, [r2, #21]
 382:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	select_controller(controller);
 1834              		.loc 1 382 0
 1835 07f4 BB1D     		adds	r3, r7, #6
 1836 07f6 1B78     		ldrb	r3, [r3]
 1837 07f8 1800     		movs	r0, r3
 1838 07fa FFF7FEFF 		bl	select_controller
 383:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_500ns();
 1839              		.loc 1 383 0
 1840 07fe FFF7FEFF 		bl	delay_500ns
 384:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_set(B_E);
 1841              		.loc 1 384 0
 1842 0802 4020     		movs	r0, #64
 1843 0804 FFF7FEFF 		bl	graphic_ctrl_bit_set
 385:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	delay_500ns();
 1844              		.loc 1 385 0
 1845 0808 FFF7FEFF 		bl	delay_500ns
 386:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear( B_E );
 1846              		.loc 1 386 0
 1847 080c 4020     		movs	r0, #64
 1848 080e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 387:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if(controller & B_CS1) {
 1849              		.loc 1 387 0
 1850 0812 BB1D     		adds	r3, r7, #6
 1851 0814 1B78     		ldrb	r3, [r3]
 1852 0816 0822     		movs	r2, #8
 1853 0818 1340     		ands	r3, r2
 1854 081a 04D0     		beq	.L106
 388:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		select_controller( B_CS1);
 1855              		.loc 1 388 0
 1856 081c 0820     		movs	r0, #8
 1857 081e FFF7FEFF 		bl	select_controller
 389:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		graphic_wait_ready();
 1858              		.loc 1 389 0
 1859 0822 FFF748FF 		bl	graphic_wait_ready
 1860              	.L106:
 390:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 391:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if(controller & B_CS2) {
 1861              		.loc 1 391 0
 1862 0826 BB1D     		adds	r3, r7, #6
 1863 0828 1B78     		ldrb	r3, [r3]
 1864 082a 1022     		movs	r2, #16
 1865 082c 1340     		ands	r3, r2
 1866 082e 04D0     		beq	.L108
 392:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		select_controller( B_CS2);
 1867              		.loc 1 392 0
 1868 0830 1020     		movs	r0, #16
 1869 0832 FFF7FEFF 		bl	select_controller
 393:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		graphic_wait_ready();
 1870              		.loc 1 393 0
 1871 0836 FFF73EFF 		bl	graphic_wait_ready
 1872              	.L108:
 394:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 395:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1873              		.loc 1 395 0
 1874 083a C046     		nop
 1875 083c BD46     		mov	sp, r7
 1876 083e 02B0     		add	sp, sp, #8
 1877              		@ sp needed
 1878 0840 80BD     		pop	{r7, pc}
 1879              	.L110:
 1880 0842 C046     		.align	2
 1881              	.L109:
 1882 0844 00100240 		.word	1073876992
 1883              		.cfi_endproc
 1884              	.LFE26:
 1886              		.align	1
 1887              		.syntax unified
 1888              		.code	16
 1889              		.thumb_func
 1890              		.fpu softvfp
 1892              	graphic_write_command:
 1893              	.LFB27:
 396:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 397:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** static void graphic_write_command(uint8_t command, uint8_t controller)
 398:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1894              		.loc 1 398 0
 1895              		.cfi_startproc
 1896              		@ args = 0, pretend = 0, frame = 8
 1897              		@ frame_needed = 1, uses_anonymous_args = 0
 1898 0848 80B5     		push	{r7, lr}
 1899              		.cfi_def_cfa_offset 8
 1900              		.cfi_offset 7, -8
 1901              		.cfi_offset 14, -4
 1902 084a 82B0     		sub	sp, sp, #8
 1903              		.cfi_def_cfa_offset 16
 1904 084c 00AF     		add	r7, sp, #0
 1905              		.cfi_def_cfa_register 7
 1906 084e 0200     		movs	r2, r0
 1907 0850 FB1D     		adds	r3, r7, #7
 1908 0852 1A70     		strb	r2, [r3]
 1909 0854 BB1D     		adds	r3, r7, #6
 1910 0856 0A1C     		adds	r2, r1, #0
 1911 0858 1A70     		strb	r2, [r3]
 399:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1912              		.loc 1 399 0
 1913 085a 4020     		movs	r0, #64
 1914 085c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 400:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	select_controller(controller);
 1915              		.loc 1 400 0
 1916 0860 BB1D     		adds	r3, r7, #6
 1917 0862 1B78     		ldrb	r3, [r3]
 1918 0864 1800     		movs	r0, r3
 1919 0866 FFF7FEFF 		bl	select_controller
 401:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_RS|B_RW);
 1920              		.loc 1 401 0
 1921 086a 0320     		movs	r0, #3
 1922 086c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 402:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_write(command, controller);
 1923              		.loc 1 402 0
 1924 0870 BB1D     		adds	r3, r7, #6
 1925 0872 1A78     		ldrb	r2, [r3]
 1926 0874 FB1D     		adds	r3, r7, #7
 1927 0876 1B78     		ldrb	r3, [r3]
 1928 0878 1100     		movs	r1, r2
 1929 087a 1800     		movs	r0, r3
 1930 087c FFF7ADFF 		bl	graphic_write
 403:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1931              		.loc 1 403 0
 1932 0880 C046     		nop
 1933 0882 BD46     		mov	sp, r7
 1934 0884 02B0     		add	sp, sp, #8
 1935              		@ sp needed
 1936 0886 80BD     		pop	{r7, pc}
 1937              		.cfi_endproc
 1938              	.LFE27:
 1940              		.align	1
 1941              		.syntax unified
 1942              		.code	16
 1943              		.thumb_func
 1944              		.fpu softvfp
 1946              	graphic_write_data:
 1947              	.LFB28:
 404:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 405:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** static void graphic_write_data(uint8_t data, uint8_t controller)
 406:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** {
 1948              		.loc 1 406 0
 1949              		.cfi_startproc
 1950              		@ args = 0, pretend = 0, frame = 8
 1951              		@ frame_needed = 1, uses_anonymous_args = 0
 1952 0888 80B5     		push	{r7, lr}
 1953              		.cfi_def_cfa_offset 8
 1954              		.cfi_offset 7, -8
 1955              		.cfi_offset 14, -4
 1956 088a 82B0     		sub	sp, sp, #8
 1957              		.cfi_def_cfa_offset 16
 1958 088c 00AF     		add	r7, sp, #0
 1959              		.cfi_def_cfa_register 7
 1960 088e 0200     		movs	r2, r0
 1961 0890 FB1D     		adds	r3, r7, #7
 1962 0892 1A70     		strb	r2, [r3]
 1963 0894 BB1D     		adds	r3, r7, #6
 1964 0896 0A1C     		adds	r2, r1, #0
 1965 0898 1A70     		strb	r2, [r3]
 407:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1966              		.loc 1 407 0
 1967 089a 4020     		movs	r0, #64
 1968 089c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 408:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	select_controller(controller);
 1969              		.loc 1 408 0
 1970 08a0 BB1D     		adds	r3, r7, #6
 1971 08a2 1B78     		ldrb	r3, [r3]
 1972 08a4 1800     		movs	r0, r3
 1973 08a6 FFF7FEFF 		bl	select_controller
 409:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_set(B_RS);
 1974              		.loc 1 409 0
 1975 08aa 0120     		movs	r0, #1
 1976 08ac FFF7FEFF 		bl	graphic_ctrl_bit_set
 410:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_ctrl_bit_clear(B_RW);
 1977              		.loc 1 410 0
 1978 08b0 0220     		movs	r0, #2
 1979 08b2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 411:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	graphic_write(data, controller);
 1980              		.loc 1 411 0
 1981 08b6 BB1D     		adds	r3, r7, #6
 1982 08b8 1A78     		ldrb	r2, [r3]
 1983 08ba FB1D     		adds	r3, r7, #7
 1984 08bc 1B78     		ldrb	r3, [r3]
 1985 08be 1100     		movs	r1, r2
 1986 08c0 1800     		movs	r0, r3
 1987 08c2 FFF78AFF 		bl	graphic_write
 412:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 1988              		.loc 1 412 0
 1989 08c6 C046     		nop
 1990 08c8 BD46     		mov	sp, r7
 1991 08ca 02B0     		add	sp, sp, #8
 1992              		@ sp needed
 1993 08cc 80BD     		pop	{r7, pc}
 1994              		.cfi_endproc
 1995              	.LFE28:
 1997              		.align	1
 1998              		.global	graphic_clear_screen
 1999              		.syntax unified
 2000              		.code	16
 2001              		.thumb_func
 2002              		.fpu softvfp
 2004              	graphic_clear_screen:
 2005              	.LFB29:
 413:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 414:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void graphic_clear_screen(void) {
 2006              		.loc 1 414 0
 2007              		.cfi_startproc
 2008              		@ args = 0, pretend = 0, frame = 8
 2009              		@ frame_needed = 1, uses_anonymous_args = 0
 2010 08ce 80B5     		push	{r7, lr}
 2011              		.cfi_def_cfa_offset 8
 2012              		.cfi_offset 7, -8
 2013              		.cfi_offset 14, -4
 2014 08d0 82B0     		sub	sp, sp, #8
 2015              		.cfi_def_cfa_offset 16
 2016 08d2 00AF     		add	r7, sp, #0
 2017              		.cfi_def_cfa_register 7
 415:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	uint8_t i, j;
 416:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	for(j = 0; j < 8; j++) {
 2018              		.loc 1 416 0
 2019 08d4 BB1D     		adds	r3, r7, #6
 2020 08d6 0022     		movs	r2, #0
 2021 08d8 1A70     		strb	r2, [r3]
 2022 08da 23E0     		b	.L114
 2023              	.L117:
 417:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 2024              		.loc 1 417 0
 2025 08dc BB1D     		adds	r3, r7, #6
 2026 08de 1B78     		ldrb	r3, [r3]
 2027 08e0 4822     		movs	r2, #72
 2028 08e2 5242     		rsbs	r2, r2, #0
 2029 08e4 1343     		orrs	r3, r2
 2030 08e6 DBB2     		uxtb	r3, r3
 2031 08e8 1821     		movs	r1, #24
 2032 08ea 1800     		movs	r0, r3
 2033 08ec FFF7ACFF 		bl	graphic_write_command
 418:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 2034              		.loc 1 418 0
 2035 08f0 1821     		movs	r1, #24
 2036 08f2 4020     		movs	r0, #64
 2037 08f4 FFF7A8FF 		bl	graphic_write_command
 419:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		for(i = 0; i <= 63; i++){
 2038              		.loc 1 419 0
 2039 08f8 FB1D     		adds	r3, r7, #7
 2040 08fa 0022     		movs	r2, #0
 2041 08fc 1A70     		strb	r2, [r3]
 2042 08fe 08E0     		b	.L115
 2043              	.L116:
 420:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 2044              		.loc 1 420 0 discriminator 3
 2045 0900 1821     		movs	r1, #24
 2046 0902 0020     		movs	r0, #0
 2047 0904 FFF7C0FF 		bl	graphic_write_data
 419:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		for(i = 0; i <= 63; i++){
 2048              		.loc 1 419 0 discriminator 3
 2049 0908 FB1D     		adds	r3, r7, #7
 2050 090a 1A78     		ldrb	r2, [r3]
 2051 090c FB1D     		adds	r3, r7, #7
 2052 090e 0132     		adds	r2, r2, #1
 2053 0910 1A70     		strb	r2, [r3]
 2054              	.L115:
 419:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		for(i = 0; i <= 63; i++){
 2055              		.loc 1 419 0 is_stmt 0 discriminator 1
 2056 0912 FB1D     		adds	r3, r7, #7
 2057 0914 1B78     		ldrb	r3, [r3]
 2058 0916 3F2B     		cmp	r3, #63
 2059 0918 F2D9     		bls	.L116
 416:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 2060              		.loc 1 416 0 is_stmt 1 discriminator 2
 2061 091a BB1D     		adds	r3, r7, #6
 2062 091c 1A78     		ldrb	r2, [r3]
 2063 091e BB1D     		adds	r3, r7, #6
 2064 0920 0132     		adds	r2, r2, #1
 2065 0922 1A70     		strb	r2, [r3]
 2066              	.L114:
 416:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 2067              		.loc 1 416 0 is_stmt 0 discriminator 1
 2068 0924 BB1D     		adds	r3, r7, #6
 2069 0926 1B78     		ldrb	r3, [r3]
 2070 0928 072B     		cmp	r3, #7
 2071 092a D7D9     		bls	.L117
 421:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		}
 422:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 423:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 2072              		.loc 1 423 0 is_stmt 1
 2073 092c C046     		nop
 2074 092e BD46     		mov	sp, r7
 2075 0930 02B0     		add	sp, sp, #8
 2076              		@ sp needed
 2077 0932 80BD     		pop	{r7, pc}
 2078              		.cfi_endproc
 2079              	.LFE29:
 2081              		.comm	backBuffer,1024,4
 2082              		.align	1
 2083              		.global	pixel
 2084              		.syntax unified
 2085              		.code	16
 2086              		.thumb_func
 2087              		.fpu softvfp
 2089              	pixel:
 2090              	.LFB30:
 424:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 425:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** uint8_t backBuffer[1024]; // 128 * 64 / 8
 426:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 427:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void pixel(int x, int y) {
 2091              		.loc 1 427 0
 2092              		.cfi_startproc
 2093              		@ args = 0, pretend = 0, frame = 16
 2094              		@ frame_needed = 1, uses_anonymous_args = 0
 2095 0934 80B5     		push	{r7, lr}
 2096              		.cfi_def_cfa_offset 8
 2097              		.cfi_offset 7, -8
 2098              		.cfi_offset 14, -4
 2099 0936 84B0     		sub	sp, sp, #16
 2100              		.cfi_def_cfa_offset 24
 2101 0938 00AF     		add	r7, sp, #0
 2102              		.cfi_def_cfa_register 7
 2103 093a 7860     		str	r0, [r7, #4]
 2104 093c 3960     		str	r1, [r7]
 428:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	uint8_t mask;
 429:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	int index = 0;
 2105              		.loc 1 429 0
 2106 093e 0023     		movs	r3, #0
 2107 0940 FB60     		str	r3, [r7, #12]
 430:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if( (x > 128 ) || (x < 1) || (y > 64) || (y < 1) ) return;
 2108              		.loc 1 430 0
 2109 0942 7B68     		ldr	r3, [r7, #4]
 2110 0944 802B     		cmp	r3, #128
 2111 0946 3DDC     		bgt	.L125
 2112              		.loc 1 430 0 is_stmt 0 discriminator 1
 2113 0948 7B68     		ldr	r3, [r7, #4]
 2114 094a 002B     		cmp	r3, #0
 2115 094c 3ADD     		ble	.L125
 2116              		.loc 1 430 0 discriminator 2
 2117 094e 3B68     		ldr	r3, [r7]
 2118 0950 402B     		cmp	r3, #64
 2119 0952 37DC     		bgt	.L125
 2120              		.loc 1 430 0 discriminator 3
 2121 0954 3B68     		ldr	r3, [r7]
 2122 0956 002B     		cmp	r3, #0
 2123 0958 34DD     		ble	.L125
 431:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	mask = 1 << ((y-1)%8);
 2124              		.loc 1 431 0 is_stmt 1
 2125 095a 3B68     		ldr	r3, [r7]
 2126 095c 013B     		subs	r3, r3, #1
 2127 095e 1B4A     		ldr	r2, .L126
 2128 0960 1340     		ands	r3, r2
 2129 0962 04D5     		bpl	.L122
 2130 0964 013B     		subs	r3, r3, #1
 2131 0966 0822     		movs	r2, #8
 2132 0968 5242     		rsbs	r2, r2, #0
 2133 096a 1343     		orrs	r3, r2
 2134 096c 0133     		adds	r3, r3, #1
 2135              	.L122:
 2136 096e 1A00     		movs	r2, r3
 2137 0970 0123     		movs	r3, #1
 2138 0972 9340     		lsls	r3, r3, r2
 2139 0974 1A00     		movs	r2, r3
 2140 0976 0B23     		movs	r3, #11
 2141 0978 FB18     		adds	r3, r7, r3
 2142 097a 1A70     		strb	r2, [r3]
 432:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	if(x > 64) {
 2143              		.loc 1 432 0
 2144 097c 7B68     		ldr	r3, [r7, #4]
 2145 097e 402B     		cmp	r3, #64
 2146 0980 05DD     		ble	.L123
 433:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		x -= 65;
 2147              		.loc 1 433 0
 2148 0982 7B68     		ldr	r3, [r7, #4]
 2149 0984 413B     		subs	r3, r3, #65
 2150 0986 7B60     		str	r3, [r7, #4]
 434:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		index = 512;
 2151              		.loc 1 434 0
 2152 0988 8023     		movs	r3, #128
 2153 098a 9B00     		lsls	r3, r3, #2
 2154 098c FB60     		str	r3, [r7, #12]
 2155              	.L123:
 435:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 436:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	index += x + ((y-1)/8)*64;
 2156              		.loc 1 436 0
 2157 098e 3B68     		ldr	r3, [r7]
 2158 0990 013B     		subs	r3, r3, #1
 2159 0992 002B     		cmp	r3, #0
 2160 0994 00DA     		bge	.L124
 2161 0996 0733     		adds	r3, r3, #7
 2162              	.L124:
 2163 0998 DB10     		asrs	r3, r3, #3
 2164 099a 9A01     		lsls	r2, r3, #6
 2165 099c 7B68     		ldr	r3, [r7, #4]
 2166 099e D318     		adds	r3, r2, r3
 2167 09a0 FA68     		ldr	r2, [r7, #12]
 2168 09a2 D318     		adds	r3, r2, r3
 2169 09a4 FB60     		str	r3, [r7, #12]
 437:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	backBuffer[index] |= mask;
 2170              		.loc 1 437 0
 2171 09a6 0A4A     		ldr	r2, .L126+4
 2172 09a8 FB68     		ldr	r3, [r7, #12]
 2173 09aa D318     		adds	r3, r2, r3
 2174 09ac 1A78     		ldrb	r2, [r3]
 2175 09ae 0B23     		movs	r3, #11
 2176 09b0 FB18     		adds	r3, r7, r3
 2177 09b2 1B78     		ldrb	r3, [r3]
 2178 09b4 1343     		orrs	r3, r2
 2179 09b6 D9B2     		uxtb	r1, r3
 2180 09b8 054A     		ldr	r2, .L126+4
 2181 09ba FB68     		ldr	r3, [r7, #12]
 2182 09bc D318     		adds	r3, r2, r3
 2183 09be 0A1C     		adds	r2, r1, #0
 2184 09c0 1A70     		strb	r2, [r3]
 2185 09c2 00E0     		b	.L118
 2186              	.L125:
 430:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	mask = 1 << ((y-1)%8);
 2187              		.loc 1 430 0
 2188 09c4 C046     		nop
 2189              	.L118:
 438:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 2190              		.loc 1 438 0
 2191 09c6 BD46     		mov	sp, r7
 2192 09c8 04B0     		add	sp, sp, #16
 2193              		@ sp needed
 2194 09ca 80BD     		pop	{r7, pc}
 2195              	.L127:
 2196              		.align	2
 2197              	.L126:
 2198 09cc 07000080 		.word	-2147483641
 2199 09d0 00000000 		.word	backBuffer
 2200              		.cfi_endproc
 2201              	.LFE30:
 2203              		.align	1
 2204              		.global	clear_backBuffer
 2205              		.syntax unified
 2206              		.code	16
 2207              		.thumb_func
 2208              		.fpu softvfp
 2210              	clear_backBuffer:
 2211              	.LFB31:
 439:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 440:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void clear_backBuffer() {
 2212              		.loc 1 440 0
 2213              		.cfi_startproc
 2214              		@ args = 0, pretend = 0, frame = 8
 2215              		@ frame_needed = 1, uses_anonymous_args = 0
 2216 09d4 80B5     		push	{r7, lr}
 2217              		.cfi_def_cfa_offset 8
 2218              		.cfi_offset 7, -8
 2219              		.cfi_offset 14, -4
 2220 09d6 82B0     		sub	sp, sp, #8
 2221              		.cfi_def_cfa_offset 16
 2222 09d8 00AF     		add	r7, sp, #0
 2223              		.cfi_def_cfa_register 7
 441:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	int i;
 442:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	for (i = 0; i < 1024; i++)
 2224              		.loc 1 442 0
 2225 09da 0023     		movs	r3, #0
 2226 09dc 7B60     		str	r3, [r7, #4]
 2227 09de 07E0     		b	.L129
 2228              	.L130:
 443:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	backBuffer[i] = 0;
 2229              		.loc 1 443 0 discriminator 3
 2230 09e0 074A     		ldr	r2, .L131
 2231 09e2 7B68     		ldr	r3, [r7, #4]
 2232 09e4 D318     		adds	r3, r2, r3
 2233 09e6 0022     		movs	r2, #0
 2234 09e8 1A70     		strb	r2, [r3]
 442:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	backBuffer[i] = 0;
 2235              		.loc 1 442 0 discriminator 3
 2236 09ea 7B68     		ldr	r3, [r7, #4]
 2237 09ec 0133     		adds	r3, r3, #1
 2238 09ee 7B60     		str	r3, [r7, #4]
 2239              	.L129:
 442:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	backBuffer[i] = 0;
 2240              		.loc 1 442 0 is_stmt 0 discriminator 1
 2241 09f0 7B68     		ldr	r3, [r7, #4]
 2242 09f2 044A     		ldr	r2, .L131+4
 2243 09f4 9342     		cmp	r3, r2
 2244 09f6 F3DD     		ble	.L130
 444:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 2245              		.loc 1 444 0 is_stmt 1
 2246 09f8 C046     		nop
 2247 09fa BD46     		mov	sp, r7
 2248 09fc 02B0     		add	sp, sp, #8
 2249              		@ sp needed
 2250 09fe 80BD     		pop	{r7, pc}
 2251              	.L132:
 2252              		.align	2
 2253              	.L131:
 2254 0a00 00000000 		.word	backBuffer
 2255 0a04 FF030000 		.word	1023
 2256              		.cfi_endproc
 2257              	.LFE31:
 2259              		.align	1
 2260              		.global	graphic_draw_screen
 2261              		.syntax unified
 2262              		.code	16
 2263              		.thumb_func
 2264              		.fpu softvfp
 2266              	graphic_draw_screen:
 2267              	.LFB32:
 445:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 
 446:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** void graphic_draw_screen(void) {
 2268              		.loc 1 446 0
 2269              		.cfi_startproc
 2270              		@ args = 0, pretend = 0, frame = 16
 2271              		@ frame_needed = 1, uses_anonymous_args = 0
 2272 0a08 80B5     		push	{r7, lr}
 2273              		.cfi_def_cfa_offset 8
 2274              		.cfi_offset 7, -8
 2275              		.cfi_offset 14, -4
 2276 0a0a 84B0     		sub	sp, sp, #16
 2277              		.cfi_def_cfa_offset 24
 2278 0a0c 00AF     		add	r7, sp, #0
 2279              		.cfi_def_cfa_register 7
 447:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	uint8_t i, j, controller, c;
 448:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	unsigned int k = 0;
 2280              		.loc 1 448 0
 2281 0a0e 0023     		movs	r3, #0
 2282 0a10 BB60     		str	r3, [r7, #8]
 449:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	for(c = 0; c < 2; c++) {
 2283              		.loc 1 449 0
 2284 0a12 0D23     		movs	r3, #13
 2285 0a14 FB18     		adds	r3, r7, r3
 2286 0a16 0022     		movs	r2, #0
 2287 0a18 1A70     		strb	r2, [r3]
 2288 0a1a 52E0     		b	.L134
 2289              	.L141:
 450:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		controller = (c == 0) ? B_CS1 : B_CS2;
 2290              		.loc 1 450 0
 2291 0a1c 0D23     		movs	r3, #13
 2292 0a1e FB18     		adds	r3, r7, r3
 2293 0a20 1B78     		ldrb	r3, [r3]
 2294 0a22 002B     		cmp	r3, #0
 2295 0a24 01D1     		bne	.L135
 2296              		.loc 1 450 0 is_stmt 0 discriminator 1
 2297 0a26 0822     		movs	r2, #8
 2298 0a28 00E0     		b	.L136
 2299              	.L135:
 2300              		.loc 1 450 0 discriminator 2
 2301 0a2a 1022     		movs	r2, #16
 2302              	.L136:
 2303              		.loc 1 450 0 discriminator 4
 2304 0a2c FB1D     		adds	r3, r7, #7
 2305 0a2e 1A70     		strb	r2, [r3]
 451:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		for(j = 0; j < 8; j++) {
 2306              		.loc 1 451 0 is_stmt 1 discriminator 4
 2307 0a30 0E23     		movs	r3, #14
 2308 0a32 FB18     		adds	r3, r7, r3
 2309 0a34 0022     		movs	r2, #0
 2310 0a36 1A70     		strb	r2, [r3]
 2311 0a38 37E0     		b	.L137
 2312              	.L140:
 452:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_write_command(LCD_SET_PAGE | j, controller);
 2313              		.loc 1 452 0
 2314 0a3a 0E23     		movs	r3, #14
 2315 0a3c FB18     		adds	r3, r7, r3
 2316 0a3e 1B78     		ldrb	r3, [r3]
 2317 0a40 4822     		movs	r2, #72
 2318 0a42 5242     		rsbs	r2, r2, #0
 2319 0a44 1343     		orrs	r3, r2
 2320 0a46 DAB2     		uxtb	r2, r3
 2321 0a48 FB1D     		adds	r3, r7, #7
 2322 0a4a 1B78     		ldrb	r3, [r3]
 2323 0a4c 1900     		movs	r1, r3
 2324 0a4e 1000     		movs	r0, r2
 2325 0a50 FFF7FAFE 		bl	graphic_write_command
 453:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_write_command(LCD_SET_ADD | 0, controller);
 2326              		.loc 1 453 0
 2327 0a54 FB1D     		adds	r3, r7, #7
 2328 0a56 1B78     		ldrb	r3, [r3]
 2329 0a58 1900     		movs	r1, r3
 2330 0a5a 4020     		movs	r0, #64
 2331 0a5c FFF7F4FE 		bl	graphic_write_command
 454:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			for(i = 0; i <= 63; i++, k++) {
 2332              		.loc 1 454 0
 2333 0a60 0F23     		movs	r3, #15
 2334 0a62 FB18     		adds	r3, r7, r3
 2335 0a64 0022     		movs	r2, #0
 2336 0a66 1A70     		strb	r2, [r3]
 2337 0a68 13E0     		b	.L138
 2338              	.L139:
 455:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 				graphic_write_data(backBuffer[k], controller);
 2339              		.loc 1 455 0 discriminator 3
 2340 0a6a 1A4A     		ldr	r2, .L142
 2341 0a6c BB68     		ldr	r3, [r7, #8]
 2342 0a6e D318     		adds	r3, r2, r3
 2343 0a70 1A78     		ldrb	r2, [r3]
 2344 0a72 FB1D     		adds	r3, r7, #7
 2345 0a74 1B78     		ldrb	r3, [r3]
 2346 0a76 1900     		movs	r1, r3
 2347 0a78 1000     		movs	r0, r2
 2348 0a7a FFF705FF 		bl	graphic_write_data
 454:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			for(i = 0; i <= 63; i++, k++) {
 2349              		.loc 1 454 0 discriminator 3
 2350 0a7e 0F23     		movs	r3, #15
 2351 0a80 FB18     		adds	r3, r7, r3
 2352 0a82 1A78     		ldrb	r2, [r3]
 2353 0a84 0F23     		movs	r3, #15
 2354 0a86 FB18     		adds	r3, r7, r3
 2355 0a88 0132     		adds	r2, r2, #1
 2356 0a8a 1A70     		strb	r2, [r3]
 2357 0a8c BB68     		ldr	r3, [r7, #8]
 2358 0a8e 0133     		adds	r3, r3, #1
 2359 0a90 BB60     		str	r3, [r7, #8]
 2360              	.L138:
 454:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			for(i = 0; i <= 63; i++, k++) {
 2361              		.loc 1 454 0 is_stmt 0 discriminator 1
 2362 0a92 0F23     		movs	r3, #15
 2363 0a94 FB18     		adds	r3, r7, r3
 2364 0a96 1B78     		ldrb	r3, [r3]
 2365 0a98 3F2B     		cmp	r3, #63
 2366 0a9a E6D9     		bls	.L139
 451:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_write_command(LCD_SET_PAGE | j, controller);
 2367              		.loc 1 451 0 is_stmt 1 discriminator 2
 2368 0a9c 0E23     		movs	r3, #14
 2369 0a9e FB18     		adds	r3, r7, r3
 2370 0aa0 1A78     		ldrb	r2, [r3]
 2371 0aa2 0E23     		movs	r3, #14
 2372 0aa4 FB18     		adds	r3, r7, r3
 2373 0aa6 0132     		adds	r2, r2, #1
 2374 0aa8 1A70     		strb	r2, [r3]
 2375              	.L137:
 451:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			graphic_write_command(LCD_SET_PAGE | j, controller);
 2376              		.loc 1 451 0 is_stmt 0 discriminator 1
 2377 0aaa 0E23     		movs	r3, #14
 2378 0aac FB18     		adds	r3, r7, r3
 2379 0aae 1B78     		ldrb	r3, [r3]
 2380 0ab0 072B     		cmp	r3, #7
 2381 0ab2 C2D9     		bls	.L140
 449:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		controller = (c == 0) ? B_CS1 : B_CS2;
 2382              		.loc 1 449 0 is_stmt 1 discriminator 2
 2383 0ab4 0D23     		movs	r3, #13
 2384 0ab6 FB18     		adds	r3, r7, r3
 2385 0ab8 1A78     		ldrb	r2, [r3]
 2386 0aba 0D23     		movs	r3, #13
 2387 0abc FB18     		adds	r3, r7, r3
 2388 0abe 0132     		adds	r2, r2, #1
 2389 0ac0 1A70     		strb	r2, [r3]
 2390              	.L134:
 449:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		controller = (c == 0) ? B_CS1 : B_CS2;
 2391              		.loc 1 449 0 is_stmt 0 discriminator 1
 2392 0ac2 0D23     		movs	r3, #13
 2393 0ac4 FB18     		adds	r3, r7, r3
 2394 0ac6 1B78     		ldrb	r3, [r3]
 2395 0ac8 012B     		cmp	r3, #1
 2396 0aca A7D9     		bls	.L141
 456:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 			}
 457:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 		}
 458:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** 	}
 459:/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c **** }
 2397              		.loc 1 459 0 is_stmt 1
 2398 0acc C046     		nop
 2399 0ace BD46     		mov	sp, r7
 2400 0ad0 04B0     		add	sp, sp, #16
 2401              		@ sp needed
 2402 0ad2 80BD     		pop	{r7, pc}
 2403              	.L143:
 2404              		.align	2
 2405              	.L142:
 2406 0ad4 00000000 		.word	backBuffer
 2407              		.cfi_endproc
 2408              	.LFE32:
 2410              	.Letext0:
 2411              		.file 2 "/Users/antonlevholm/Downloads/gcc-arm-none-eabi-6-2017-q1-update/arm-none-eabi/include/ma
 2412              		.file 3 "/Users/antonlevholm/Downloads/gcc-arm-none-eabi-6-2017-q1-update/arm-none-eabi/include/sy
 2413              		.file 4 "/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.h"
