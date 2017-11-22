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
  24              		.file 1 "E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay/gpio.c"
   1:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** #include "gpio.h"
   2:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** #include "sys_delay.h"
   3:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** #include <stdint.h>
   4:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
   5:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void setup_for_keypad(GPIO* _gpio) {
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
   6:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt pinnar 15-12 till utportar
   7:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// och pinnar 11-8 till inportar.
   8:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     _gpio->moder &= 0x0000FFFF;
  38              		.loc 1 8 0
  39 0008 7B68     		ldr	r3, [r7, #4]
  40 000a 1B68     		ldr	r3, [r3]
  41 000c 1B04     		lsls	r3, r3, #16
  42 000e 1A0C     		lsrs	r2, r3, #16
  43 0010 7B68     		ldr	r3, [r7, #4]
  44 0012 1A60     		str	r2, [r3]
   9:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     _gpio->moder |= 0x5500FFFF;
  45              		.loc 1 9 0
  46 0014 7B68     		ldr	r3, [r7, #4]
  47 0016 1B68     		ldr	r3, [r3]
  48 0018 114A     		ldr	r2, .L2
  49 001a 1A43     		orrs	r2, r3
  50 001c 7B68     		ldr	r3, [r7, #4]
  51 001e 1A60     		str	r2, [r3]
  10:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  11:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt pinnar 15-12 till "push-pull"
  12:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// och pinnar 11-8 till "open drain".
  13:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     _gpio->otyper &= 0xFFFF00FF;
  52              		.loc 1 13 0
  53 0020 7B68     		ldr	r3, [r7, #4]
  54 0022 9B88     		ldrh	r3, [r3, #4]
  55 0024 FF22     		movs	r2, #255
  56 0026 1340     		ands	r3, r2
  57 0028 9AB2     		uxth	r2, r3
  58 002a 7B68     		ldr	r3, [r7, #4]
  59 002c 9A80     		strh	r2, [r3, #4]
  14:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     _gpio->otyper |= 0x00000F00;
  60              		.loc 1 14 0
  61 002e 7B68     		ldr	r3, [r7, #4]
  62 0030 9B88     		ldrh	r3, [r3, #4]
  63 0032 F022     		movs	r2, #240
  64 0034 1201     		lsls	r2, r2, #4
  65 0036 1343     		orrs	r3, r2
  66 0038 9AB2     		uxth	r2, r3
  67 003a 7B68     		ldr	r3, [r7, #4]
  68 003c 9A80     		strh	r2, [r3, #4]
  15:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  16:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt pinnar 15-12 till "floating"
  17:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// och pinnar 11-8 till "pull-down"
  18:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     _gpio->pupdr &= 0x0000FFFF;
  69              		.loc 1 18 0
  70 003e 7B68     		ldr	r3, [r7, #4]
  71 0040 DB68     		ldr	r3, [r3, #12]
  72 0042 1B04     		lsls	r3, r3, #16
  73 0044 1A0C     		lsrs	r2, r3, #16
  74 0046 7B68     		ldr	r3, [r7, #4]
  75 0048 DA60     		str	r2, [r3, #12]
  19:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     _gpio->pupdr |= 0x00AA0000;
  76              		.loc 1 19 0
  77 004a 7B68     		ldr	r3, [r7, #4]
  78 004c DB68     		ldr	r3, [r3, #12]
  79 004e AA22     		movs	r2, #170
  80 0050 1204     		lsls	r2, r2, #16
  81 0052 1A43     		orrs	r2, r3
  82 0054 7B68     		ldr	r3, [r7, #4]
  83 0056 DA60     		str	r2, [r3, #12]
  20:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
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
  21:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  22:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void setup_for_seg_disp(GPIO* _gpio) {
 106              		.loc 1 22 0
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
  23:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt pinnar 7-0 till utportar
  24:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	_gpio->moder &= 0xFFFF0000;
 119              		.loc 1 24 0
 120 006c 7B68     		ldr	r3, [r7, #4]
 121 006e 1B68     		ldr	r3, [r3]
 122 0070 1B0C     		lsrs	r3, r3, #16
 123 0072 1A04     		lsls	r2, r3, #16
 124 0074 7B68     		ldr	r3, [r7, #4]
 125 0076 1A60     		str	r2, [r3]
  25:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	_gpio->moder |= 0x00005555;
 126              		.loc 1 25 0
 127 0078 7B68     		ldr	r3, [r7, #4]
 128 007a 1B68     		ldr	r3, [r3]
 129 007c 114A     		ldr	r2, .L5
 130 007e 1A43     		orrs	r2, r3
 131 0080 7B68     		ldr	r3, [r7, #4]
 132 0082 1A60     		str	r2, [r3]
  26:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  27:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt pinnar 7-0 till "push-pull"
  28:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	_gpio->otyper &= 0xFFFFFF00;
 133              		.loc 1 28 0
 134 0084 7B68     		ldr	r3, [r7, #4]
 135 0086 9B88     		ldrh	r3, [r3, #4]
 136 0088 FF22     		movs	r2, #255
 137 008a 9343     		bics	r3, r2
 138 008c 9AB2     		uxth	r2, r3
 139 008e 7B68     		ldr	r3, [r7, #4]
 140 0090 9A80     		strh	r2, [r3, #4]
  29:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	_gpio->otyper |= 0x000000FF;
 141              		.loc 1 29 0
 142 0092 7B68     		ldr	r3, [r7, #4]
 143 0094 9B88     		ldrh	r3, [r3, #4]
 144 0096 FF22     		movs	r2, #255
 145 0098 1343     		orrs	r3, r2
 146 009a 9AB2     		uxth	r2, r3
 147 009c 7B68     		ldr	r3, [r7, #4]
 148 009e 9A80     		strh	r2, [r3, #4]
  30:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  31:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätter pinnar 4-0 till "pull-down"
  32:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	_gpio->pupdr &= 0xFFFFFF00;
 149              		.loc 1 32 0
 150 00a0 7B68     		ldr	r3, [r7, #4]
 151 00a2 DB68     		ldr	r3, [r3, #12]
 152 00a4 FF22     		movs	r2, #255
 153 00a6 9343     		bics	r3, r2
 154 00a8 1A00     		movs	r2, r3
 155 00aa 7B68     		ldr	r3, [r7, #4]
 156 00ac DA60     		str	r2, [r3, #12]
  33:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	_gpio->pupdr |= 0x000000AA;
 157              		.loc 1 33 0
 158 00ae 7B68     		ldr	r3, [r7, #4]
 159 00b0 DB68     		ldr	r3, [r3, #12]
 160 00b2 AA22     		movs	r2, #170
 161 00b4 1A43     		orrs	r2, r3
 162 00b6 7B68     		ldr	r3, [r7, #4]
 163 00b8 DA60     		str	r2, [r3, #12]
  34:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 164              		.loc 1 34 0
 165 00ba C046     		nop
 166 00bc BD46     		mov	sp, r7
 167 00be 02B0     		add	sp, sp, #8
 168              		@ sp needed
 169 00c0 80BD     		pop	{r7, pc}
 170              	.L6:
 171 00c2 C046     		.align	2
 172              	.L5:
 173 00c4 55550000 		.word	21845
 174              		.cfi_endproc
 175              	.LFE1:
 177              		.section	.rodata
 178              		.align	2
 179              	.LC0:
 180 0000 01       		.byte	1
 181 0001 02       		.byte	2
 182 0002 03       		.byte	3
 183 0003 0A       		.byte	10
 184 0004 04       		.byte	4
 185 0005 05       		.byte	5
 186 0006 06       		.byte	6
 187 0007 0B       		.byte	11
 188 0008 07       		.byte	7
 189 0009 08       		.byte	8
 190 000a 09       		.byte	9
 191 000b 0C       		.byte	12
 192 000c 0E       		.byte	14
 193 000d 00       		.byte	0
 194 000e 0F       		.byte	15
 195 000f 0D       		.byte	13
 196              		.text
 197              		.align	1
 198              		.global	keyb
 199              		.syntax unified
 200              		.code	16
 201              		.thumb_func
 202              		.fpu softvfp
 204              	keyb:
 205              	.LFB2:
  35:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  36:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** unsigned char keyb(void) {
 206              		.loc 1 36 0
 207              		.cfi_startproc
 208              		@ args = 0, pretend = 0, frame = 24
 209              		@ frame_needed = 1, uses_anonymous_args = 0
 210 00c8 90B5     		push	{r4, r7, lr}
 211              		.cfi_def_cfa_offset 12
 212              		.cfi_offset 4, -12
 213              		.cfi_offset 7, -8
 214              		.cfi_offset 14, -4
 215 00ca 87B0     		sub	sp, sp, #28
 216              		.cfi_def_cfa_offset 40
 217 00cc 00AF     		add	r7, sp, #0
 218              		.cfi_def_cfa_register 7
  37:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	unsigned char keys[] = {
 219              		.loc 1 37 0
 220 00ce 3B1D     		adds	r3, r7, #4
 221 00d0 1F4A     		ldr	r2, .L13
 222 00d2 13CA     		ldmia	r2!, {r0, r1, r4}
 223 00d4 13C3     		stmia	r3!, {r0, r1, r4}
 224 00d6 1268     		ldr	r2, [r2]
 225 00d8 1A60     		str	r2, [r3]
  38:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		1,  2,  3,  10,
  39:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		4,  5,  6,  11,
  40:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		7,  8,  9,  12,
  41:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		14, 0,  15, 13
  42:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	};
  43:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	unsigned char row, col;
  44:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	for(row = 0; row < 4; row++) {
 226              		.loc 1 44 0
 227 00da 1723     		movs	r3, #23
 228 00dc FB18     		adds	r3, r7, r3
 229 00de 0022     		movs	r2, #0
 230 00e0 1A70     		strb	r2, [r3]
 231 00e2 2AE0     		b	.L8
 232              	.L11:
  45:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		deactivate_rows(GPIO_D);
 233              		.loc 1 45 0
 234 00e4 1B4B     		ldr	r3, .L13+4
 235 00e6 1800     		movs	r0, r3
 236 00e8 FFF7FEFF 		bl	deactivate_rows
  46:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		activate_row(GPIO_D, row);
 237              		.loc 1 46 0
 238 00ec 1723     		movs	r3, #23
 239 00ee FB18     		adds	r3, r7, r3
 240 00f0 1B78     		ldrb	r3, [r3]
 241 00f2 184A     		ldr	r2, .L13+4
 242 00f4 1900     		movs	r1, r3
 243 00f6 1000     		movs	r0, r2
 244 00f8 FFF7FEFF 		bl	activate_row
  47:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		col = read_col(GPIO_D);
 245              		.loc 1 47 0
 246 00fc 1623     		movs	r3, #22
 247 00fe FC18     		adds	r4, r7, r3
 248 0100 144B     		ldr	r3, .L13+4
 249 0102 1800     		movs	r0, r3
 250 0104 FFF7FEFF 		bl	read_col
 251 0108 0300     		movs	r3, r0
 252 010a 2370     		strb	r3, [r4]
  48:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		if(col != 0xFF) {
 253              		.loc 1 48 0
 254 010c 1623     		movs	r3, #22
 255 010e FB18     		adds	r3, r7, r3
 256 0110 1B78     		ldrb	r3, [r3]
 257 0112 FF2B     		cmp	r3, #255
 258 0114 0AD0     		beq	.L9
  49:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			return keys[ 4 * row + col];
 259              		.loc 1 49 0
 260 0116 1723     		movs	r3, #23
 261 0118 FB18     		adds	r3, r7, r3
 262 011a 1B78     		ldrb	r3, [r3]
 263 011c 9A00     		lsls	r2, r3, #2
 264 011e 1623     		movs	r3, #22
 265 0120 FB18     		adds	r3, r7, r3
 266 0122 1B78     		ldrb	r3, [r3]
 267 0124 D318     		adds	r3, r2, r3
 268 0126 3A1D     		adds	r2, r7, #4
 269 0128 D35C     		ldrb	r3, [r2, r3]
 270 012a 0CE0     		b	.L12
 271              	.L9:
  44:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		deactivate_rows(GPIO_D);
 272              		.loc 1 44 0 discriminator 2
 273 012c 1723     		movs	r3, #23
 274 012e FB18     		adds	r3, r7, r3
 275 0130 1A78     		ldrb	r2, [r3]
 276 0132 1723     		movs	r3, #23
 277 0134 FB18     		adds	r3, r7, r3
 278 0136 0132     		adds	r2, r2, #1
 279 0138 1A70     		strb	r2, [r3]
 280              	.L8:
  44:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		deactivate_rows(GPIO_D);
 281              		.loc 1 44 0 is_stmt 0 discriminator 1
 282 013a 1723     		movs	r3, #23
 283 013c FB18     		adds	r3, r7, r3
 284 013e 1B78     		ldrb	r3, [r3]
 285 0140 032B     		cmp	r3, #3
 286 0142 CFD9     		bls	.L11
  50:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		}
  51:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
  52:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	return 0xFF;
 287              		.loc 1 52 0 is_stmt 1
 288 0144 FF23     		movs	r3, #255
 289              	.L12:
  53:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 290              		.loc 1 53 0 discriminator 1
 291 0146 1800     		movs	r0, r3
 292 0148 BD46     		mov	sp, r7
 293 014a 07B0     		add	sp, sp, #28
 294              		@ sp needed
 295 014c 90BD     		pop	{r4, r7, pc}
 296              	.L14:
 297 014e C046     		.align	2
 298              	.L13:
 299 0150 00000000 		.word	.LC0
 300 0154 000C0240 		.word	1073875968
 301              		.cfi_endproc
 302              	.LFE2:
 304              		.section	.rodata
 305              		.align	2
 306              	.LC1:
 307 0010 3F00     		.short	63
 308 0012 0600     		.short	6
 309 0014 5B00     		.short	91
 310 0016 4F00     		.short	79
 311 0018 6600     		.short	102
 312 001a 6D00     		.short	109
 313 001c 7D00     		.short	125
 314 001e 0700     		.short	7
 315 0020 7F00     		.short	127
 316 0022 6F00     		.short	111
 317 0024 7700     		.short	119
 318 0026 7C00     		.short	124
 319 0028 5800     		.short	88
 320 002a 5E00     		.short	94
 321 002c 8000     		.short	128
 322 002e 7600     		.short	118
 323              		.text
 324              		.align	1
 325              		.global	out7seg
 326              		.syntax unified
 327              		.code	16
 328              		.thumb_func
 329              		.fpu softvfp
 331              	out7seg:
 332              	.LFB3:
  54:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  55:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void out7seg(GPIO* _gpio, unsigned char c) {
 333              		.loc 1 55 0
 334              		.cfi_startproc
 335              		@ args = 0, pretend = 0, frame = 40
 336              		@ frame_needed = 1, uses_anonymous_args = 0
 337 0158 90B5     		push	{r4, r7, lr}
 338              		.cfi_def_cfa_offset 12
 339              		.cfi_offset 4, -12
 340              		.cfi_offset 7, -8
 341              		.cfi_offset 14, -4
 342 015a 8BB0     		sub	sp, sp, #44
 343              		.cfi_def_cfa_offset 56
 344 015c 00AF     		add	r7, sp, #0
 345              		.cfi_def_cfa_register 7
 346 015e 7860     		str	r0, [r7, #4]
 347 0160 0A00     		movs	r2, r1
 348 0162 FB1C     		adds	r3, r7, #3
 349 0164 1A70     		strb	r2, [r3]
  56:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     unsigned short result[] = {
 350              		.loc 1 56 0
 351 0166 0823     		movs	r3, #8
 352 0168 FB18     		adds	r3, r7, r3
 353 016a 0E4A     		ldr	r2, .L19
 354 016c 13CA     		ldmia	r2!, {r0, r1, r4}
 355 016e 13C3     		stmia	r3!, {r0, r1, r4}
 356 0170 13CA     		ldmia	r2!, {r0, r1, r4}
 357 0172 13C3     		stmia	r3!, {r0, r1, r4}
 358 0174 03CA     		ldmia	r2!, {r0, r1}
 359 0176 03C3     		stmia	r3!, {r0, r1}
  57:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x3F, // 0
  58:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x06, // 1
  59:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x5B, // 2
  60:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x4F, // 3
  61:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x66, // 4
  62:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x6D, // 5
  63:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x7D, // 6
  64:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x07, // 7
  65:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x7F, // 8
  66:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x6F, // 9
  67:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x77, // A
  68:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x7C, // B
  69:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x58, // C
  70:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x5E, // D
  71:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x80, // E
  72:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		0x76  // F
  73:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	};
  74:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  75:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     if(c > 0xF) {
 360              		.loc 1 75 0
 361 0178 FB1C     		adds	r3, r7, #3
 362 017a 1B78     		ldrb	r3, [r3]
 363 017c 0F2B     		cmp	r3, #15
 364 017e 03D9     		bls	.L16
  76:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		_gpio->odrLow = 0x00;
 365              		.loc 1 76 0
 366 0180 7B68     		ldr	r3, [r7, #4]
 367 0182 0022     		movs	r2, #0
 368 0184 1A75     		strb	r2, [r3, #20]
  77:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     } else {
  78:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		_gpio->odrLow = result[c];
  79:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     }
  80:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 369              		.loc 1 80 0
 370 0186 08E0     		b	.L18
 371              	.L16:
  78:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c ****     }
 372              		.loc 1 78 0
 373 0188 FB1C     		adds	r3, r7, #3
 374 018a 1A78     		ldrb	r2, [r3]
 375 018c 0823     		movs	r3, #8
 376 018e FB18     		adds	r3, r7, r3
 377 0190 5200     		lsls	r2, r2, #1
 378 0192 D35A     		ldrh	r3, [r2, r3]
 379 0194 DAB2     		uxtb	r2, r3
 380 0196 7B68     		ldr	r3, [r7, #4]
 381 0198 1A75     		strb	r2, [r3, #20]
 382              	.L18:
 383              		.loc 1 80 0
 384 019a C046     		nop
 385 019c BD46     		mov	sp, r7
 386 019e 0BB0     		add	sp, sp, #44
 387              		@ sp needed
 388 01a0 90BD     		pop	{r4, r7, pc}
 389              	.L20:
 390 01a2 C046     		.align	2
 391              	.L19:
 392 01a4 10000000 		.word	.LC1
 393              		.cfi_endproc
 394              	.LFE3:
 396              		.align	1
 397              		.global	activate_row
 398              		.syntax unified
 399              		.code	16
 400              		.thumb_func
 401              		.fpu softvfp
 403              	activate_row:
 404              	.LFB4:
  81:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  82:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void activate_row(GPIO* _gpio, unsigned char row) {
 405              		.loc 1 82 0
 406              		.cfi_startproc
 407              		@ args = 0, pretend = 0, frame = 8
 408              		@ frame_needed = 1, uses_anonymous_args = 0
 409 01a8 80B5     		push	{r7, lr}
 410              		.cfi_def_cfa_offset 8
 411              		.cfi_offset 7, -8
 412              		.cfi_offset 14, -4
 413 01aa 82B0     		sub	sp, sp, #8
 414              		.cfi_def_cfa_offset 16
 415 01ac 00AF     		add	r7, sp, #0
 416              		.cfi_def_cfa_register 7
 417 01ae 7860     		str	r0, [r7, #4]
 418 01b0 0A00     		movs	r2, r1
 419 01b2 FB1C     		adds	r3, r7, #3
 420 01b4 1A70     		strb	r2, [r3]
  83:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	switch(row){
 421              		.loc 1 83 0
 422 01b6 FB1C     		adds	r3, r7, #3
 423 01b8 1B78     		ldrb	r3, [r3]
 424 01ba 012B     		cmp	r3, #1
 425 01bc 0CD0     		beq	.L23
 426 01be 02DC     		bgt	.L24
 427 01c0 002B     		cmp	r3, #0
 428 01c2 05D0     		beq	.L25
  84:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 0: _gpio->odrHigh = 0x10; break;
  85:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 1: _gpio->odrHigh = 0x20; break;
  86:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 2: _gpio->odrHigh = 0x40; break;
  87:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 3: _gpio->odrHigh = 0x80; break;
  88:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
  89:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 429              		.loc 1 89 0
 430 01c4 14E0     		b	.L28
 431              	.L24:
  83:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	switch(row){
 432              		.loc 1 83 0
 433 01c6 022B     		cmp	r3, #2
 434 01c8 0AD0     		beq	.L26
 435 01ca 032B     		cmp	r3, #3
 436 01cc 0CD0     		beq	.L27
 437              		.loc 1 89 0
 438 01ce 0FE0     		b	.L28
 439              	.L25:
  84:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 0: _gpio->odrHigh = 0x10; break;
 440              		.loc 1 84 0
 441 01d0 7B68     		ldr	r3, [r7, #4]
 442 01d2 1022     		movs	r2, #16
 443 01d4 5A75     		strb	r2, [r3, #21]
 444 01d6 0BE0     		b	.L22
 445              	.L23:
  85:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 2: _gpio->odrHigh = 0x40; break;
 446              		.loc 1 85 0
 447 01d8 7B68     		ldr	r3, [r7, #4]
 448 01da 2022     		movs	r2, #32
 449 01dc 5A75     		strb	r2, [r3, #21]
 450 01de 07E0     		b	.L22
 451              	.L26:
  86:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 3: _gpio->odrHigh = 0x80; break;
 452              		.loc 1 86 0
 453 01e0 7B68     		ldr	r3, [r7, #4]
 454 01e2 4022     		movs	r2, #64
 455 01e4 5A75     		strb	r2, [r3, #21]
 456 01e6 03E0     		b	.L22
 457              	.L27:
  87:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 458              		.loc 1 87 0
 459 01e8 7B68     		ldr	r3, [r7, #4]
 460 01ea 8022     		movs	r2, #128
 461 01ec 5A75     		strb	r2, [r3, #21]
 462 01ee C046     		nop
 463              	.L22:
 464              	.L28:
 465              		.loc 1 89 0
 466 01f0 C046     		nop
 467 01f2 BD46     		mov	sp, r7
 468 01f4 02B0     		add	sp, sp, #8
 469              		@ sp needed
 470 01f6 80BD     		pop	{r7, pc}
 471              		.cfi_endproc
 472              	.LFE4:
 474              		.align	1
 475              		.global	deactivate_rows
 476              		.syntax unified
 477              		.code	16
 478              		.thumb_func
 479              		.fpu softvfp
 481              	deactivate_rows:
 482              	.LFB5:
  90:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  91:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void deactivate_rows(GPIO* _gpio) {
 483              		.loc 1 91 0
 484              		.cfi_startproc
 485              		@ args = 0, pretend = 0, frame = 8
 486              		@ frame_needed = 1, uses_anonymous_args = 0
 487 01f8 80B5     		push	{r7, lr}
 488              		.cfi_def_cfa_offset 8
 489              		.cfi_offset 7, -8
 490              		.cfi_offset 14, -4
 491 01fa 82B0     		sub	sp, sp, #8
 492              		.cfi_def_cfa_offset 16
 493 01fc 00AF     		add	r7, sp, #0
 494              		.cfi_def_cfa_register 7
 495 01fe 7860     		str	r0, [r7, #4]
  92:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	_gpio->odrHigh = 0x00;
 496              		.loc 1 92 0
 497 0200 7B68     		ldr	r3, [r7, #4]
 498 0202 0022     		movs	r2, #0
 499 0204 5A75     		strb	r2, [r3, #21]
  93:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 500              		.loc 1 93 0
 501 0206 C046     		nop
 502 0208 BD46     		mov	sp, r7
 503 020a 02B0     		add	sp, sp, #8
 504              		@ sp needed
 505 020c 80BD     		pop	{r7, pc}
 506              		.cfi_endproc
 507              	.LFE5:
 509              		.align	1
 510              		.global	read_col
 511              		.syntax unified
 512              		.code	16
 513              		.thumb_func
 514              		.fpu softvfp
 516              	read_col:
 517              	.LFB6:
  94:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
  95:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** unsigned char read_col(GPIO* _gpio) {
 518              		.loc 1 95 0
 519              		.cfi_startproc
 520              		@ args = 0, pretend = 0, frame = 8
 521              		@ frame_needed = 1, uses_anonymous_args = 0
 522 020e 80B5     		push	{r7, lr}
 523              		.cfi_def_cfa_offset 8
 524              		.cfi_offset 7, -8
 525              		.cfi_offset 14, -4
 526 0210 82B0     		sub	sp, sp, #8
 527              		.cfi_def_cfa_offset 16
 528 0212 00AF     		add	r7, sp, #0
 529              		.cfi_def_cfa_register 7
 530 0214 7860     		str	r0, [r7, #4]
  96:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(_gpio->idrHigh & 0x01) return 0;
 531              		.loc 1 96 0
 532 0216 7B68     		ldr	r3, [r7, #4]
 533 0218 5B7C     		ldrb	r3, [r3, #17]
 534 021a 1A00     		movs	r2, r3
 535 021c 0123     		movs	r3, #1
 536 021e 1340     		ands	r3, r2
 537 0220 01D0     		beq	.L31
 538              		.loc 1 96 0 is_stmt 0 discriminator 1
 539 0222 0023     		movs	r3, #0
 540 0224 18E0     		b	.L32
 541              	.L31:
  97:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(_gpio->idrHigh & 0x02) return 1;
 542              		.loc 1 97 0 is_stmt 1
 543 0226 7B68     		ldr	r3, [r7, #4]
 544 0228 5B7C     		ldrb	r3, [r3, #17]
 545 022a 1A00     		movs	r2, r3
 546 022c 0223     		movs	r3, #2
 547 022e 1340     		ands	r3, r2
 548 0230 01D0     		beq	.L33
 549              		.loc 1 97 0 is_stmt 0 discriminator 1
 550 0232 0123     		movs	r3, #1
 551 0234 10E0     		b	.L32
 552              	.L33:
  98:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(_gpio->idrHigh & 0x04) return 2;
 553              		.loc 1 98 0 is_stmt 1
 554 0236 7B68     		ldr	r3, [r7, #4]
 555 0238 5B7C     		ldrb	r3, [r3, #17]
 556 023a 1A00     		movs	r2, r3
 557 023c 0423     		movs	r3, #4
 558 023e 1340     		ands	r3, r2
 559 0240 01D0     		beq	.L34
 560              		.loc 1 98 0 is_stmt 0 discriminator 1
 561 0242 0223     		movs	r3, #2
 562 0244 08E0     		b	.L32
 563              	.L34:
  99:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(_gpio->idrHigh & 0x08) return 3;
 564              		.loc 1 99 0 is_stmt 1
 565 0246 7B68     		ldr	r3, [r7, #4]
 566 0248 5B7C     		ldrb	r3, [r3, #17]
 567 024a 1A00     		movs	r2, r3
 568 024c 0823     		movs	r3, #8
 569 024e 1340     		ands	r3, r2
 570 0250 01D0     		beq	.L35
 571              		.loc 1 99 0 is_stmt 0 discriminator 1
 572 0252 0323     		movs	r3, #3
 573 0254 00E0     		b	.L32
 574              	.L35:
 100:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	return 0xFF;
 575              		.loc 1 100 0 is_stmt 1
 576 0256 FF23     		movs	r3, #255
 577              	.L32:
 101:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 578              		.loc 1 101 0
 579 0258 1800     		movs	r0, r3
 580 025a BD46     		mov	sp, r7
 581 025c 02B0     		add	sp, sp, #8
 582              		@ sp needed
 583 025e 80BD     		pop	{r7, pc}
 584              		.cfi_endproc
 585              	.LFE6:
 587              		.align	1
 588              		.global	setup_for_ascii_display
 589              		.syntax unified
 590              		.code	16
 591              		.thumb_func
 592              		.fpu softvfp
 594              	setup_for_ascii_display:
 595              	.LFB7:
 102:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 103:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void setup_for_ascii_display() {
 596              		.loc 1 103 0
 597              		.cfi_startproc
 598              		@ args = 0, pretend = 0, frame = 0
 599              		@ frame_needed = 1, uses_anonymous_args = 0
 600 0260 80B5     		push	{r7, lr}
 601              		.cfi_def_cfa_offset 8
 602              		.cfi_offset 7, -8
 603              		.cfi_offset 14, -4
 604 0262 00AF     		add	r7, sp, #0
 605              		.cfi_def_cfa_register 7
 104:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt alla pinnar till utportar.
 105:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder = 0x55555555;
 606              		.loc 1 105 0
 607 0264 054B     		ldr	r3, .L37
 608 0266 064A     		ldr	r2, .L37+4
 609 0268 1A60     		str	r2, [r3]
 106:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 107:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt utportar till "push/pull".
 108:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	//GPIO_E->otyper = 0x00000000;
 109:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 110:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt utportars hastighet till medium.
 111:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->ospeedr = 0x55555555;
 610              		.loc 1 111 0
 611 026a 044B     		ldr	r3, .L37
 612 026c 044A     		ldr	r2, .L37+4
 613 026e 9A60     		str	r2, [r3, #8]
 112:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 113:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt utportart hastighet till low.
 114:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	//GPIO_E->ospeedr = 0x00000000;
 115:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 116:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// inportar är "pull-up"
 117:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	//GPIO_E->pupdr = 0x55550000;
 118:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 119:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_init();
 614              		.loc 1 119 0
 615 0270 FFF7FEFF 		bl	ascii_init
 120:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 616              		.loc 1 120 0
 617 0274 C046     		nop
 618 0276 BD46     		mov	sp, r7
 619              		@ sp needed
 620 0278 80BD     		pop	{r7, pc}
 621              	.L38:
 622 027a C046     		.align	2
 623              	.L37:
 624 027c 00100240 		.word	1073876992
 625 0280 55555555 		.word	1431655765
 626              		.cfi_endproc
 627              	.LFE7:
 629              		.align	1
 630              		.global	ascii_init
 631              		.syntax unified
 632              		.code	16
 633              		.thumb_func
 634              		.fpu softvfp
 636              	ascii_init:
 637              	.LFB8:
 121:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 122:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void ascii_init(void) {
 638              		.loc 1 122 0
 639              		.cfi_startproc
 640              		@ args = 0, pretend = 0, frame = 0
 641              		@ frame_needed = 1, uses_anonymous_args = 0
 642 0284 80B5     		push	{r7, lr}
 643              		.cfi_def_cfa_offset 8
 644              		.cfi_offset 7, -8
 645              		.cfi_offset 14, -4
 646 0286 00AF     		add	r7, sp, #0
 647              		.cfi_def_cfa_register 7
 123:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 648              		.loc 1 123 0
 649 0288 C046     		nop
 650              	.L40:
 651              		.loc 1 123 0 is_stmt 0 discriminator 1
 652 028a FFF7FEFF 		bl	ascii_read_status
 653 028e 0300     		movs	r3, r0
 654 0290 1A00     		movs	r2, r3
 655 0292 8023     		movs	r3, #128
 656 0294 1340     		ands	r3, r2
 657 0296 802B     		cmp	r3, #128
 658 0298 F7D0     		beq	.L40
 124:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 125:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(20);
 659              		.loc 1 125 0 is_stmt 1
 660 029a 1420     		movs	r0, #20
 661 029c FFF7FEFF 		bl	delay_mikro
 126:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Function Set - 2 rader, 5x8 punkters tecken.
 127:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_write_cmd(0x38);
 662              		.loc 1 127 0
 663 02a0 3820     		movs	r0, #56
 664 02a2 FFF7FEFF 		bl	ascii_write_cmd
 128:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(39);
 665              		.loc 1 128 0
 666 02a6 2720     		movs	r0, #39
 667 02a8 FFF7FEFF 		bl	delay_mikro
 129:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 130:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 131:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 668              		.loc 1 131 0
 669 02ac C046     		nop
 670              	.L41:
 671              		.loc 1 131 0 is_stmt 0 discriminator 1
 672 02ae FFF7FEFF 		bl	ascii_read_status
 673 02b2 0300     		movs	r3, r0
 674 02b4 1A00     		movs	r2, r3
 675 02b6 8023     		movs	r3, #128
 676 02b8 1340     		ands	r3, r2
 677 02ba 802B     		cmp	r3, #128
 678 02bc F7D0     		beq	.L41
 132:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 133:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(20);
 679              		.loc 1 133 0 is_stmt 1
 680 02be 1420     		movs	r0, #20
 681 02c0 FFF7FEFF 		bl	delay_mikro
 134:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Tänd display, tänd markör ("cursor"), konstant visning.
 135:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_write_cmd(0x0E);
 682              		.loc 1 135 0
 683 02c4 0E20     		movs	r0, #14
 684 02c6 FFF7FEFF 		bl	ascii_write_cmd
 136:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(39);
 685              		.loc 1 136 0
 686 02ca 2720     		movs	r0, #39
 687 02cc FFF7FEFF 		bl	delay_mikro
 137:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 138:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 688              		.loc 1 138 0
 689 02d0 C046     		nop
 690              	.L42:
 691              		.loc 1 138 0 is_stmt 0 discriminator 1
 692 02d2 FFF7FEFF 		bl	ascii_read_status
 693 02d6 0300     		movs	r3, r0
 694 02d8 1A00     		movs	r2, r3
 695 02da 8023     		movs	r3, #128
 696 02dc 1340     		ands	r3, r2
 697 02de 802B     		cmp	r3, #128
 698 02e0 F7D0     		beq	.L42
 139:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 140:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(20);
 699              		.loc 1 140 0 is_stmt 1
 700 02e2 1420     		movs	r0, #20
 701 02e4 FFF7FEFF 		bl	delay_mikro
 141:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Clear display.
 142:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_write_cmd(0x01);
 702              		.loc 1 142 0
 703 02e8 0120     		movs	r0, #1
 704 02ea FFF7FEFF 		bl	ascii_write_cmd
 143:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(39);
 705              		.loc 1 143 0
 706 02ee 2720     		movs	r0, #39
 707 02f0 FFF7FEFF 		bl	delay_mikro
 144:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 145:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 708              		.loc 1 145 0
 709 02f4 C046     		nop
 710              	.L43:
 711              		.loc 1 145 0 is_stmt 0 discriminator 1
 712 02f6 FFF7FEFF 		bl	ascii_read_status
 713 02fa 0300     		movs	r3, r0
 714 02fc 1A00     		movs	r2, r3
 715 02fe 8023     		movs	r3, #128
 716 0300 1340     		ands	r3, r2
 717 0302 802B     		cmp	r3, #128
 718 0304 F7D0     		beq	.L43
 146:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 147:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(20);
 719              		.loc 1 147 0 is_stmt 1
 720 0306 1420     		movs	r0, #20
 721 0308 FFF7FEFF 		bl	delay_mikro
 148:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Adressering med "increment", inget skift av adressbuffern.
 149:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_write_cmd(0x04);
 722              		.loc 1 149 0
 723 030c 0420     		movs	r0, #4
 724 030e FFF7FEFF 		bl	ascii_write_cmd
 150:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(39);
 725              		.loc 1 150 0
 726 0312 2720     		movs	r0, #39
 727 0314 FFF7FEFF 		bl	delay_mikro
 151:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 728              		.loc 1 151 0
 729 0318 C046     		nop
 730 031a BD46     		mov	sp, r7
 731              		@ sp needed
 732 031c 80BD     		pop	{r7, pc}
 733              		.cfi_endproc
 734              	.LFE8:
 736              		.align	1
 737              		.global	ascii_ctrl_bit_set
 738              		.syntax unified
 739              		.code	16
 740              		.thumb_func
 741              		.fpu softvfp
 743              	ascii_ctrl_bit_set:
 744              	.LFB9:
 152:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 153:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void ascii_ctrl_bit_set(unsigned char x) {
 745              		.loc 1 153 0
 746              		.cfi_startproc
 747              		@ args = 0, pretend = 0, frame = 16
 748              		@ frame_needed = 1, uses_anonymous_args = 0
 749 031e 80B5     		push	{r7, lr}
 750              		.cfi_def_cfa_offset 8
 751              		.cfi_offset 7, -8
 752              		.cfi_offset 14, -4
 753 0320 84B0     		sub	sp, sp, #16
 754              		.cfi_def_cfa_offset 24
 755 0322 00AF     		add	r7, sp, #0
 756              		.cfi_def_cfa_register 7
 757 0324 0200     		movs	r2, r0
 758 0326 FB1D     		adds	r3, r7, #7
 759 0328 1A70     		strb	r2, [r3]
 154:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	//GPIO_E->odrLow |= x;
 155:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 156:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	unsigned char c;
 157:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c = GPIO_E->odrLow;
 760              		.loc 1 157 0
 761 032a 0D4A     		ldr	r2, .L45
 762 032c 0F23     		movs	r3, #15
 763 032e FB18     		adds	r3, r7, r3
 764 0330 127D     		ldrb	r2, [r2, #20]
 765 0332 1A70     		strb	r2, [r3]
 158:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c |= (B_SELECT | x);
 766              		.loc 1 158 0
 767 0334 FA1D     		adds	r2, r7, #7
 768 0336 0F23     		movs	r3, #15
 769 0338 FB18     		adds	r3, r7, r3
 770 033a 1278     		ldrb	r2, [r2]
 771 033c 1B78     		ldrb	r3, [r3]
 772 033e 1343     		orrs	r3, r2
 773 0340 DAB2     		uxtb	r2, r3
 774 0342 0F23     		movs	r3, #15
 775 0344 FB18     		adds	r3, r7, r3
 776 0346 0421     		movs	r1, #4
 777 0348 0A43     		orrs	r2, r1
 778 034a 1A70     		strb	r2, [r3]
 159:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->odrLow = c;
 779              		.loc 1 159 0
 780 034c 044A     		ldr	r2, .L45
 781 034e 0F23     		movs	r3, #15
 782 0350 FB18     		adds	r3, r7, r3
 783 0352 1B78     		ldrb	r3, [r3]
 784 0354 1375     		strb	r3, [r2, #20]
 160:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 785              		.loc 1 160 0
 786 0356 C046     		nop
 787 0358 BD46     		mov	sp, r7
 788 035a 04B0     		add	sp, sp, #16
 789              		@ sp needed
 790 035c 80BD     		pop	{r7, pc}
 791              	.L46:
 792 035e C046     		.align	2
 793              	.L45:
 794 0360 00100240 		.word	1073876992
 795              		.cfi_endproc
 796              	.LFE9:
 798              		.align	1
 799              		.global	ascii_ctrl_bit_clear
 800              		.syntax unified
 801              		.code	16
 802              		.thumb_func
 803              		.fpu softvfp
 805              	ascii_ctrl_bit_clear:
 806              	.LFB10:
 161:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 162:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void ascii_ctrl_bit_clear(unsigned char x) {
 807              		.loc 1 162 0
 808              		.cfi_startproc
 809              		@ args = 0, pretend = 0, frame = 16
 810              		@ frame_needed = 1, uses_anonymous_args = 0
 811 0364 80B5     		push	{r7, lr}
 812              		.cfi_def_cfa_offset 8
 813              		.cfi_offset 7, -8
 814              		.cfi_offset 14, -4
 815 0366 84B0     		sub	sp, sp, #16
 816              		.cfi_def_cfa_offset 24
 817 0368 00AF     		add	r7, sp, #0
 818              		.cfi_def_cfa_register 7
 819 036a 0200     		movs	r2, r0
 820 036c FB1D     		adds	r3, r7, #7
 821 036e 1A70     		strb	r2, [r3]
 163:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	//GPIO_E->odrLow &= (~x);
 164:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 165:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	unsigned char c;
 166:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c = GPIO_E->odrLow;
 822              		.loc 1 166 0
 823 0370 0F4A     		ldr	r2, .L48
 824 0372 0F23     		movs	r3, #15
 825 0374 FB18     		adds	r3, r7, r3
 826 0376 127D     		ldrb	r2, [r2, #20]
 827 0378 1A70     		strb	r2, [r3]
 167:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c = (B_SELECT | c & ~x);
 828              		.loc 1 167 0
 829 037a FB1D     		adds	r3, r7, #7
 830 037c 1B78     		ldrb	r3, [r3]
 831 037e 5BB2     		sxtb	r3, r3
 832 0380 DB43     		mvns	r3, r3
 833 0382 5BB2     		sxtb	r3, r3
 834 0384 0F22     		movs	r2, #15
 835 0386 BA18     		adds	r2, r7, r2
 836 0388 1278     		ldrb	r2, [r2]
 837 038a 52B2     		sxtb	r2, r2
 838 038c 1340     		ands	r3, r2
 839 038e 5BB2     		sxtb	r3, r3
 840 0390 0422     		movs	r2, #4
 841 0392 1343     		orrs	r3, r2
 842 0394 5AB2     		sxtb	r2, r3
 843 0396 0F23     		movs	r3, #15
 844 0398 FB18     		adds	r3, r7, r3
 845 039a 1A70     		strb	r2, [r3]
 168:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->odrLow = c;
 846              		.loc 1 168 0
 847 039c 044A     		ldr	r2, .L48
 848 039e 0F23     		movs	r3, #15
 849 03a0 FB18     		adds	r3, r7, r3
 850 03a2 1B78     		ldrb	r3, [r3]
 851 03a4 1375     		strb	r3, [r2, #20]
 169:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 852              		.loc 1 169 0
 853 03a6 C046     		nop
 854 03a8 BD46     		mov	sp, r7
 855 03aa 04B0     		add	sp, sp, #16
 856              		@ sp needed
 857 03ac 80BD     		pop	{r7, pc}
 858              	.L49:
 859 03ae C046     		.align	2
 860              	.L48:
 861 03b0 00100240 		.word	1073876992
 862              		.cfi_endproc
 863              	.LFE10:
 865              		.align	1
 866              		.global	ascii_write_cmd
 867              		.syntax unified
 868              		.code	16
 869              		.thumb_func
 870              		.fpu softvfp
 872              	ascii_write_cmd:
 873              	.LFB11:
 170:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 171:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void ascii_write_cmd(unsigned char command) {
 874              		.loc 1 171 0
 875              		.cfi_startproc
 876              		@ args = 0, pretend = 0, frame = 8
 877              		@ frame_needed = 1, uses_anonymous_args = 0
 878 03b4 80B5     		push	{r7, lr}
 879              		.cfi_def_cfa_offset 8
 880              		.cfi_offset 7, -8
 881              		.cfi_offset 14, -4
 882 03b6 82B0     		sub	sp, sp, #8
 883              		.cfi_def_cfa_offset 16
 884 03b8 00AF     		add	r7, sp, #0
 885              		.cfi_def_cfa_register 7
 886 03ba 0200     		movs	r2, r0
 887 03bc FB1D     		adds	r3, r7, #7
 888 03be 1A70     		strb	r2, [r3]
 172:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Doesn't wait or check for the status flag...
 173:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_RS);
 889              		.loc 1 173 0
 890 03c0 0120     		movs	r0, #1
 891 03c2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 174:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_RW);
 892              		.loc 1 174 0
 893 03c6 0220     		movs	r0, #2
 894 03c8 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 175:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_write_controller(command);
 895              		.loc 1 175 0
 896 03cc FB1D     		adds	r3, r7, #7
 897 03ce 1B78     		ldrb	r3, [r3]
 898 03d0 1800     		movs	r0, r3
 899 03d2 FFF7FEFF 		bl	ascii_write_controller
 176:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 900              		.loc 1 176 0
 901 03d6 C046     		nop
 902 03d8 BD46     		mov	sp, r7
 903 03da 02B0     		add	sp, sp, #8
 904              		@ sp needed
 905 03dc 80BD     		pop	{r7, pc}
 906              		.cfi_endproc
 907              	.LFE11:
 909              		.align	1
 910              		.global	ascii_write_data
 911              		.syntax unified
 912              		.code	16
 913              		.thumb_func
 914              		.fpu softvfp
 916              	ascii_write_data:
 917              	.LFB12:
 177:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 178:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void ascii_write_data(unsigned char data) {
 918              		.loc 1 178 0
 919              		.cfi_startproc
 920              		@ args = 0, pretend = 0, frame = 8
 921              		@ frame_needed = 1, uses_anonymous_args = 0
 922 03de 80B5     		push	{r7, lr}
 923              		.cfi_def_cfa_offset 8
 924              		.cfi_offset 7, -8
 925              		.cfi_offset 14, -4
 926 03e0 82B0     		sub	sp, sp, #8
 927              		.cfi_def_cfa_offset 16
 928 03e2 00AF     		add	r7, sp, #0
 929              		.cfi_def_cfa_register 7
 930 03e4 0200     		movs	r2, r0
 931 03e6 FB1D     		adds	r3, r7, #7
 932 03e8 1A70     		strb	r2, [r3]
 179:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_set(B_RS);
 933              		.loc 1 179 0
 934 03ea 0120     		movs	r0, #1
 935 03ec FFF7FEFF 		bl	ascii_ctrl_bit_set
 180:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_RW);
 936              		.loc 1 180 0
 937 03f0 0220     		movs	r0, #2
 938 03f2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 181:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_write_controller(data);
 939              		.loc 1 181 0
 940 03f6 FB1D     		adds	r3, r7, #7
 941 03f8 1B78     		ldrb	r3, [r3]
 942 03fa 1800     		movs	r0, r3
 943 03fc FFF7FEFF 		bl	ascii_write_controller
 182:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 944              		.loc 1 182 0
 945 0400 C046     		nop
 946 0402 BD46     		mov	sp, r7
 947 0404 02B0     		add	sp, sp, #8
 948              		@ sp needed
 949 0406 80BD     		pop	{r7, pc}
 950              		.cfi_endproc
 951              	.LFE12:
 953              		.align	1
 954              		.global	ascii_read_status
 955              		.syntax unified
 956              		.code	16
 957              		.thumb_func
 958              		.fpu softvfp
 960              	ascii_read_status:
 961              	.LFB13:
 183:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 184:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** unsigned char ascii_read_status(void) {
 962              		.loc 1 184 0
 963              		.cfi_startproc
 964              		@ args = 0, pretend = 0, frame = 8
 965              		@ frame_needed = 1, uses_anonymous_args = 0
 966 0408 90B5     		push	{r4, r7, lr}
 967              		.cfi_def_cfa_offset 12
 968              		.cfi_offset 4, -12
 969              		.cfi_offset 7, -8
 970              		.cfi_offset 14, -4
 971 040a 83B0     		sub	sp, sp, #12
 972              		.cfi_def_cfa_offset 24
 973 040c 00AF     		add	r7, sp, #0
 974              		.cfi_def_cfa_register 7
 185:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	unsigned char read_value;
 186:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 187:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt pinnar 15-8 till ingångar.
 188:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder &= 0x0000FFFF;
 975              		.loc 1 188 0
 976 040e 0E4B     		ldr	r3, .L54
 977 0410 0D4A     		ldr	r2, .L54
 978 0412 1268     		ldr	r2, [r2]
 979 0414 1204     		lsls	r2, r2, #16
 980 0416 120C     		lsrs	r2, r2, #16
 981 0418 1A60     		str	r2, [r3]
 189:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 190:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_RS);
 982              		.loc 1 190 0
 983 041a 0120     		movs	r0, #1
 984 041c FFF7FEFF 		bl	ascii_ctrl_bit_clear
 191:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_set(B_RW);
 985              		.loc 1 191 0
 986 0420 0220     		movs	r0, #2
 987 0422 FFF7FEFF 		bl	ascii_ctrl_bit_set
 192:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	read_value = ascii_read_controller();
 988              		.loc 1 192 0
 989 0426 FC1D     		adds	r4, r7, #7
 990 0428 FFF7FEFF 		bl	ascii_read_controller
 991 042c 0300     		movs	r3, r0
 992 042e 2370     		strb	r3, [r4]
 193:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 194:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt pinnar 15-8 till utgångar igen.
 195:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder |= 0x55550000;
 993              		.loc 1 195 0
 994 0430 054B     		ldr	r3, .L54
 995 0432 054A     		ldr	r2, .L54
 996 0434 1268     		ldr	r2, [r2]
 997 0436 0549     		ldr	r1, .L54+4
 998 0438 0A43     		orrs	r2, r1
 999 043a 1A60     		str	r2, [r3]
 196:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 197:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	return read_value;
 1000              		.loc 1 197 0
 1001 043c FB1D     		adds	r3, r7, #7
 1002 043e 1B78     		ldrb	r3, [r3]
 198:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1003              		.loc 1 198 0
 1004 0440 1800     		movs	r0, r3
 1005 0442 BD46     		mov	sp, r7
 1006 0444 03B0     		add	sp, sp, #12
 1007              		@ sp needed
 1008 0446 90BD     		pop	{r4, r7, pc}
 1009              	.L55:
 1010              		.align	2
 1011              	.L54:
 1012 0448 00100240 		.word	1073876992
 1013 044c 00005555 		.word	1431633920
 1014              		.cfi_endproc
 1015              	.LFE13:
 1017              		.align	1
 1018              		.global	ascii_read_data
 1019              		.syntax unified
 1020              		.code	16
 1021              		.thumb_func
 1022              		.fpu softvfp
 1024              	ascii_read_data:
 1025              	.LFB14:
 199:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 200:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** unsigned char ascii_read_data(void) {
 1026              		.loc 1 200 0
 1027              		.cfi_startproc
 1028              		@ args = 0, pretend = 0, frame = 8
 1029              		@ frame_needed = 1, uses_anonymous_args = 0
 1030 0450 90B5     		push	{r4, r7, lr}
 1031              		.cfi_def_cfa_offset 12
 1032              		.cfi_offset 4, -12
 1033              		.cfi_offset 7, -8
 1034              		.cfi_offset 14, -4
 1035 0452 83B0     		sub	sp, sp, #12
 1036              		.cfi_def_cfa_offset 24
 1037 0454 00AF     		add	r7, sp, #0
 1038              		.cfi_def_cfa_register 7
 201:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	unsigned char read_value;
 202:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 203:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt pinnar 15-8 till ingångar.
 204:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder &= 0x0000FFFF;
 1039              		.loc 1 204 0
 1040 0456 0E4B     		ldr	r3, .L58
 1041 0458 0D4A     		ldr	r2, .L58
 1042 045a 1268     		ldr	r2, [r2]
 1043 045c 1204     		lsls	r2, r2, #16
 1044 045e 120C     		lsrs	r2, r2, #16
 1045 0460 1A60     		str	r2, [r3]
 205:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 206:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_set(B_RS);
 1046              		.loc 1 206 0
 1047 0462 0120     		movs	r0, #1
 1048 0464 FFF7FEFF 		bl	ascii_ctrl_bit_set
 207:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_set(B_RW);
 1049              		.loc 1 207 0
 1050 0468 0220     		movs	r0, #2
 1051 046a FFF7FEFF 		bl	ascii_ctrl_bit_set
 208:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	read_value = ascii_read_controller();
 1052              		.loc 1 208 0
 1053 046e FC1D     		adds	r4, r7, #7
 1054 0470 FFF7FEFF 		bl	ascii_read_controller
 1055 0474 0300     		movs	r3, r0
 1056 0476 2370     		strb	r3, [r4]
 209:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 210:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Sätt pinnar 15-8 till utgångar igen.
 211:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder |= 0xFFFF0000;
 1057              		.loc 1 211 0
 1058 0478 054B     		ldr	r3, .L58
 1059 047a 054A     		ldr	r2, .L58
 1060 047c 1268     		ldr	r2, [r2]
 1061 047e 0549     		ldr	r1, .L58+4
 1062 0480 0A43     		orrs	r2, r1
 1063 0482 1A60     		str	r2, [r3]
 212:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 213:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	return read_value;
 1064              		.loc 1 213 0
 1065 0484 FB1D     		adds	r3, r7, #7
 1066 0486 1B78     		ldrb	r3, [r3]
 214:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1067              		.loc 1 214 0
 1068 0488 1800     		movs	r0, r3
 1069 048a BD46     		mov	sp, r7
 1070 048c 03B0     		add	sp, sp, #12
 1071              		@ sp needed
 1072 048e 90BD     		pop	{r4, r7, pc}
 1073              	.L59:
 1074              		.align	2
 1075              	.L58:
 1076 0490 00100240 		.word	1073876992
 1077 0494 0000FFFF 		.word	-65536
 1078              		.cfi_endproc
 1079              	.LFE14:
 1081              		.align	1
 1082              		.global	ascii_write_controller
 1083              		.syntax unified
 1084              		.code	16
 1085              		.thumb_func
 1086              		.fpu softvfp
 1088              	ascii_write_controller:
 1089              	.LFB15:
 215:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 216:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void ascii_write_controller(unsigned char byte) {
 1090              		.loc 1 216 0
 1091              		.cfi_startproc
 1092              		@ args = 0, pretend = 0, frame = 8
 1093              		@ frame_needed = 1, uses_anonymous_args = 0
 1094 0498 80B5     		push	{r7, lr}
 1095              		.cfi_def_cfa_offset 8
 1096              		.cfi_offset 7, -8
 1097              		.cfi_offset 14, -4
 1098 049a 82B0     		sub	sp, sp, #8
 1099              		.cfi_def_cfa_offset 16
 1100 049c 00AF     		add	r7, sp, #0
 1101              		.cfi_def_cfa_register 7
 1102 049e 0200     		movs	r2, r0
 1103 04a0 FB1D     		adds	r3, r7, #7
 1104 04a2 1A70     		strb	r2, [r3]
 217:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Delay40ns is redundant
 218:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_set(B_E);
 1105              		.loc 1 218 0
 1106 04a4 4020     		movs	r0, #64
 1107 04a6 FFF7FEFF 		bl	ascii_ctrl_bit_set
 219:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->odrHigh = byte;
 1108              		.loc 1 219 0
 1109 04aa 064A     		ldr	r2, .L61
 1110 04ac FB1D     		adds	r3, r7, #7
 1111 04ae 1B78     		ldrb	r3, [r3]
 1112 04b0 5375     		strb	r3, [r2, #21]
 220:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_250ns();
 1113              		.loc 1 220 0
 1114 04b2 FFF7FEFF 		bl	delay_250ns
 221:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_E);
 1115              		.loc 1 221 0
 1116 04b6 4020     		movs	r0, #64
 1117 04b8 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 222:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Delay10ns is redundant
 223:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1118              		.loc 1 223 0
 1119 04bc C046     		nop
 1120 04be BD46     		mov	sp, r7
 1121 04c0 02B0     		add	sp, sp, #8
 1122              		@ sp needed
 1123 04c2 80BD     		pop	{r7, pc}
 1124              	.L62:
 1125              		.align	2
 1126              	.L61:
 1127 04c4 00100240 		.word	1073876992
 1128              		.cfi_endproc
 1129              	.LFE15:
 1131              		.align	1
 1132              		.global	ascii_read_controller
 1133              		.syntax unified
 1134              		.code	16
 1135              		.thumb_func
 1136              		.fpu softvfp
 1138              	ascii_read_controller:
 1139              	.LFB16:
 224:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 225:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** unsigned char ascii_read_controller(void) {
 1140              		.loc 1 225 0
 1141              		.cfi_startproc
 1142              		@ args = 0, pretend = 0, frame = 8
 1143              		@ frame_needed = 1, uses_anonymous_args = 0
 1144 04c8 80B5     		push	{r7, lr}
 1145              		.cfi_def_cfa_offset 8
 1146              		.cfi_offset 7, -8
 1147              		.cfi_offset 14, -4
 1148 04ca 82B0     		sub	sp, sp, #8
 1149              		.cfi_def_cfa_offset 16
 1150 04cc 00AF     		add	r7, sp, #0
 1151              		.cfi_def_cfa_register 7
 226:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	unsigned char read_value;
 227:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_set(B_E);
 1152              		.loc 1 227 0
 1153 04ce 4020     		movs	r0, #64
 1154 04d0 FFF7FEFF 		bl	ascii_ctrl_bit_set
 228:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_250ns();
 1155              		.loc 1 228 0
 1156 04d4 FFF7FEFF 		bl	delay_250ns
 229:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_250ns();
 1157              		.loc 1 229 0
 1158 04d8 FFF7FEFF 		bl	delay_250ns
 230:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	read_value = GPIO_E->idrHigh;
 1159              		.loc 1 230 0
 1160 04dc 064A     		ldr	r2, .L65
 1161 04de FB1D     		adds	r3, r7, #7
 1162 04e0 527C     		ldrb	r2, [r2, #17]
 1163 04e2 1A70     		strb	r2, [r3]
 231:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_E);
 1164              		.loc 1 231 0
 1165 04e4 4020     		movs	r0, #64
 1166 04e6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 232:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	return read_value;
 1167              		.loc 1 232 0
 1168 04ea FB1D     		adds	r3, r7, #7
 1169 04ec 1B78     		ldrb	r3, [r3]
 233:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1170              		.loc 1 233 0
 1171 04ee 1800     		movs	r0, r3
 1172 04f0 BD46     		mov	sp, r7
 1173 04f2 02B0     		add	sp, sp, #8
 1174              		@ sp needed
 1175 04f4 80BD     		pop	{r7, pc}
 1176              	.L66:
 1177 04f6 C046     		.align	2
 1178              	.L65:
 1179 04f8 00100240 		.word	1073876992
 1180              		.cfi_endproc
 1181              	.LFE16:
 1183              		.align	1
 1184              		.global	ascii_gotoxy
 1185              		.syntax unified
 1186              		.code	16
 1187              		.thumb_func
 1188              		.fpu softvfp
 1190              	ascii_gotoxy:
 1191              	.LFB17:
 234:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 235:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void ascii_gotoxy(int x, int y) {
 1192              		.loc 1 235 0
 1193              		.cfi_startproc
 1194              		@ args = 0, pretend = 0, frame = 16
 1195              		@ frame_needed = 1, uses_anonymous_args = 0
 1196 04fc 80B5     		push	{r7, lr}
 1197              		.cfi_def_cfa_offset 8
 1198              		.cfi_offset 7, -8
 1199              		.cfi_offset 14, -4
 1200 04fe 84B0     		sub	sp, sp, #16
 1201              		.cfi_def_cfa_offset 24
 1202 0500 00AF     		add	r7, sp, #0
 1203              		.cfi_def_cfa_register 7
 1204 0502 7860     		str	r0, [r7, #4]
 1205 0504 3960     		str	r1, [r7]
 236:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(!(y == 1 || y == 2)) return;
 1206              		.loc 1 236 0
 1207 0506 3B68     		ldr	r3, [r7]
 1208 0508 012B     		cmp	r3, #1
 1209 050a 02D0     		beq	.L68
 1210              		.loc 1 236 0 is_stmt 0 discriminator 1
 1211 050c 3B68     		ldr	r3, [r7]
 1212 050e 022B     		cmp	r3, #2
 1213 0510 1AD1     		bne	.L71
 1214              	.L68:
 237:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	unsigned char address = x - 1;
 1215              		.loc 1 237 0 is_stmt 1
 1216 0512 7B68     		ldr	r3, [r7, #4]
 1217 0514 DAB2     		uxtb	r2, r3
 1218 0516 0F23     		movs	r3, #15
 1219 0518 FB18     		adds	r3, r7, r3
 1220 051a 013A     		subs	r2, r2, #1
 1221 051c 1A70     		strb	r2, [r3]
 238:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(y == 2){
 1222              		.loc 1 238 0
 1223 051e 3B68     		ldr	r3, [r7]
 1224 0520 022B     		cmp	r3, #2
 1225 0522 06D1     		bne	.L70
 239:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		address += 0x40;
 1226              		.loc 1 239 0
 1227 0524 0F23     		movs	r3, #15
 1228 0526 FB18     		adds	r3, r7, r3
 1229 0528 0F22     		movs	r2, #15
 1230 052a BA18     		adds	r2, r7, r2
 1231 052c 1278     		ldrb	r2, [r2]
 1232 052e 4032     		adds	r2, r2, #64
 1233 0530 1A70     		strb	r2, [r3]
 1234              	.L70:
 240:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 241:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_write_cmd(0x80 | address);
 1235              		.loc 1 241 0
 1236 0532 0F23     		movs	r3, #15
 1237 0534 FB18     		adds	r3, r7, r3
 1238 0536 1B78     		ldrb	r3, [r3]
 1239 0538 8022     		movs	r2, #128
 1240 053a 5242     		rsbs	r2, r2, #0
 1241 053c 1343     		orrs	r3, r2
 1242 053e DBB2     		uxtb	r3, r3
 1243 0540 1800     		movs	r0, r3
 1244 0542 FFF7FEFF 		bl	ascii_write_cmd
 1245 0546 00E0     		b	.L67
 1246              	.L71:
 236:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	unsigned char address = x - 1;
 1247              		.loc 1 236 0
 1248 0548 C046     		nop
 1249              	.L67:
 242:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1250              		.loc 1 242 0
 1251 054a BD46     		mov	sp, r7
 1252 054c 04B0     		add	sp, sp, #16
 1253              		@ sp needed
 1254 054e 80BD     		pop	{r7, pc}
 1255              		.cfi_endproc
 1256              	.LFE17:
 1258              		.align	1
 1259              		.global	ascii_write_char
 1260              		.syntax unified
 1261              		.code	16
 1262              		.thumb_func
 1263              		.fpu softvfp
 1265              	ascii_write_char:
 1266              	.LFB18:
 243:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 244:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void ascii_write_char(unsigned char c) {
 1267              		.loc 1 244 0
 1268              		.cfi_startproc
 1269              		@ args = 0, pretend = 0, frame = 8
 1270              		@ frame_needed = 1, uses_anonymous_args = 0
 1271 0550 80B5     		push	{r7, lr}
 1272              		.cfi_def_cfa_offset 8
 1273              		.cfi_offset 7, -8
 1274              		.cfi_offset 14, -4
 1275 0552 82B0     		sub	sp, sp, #8
 1276              		.cfi_def_cfa_offset 16
 1277 0554 00AF     		add	r7, sp, #0
 1278              		.cfi_def_cfa_register 7
 1279 0556 0200     		movs	r2, r0
 1280 0558 FB1D     		adds	r3, r7, #7
 1281 055a 1A70     		strb	r2, [r3]
 245:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
 1282              		.loc 1 245 0
 1283 055c C046     		nop
 1284              	.L73:
 1285              		.loc 1 245 0 is_stmt 0 discriminator 1
 1286 055e FFF7FEFF 		bl	ascii_read_status
 1287 0562 0300     		movs	r3, r0
 1288 0564 1A00     		movs	r2, r3
 1289 0566 8023     		movs	r3, #128
 1290 0568 1340     		ands	r3, r2
 1291 056a 802B     		cmp	r3, #128
 1292 056c F7D0     		beq	.L73
 246:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 247:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(8);
 1293              		.loc 1 247 0 is_stmt 1
 1294 056e 0820     		movs	r0, #8
 1295 0570 FFF7FEFF 		bl	delay_mikro
 248:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	ascii_write_data(c);
 1296              		.loc 1 248 0
 1297 0574 FB1D     		adds	r3, r7, #7
 1298 0576 1B78     		ldrb	r3, [r3]
 1299 0578 1800     		movs	r0, r3
 1300 057a FFF7FEFF 		bl	ascii_write_data
 249:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(43);
 1301              		.loc 1 249 0
 1302 057e 2B20     		movs	r0, #43
 1303 0580 FFF7FEFF 		bl	delay_mikro
 250:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	//delay_mikro(100000);
 251:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1304              		.loc 1 251 0
 1305 0584 C046     		nop
 1306 0586 BD46     		mov	sp, r7
 1307 0588 02B0     		add	sp, sp, #8
 1308              		@ sp needed
 1309 058a 80BD     		pop	{r7, pc}
 1310              		.cfi_endproc
 1311              	.LFE18:
 1313              		.align	1
 1314              		.global	graphic_ctrl_bit_set
 1315              		.syntax unified
 1316              		.code	16
 1317              		.thumb_func
 1318              		.fpu softvfp
 1320              	graphic_ctrl_bit_set:
 1321              	.LFB19:
 252:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 253:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void graphic_ctrl_bit_set(uint8_t x) {
 1322              		.loc 1 253 0
 1323              		.cfi_startproc
 1324              		@ args = 0, pretend = 0, frame = 16
 1325              		@ frame_needed = 1, uses_anonymous_args = 0
 1326 058c 80B5     		push	{r7, lr}
 1327              		.cfi_def_cfa_offset 8
 1328              		.cfi_offset 7, -8
 1329              		.cfi_offset 14, -4
 1330 058e 84B0     		sub	sp, sp, #16
 1331              		.cfi_def_cfa_offset 24
 1332 0590 00AF     		add	r7, sp, #0
 1333              		.cfi_def_cfa_register 7
 1334 0592 0200     		movs	r2, r0
 1335 0594 FB1D     		adds	r3, r7, #7
 1336 0596 1A70     		strb	r2, [r3]
 254:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	uint8_t c;
 255:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c = GPIO_E->odrLow;
 1337              		.loc 1 255 0
 1338 0598 124A     		ldr	r2, .L75
 1339 059a 0F23     		movs	r3, #15
 1340 059c FB18     		adds	r3, r7, r3
 1341 059e 127D     		ldrb	r2, [r2, #20]
 1342 05a0 1A70     		strb	r2, [r3]
 256:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c &= ~B_SELECT;
 1343              		.loc 1 256 0
 1344 05a2 0F23     		movs	r3, #15
 1345 05a4 FB18     		adds	r3, r7, r3
 1346 05a6 0F22     		movs	r2, #15
 1347 05a8 BA18     		adds	r2, r7, r2
 1348 05aa 1278     		ldrb	r2, [r2]
 1349 05ac 0421     		movs	r1, #4
 1350 05ae 8A43     		bics	r2, r1
 1351 05b0 1A70     		strb	r2, [r3]
 257:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c |= (~B_SELECT & x);
 1352              		.loc 1 257 0
 1353 05b2 FB1D     		adds	r3, r7, #7
 1354 05b4 1B78     		ldrb	r3, [r3]
 1355 05b6 5BB2     		sxtb	r3, r3
 1356 05b8 0422     		movs	r2, #4
 1357 05ba 9343     		bics	r3, r2
 1358 05bc 5AB2     		sxtb	r2, r3
 1359 05be 0F23     		movs	r3, #15
 1360 05c0 FB18     		adds	r3, r7, r3
 1361 05c2 1B78     		ldrb	r3, [r3]
 1362 05c4 5BB2     		sxtb	r3, r3
 1363 05c6 1343     		orrs	r3, r2
 1364 05c8 5AB2     		sxtb	r2, r3
 1365 05ca 0F23     		movs	r3, #15
 1366 05cc FB18     		adds	r3, r7, r3
 1367 05ce 1A70     		strb	r2, [r3]
 258:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->odrLow = c;
 1368              		.loc 1 258 0
 1369 05d0 044A     		ldr	r2, .L75
 1370 05d2 0F23     		movs	r3, #15
 1371 05d4 FB18     		adds	r3, r7, r3
 1372 05d6 1B78     		ldrb	r3, [r3]
 1373 05d8 1375     		strb	r3, [r2, #20]
 259:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1374              		.loc 1 259 0
 1375 05da C046     		nop
 1376 05dc BD46     		mov	sp, r7
 1377 05de 04B0     		add	sp, sp, #16
 1378              		@ sp needed
 1379 05e0 80BD     		pop	{r7, pc}
 1380              	.L76:
 1381 05e2 C046     		.align	2
 1382              	.L75:
 1383 05e4 00100240 		.word	1073876992
 1384              		.cfi_endproc
 1385              	.LFE19:
 1387              		.align	1
 1388              		.global	graphic_ctrl_bit_clear
 1389              		.syntax unified
 1390              		.code	16
 1391              		.thumb_func
 1392              		.fpu softvfp
 1394              	graphic_ctrl_bit_clear:
 1395              	.LFB20:
 260:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 261:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void graphic_ctrl_bit_clear(uint8_t x) {
 1396              		.loc 1 261 0
 1397              		.cfi_startproc
 1398              		@ args = 0, pretend = 0, frame = 16
 1399              		@ frame_needed = 1, uses_anonymous_args = 0
 1400 05e8 80B5     		push	{r7, lr}
 1401              		.cfi_def_cfa_offset 8
 1402              		.cfi_offset 7, -8
 1403              		.cfi_offset 14, -4
 1404 05ea 84B0     		sub	sp, sp, #16
 1405              		.cfi_def_cfa_offset 24
 1406 05ec 00AF     		add	r7, sp, #0
 1407              		.cfi_def_cfa_register 7
 1408 05ee 0200     		movs	r2, r0
 1409 05f0 FB1D     		adds	r3, r7, #7
 1410 05f2 1A70     		strb	r2, [r3]
 262:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	uint8_t c;
 263:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c = GPIO_E->odrLow;
 1411              		.loc 1 263 0
 1412 05f4 114A     		ldr	r2, .L78
 1413 05f6 0F23     		movs	r3, #15
 1414 05f8 FB18     		adds	r3, r7, r3
 1415 05fa 127D     		ldrb	r2, [r2, #20]
 1416 05fc 1A70     		strb	r2, [r3]
 264:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c &= ~B_SELECT;
 1417              		.loc 1 264 0
 1418 05fe 0F23     		movs	r3, #15
 1419 0600 FB18     		adds	r3, r7, r3
 1420 0602 0F22     		movs	r2, #15
 1421 0604 BA18     		adds	r2, r7, r2
 1422 0606 1278     		ldrb	r2, [r2]
 1423 0608 0421     		movs	r1, #4
 1424 060a 8A43     		bics	r2, r1
 1425 060c 1A70     		strb	r2, [r3]
 265:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	c &= ~x;
 1426              		.loc 1 265 0
 1427 060e FB1D     		adds	r3, r7, #7
 1428 0610 1B78     		ldrb	r3, [r3]
 1429 0612 5BB2     		sxtb	r3, r3
 1430 0614 DB43     		mvns	r3, r3
 1431 0616 5BB2     		sxtb	r3, r3
 1432 0618 0F22     		movs	r2, #15
 1433 061a BA18     		adds	r2, r7, r2
 1434 061c 1278     		ldrb	r2, [r2]
 1435 061e 52B2     		sxtb	r2, r2
 1436 0620 1340     		ands	r3, r2
 1437 0622 5AB2     		sxtb	r2, r3
 1438 0624 0F23     		movs	r3, #15
 1439 0626 FB18     		adds	r3, r7, r3
 1440 0628 1A70     		strb	r2, [r3]
 266:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->odrLow = c;
 1441              		.loc 1 266 0
 1442 062a 044A     		ldr	r2, .L78
 1443 062c 0F23     		movs	r3, #15
 1444 062e FB18     		adds	r3, r7, r3
 1445 0630 1B78     		ldrb	r3, [r3]
 1446 0632 1375     		strb	r3, [r2, #20]
 267:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1447              		.loc 1 267 0
 1448 0634 C046     		nop
 1449 0636 BD46     		mov	sp, r7
 1450 0638 04B0     		add	sp, sp, #16
 1451              		@ sp needed
 1452 063a 80BD     		pop	{r7, pc}
 1453              	.L79:
 1454              		.align	2
 1455              	.L78:
 1456 063c 00100240 		.word	1073876992
 1457              		.cfi_endproc
 1458              	.LFE20:
 1460              		.align	1
 1461              		.global	select_controller
 1462              		.syntax unified
 1463              		.code	16
 1464              		.thumb_func
 1465              		.fpu softvfp
 1467              	select_controller:
 1468              	.LFB21:
 268:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 269:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void select_controller(uint8_t controller) {
 1469              		.loc 1 269 0
 1470              		.cfi_startproc
 1471              		@ args = 0, pretend = 0, frame = 8
 1472              		@ frame_needed = 1, uses_anonymous_args = 0
 1473 0640 80B5     		push	{r7, lr}
 1474              		.cfi_def_cfa_offset 8
 1475              		.cfi_offset 7, -8
 1476              		.cfi_offset 14, -4
 1477 0642 82B0     		sub	sp, sp, #8
 1478              		.cfi_def_cfa_offset 16
 1479 0644 00AF     		add	r7, sp, #0
 1480              		.cfi_def_cfa_register 7
 1481 0646 0200     		movs	r2, r0
 1482 0648 FB1D     		adds	r3, r7, #7
 1483 064a 1A70     		strb	r2, [r3]
 270:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	switch(controller){
 1484              		.loc 1 270 0
 1485 064c FB1D     		adds	r3, r7, #7
 1486 064e 1B78     		ldrb	r3, [r3]
 1487 0650 082B     		cmp	r3, #8
 1488 0652 0CD0     		beq	.L82
 1489 0654 02DC     		bgt	.L83
 1490 0656 002B     		cmp	r3, #0
 1491 0658 05D0     		beq	.L84
 271:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 0:
 272:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			graphic_ctrl_bit_clear(B_CS1|B_CS2);
 273:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			break;
 274:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case B_CS1 :
 275:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			graphic_ctrl_bit_set(B_CS1);
 276:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			graphic_ctrl_bit_clear(B_CS2);
 277:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			break;
 278:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case B_CS2 :
 279:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			graphic_ctrl_bit_set(B_CS2);
 280:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			graphic_ctrl_bit_clear(B_CS1);
 281:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			break;
 282:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case B_CS1|B_CS2 :
 283:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			graphic_ctrl_bit_set(B_CS1|B_CS2);
 284:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			break;
 285:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 286:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1492              		.loc 1 286 0
 1493 065a 1AE0     		b	.L87
 1494              	.L83:
 270:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	switch(controller){
 1495              		.loc 1 270 0
 1496 065c 102B     		cmp	r3, #16
 1497 065e 0DD0     		beq	.L85
 1498 0660 182B     		cmp	r3, #24
 1499 0662 12D0     		beq	.L86
 1500              		.loc 1 286 0
 1501 0664 15E0     		b	.L87
 1502              	.L84:
 272:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			break;
 1503              		.loc 1 272 0
 1504 0666 1820     		movs	r0, #24
 1505 0668 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 273:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case B_CS1 :
 1506              		.loc 1 273 0
 1507 066c 11E0     		b	.L81
 1508              	.L82:
 275:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			graphic_ctrl_bit_clear(B_CS2);
 1509              		.loc 1 275 0
 1510 066e 0820     		movs	r0, #8
 1511 0670 FFF7FEFF 		bl	graphic_ctrl_bit_set
 276:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			break;
 1512              		.loc 1 276 0
 1513 0674 1020     		movs	r0, #16
 1514 0676 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 277:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case B_CS2 :
 1515              		.loc 1 277 0
 1516 067a 0AE0     		b	.L81
 1517              	.L85:
 279:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			graphic_ctrl_bit_clear(B_CS1);
 1518              		.loc 1 279 0
 1519 067c 1020     		movs	r0, #16
 1520 067e FFF7FEFF 		bl	graphic_ctrl_bit_set
 280:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			break;
 1521              		.loc 1 280 0
 1522 0682 0820     		movs	r0, #8
 1523 0684 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 281:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case B_CS1|B_CS2 :
 1524              		.loc 1 281 0
 1525 0688 03E0     		b	.L81
 1526              	.L86:
 283:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			break;
 1527              		.loc 1 283 0
 1528 068a 1820     		movs	r0, #24
 1529 068c FFF7FEFF 		bl	graphic_ctrl_bit_set
 284:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 1530              		.loc 1 284 0
 1531 0690 C046     		nop
 1532              	.L81:
 1533              	.L87:
 1534              		.loc 1 286 0
 1535 0692 C046     		nop
 1536 0694 BD46     		mov	sp, r7
 1537 0696 02B0     		add	sp, sp, #8
 1538              		@ sp needed
 1539 0698 80BD     		pop	{r7, pc}
 1540              		.cfi_endproc
 1541              	.LFE21:
 1543              		.align	1
 1544              		.global	graphic_initialize
 1545              		.syntax unified
 1546              		.code	16
 1547              		.thumb_func
 1548              		.fpu softvfp
 1550              	graphic_initialize:
 1551              	.LFB22:
 287:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 288:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void graphic_initialize(void) {
 1552              		.loc 1 288 0
 1553              		.cfi_startproc
 1554              		@ args = 0, pretend = 0, frame = 0
 1555              		@ frame_needed = 1, uses_anonymous_args = 0
 1556 069a 80B5     		push	{r7, lr}
 1557              		.cfi_def_cfa_offset 8
 1558              		.cfi_offset 7, -8
 1559              		.cfi_offset 14, -4
 1560 069c 00AF     		add	r7, sp, #0
 1561              		.cfi_def_cfa_register 7
 289:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_set(B_E);
 1562              		.loc 1 289 0
 1563 069e 4020     		movs	r0, #64
 1564 06a0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 290:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(10);
 1565              		.loc 1 290 0
 1566 06a4 0A20     		movs	r0, #10
 1567 06a6 FFF7FEFF 		bl	delay_mikro
 291:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 1568              		.loc 1 291 0
 1569 06aa 7820     		movs	r0, #120
 1570 06ac FFF7FEFF 		bl	graphic_ctrl_bit_clear
 292:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(30);
 1571              		.loc 1 292 0
 1572 06b0 1E20     		movs	r0, #30
 1573 06b2 FFF7FEFF 		bl	delay_mikro
 293:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_set(B_RST);
 1574              		.loc 1 293 0
 1575 06b6 2020     		movs	r0, #32
 1576 06b8 FFF7FEFF 		bl	graphic_ctrl_bit_set
 294:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_mikro(100);
 1577              		.loc 1 294 0
 1578 06bc 6420     		movs	r0, #100
 1579 06be FFF7FEFF 		bl	delay_mikro
 295:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 1580              		.loc 1 295 0
 1581 06c2 1821     		movs	r1, #24
 1582 06c4 3E20     		movs	r0, #62
 1583 06c6 FFF7FEFF 		bl	graphic_write_command
 296:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write_command(LCD_ON, B_CS1|B_CS2);
 1584              		.loc 1 296 0
 1585 06ca 1821     		movs	r1, #24
 1586 06cc 3F20     		movs	r0, #63
 1587 06ce FFF7FEFF 		bl	graphic_write_command
 297:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 1588              		.loc 1 297 0
 1589 06d2 1821     		movs	r1, #24
 1590 06d4 C020     		movs	r0, #192
 1591 06d6 FFF7FEFF 		bl	graphic_write_command
 298:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 1592              		.loc 1 298 0
 1593 06da 1821     		movs	r1, #24
 1594 06dc 4020     		movs	r0, #64
 1595 06de FFF7FEFF 		bl	graphic_write_command
 299:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 1596              		.loc 1 299 0
 1597 06e2 1821     		movs	r1, #24
 1598 06e4 B820     		movs	r0, #184
 1599 06e6 FFF7FEFF 		bl	graphic_write_command
 300:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	select_controller(0);
 1600              		.loc 1 300 0
 1601 06ea 0020     		movs	r0, #0
 1602 06ec FFF7FEFF 		bl	select_controller
 301:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1603              		.loc 1 301 0
 1604 06f0 C046     		nop
 1605 06f2 BD46     		mov	sp, r7
 1606              		@ sp needed
 1607 06f4 80BD     		pop	{r7, pc}
 1608              		.cfi_endproc
 1609              	.LFE22:
 1611              		.align	1
 1612              		.global	graphic_wait_ready
 1613              		.syntax unified
 1614              		.code	16
 1615              		.thumb_func
 1616              		.fpu softvfp
 1618              	graphic_wait_ready:
 1619              	.LFB23:
 302:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 303:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void graphic_wait_ready(void) {
 1620              		.loc 1 303 0
 1621              		.cfi_startproc
 1622              		@ args = 0, pretend = 0, frame = 8
 1623              		@ frame_needed = 1, uses_anonymous_args = 0
 1624 06f6 80B5     		push	{r7, lr}
 1625              		.cfi_def_cfa_offset 8
 1626              		.cfi_offset 7, -8
 1627              		.cfi_offset 14, -4
 1628 06f8 82B0     		sub	sp, sp, #8
 1629              		.cfi_def_cfa_offset 16
 1630 06fa 00AF     		add	r7, sp, #0
 1631              		.cfi_def_cfa_register 7
 304:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	uint8_t c;
 305:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1632              		.loc 1 305 0
 1633 06fc 4020     		movs	r0, #64
 1634 06fe FFF7FEFF 		bl	graphic_ctrl_bit_clear
 306:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder = 0x00005555; // 15-8 inputs, 7-0 outputs
 1635              		.loc 1 306 0
 1636 0702 144B     		ldr	r3, .L95
 1637 0704 144A     		ldr	r2, .L95+4
 1638 0706 1A60     		str	r2, [r3]
 307:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_RS);
 1639              		.loc 1 307 0
 1640 0708 0120     		movs	r0, #1
 1641 070a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 308:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_set(B_RW);
 1642              		.loc 1 308 0
 1643 070e 0220     		movs	r0, #2
 1644 0710 FFF7FEFF 		bl	graphic_ctrl_bit_set
 309:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_500ns();
 1645              		.loc 1 309 0
 1646 0714 FFF7FEFF 		bl	delay_500ns
 1647              	.L92:
 310:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	while(1) {
 311:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_ctrl_bit_set(B_E);
 1648              		.loc 1 311 0
 1649 0718 4020     		movs	r0, #64
 1650 071a FFF7FEFF 		bl	graphic_ctrl_bit_set
 312:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		delay_500ns();
 1651              		.loc 1 312 0
 1652 071e FFF7FEFF 		bl	delay_500ns
 313:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		c = GPIO_E->idrHigh & LCD_BUSY;
 1653              		.loc 1 313 0
 1654 0722 0C4B     		ldr	r3, .L95
 1655 0724 5B7C     		ldrb	r3, [r3, #17]
 1656 0726 DAB2     		uxtb	r2, r3
 1657 0728 FB1D     		adds	r3, r7, #7
 1658 072a 7F21     		movs	r1, #127
 1659 072c 8A43     		bics	r2, r1
 1660 072e 1A70     		strb	r2, [r3]
 314:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_ctrl_bit_clear(B_E);
 1661              		.loc 1 314 0
 1662 0730 4020     		movs	r0, #64
 1663 0732 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 315:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		delay_500ns();
 1664              		.loc 1 315 0
 1665 0736 FFF7FEFF 		bl	delay_500ns
 316:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		if( c == 0 ) break;
 1666              		.loc 1 316 0
 1667 073a FB1D     		adds	r3, r7, #7
 1668 073c 1B78     		ldrb	r3, [r3]
 1669 073e 002B     		cmp	r3, #0
 1670 0740 00D0     		beq	.L94
 311:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		delay_500ns();
 1671              		.loc 1 311 0
 1672 0742 E9E7     		b	.L92
 1673              	.L94:
 1674              		.loc 1 316 0
 1675 0744 C046     		nop
 317:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 318:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder = 0x55555555; // 15-0 outputs
 1676              		.loc 1 318 0
 1677 0746 034B     		ldr	r3, .L95
 1678 0748 044A     		ldr	r2, .L95+8
 1679 074a 1A60     		str	r2, [r3]
 319:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1680              		.loc 1 319 0
 1681 074c C046     		nop
 1682 074e BD46     		mov	sp, r7
 1683 0750 02B0     		add	sp, sp, #8
 1684              		@ sp needed
 1685 0752 80BD     		pop	{r7, pc}
 1686              	.L96:
 1687              		.align	2
 1688              	.L95:
 1689 0754 00100240 		.word	1073876992
 1690 0758 55550000 		.word	21845
 1691 075c 55555555 		.word	1431655765
 1692              		.cfi_endproc
 1693              	.LFE23:
 1695              		.align	1
 1696              		.global	graphic_read
 1697              		.syntax unified
 1698              		.code	16
 1699              		.thumb_func
 1700              		.fpu softvfp
 1702              	graphic_read:
 1703              	.LFB24:
 320:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 321:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** uint8_t graphic_read(uint8_t controller) {
 1704              		.loc 1 321 0
 1705              		.cfi_startproc
 1706              		@ args = 0, pretend = 0, frame = 16
 1707              		@ frame_needed = 1, uses_anonymous_args = 0
 1708 0760 80B5     		push	{r7, lr}
 1709              		.cfi_def_cfa_offset 8
 1710              		.cfi_offset 7, -8
 1711              		.cfi_offset 14, -4
 1712 0762 84B0     		sub	sp, sp, #16
 1713              		.cfi_def_cfa_offset 24
 1714 0764 00AF     		add	r7, sp, #0
 1715              		.cfi_def_cfa_register 7
 1716 0766 0200     		movs	r2, r0
 1717 0768 FB1D     		adds	r3, r7, #7
 1718 076a 1A70     		strb	r2, [r3]
 322:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1719              		.loc 1 322 0
 1720 076c 4020     		movs	r0, #64
 1721 076e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 323:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder = 0x00005555;
 1722              		.loc 1 323 0
 1723 0772 1C4B     		ldr	r3, .L101
 1724 0774 1C4A     		ldr	r2, .L101+4
 1725 0776 1A60     		str	r2, [r3]
 324:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_set(B_RW);
 1726              		.loc 1 324 0
 1727 0778 0220     		movs	r0, #2
 1728 077a FFF7FEFF 		bl	graphic_ctrl_bit_set
 325:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_set(B_RS);
 1729              		.loc 1 325 0
 1730 077e 0120     		movs	r0, #1
 1731 0780 FFF7FEFF 		bl	graphic_ctrl_bit_set
 326:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	select_controller(controller);
 1732              		.loc 1 326 0
 1733 0784 FB1D     		adds	r3, r7, #7
 1734 0786 1B78     		ldrb	r3, [r3]
 1735 0788 1800     		movs	r0, r3
 1736 078a FFF7FEFF 		bl	select_controller
 327:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_500ns();
 1737              		.loc 1 327 0
 1738 078e FFF7FEFF 		bl	delay_500ns
 328:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_set(B_E);
 1739              		.loc 1 328 0
 1740 0792 4020     		movs	r0, #64
 1741 0794 FFF7FEFF 		bl	graphic_ctrl_bit_set
 329:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_500ns();
 1742              		.loc 1 329 0
 1743 0798 FFF7FEFF 		bl	delay_500ns
 330:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	uint8_t rv = GPIO_E->odrHigh;
 1744              		.loc 1 330 0
 1745 079c 114A     		ldr	r2, .L101
 1746 079e 0F23     		movs	r3, #15
 1747 07a0 FB18     		adds	r3, r7, r3
 1748 07a2 527D     		ldrb	r2, [r2, #21]
 1749 07a4 1A70     		strb	r2, [r3]
 331:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1750              		.loc 1 331 0
 1751 07a6 4020     		movs	r0, #64
 1752 07a8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 332:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder = 0x55555555;
 1753              		.loc 1 332 0
 1754 07ac 0D4B     		ldr	r3, .L101
 1755 07ae 0F4A     		ldr	r2, .L101+8
 1756 07b0 1A60     		str	r2, [r3]
 333:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(controller == B_CS1) {
 1757              		.loc 1 333 0
 1758 07b2 FB1D     		adds	r3, r7, #7
 1759 07b4 1B78     		ldrb	r3, [r3]
 1760 07b6 082B     		cmp	r3, #8
 1761 07b8 04D1     		bne	.L98
 334:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		select_controller(B_CS1);
 1762              		.loc 1 334 0
 1763 07ba 0820     		movs	r0, #8
 1764 07bc FFF7FEFF 		bl	select_controller
 335:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_wait_ready();
 1765              		.loc 1 335 0
 1766 07c0 FFF7FEFF 		bl	graphic_wait_ready
 1767              	.L98:
 336:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 337:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(controller == B_CS2){
 1768              		.loc 1 337 0
 1769 07c4 FB1D     		adds	r3, r7, #7
 1770 07c6 1B78     		ldrb	r3, [r3]
 1771 07c8 102B     		cmp	r3, #16
 1772 07ca 04D1     		bne	.L99
 338:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		select_controller(B_CS2);
 1773              		.loc 1 338 0
 1774 07cc 1020     		movs	r0, #16
 1775 07ce FFF7FEFF 		bl	select_controller
 339:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_wait_ready();
 1776              		.loc 1 339 0
 1777 07d2 FFF7FEFF 		bl	graphic_wait_ready
 1778              	.L99:
 340:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 341:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// graphic_read = RV (what???)
 342:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	return rv;
 1779              		.loc 1 342 0
 1780 07d6 0F23     		movs	r3, #15
 1781 07d8 FB18     		adds	r3, r7, r3
 1782 07da 1B78     		ldrb	r3, [r3]
 343:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1783              		.loc 1 343 0
 1784 07dc 1800     		movs	r0, r3
 1785 07de BD46     		mov	sp, r7
 1786 07e0 04B0     		add	sp, sp, #16
 1787              		@ sp needed
 1788 07e2 80BD     		pop	{r7, pc}
 1789              	.L102:
 1790              		.align	2
 1791              	.L101:
 1792 07e4 00100240 		.word	1073876992
 1793 07e8 55550000 		.word	21845
 1794 07ec 55555555 		.word	1431655765
 1795              		.cfi_endproc
 1796              	.LFE24:
 1798              		.align	1
 1799              		.global	graphic_write
 1800              		.syntax unified
 1801              		.code	16
 1802              		.thumb_func
 1803              		.fpu softvfp
 1805              	graphic_write:
 1806              	.LFB25:
 344:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 345:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void graphic_write(uint8_t value, uint8_t controller) {
 1807              		.loc 1 345 0
 1808              		.cfi_startproc
 1809              		@ args = 0, pretend = 0, frame = 8
 1810              		@ frame_needed = 1, uses_anonymous_args = 0
 1811 07f0 80B5     		push	{r7, lr}
 1812              		.cfi_def_cfa_offset 8
 1813              		.cfi_offset 7, -8
 1814              		.cfi_offset 14, -4
 1815 07f2 82B0     		sub	sp, sp, #8
 1816              		.cfi_def_cfa_offset 16
 1817 07f4 00AF     		add	r7, sp, #0
 1818              		.cfi_def_cfa_register 7
 1819 07f6 0200     		movs	r2, r0
 1820 07f8 FB1D     		adds	r3, r7, #7
 1821 07fa 1A70     		strb	r2, [r3]
 1822 07fc BB1D     		adds	r3, r7, #6
 1823 07fe 0A1C     		adds	r2, r1, #0
 1824 0800 1A70     		strb	r2, [r3]
 346:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->odrHigh = value;
 1825              		.loc 1 346 0
 1826 0802 1A4A     		ldr	r2, .L106
 1827 0804 FB1D     		adds	r3, r7, #7
 1828 0806 1B78     		ldrb	r3, [r3]
 1829 0808 5375     		strb	r3, [r2, #21]
 347:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	select_controller(controller);
 1830              		.loc 1 347 0
 1831 080a BB1D     		adds	r3, r7, #6
 1832 080c 1B78     		ldrb	r3, [r3]
 1833 080e 1800     		movs	r0, r3
 1834 0810 FFF7FEFF 		bl	select_controller
 348:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_500ns();
 1835              		.loc 1 348 0
 1836 0814 FFF7FEFF 		bl	delay_500ns
 349:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_set(B_E);
 1837              		.loc 1 349 0
 1838 0818 4020     		movs	r0, #64
 1839 081a FFF7FEFF 		bl	graphic_ctrl_bit_set
 350:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	delay_500ns();
 1840              		.loc 1 350 0
 1841 081e FFF7FEFF 		bl	delay_500ns
 351:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1842              		.loc 1 351 0
 1843 0822 4020     		movs	r0, #64
 1844 0824 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 352:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(controller & B_CS1) {
 1845              		.loc 1 352 0
 1846 0828 BB1D     		adds	r3, r7, #6
 1847 082a 1B78     		ldrb	r3, [r3]
 1848 082c 0822     		movs	r2, #8
 1849 082e 1340     		ands	r3, r2
 1850 0830 04D0     		beq	.L104
 353:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		select_controller(B_CS1);
 1851              		.loc 1 353 0
 1852 0832 0820     		movs	r0, #8
 1853 0834 FFF7FEFF 		bl	select_controller
 354:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_wait_ready();
 1854              		.loc 1 354 0
 1855 0838 FFF7FEFF 		bl	graphic_wait_ready
 1856              	.L104:
 355:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 356:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(controller & B_CS2) {
 1857              		.loc 1 356 0
 1858 083c BB1D     		adds	r3, r7, #6
 1859 083e 1B78     		ldrb	r3, [r3]
 1860 0840 1022     		movs	r2, #16
 1861 0842 1340     		ands	r3, r2
 1862 0844 04D0     		beq	.L105
 357:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		select_controller(B_CS2);
 1863              		.loc 1 357 0
 1864 0846 1020     		movs	r0, #16
 1865 0848 FFF7FEFF 		bl	select_controller
 358:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_wait_ready();
 1866              		.loc 1 358 0
 1867 084c FFF7FEFF 		bl	graphic_wait_ready
 1868              	.L105:
 359:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 360:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->odrHigh = 0;
 1869              		.loc 1 360 0
 1870 0850 064B     		ldr	r3, .L106
 1871 0852 0022     		movs	r2, #0
 1872 0854 5A75     		strb	r2, [r3, #21]
 361:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_set(B_E);
 1873              		.loc 1 361 0
 1874 0856 4020     		movs	r0, #64
 1875 0858 FFF7FEFF 		bl	graphic_ctrl_bit_set
 362:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	select_controller(0);
 1876              		.loc 1 362 0
 1877 085c 0020     		movs	r0, #0
 1878 085e FFF7FEFF 		bl	select_controller
 363:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1879              		.loc 1 363 0
 1880 0862 C046     		nop
 1881 0864 BD46     		mov	sp, r7
 1882 0866 02B0     		add	sp, sp, #8
 1883              		@ sp needed
 1884 0868 80BD     		pop	{r7, pc}
 1885              	.L107:
 1886 086a C046     		.align	2
 1887              	.L106:
 1888 086c 00100240 		.word	1073876992
 1889              		.cfi_endproc
 1890              	.LFE25:
 1892              		.align	1
 1893              		.global	graphic_write_command
 1894              		.syntax unified
 1895              		.code	16
 1896              		.thumb_func
 1897              		.fpu softvfp
 1899              	graphic_write_command:
 1900              	.LFB26:
 364:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 365:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void graphic_write_command(uint8_t commandToWrite, uint8_t controller) {
 1901              		.loc 1 365 0
 1902              		.cfi_startproc
 1903              		@ args = 0, pretend = 0, frame = 8
 1904              		@ frame_needed = 1, uses_anonymous_args = 0
 1905 0870 80B5     		push	{r7, lr}
 1906              		.cfi_def_cfa_offset 8
 1907              		.cfi_offset 7, -8
 1908              		.cfi_offset 14, -4
 1909 0872 82B0     		sub	sp, sp, #8
 1910              		.cfi_def_cfa_offset 16
 1911 0874 00AF     		add	r7, sp, #0
 1912              		.cfi_def_cfa_register 7
 1913 0876 0200     		movs	r2, r0
 1914 0878 FB1D     		adds	r3, r7, #7
 1915 087a 1A70     		strb	r2, [r3]
 1916 087c BB1D     		adds	r3, r7, #6
 1917 087e 0A1C     		adds	r2, r1, #0
 1918 0880 1A70     		strb	r2, [r3]
 366:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1919              		.loc 1 366 0
 1920 0882 4020     		movs	r0, #64
 1921 0884 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 367:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	select_controller(controller);
 1922              		.loc 1 367 0
 1923 0888 BB1D     		adds	r3, r7, #6
 1924 088a 1B78     		ldrb	r3, [r3]
 1925 088c 1800     		movs	r0, r3
 1926 088e FFF7FEFF 		bl	select_controller
 368:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_RS | B_RW);
 1927              		.loc 1 368 0
 1928 0892 0320     		movs	r0, #3
 1929 0894 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 369:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write(commandToWrite, controller);
 1930              		.loc 1 369 0
 1931 0898 BB1D     		adds	r3, r7, #6
 1932 089a 1A78     		ldrb	r2, [r3]
 1933 089c FB1D     		adds	r3, r7, #7
 1934 089e 1B78     		ldrb	r3, [r3]
 1935 08a0 1100     		movs	r1, r2
 1936 08a2 1800     		movs	r0, r3
 1937 08a4 FFF7FEFF 		bl	graphic_write
 370:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1938              		.loc 1 370 0
 1939 08a8 C046     		nop
 1940 08aa BD46     		mov	sp, r7
 1941 08ac 02B0     		add	sp, sp, #8
 1942              		@ sp needed
 1943 08ae 80BD     		pop	{r7, pc}
 1944              		.cfi_endproc
 1945              	.LFE26:
 1947              		.align	1
 1948              		.global	graphic_write_data
 1949              		.syntax unified
 1950              		.code	16
 1951              		.thumb_func
 1952              		.fpu softvfp
 1954              	graphic_write_data:
 1955              	.LFB27:
 371:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 372:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void graphic_write_data(uint8_t data, uint8_t controller) {
 1956              		.loc 1 372 0
 1957              		.cfi_startproc
 1958              		@ args = 0, pretend = 0, frame = 8
 1959              		@ frame_needed = 1, uses_anonymous_args = 0
 1960 08b0 80B5     		push	{r7, lr}
 1961              		.cfi_def_cfa_offset 8
 1962              		.cfi_offset 7, -8
 1963              		.cfi_offset 14, -4
 1964 08b2 82B0     		sub	sp, sp, #8
 1965              		.cfi_def_cfa_offset 16
 1966 08b4 00AF     		add	r7, sp, #0
 1967              		.cfi_def_cfa_register 7
 1968 08b6 0200     		movs	r2, r0
 1969 08b8 FB1D     		adds	r3, r7, #7
 1970 08ba 1A70     		strb	r2, [r3]
 1971 08bc BB1D     		adds	r3, r7, #6
 1972 08be 0A1C     		adds	r2, r1, #0
 1973 08c0 1A70     		strb	r2, [r3]
 373:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_E);
 1974              		.loc 1 373 0
 1975 08c2 4020     		movs	r0, #64
 1976 08c4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 374:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	select_controller(controller);
 1977              		.loc 1 374 0
 1978 08c8 BB1D     		adds	r3, r7, #6
 1979 08ca 1B78     		ldrb	r3, [r3]
 1980 08cc 1800     		movs	r0, r3
 1981 08ce FFF7FEFF 		bl	select_controller
 375:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_set(B_RS);
 1982              		.loc 1 375 0
 1983 08d2 0120     		movs	r0, #1
 1984 08d4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 376:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_ctrl_bit_clear(B_RW);
 1985              		.loc 1 376 0
 1986 08d8 0220     		movs	r0, #2
 1987 08da FFF7FEFF 		bl	graphic_ctrl_bit_clear
 377:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write(data, controller);
 1988              		.loc 1 377 0
 1989 08de BB1D     		adds	r3, r7, #6
 1990 08e0 1A78     		ldrb	r2, [r3]
 1991 08e2 FB1D     		adds	r3, r7, #7
 1992 08e4 1B78     		ldrb	r3, [r3]
 1993 08e6 1100     		movs	r1, r2
 1994 08e8 1800     		movs	r0, r3
 1995 08ea FFF7FEFF 		bl	graphic_write
 378:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 1996              		.loc 1 378 0
 1997 08ee C046     		nop
 1998 08f0 BD46     		mov	sp, r7
 1999 08f2 02B0     		add	sp, sp, #8
 2000              		@ sp needed
 2001 08f4 80BD     		pop	{r7, pc}
 2002              		.cfi_endproc
 2003              	.LFE27:
 2005              		.align	1
 2006              		.global	graphic_read_data
 2007              		.syntax unified
 2008              		.code	16
 2009              		.thumb_func
 2010              		.fpu softvfp
 2012              	graphic_read_data:
 2013              	.LFB28:
 379:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 380:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** uint8_t graphic_read_data(unsigned char controller) {
 2014              		.loc 1 380 0
 2015              		.cfi_startproc
 2016              		@ args = 0, pretend = 0, frame = 8
 2017              		@ frame_needed = 1, uses_anonymous_args = 0
 2018 08f6 80B5     		push	{r7, lr}
 2019              		.cfi_def_cfa_offset 8
 2020              		.cfi_offset 7, -8
 2021              		.cfi_offset 14, -4
 2022 08f8 82B0     		sub	sp, sp, #8
 2023              		.cfi_def_cfa_offset 16
 2024 08fa 00AF     		add	r7, sp, #0
 2025              		.cfi_def_cfa_register 7
 2026 08fc 0200     		movs	r2, r0
 2027 08fe FB1D     		adds	r3, r7, #7
 2028 0900 1A70     		strb	r2, [r3]
 381:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	(void) graphic_read(controller);
 2029              		.loc 1 381 0
 2030 0902 FB1D     		adds	r3, r7, #7
 2031 0904 1B78     		ldrb	r3, [r3]
 2032 0906 1800     		movs	r0, r3
 2033 0908 FFF7FEFF 		bl	graphic_read
 382:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	return graphic_read(controller);
 2034              		.loc 1 382 0
 2035 090c FB1D     		adds	r3, r7, #7
 2036 090e 1B78     		ldrb	r3, [r3]
 2037 0910 1800     		movs	r0, r3
 2038 0912 FFF7FEFF 		bl	graphic_read
 2039 0916 0300     		movs	r3, r0
 383:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 2040              		.loc 1 383 0
 2041 0918 1800     		movs	r0, r3
 2042 091a BD46     		mov	sp, r7
 2043 091c 02B0     		add	sp, sp, #8
 2044              		@ sp needed
 2045 091e 80BD     		pop	{r7, pc}
 2046              		.cfi_endproc
 2047              	.LFE28:
 2049              		.align	1
 2050              		.global	graphic_clear_screen
 2051              		.syntax unified
 2052              		.code	16
 2053              		.thumb_func
 2054              		.fpu softvfp
 2056              	graphic_clear_screen:
 2057              	.LFB29:
 384:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 385:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void graphic_clear_screen(void) {
 2058              		.loc 1 385 0
 2059              		.cfi_startproc
 2060              		@ args = 0, pretend = 0, frame = 8
 2061              		@ frame_needed = 1, uses_anonymous_args = 0
 2062 0920 80B5     		push	{r7, lr}
 2063              		.cfi_def_cfa_offset 8
 2064              		.cfi_offset 7, -8
 2065              		.cfi_offset 14, -4
 2066 0922 82B0     		sub	sp, sp, #8
 2067              		.cfi_def_cfa_offset 16
 2068 0924 00AF     		add	r7, sp, #0
 2069              		.cfi_def_cfa_register 7
 386:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	uint8_t page, add;
 387:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	for(page = 0; page < 8; page++){
 2070              		.loc 1 387 0
 2071 0926 FB1D     		adds	r3, r7, #7
 2072 0928 0022     		movs	r2, #0
 2073 092a 1A70     		strb	r2, [r3]
 2074 092c 23E0     		b	.L113
 2075              	.L116:
 388:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_write_command(LCD_SET_PAGE	| page, B_CS1|B_CS2);
 2076              		.loc 1 388 0
 2077 092e FB1D     		adds	r3, r7, #7
 2078 0930 1B78     		ldrb	r3, [r3]
 2079 0932 4822     		movs	r2, #72
 2080 0934 5242     		rsbs	r2, r2, #0
 2081 0936 1343     		orrs	r3, r2
 2082 0938 DBB2     		uxtb	r3, r3
 2083 093a 1821     		movs	r1, #24
 2084 093c 1800     		movs	r0, r3
 2085 093e FFF7FEFF 		bl	graphic_write_command
 389:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_write_command(LCD_SET_ADD	| 0, 	B_CS1|B_CS2);
 2086              		.loc 1 389 0
 2087 0942 1821     		movs	r1, #24
 2088 0944 4020     		movs	r0, #64
 2089 0946 FFF7FEFF 		bl	graphic_write_command
 390:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		for(add = 0; add < 64; add++){
 2090              		.loc 1 390 0
 2091 094a BB1D     		adds	r3, r7, #6
 2092 094c 0022     		movs	r2, #0
 2093 094e 1A70     		strb	r2, [r3]
 2094 0950 08E0     		b	.L114
 2095              	.L115:
 391:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 			graphic_write_data(0,B_CS1|B_CS2);
 2096              		.loc 1 391 0 discriminator 3
 2097 0952 1821     		movs	r1, #24
 2098 0954 0020     		movs	r0, #0
 2099 0956 FFF7FEFF 		bl	graphic_write_data
 390:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		for(add = 0; add < 64; add++){
 2100              		.loc 1 390 0 discriminator 3
 2101 095a BB1D     		adds	r3, r7, #6
 2102 095c 1A78     		ldrb	r2, [r3]
 2103 095e BB1D     		adds	r3, r7, #6
 2104 0960 0132     		adds	r2, r2, #1
 2105 0962 1A70     		strb	r2, [r3]
 2106              	.L114:
 390:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		for(add = 0; add < 64; add++){
 2107              		.loc 1 390 0 is_stmt 0 discriminator 1
 2108 0964 BB1D     		adds	r3, r7, #6
 2109 0966 1B78     		ldrb	r3, [r3]
 2110 0968 3F2B     		cmp	r3, #63
 2111 096a F2D9     		bls	.L115
 387:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_write_command(LCD_SET_PAGE	| page, B_CS1|B_CS2);
 2112              		.loc 1 387 0 is_stmt 1 discriminator 2
 2113 096c FB1D     		adds	r3, r7, #7
 2114 096e 1A78     		ldrb	r2, [r3]
 2115 0970 FB1D     		adds	r3, r7, #7
 2116 0972 0132     		adds	r2, r2, #1
 2117 0974 1A70     		strb	r2, [r3]
 2118              	.L113:
 387:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		graphic_write_command(LCD_SET_PAGE	| page, B_CS1|B_CS2);
 2119              		.loc 1 387 0 is_stmt 0 discriminator 1
 2120 0976 FB1D     		adds	r3, r7, #7
 2121 0978 1B78     		ldrb	r3, [r3]
 2122 097a 072B     		cmp	r3, #7
 2123 097c D7D9     		bls	.L116
 392:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		}
 393:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 394:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 2124              		.loc 1 394 0 is_stmt 1
 2125 097e C046     		nop
 2126 0980 BD46     		mov	sp, r7
 2127 0982 02B0     		add	sp, sp, #8
 2128              		@ sp needed
 2129 0984 80BD     		pop	{r7, pc}
 2130              		.cfi_endproc
 2131              	.LFE29:
 2133              		.align	1
 2134              		.global	setup_for_graphic_display
 2135              		.syntax unified
 2136              		.code	16
 2137              		.thumb_func
 2138              		.fpu softvfp
 2140              	setup_for_graphic_display:
 2141              	.LFB30:
 395:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 396:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void setup_for_graphic_display(void){
 2142              		.loc 1 396 0
 2143              		.cfi_startproc
 2144              		@ args = 0, pretend = 0, frame = 0
 2145              		@ frame_needed = 1, uses_anonymous_args = 0
 2146 0986 80B5     		push	{r7, lr}
 2147              		.cfi_def_cfa_offset 8
 2148              		.cfi_offset 7, -8
 2149              		.cfi_offset 14, -4
 2150 0988 00AF     		add	r7, sp, #0
 2151              		.cfi_def_cfa_register 7
 397:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->moder = 0x55555555;
 2152              		.loc 1 397 0
 2153 098a 044B     		ldr	r3, .L118
 2154 098c 044A     		ldr	r2, .L118+4
 2155 098e 1A60     		str	r2, [r3]
 398:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	GPIO_E->ospeedr = 0x55555555;
 2156              		.loc 1 398 0
 2157 0990 024B     		ldr	r3, .L118
 2158 0992 034A     		ldr	r2, .L118+4
 2159 0994 9A60     		str	r2, [r3, #8]
 399:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }
 2160              		.loc 1 399 0
 2161 0996 C046     		nop
 2162 0998 BD46     		mov	sp, r7
 2163              		@ sp needed
 2164 099a 80BD     		pop	{r7, pc}
 2165              	.L119:
 2166              		.align	2
 2167              	.L118:
 2168 099c 00100240 		.word	1073876992
 2169 09a0 55555555 		.word	1431655765
 2170              		.cfi_endproc
 2171              	.LFE30:
 2173              		.align	1
 2174              		.global	pixel
 2175              		.syntax unified
 2176              		.code	16
 2177              		.thumb_func
 2178              		.fpu softvfp
 2180              	pixel:
 2181              	.LFB31:
 400:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 
 401:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** void pixel(unsigned char x, unsigned char y, unsigned char set) {
 2182              		.loc 1 401 0
 2183              		.cfi_startproc
 2184              		@ args = 0, pretend = 0, frame = 16
 2185              		@ frame_needed = 1, uses_anonymous_args = 0
 2186 09a4 90B5     		push	{r4, r7, lr}
 2187              		.cfi_def_cfa_offset 12
 2188              		.cfi_offset 4, -12
 2189              		.cfi_offset 7, -8
 2190              		.cfi_offset 14, -4
 2191 09a6 85B0     		sub	sp, sp, #20
 2192              		.cfi_def_cfa_offset 32
 2193 09a8 00AF     		add	r7, sp, #0
 2194              		.cfi_def_cfa_register 7
 2195 09aa 0400     		movs	r4, r0
 2196 09ac 0800     		movs	r0, r1
 2197 09ae 1100     		movs	r1, r2
 2198 09b0 FB1D     		adds	r3, r7, #7
 2199 09b2 221C     		adds	r2, r4, #0
 2200 09b4 1A70     		strb	r2, [r3]
 2201 09b6 BB1D     		adds	r3, r7, #6
 2202 09b8 021C     		adds	r2, r0, #0
 2203 09ba 1A70     		strb	r2, [r3]
 2204 09bc 7B1D     		adds	r3, r7, #5
 2205 09be 0A1C     		adds	r2, r1, #0
 2206 09c0 1A70     		strb	r2, [r3]
 402:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Kontrollera att x och y är i tillåtna intervall. 
 403:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if((x > 128 || x < 1) && (y > 64 || y < 1)) return;
 2207              		.loc 1 403 0
 2208 09c2 FB1D     		adds	r3, r7, #7
 2209 09c4 1B78     		ldrb	r3, [r3]
 2210 09c6 802B     		cmp	r3, #128
 2211 09c8 03D8     		bhi	.L121
 2212              		.loc 1 403 0 is_stmt 0 discriminator 2
 2213 09ca FB1D     		adds	r3, r7, #7
 2214 09cc 1B78     		ldrb	r3, [r3]
 2215 09ce 002B     		cmp	r3, #0
 2216 09d0 09D1     		bne	.L122
 2217              	.L121:
 2218              		.loc 1 403 0 discriminator 3
 2219 09d2 BB1D     		adds	r3, r7, #6
 2220 09d4 1B78     		ldrb	r3, [r3]
 2221 09d6 402B     		cmp	r3, #64
 2222 09d8 00D9     		bls	.LCB1809
 2223 09da CCE0     		b	.L143	@long jump
 2224              	.LCB1809:
 2225              		.loc 1 403 0 discriminator 4
 2226 09dc BB1D     		adds	r3, r7, #6
 2227 09de 1B78     		ldrb	r3, [r3]
 2228 09e0 002B     		cmp	r3, #0
 2229 09e2 00D1     		bne	.LCB1813
 2230 09e4 C7E0     		b	.L143	@long jump
 2231              	.LCB1813:
 2232              	.L122:
 404:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(set != 0 && set != 1) return;
 2233              		.loc 1 404 0 is_stmt 1
 2234 09e6 7B1D     		adds	r3, r7, #5
 2235 09e8 1B78     		ldrb	r3, [r3]
 2236 09ea 002B     		cmp	r3, #0
 2237 09ec 04D0     		beq	.L125
 2238              		.loc 1 404 0 is_stmt 0 discriminator 1
 2239 09ee 7B1D     		adds	r3, r7, #5
 2240 09f0 1B78     		ldrb	r3, [r3]
 2241 09f2 012B     		cmp	r3, #1
 2242 09f4 00D0     		beq	.LCB1822
 2243 09f6 C0E0     		b	.L144	@long jump
 2244              	.LCB1822:
 2245              	.L125:
 405:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	
 406:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	uint8_t index = (y - 1) / 8;
 2246              		.loc 1 406 0 is_stmt 1
 2247 09f8 BB1D     		adds	r3, r7, #6
 2248 09fa 1B78     		ldrb	r3, [r3]
 2249 09fc 013B     		subs	r3, r3, #1
 2250 09fe 002B     		cmp	r3, #0
 2251 0a00 00DA     		bge	.L126
 2252 0a02 0733     		adds	r3, r3, #7
 2253              	.L126:
 2254 0a04 DB10     		asrs	r3, r3, #3
 2255 0a06 1A00     		movs	r2, r3
 2256 0a08 0C23     		movs	r3, #12
 2257 0a0a FB18     		adds	r3, r7, r3
 2258 0a0c 1A70     		strb	r2, [r3]
 407:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	uint8_t mask;
 408:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	switch((y - 1) % 8){
 2259              		.loc 1 408 0
 2260 0a0e BB1D     		adds	r3, r7, #6
 2261 0a10 1B78     		ldrb	r3, [r3]
 2262 0a12 013B     		subs	r3, r3, #1
 2263 0a14 5B4A     		ldr	r2, .L145
 2264 0a16 1340     		ands	r3, r2
 2265 0a18 04D5     		bpl	.L127
 2266 0a1a 013B     		subs	r3, r3, #1
 2267 0a1c 0822     		movs	r2, #8
 2268 0a1e 5242     		rsbs	r2, r2, #0
 2269 0a20 1343     		orrs	r3, r2
 2270 0a22 0133     		adds	r3, r3, #1
 2271              	.L127:
 2272 0a24 072B     		cmp	r3, #7
 2273 0a26 2CD8     		bhi	.L128
 2274 0a28 9A00     		lsls	r2, r3, #2
 2275 0a2a 574B     		ldr	r3, .L145+4
 2276 0a2c D318     		adds	r3, r2, r3
 2277 0a2e 1B68     		ldr	r3, [r3]
 2278 0a30 9F46     		mov	pc, r3
 2279              		.section	.rodata
 2280              		.align	2
 2281              	.L130:
 2282 0030 320A0000 		.word	.L129
 2283 0034 3C0A0000 		.word	.L131
 2284 0038 460A0000 		.word	.L132
 2285 003c 500A0000 		.word	.L133
 2286 0040 5A0A0000 		.word	.L134
 2287 0044 640A0000 		.word	.L135
 2288 0048 6E0A0000 		.word	.L136
 2289 004c 780A0000 		.word	.L137
 2290              		.text
 2291              	.L129:
 409:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 0: mask = 1; break;
 2292              		.loc 1 409 0
 2293 0a32 0F23     		movs	r3, #15
 2294 0a34 FB18     		adds	r3, r7, r3
 2295 0a36 0122     		movs	r2, #1
 2296 0a38 1A70     		strb	r2, [r3]
 2297 0a3a 22E0     		b	.L128
 2298              	.L131:
 410:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 1: mask = 2; break;
 2299              		.loc 1 410 0
 2300 0a3c 0F23     		movs	r3, #15
 2301 0a3e FB18     		adds	r3, r7, r3
 2302 0a40 0222     		movs	r2, #2
 2303 0a42 1A70     		strb	r2, [r3]
 2304 0a44 1DE0     		b	.L128
 2305              	.L132:
 411:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 2: mask = 4; break;
 2306              		.loc 1 411 0
 2307 0a46 0F23     		movs	r3, #15
 2308 0a48 FB18     		adds	r3, r7, r3
 2309 0a4a 0422     		movs	r2, #4
 2310 0a4c 1A70     		strb	r2, [r3]
 2311 0a4e 18E0     		b	.L128
 2312              	.L133:
 412:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 3: mask = 8; break;
 2313              		.loc 1 412 0
 2314 0a50 0F23     		movs	r3, #15
 2315 0a52 FB18     		adds	r3, r7, r3
 2316 0a54 0822     		movs	r2, #8
 2317 0a56 1A70     		strb	r2, [r3]
 2318 0a58 13E0     		b	.L128
 2319              	.L134:
 413:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 4: mask = 0x10; break;
 2320              		.loc 1 413 0
 2321 0a5a 0F23     		movs	r3, #15
 2322 0a5c FB18     		adds	r3, r7, r3
 2323 0a5e 1022     		movs	r2, #16
 2324 0a60 1A70     		strb	r2, [r3]
 2325 0a62 0EE0     		b	.L128
 2326              	.L135:
 414:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 5: mask = 0x20; break;
 2327              		.loc 1 414 0
 2328 0a64 0F23     		movs	r3, #15
 2329 0a66 FB18     		adds	r3, r7, r3
 2330 0a68 2022     		movs	r2, #32
 2331 0a6a 1A70     		strb	r2, [r3]
 2332 0a6c 09E0     		b	.L128
 2333              	.L136:
 415:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 6: mask = 0x40; break;
 2334              		.loc 1 415 0
 2335 0a6e 0F23     		movs	r3, #15
 2336 0a70 FB18     		adds	r3, r7, r3
 2337 0a72 4022     		movs	r2, #64
 2338 0a74 1A70     		strb	r2, [r3]
 2339 0a76 04E0     		b	.L128
 2340              	.L137:
 416:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		case 7: mask = 0x80; break;
 2341              		.loc 1 416 0
 2342 0a78 0F23     		movs	r3, #15
 2343 0a7a FB18     		adds	r3, r7, r3
 2344 0a7c 8022     		movs	r2, #128
 2345 0a7e 1A70     		strb	r2, [r3]
 2346 0a80 C046     		nop
 2347              	.L128:
 417:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 418:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(set == 0){
 2348              		.loc 1 418 0
 2349 0a82 7B1D     		adds	r3, r7, #5
 2350 0a84 1B78     		ldrb	r3, [r3]
 2351 0a86 002B     		cmp	r3, #0
 2352 0a88 06D1     		bne	.L138
 419:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		mask = ~mask; // biten ska nollställas
 2353              		.loc 1 419 0
 2354 0a8a 0F23     		movs	r3, #15
 2355 0a8c FB18     		adds	r3, r7, r3
 2356 0a8e 0F22     		movs	r2, #15
 2357 0a90 BA18     		adds	r2, r7, r2
 2358 0a92 1278     		ldrb	r2, [r2]
 2359 0a94 D243     		mvns	r2, r2
 2360 0a96 1A70     		strb	r2, [r3]
 2361              	.L138:
 420:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 421:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	
 422:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	uint8_t f_x, controller;
 423:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	
 424:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	// Bestäm fysiska koordinater och välj styrkrets
 425:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(x > 64){
 2362              		.loc 1 425 0
 2363 0a98 FB1D     		adds	r3, r7, #7
 2364 0a9a 1B78     		ldrb	r3, [r3]
 2365 0a9c 402B     		cmp	r3, #64
 2366 0a9e 0AD9     		bls	.L139
 426:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		controller = B_CS2;
 2367              		.loc 1 426 0
 2368 0aa0 0D23     		movs	r3, #13
 2369 0aa2 FB18     		adds	r3, r7, r3
 2370 0aa4 1022     		movs	r2, #16
 2371 0aa6 1A70     		strb	r2, [r3]
 427:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		f_x = x - 65;
 2372              		.loc 1 427 0
 2373 0aa8 0E23     		movs	r3, #14
 2374 0aaa FB18     		adds	r3, r7, r3
 2375 0aac FA1D     		adds	r2, r7, #7
 2376 0aae 1278     		ldrb	r2, [r2]
 2377 0ab0 413A     		subs	r2, r2, #65
 2378 0ab2 1A70     		strb	r2, [r3]
 2379 0ab4 09E0     		b	.L140
 2380              	.L139:
 428:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}else{
 429:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		controller = B_CS1;
 2381              		.loc 1 429 0
 2382 0ab6 0D23     		movs	r3, #13
 2383 0ab8 FB18     		adds	r3, r7, r3
 2384 0aba 0822     		movs	r2, #8
 2385 0abc 1A70     		strb	r2, [r3]
 430:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		f_x = x - 1;
 2386              		.loc 1 430 0
 2387 0abe 0E23     		movs	r3, #14
 2388 0ac0 FB18     		adds	r3, r7, r3
 2389 0ac2 FA1D     		adds	r2, r7, #7
 2390 0ac4 1278     		ldrb	r2, [r2]
 2391 0ac6 013A     		subs	r2, r2, #1
 2392 0ac8 1A70     		strb	r2, [r3]
 2393              	.L140:
 431:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 432:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write_command(LCD_SET_ADD | f_x, controller);
 2394              		.loc 1 432 0
 2395 0aca 0E23     		movs	r3, #14
 2396 0acc FB18     		adds	r3, r7, r3
 2397 0ace 1B78     		ldrb	r3, [r3]
 2398 0ad0 4022     		movs	r2, #64
 2399 0ad2 1343     		orrs	r3, r2
 2400 0ad4 DAB2     		uxtb	r2, r3
 2401 0ad6 0D23     		movs	r3, #13
 2402 0ad8 FB18     		adds	r3, r7, r3
 2403 0ada 1B78     		ldrb	r3, [r3]
 2404 0adc 1900     		movs	r1, r3
 2405 0ade 1000     		movs	r0, r2
 2406 0ae0 FFF7FEFF 		bl	graphic_write_command
 433:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write_command(LCD_SET_PAGE | index, controller);
 2407              		.loc 1 433 0
 2408 0ae4 0C23     		movs	r3, #12
 2409 0ae6 FB18     		adds	r3, r7, r3
 2410 0ae8 1B78     		ldrb	r3, [r3]
 2411 0aea 4822     		movs	r2, #72
 2412 0aec 5242     		rsbs	r2, r2, #0
 2413 0aee 1343     		orrs	r3, r2
 2414 0af0 DAB2     		uxtb	r2, r3
 2415 0af2 0D23     		movs	r3, #13
 2416 0af4 FB18     		adds	r3, r7, r3
 2417 0af6 1B78     		ldrb	r3, [r3]
 2418 0af8 1900     		movs	r1, r3
 2419 0afa 1000     		movs	r0, r2
 2420 0afc FFF7FEFF 		bl	graphic_write_command
 434:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	uint8_t temp = graphic_read_data(controller);
 2421              		.loc 1 434 0
 2422 0b00 0B23     		movs	r3, #11
 2423 0b02 FC18     		adds	r4, r7, r3
 2424 0b04 0D23     		movs	r3, #13
 2425 0b06 FB18     		adds	r3, r7, r3
 2426 0b08 1B78     		ldrb	r3, [r3]
 2427 0b0a 1800     		movs	r0, r3
 2428 0b0c FFF7FEFF 		bl	graphic_read_data
 2429 0b10 0300     		movs	r3, r0
 2430 0b12 2370     		strb	r3, [r4]
 435:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write_command(LCD_SET_ADD | f_x, controller);
 2431              		.loc 1 435 0
 2432 0b14 0E23     		movs	r3, #14
 2433 0b16 FB18     		adds	r3, r7, r3
 2434 0b18 1B78     		ldrb	r3, [r3]
 2435 0b1a 4022     		movs	r2, #64
 2436 0b1c 1343     		orrs	r3, r2
 2437 0b1e DAB2     		uxtb	r2, r3
 2438 0b20 0D23     		movs	r3, #13
 2439 0b22 FB18     		adds	r3, r7, r3
 2440 0b24 1B78     		ldrb	r3, [r3]
 2441 0b26 1900     		movs	r1, r3
 2442 0b28 1000     		movs	r0, r2
 2443 0b2a FFF7FEFF 		bl	graphic_write_command
 436:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(set == 1){
 2444              		.loc 1 436 0
 2445 0b2e 7B1D     		adds	r3, r7, #5
 2446 0b30 1B78     		ldrb	r3, [r3]
 2447 0b32 012B     		cmp	r3, #1
 2448 0b34 0AD1     		bne	.L141
 437:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		mask = mask | temp;
 2449              		.loc 1 437 0
 2450 0b36 0F23     		movs	r3, #15
 2451 0b38 FB18     		adds	r3, r7, r3
 2452 0b3a 0F22     		movs	r2, #15
 2453 0b3c B918     		adds	r1, r7, r2
 2454 0b3e 0B22     		movs	r2, #11
 2455 0b40 BA18     		adds	r2, r7, r2
 2456 0b42 0978     		ldrb	r1, [r1]
 2457 0b44 1278     		ldrb	r2, [r2]
 2458 0b46 0A43     		orrs	r2, r1
 2459 0b48 1A70     		strb	r2, [r3]
 2460 0b4a 09E0     		b	.L142
 2461              	.L141:
 438:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}else{
 439:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 		mask = mask & temp;
 2462              		.loc 1 439 0
 2463 0b4c 0F23     		movs	r3, #15
 2464 0b4e FB18     		adds	r3, r7, r3
 2465 0b50 0F22     		movs	r2, #15
 2466 0b52 BA18     		adds	r2, r7, r2
 2467 0b54 0B21     		movs	r1, #11
 2468 0b56 7918     		adds	r1, r7, r1
 2469 0b58 1278     		ldrb	r2, [r2]
 2470 0b5a 0978     		ldrb	r1, [r1]
 2471 0b5c 0A40     		ands	r2, r1
 2472 0b5e 1A70     		strb	r2, [r3]
 2473              	.L142:
 440:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	}
 441:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	graphic_write_data(mask, controller);	
 2474              		.loc 1 441 0
 2475 0b60 0D23     		movs	r3, #13
 2476 0b62 FB18     		adds	r3, r7, r3
 2477 0b64 1A78     		ldrb	r2, [r3]
 2478 0b66 0F23     		movs	r3, #15
 2479 0b68 FB18     		adds	r3, r7, r3
 2480 0b6a 1B78     		ldrb	r3, [r3]
 2481 0b6c 1100     		movs	r1, r2
 2482 0b6e 1800     		movs	r0, r3
 2483 0b70 FFF7FEFF 		bl	graphic_write_data
 2484 0b74 02E0     		b	.L120
 2485              	.L143:
 403:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	if(set != 0 && set != 1) return;
 2486              		.loc 1 403 0
 2487 0b76 C046     		nop
 2488 0b78 00E0     		b	.L120
 2489              	.L144:
 404:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** 	
 2490              		.loc 1 404 0
 2491 0b7a C046     		nop
 2492              	.L120:
 442:E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay\gpio.c **** }...
 2493              		.loc 1 442 0
 2494 0b7c BD46     		mov	sp, r7
 2495 0b7e 05B0     		add	sp, sp, #20
 2496              		@ sp needed
 2497 0b80 90BD     		pop	{r4, r7, pc}
 2498              	.L146:
 2499 0b82 C046     		.align	2
 2500              	.L145:
 2501 0b84 07000080 		.word	-2147483641
 2502 0b88 30000000 		.word	.L130
 2503              		.cfi_endproc
 2504              	.LFE31:
 2506              	.Letext0:
 2507              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 2508              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 2509              		.file 4 "E:/DAT017/CodeLite files/Moplaborationer/graphicdisplay/gpio.h"
