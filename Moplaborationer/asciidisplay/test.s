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
  24              		.file 1 "E:/DAT017/CodeLite files/Moplaborationer/asciidisplay/gpio.c"
   1:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** #include "gpio.h"
   2:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** #include "sys_delay.h"
   3:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
   4:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void setup_for_keypad(GPIO* _gpio)
   5:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
   6:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt pinnar 15-12 till utportar
   7:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// och pinnar 11-8 till inportar.
   8:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     _gpio->moder &= 0x0000FFFF;
  38              		.loc 1 8 0
  39 0008 7B68     		ldr	r3, [r7, #4]
  40 000a 1B68     		ldr	r3, [r3]
  41 000c 1B04     		lsls	r3, r3, #16
  42 000e 1A0C     		lsrs	r2, r3, #16
  43 0010 7B68     		ldr	r3, [r7, #4]
  44 0012 1A60     		str	r2, [r3]
   9:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     _gpio->moder |= 0x5500FFFF;
  45              		.loc 1 9 0
  46 0014 7B68     		ldr	r3, [r7, #4]
  47 0016 1B68     		ldr	r3, [r3]
  48 0018 114A     		ldr	r2, .L2
  49 001a 1A43     		orrs	r2, r3
  50 001c 7B68     		ldr	r3, [r7, #4]
  51 001e 1A60     		str	r2, [r3]
  10:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
  11:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt pinnar 15-12 till "push-pull"
  12:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// och pinnar 11-8 till "open drain".
  13:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     _gpio->otyper &= 0xFFFF00FF;
  52              		.loc 1 13 0
  53 0020 7B68     		ldr	r3, [r7, #4]
  54 0022 9B88     		ldrh	r3, [r3, #4]
  55 0024 FF22     		movs	r2, #255
  56 0026 1340     		ands	r3, r2
  57 0028 9AB2     		uxth	r2, r3
  58 002a 7B68     		ldr	r3, [r7, #4]
  59 002c 9A80     		strh	r2, [r3, #4]
  14:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     _gpio->otyper |= 0x00000F00;
  60              		.loc 1 14 0
  61 002e 7B68     		ldr	r3, [r7, #4]
  62 0030 9B88     		ldrh	r3, [r3, #4]
  63 0032 F022     		movs	r2, #240
  64 0034 1201     		lsls	r2, r2, #4
  65 0036 1343     		orrs	r3, r2
  66 0038 9AB2     		uxth	r2, r3
  67 003a 7B68     		ldr	r3, [r7, #4]
  68 003c 9A80     		strh	r2, [r3, #4]
  15:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
  16:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt pinnar 15-12 till "floating"
  17:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// och pinnar 11-8 till "pull-down"
  18:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     _gpio->pupdr &= 0x0000FFFF;
  69              		.loc 1 18 0
  70 003e 7B68     		ldr	r3, [r7, #4]
  71 0040 DB68     		ldr	r3, [r3, #12]
  72 0042 1B04     		lsls	r3, r3, #16
  73 0044 1A0C     		lsrs	r2, r3, #16
  74 0046 7B68     		ldr	r3, [r7, #4]
  75 0048 DA60     		str	r2, [r3, #12]
  19:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     _gpio->pupdr |= 0x00AA0000;
  76              		.loc 1 19 0
  77 004a 7B68     		ldr	r3, [r7, #4]
  78 004c DB68     		ldr	r3, [r3, #12]
  79 004e AA22     		movs	r2, #170
  80 0050 1204     		lsls	r2, r2, #16
  81 0052 1A43     		orrs	r2, r3
  82 0054 7B68     		ldr	r3, [r7, #4]
  83 0056 DA60     		str	r2, [r3, #12]
  20:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
  21:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
  22:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void setup_for_seg_disp(GPIO* _gpio) 
  23:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
  24:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt pinnar 7-0 till utportar
  25:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	_gpio->moder &= 0xFFFF0000;
 119              		.loc 1 25 0
 120 006c 7B68     		ldr	r3, [r7, #4]
 121 006e 1B68     		ldr	r3, [r3]
 122 0070 1B0C     		lsrs	r3, r3, #16
 123 0072 1A04     		lsls	r2, r3, #16
 124 0074 7B68     		ldr	r3, [r7, #4]
 125 0076 1A60     		str	r2, [r3]
  26:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	_gpio->moder |= 0x00005555;
 126              		.loc 1 26 0
 127 0078 7B68     		ldr	r3, [r7, #4]
 128 007a 1B68     		ldr	r3, [r3]
 129 007c 034A     		ldr	r2, .L5
 130 007e 1A43     		orrs	r2, r3
 131 0080 7B68     		ldr	r3, [r7, #4]
 132 0082 1A60     		str	r2, [r3]
  27:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
  28:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt pinnar 7-0 till "push-pull"
  29:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//_gpio->otyper &= 0xFFFFFF00;
  30:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//_gpio->otyper |= 0x000000FF;
  31:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
  32:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätter pinnar 4-0 till "pull-down"
  33:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//_gpio->pupdr &= 0xFFFFFF00;
  34:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//_gpio->pupdr |= 0x000000AA;
  35:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
  36:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
  37:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** unsigned char keyb(void)
  38:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
  39:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	unsigned char keys[] = {
 188              		.loc 1 39 0
 189 0096 3B1D     		adds	r3, r7, #4
 190 0098 1F4A     		ldr	r2, .L13
 191 009a 13CA     		ldmia	r2!, {r0, r1, r4}
 192 009c 13C3     		stmia	r3!, {r0, r1, r4}
 193 009e 1268     		ldr	r2, [r2]
 194 00a0 1A60     		str	r2, [r3]
  40:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		1,  2,  3,  10,
  41:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		4,  5,  6,  11,
  42:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		7,  8,  9,  12,
  43:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		14, 0,  15, 13
  44:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	};
  45:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	unsigned char row, col;
  46:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	for(row = 0; row < 4; row++) {
 195              		.loc 1 46 0
 196 00a2 1723     		movs	r3, #23
 197 00a4 FB18     		adds	r3, r7, r3
 198 00a6 0022     		movs	r2, #0
 199 00a8 1A70     		strb	r2, [r3]
 200 00aa 2AE0     		b	.L8
 201              	.L11:
  47:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		deactivate_rows(GPIO_D);
 202              		.loc 1 47 0
 203 00ac 1B4B     		ldr	r3, .L13+4
 204 00ae 1800     		movs	r0, r3
 205 00b0 FFF7FEFF 		bl	deactivate_rows
  48:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		activate_row(GPIO_D, row);
 206              		.loc 1 48 0
 207 00b4 1723     		movs	r3, #23
 208 00b6 FB18     		adds	r3, r7, r3
 209 00b8 1B78     		ldrb	r3, [r3]
 210 00ba 184A     		ldr	r2, .L13+4
 211 00bc 1900     		movs	r1, r3
 212 00be 1000     		movs	r0, r2
 213 00c0 FFF7FEFF 		bl	activate_row
  49:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		col = read_col(GPIO_D);
 214              		.loc 1 49 0
 215 00c4 1623     		movs	r3, #22
 216 00c6 FC18     		adds	r4, r7, r3
 217 00c8 144B     		ldr	r3, .L13+4
 218 00ca 1800     		movs	r0, r3
 219 00cc FFF7FEFF 		bl	read_col
 220 00d0 0300     		movs	r3, r0
 221 00d2 2370     		strb	r3, [r4]
  50:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		if(col != 0xFF) {
 222              		.loc 1 50 0
 223 00d4 1623     		movs	r3, #22
 224 00d6 FB18     		adds	r3, r7, r3
 225 00d8 1B78     		ldrb	r3, [r3]
 226 00da FF2B     		cmp	r3, #255
 227 00dc 0AD0     		beq	.L9
  51:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 			return keys[ 4 * row + col];
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
  46:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		deactivate_rows(GPIO_D);
 241              		.loc 1 46 0 discriminator 2
 242 00f4 1723     		movs	r3, #23
 243 00f6 FB18     		adds	r3, r7, r3
 244 00f8 1A78     		ldrb	r2, [r3]
 245 00fa 1723     		movs	r3, #23
 246 00fc FB18     		adds	r3, r7, r3
 247 00fe 0132     		adds	r2, r2, #1
 248 0100 1A70     		strb	r2, [r3]
 249              	.L8:
  46:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		deactivate_rows(GPIO_D);
 250              		.loc 1 46 0 is_stmt 0 discriminator 1
 251 0102 1723     		movs	r3, #23
 252 0104 FB18     		adds	r3, r7, r3
 253 0106 1B78     		ldrb	r3, [r3]
 254 0108 032B     		cmp	r3, #3
 255 010a CFD9     		bls	.L11
  52:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		}
  53:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	}
  54:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	return 0xFF;
 256              		.loc 1 54 0 is_stmt 1
 257 010c FF23     		movs	r3, #255
 258              	.L12:
  55:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
  56:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
  57:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void out7seg(GPIO* _gpio, unsigned char c)
  58:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
  59:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     unsigned short result[] = { 
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
  60:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x3F, // 0
  61:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x06, // 1
  62:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x5B, // 2
  63:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x4F, // 3
  64:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x66, // 4
  65:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x6D, // 5
  66:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x7D, // 6
  67:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x07, // 7
  68:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x7F, // 8
  69:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x6F, // 9
  70:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x77, // A
  71:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x7C, // B
  72:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x58, // C
  73:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x5E, // D
  74:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x80, // E
  75:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		0x76  // F
  76:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	};
  77:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
  78:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     if(c > 0xF) {
 329              		.loc 1 78 0
 330 0140 FB1C     		adds	r3, r7, #3
 331 0142 1B78     		ldrb	r3, [r3]
 332 0144 0F2B     		cmp	r3, #15
 333 0146 03D9     		bls	.L16
  79:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		_gpio->odrLow = 0x00;
 334              		.loc 1 79 0
 335 0148 7B68     		ldr	r3, [r7, #4]
 336 014a 0022     		movs	r2, #0
 337 014c 1A75     		strb	r2, [r3, #20]
  80:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     } else {
  81:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		_gpio->odrLow = result[c];
  82:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     }
  83:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
 338              		.loc 1 83 0
 339 014e 08E0     		b	.L18
 340              	.L16:
  81:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c ****     }
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
  84:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
  85:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void activate_row(GPIO* _gpio, unsigned char row) 
  86:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
  87:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	switch(row){
 390              		.loc 1 87 0
 391 017e FB1C     		adds	r3, r7, #3
 392 0180 1B78     		ldrb	r3, [r3]
 393 0182 012B     		cmp	r3, #1
 394 0184 0CD0     		beq	.L23
 395 0186 02DC     		bgt	.L24
 396 0188 002B     		cmp	r3, #0
 397 018a 05D0     		beq	.L25
  88:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		case 0: _gpio->odrHigh = 0x10; break;
  89:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		case 1: _gpio->odrHigh = 0x20; break;
  90:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		case 2: _gpio->odrHigh = 0x40; break;
  91:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		case 3: _gpio->odrHigh = 0x80; break;
  92:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	}
  93:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
 398              		.loc 1 93 0
 399 018c 14E0     		b	.L28
 400              	.L24:
  87:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	switch(row){
 401              		.loc 1 87 0
 402 018e 022B     		cmp	r3, #2
 403 0190 0AD0     		beq	.L26
 404 0192 032B     		cmp	r3, #3
 405 0194 0CD0     		beq	.L27
 406              		.loc 1 93 0
 407 0196 0FE0     		b	.L28
 408              	.L25:
  88:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		case 0: _gpio->odrHigh = 0x10; break;
 409              		.loc 1 88 0
 410 0198 7B68     		ldr	r3, [r7, #4]
 411 019a 1022     		movs	r2, #16
 412 019c 5A75     		strb	r2, [r3, #21]
 413 019e 0BE0     		b	.L22
 414              	.L23:
  89:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		case 2: _gpio->odrHigh = 0x40; break;
 415              		.loc 1 89 0
 416 01a0 7B68     		ldr	r3, [r7, #4]
 417 01a2 2022     		movs	r2, #32
 418 01a4 5A75     		strb	r2, [r3, #21]
 419 01a6 07E0     		b	.L22
 420              	.L26:
  90:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		case 3: _gpio->odrHigh = 0x80; break;
 421              		.loc 1 90 0
 422 01a8 7B68     		ldr	r3, [r7, #4]
 423 01aa 4022     		movs	r2, #64
 424 01ac 5A75     		strb	r2, [r3, #21]
 425 01ae 03E0     		b	.L22
 426              	.L27:
  91:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	}
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
  94:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
  95:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void deactivate_rows(GPIO* _gpio)
  96:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
  97:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	_gpio->odrHigh = 0x00;
 465              		.loc 1 97 0
 466 01c8 7B68     		ldr	r3, [r7, #4]
 467 01ca 0022     		movs	r2, #0
 468 01cc 5A75     		strb	r2, [r3, #21]
  98:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
  99:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 100:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** unsigned char read_col(GPIO* _gpio)
 101:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 102:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	if(_gpio->idrHigh & 0x01) return 0;
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
 103:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	if(_gpio->idrHigh & 0x02) return 1;
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
 104:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	if(_gpio->idrHigh & 0x04) return 2;
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
 105:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	if(_gpio->idrHigh & 0x08) return 3;
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
 106:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	return 0xFF;
 544              		.loc 1 106 0 is_stmt 1
 545 021e FF23     		movs	r3, #255
 546              	.L32:
 107:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 108:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 109:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void setup_for_ascii_display()
 110:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 111:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt alla pinnar till utportar.
 112:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	GPIO_E->moder = 0x55555555;
 575              		.loc 1 112 0
 576 022c 034B     		ldr	r3, .L37
 577 022e 044A     		ldr	r2, .L37+4
 578 0230 1A60     		str	r2, [r3]
 113:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 114:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt utportar till "push/pull".
 115:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//GPIO_E->otyper = 0x00000000;
 116:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 117:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt utportars hastighet till medium.
 118:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//GPIO_E->ospeedr = 0x55555555;
 119:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 120:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt utportart hastighet till low.
 121:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//GPIO_E->ospeedr = 0x00000000;
 122:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 123:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// inportar är "pull-up"
 124:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//GPIO_E->pupdr = 0x55550000;
 125:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 126:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_init();
 579              		.loc 1 126 0
 580 0232 FFF7FEFF 		bl	ascii_init
 127:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 128:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 129:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void ascii_init(void)
 130:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 131:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
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
 132:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 133:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(20);
 624              		.loc 1 133 0 is_stmt 1
 625 025a 1420     		movs	r0, #20
 626 025c FFF7FEFF 		bl	delay_mikro
 134:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Function Set - 2 rader, 5x8 punkters tecken.
 135:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_write_cmd(0x38);
 627              		.loc 1 135 0
 628 0260 3820     		movs	r0, #56
 629 0262 FFF7FEFF 		bl	ascii_write_cmd
 136:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(39);
 630              		.loc 1 136 0
 631 0266 2720     		movs	r0, #39
 632 0268 FFF7FEFF 		bl	delay_mikro
 137:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 138:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 139:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
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
 140:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 141:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(20);
 644              		.loc 1 141 0 is_stmt 1
 645 027e 1420     		movs	r0, #20
 646 0280 FFF7FEFF 		bl	delay_mikro
 142:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Tänd display, tänd markör ("cursor"), konstant visning.
 143:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_write_cmd(0x0E);
 647              		.loc 1 143 0
 648 0284 0E20     		movs	r0, #14
 649 0286 FFF7FEFF 		bl	ascii_write_cmd
 144:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(39);
 650              		.loc 1 144 0
 651 028a 2720     		movs	r0, #39
 652 028c FFF7FEFF 		bl	delay_mikro
 145:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 146:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
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
 147:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 148:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(20);
 664              		.loc 1 148 0 is_stmt 1
 665 02a2 1420     		movs	r0, #20
 666 02a4 FFF7FEFF 		bl	delay_mikro
 149:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Clear display.
 150:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_write_cmd(0x01);
 667              		.loc 1 150 0
 668 02a8 0120     		movs	r0, #1
 669 02aa FFF7FEFF 		bl	ascii_write_cmd
 151:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(39);
 670              		.loc 1 151 0
 671 02ae 2720     		movs	r0, #39
 672 02b0 FFF7FEFF 		bl	delay_mikro
 152:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 153:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
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
 154:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 155:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(20);
 684              		.loc 1 155 0 is_stmt 1
 685 02c6 1420     		movs	r0, #20
 686 02c8 FFF7FEFF 		bl	delay_mikro
 156:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Adressering med "increment", inget skift av adressbuffern.
 157:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_write_cmd(0x06);
 687              		.loc 1 157 0
 688 02cc 0620     		movs	r0, #6
 689 02ce FFF7FEFF 		bl	ascii_write_cmd
 158:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(39);
 690              		.loc 1 158 0
 691 02d2 2720     		movs	r0, #39
 692 02d4 FFF7FEFF 		bl	delay_mikro
 159:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 160:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 161:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void ascii_ctrl_bit_set(unsigned char x)
 162:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 163:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//GPIO_E->odrLow |= x;
 164:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 165:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	unsigned char c;
 166:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	c = GPIO_E->odrLow;
 725              		.loc 1 166 0
 726 02ea 0D4A     		ldr	r2, .L45
 727 02ec 0F23     		movs	r3, #15
 728 02ee FB18     		adds	r3, r7, r3
 729 02f0 127D     		ldrb	r2, [r2, #20]
 730 02f2 1A70     		strb	r2, [r3]
 167:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	c |= (B_SELECT | x);
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
 168:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	GPIO_E->odrLow = c;
 744              		.loc 1 168 0
 745 030c 044A     		ldr	r2, .L45
 746 030e 0F23     		movs	r3, #15
 747 0310 FB18     		adds	r3, r7, r3
 748 0312 1B78     		ldrb	r3, [r3]
 749 0314 1375     		strb	r3, [r2, #20]
 169:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 170:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 171:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void ascii_ctrl_bit_clear(unsigned char x)
 172:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 173:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//GPIO_E->odrLow &= (~x);
 174:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 175:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	unsigned char c;
 176:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	c = GPIO_E->odrLow;
 787              		.loc 1 176 0
 788 0330 0F4A     		ldr	r2, .L48
 789 0332 0F23     		movs	r3, #15
 790 0334 FB18     		adds	r3, r7, r3
 791 0336 127D     		ldrb	r2, [r2, #20]
 792 0338 1A70     		strb	r2, [r3]
 177:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	c = (B_SELECT | c & ~x);
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
 178:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	GPIO_E->odrLow = c;
 811              		.loc 1 178 0
 812 035c 044A     		ldr	r2, .L48
 813 035e 0F23     		movs	r3, #15
 814 0360 FB18     		adds	r3, r7, r3
 815 0362 1B78     		ldrb	r3, [r3]
 816 0364 1375     		strb	r3, [r2, #20]
 179:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 180:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 181:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void ascii_write_cmd(unsigned char command)
 182:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 183:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Doesn't wait or check for the status flag...
 184:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_RS);
 854              		.loc 1 184 0
 855 0380 0120     		movs	r0, #1
 856 0382 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 185:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_RW);
 857              		.loc 1 185 0
 858 0386 0220     		movs	r0, #2
 859 0388 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 186:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_write_controller(command);
 860              		.loc 1 186 0
 861 038c FB1D     		adds	r3, r7, #7
 862 038e 1B78     		ldrb	r3, [r3]
 863 0390 1800     		movs	r0, r3
 864 0392 FFF7FEFF 		bl	ascii_write_controller
 187:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 188:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 189:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void ascii_write_data(unsigned char data)
 190:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 191:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_set(B_RS);
 898              		.loc 1 191 0
 899 03aa 0120     		movs	r0, #1
 900 03ac FFF7FEFF 		bl	ascii_ctrl_bit_set
 192:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_RW);
 901              		.loc 1 192 0
 902 03b0 0220     		movs	r0, #2
 903 03b2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 193:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_write_controller(data);
 904              		.loc 1 193 0
 905 03b6 FB1D     		adds	r3, r7, #7
 906 03b8 1B78     		ldrb	r3, [r3]
 907 03ba 1800     		movs	r0, r3
 908 03bc FFF7FEFF 		bl	ascii_write_controller
 194:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 195:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 196:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** unsigned char ascii_read_status(void)
 197:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 198:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	unsigned char read_value;
 199:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 200:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt pinnar 15-8 till ingångar.
 201:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	GPIO_E->moder &= 0x0000FFFF;
 940              		.loc 1 201 0
 941 03ce 0E4B     		ldr	r3, .L54
 942 03d0 0D4A     		ldr	r2, .L54
 943 03d2 1268     		ldr	r2, [r2]
 944 03d4 1204     		lsls	r2, r2, #16
 945 03d6 120C     		lsrs	r2, r2, #16
 946 03d8 1A60     		str	r2, [r3]
 202:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 203:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_RS);
 947              		.loc 1 203 0
 948 03da 0120     		movs	r0, #1
 949 03dc FFF7FEFF 		bl	ascii_ctrl_bit_clear
 204:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_set(B_RW);
 950              		.loc 1 204 0
 951 03e0 0220     		movs	r0, #2
 952 03e2 FFF7FEFF 		bl	ascii_ctrl_bit_set
 205:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	read_value = ascii_read_controller();
 953              		.loc 1 205 0
 954 03e6 FC1D     		adds	r4, r7, #7
 955 03e8 FFF7FEFF 		bl	ascii_read_controller
 956 03ec 0300     		movs	r3, r0
 957 03ee 2370     		strb	r3, [r4]
 206:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 207:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt pinnar 15-8 till utgångar igen.
 208:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	GPIO_E->moder |= 0x55550000;
 958              		.loc 1 208 0
 959 03f0 054B     		ldr	r3, .L54
 960 03f2 054A     		ldr	r2, .L54
 961 03f4 1268     		ldr	r2, [r2]
 962 03f6 0549     		ldr	r1, .L54+4
 963 03f8 0A43     		orrs	r2, r1
 964 03fa 1A60     		str	r2, [r3]
 209:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 210:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	return read_value;
 965              		.loc 1 210 0
 966 03fc FB1D     		adds	r3, r7, #7
 967 03fe 1B78     		ldrb	r3, [r3]
 211:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 212:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 213:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** unsigned char ascii_read_data(void)
 214:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 215:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	unsigned char read_value;
 216:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 217:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt pinnar 15-8 till ingångar.
 218:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	GPIO_E->moder &= 0x0000FFFF;
 1004              		.loc 1 218 0
 1005 0416 0E4B     		ldr	r3, .L58
 1006 0418 0D4A     		ldr	r2, .L58
 1007 041a 1268     		ldr	r2, [r2]
 1008 041c 1204     		lsls	r2, r2, #16
 1009 041e 120C     		lsrs	r2, r2, #16
 1010 0420 1A60     		str	r2, [r3]
 219:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 220:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_set(B_RS);
 1011              		.loc 1 220 0
 1012 0422 0120     		movs	r0, #1
 1013 0424 FFF7FEFF 		bl	ascii_ctrl_bit_set
 221:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_set(B_RW);
 1014              		.loc 1 221 0
 1015 0428 0220     		movs	r0, #2
 1016 042a FFF7FEFF 		bl	ascii_ctrl_bit_set
 222:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	read_value = ascii_read_controller();
 1017              		.loc 1 222 0
 1018 042e FC1D     		adds	r4, r7, #7
 1019 0430 FFF7FEFF 		bl	ascii_read_controller
 1020 0434 0300     		movs	r3, r0
 1021 0436 2370     		strb	r3, [r4]
 223:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 224:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Sätt pinnar 15-8 till utgångar igen.
 225:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	GPIO_E->moder |= 0xFFFF0000;
 1022              		.loc 1 225 0
 1023 0438 054B     		ldr	r3, .L58
 1024 043a 054A     		ldr	r2, .L58
 1025 043c 1268     		ldr	r2, [r2]
 1026 043e 0549     		ldr	r1, .L58+4
 1027 0440 0A43     		orrs	r2, r1
 1028 0442 1A60     		str	r2, [r3]
 226:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	
 227:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	return read_value;
 1029              		.loc 1 227 0
 1030 0444 FB1D     		adds	r3, r7, #7
 1031 0446 1B78     		ldrb	r3, [r3]
 228:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 229:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 230:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void ascii_write_controller(unsigned char byte)
 231:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 232:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Delay40ns is redundant
 233:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_set(B_E);
 1070              		.loc 1 233 0
 1071 0464 4020     		movs	r0, #64
 1072 0466 FFF7FEFF 		bl	ascii_ctrl_bit_set
 234:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	GPIO_E->odrHigh = byte;
 1073              		.loc 1 234 0
 1074 046a 064A     		ldr	r2, .L61
 1075 046c FB1D     		adds	r3, r7, #7
 1076 046e 1B78     		ldrb	r3, [r3]
 1077 0470 5375     		strb	r3, [r2, #21]
 235:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_250ns();
 1078              		.loc 1 235 0
 1079 0472 FFF7FEFF 		bl	delay_250ns
 236:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_E);
 1080              		.loc 1 236 0
 1081 0476 4020     		movs	r0, #64
 1082 0478 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 237:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	// Delay10ns is redundant
 238:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 239:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 240:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** unsigned char ascii_read_controller(void)
 241:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 242:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	unsigned char read_value;
 243:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_set(B_E);
 1117              		.loc 1 243 0
 1118 048e 4020     		movs	r0, #64
 1119 0490 FFF7FEFF 		bl	ascii_ctrl_bit_set
 244:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_250ns();
 1120              		.loc 1 244 0
 1121 0494 FFF7FEFF 		bl	delay_250ns
 245:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_250ns();
 1122              		.loc 1 245 0
 1123 0498 FFF7FEFF 		bl	delay_250ns
 246:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	read_value = GPIO_E->idrHigh;
 1124              		.loc 1 246 0
 1125 049c 064A     		ldr	r2, .L65
 1126 049e FB1D     		adds	r3, r7, #7
 1127 04a0 527C     		ldrb	r2, [r2, #17]
 1128 04a2 1A70     		strb	r2, [r3]
 247:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_ctrl_bit_clear(B_E);
 1129              		.loc 1 247 0
 1130 04a4 4020     		movs	r0, #64
 1131 04a6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 248:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	return read_value;
 1132              		.loc 1 248 0
 1133 04aa FB1D     		adds	r3, r7, #7
 1134 04ac 1B78     		ldrb	r3, [r3]
 249:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 250:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 251:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void ascii_gotoxy(int x, int y)
 252:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 253:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	if(!(y == 1 || y == 2)) return;
 1171              		.loc 1 253 0
 1172 04c6 3B68     		ldr	r3, [r7]
 1173 04c8 012B     		cmp	r3, #1
 1174 04ca 02D0     		beq	.L68
 1175              		.loc 1 253 0 is_stmt 0 discriminator 1
 1176 04cc 3B68     		ldr	r3, [r7]
 1177 04ce 022B     		cmp	r3, #2
 1178 04d0 1AD1     		bne	.L71
 1179              	.L68:
 254:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	unsigned char address = x - 1;
 1180              		.loc 1 254 0 is_stmt 1
 1181 04d2 7B68     		ldr	r3, [r7, #4]
 1182 04d4 DAB2     		uxtb	r2, r3
 1183 04d6 0F23     		movs	r3, #15
 1184 04d8 FB18     		adds	r3, r7, r3
 1185 04da 013A     		subs	r2, r2, #1
 1186 04dc 1A70     		strb	r2, [r3]
 255:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	if(y == 2){
 1187              		.loc 1 255 0
 1188 04de 3B68     		ldr	r3, [r7]
 1189 04e0 022B     		cmp	r3, #2
 1190 04e2 06D1     		bne	.L70
 256:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 		address += 0x40;
 1191              		.loc 1 256 0
 1192 04e4 0F23     		movs	r3, #15
 1193 04e6 FB18     		adds	r3, r7, r3
 1194 04e8 0F22     		movs	r2, #15
 1195 04ea BA18     		adds	r2, r7, r2
 1196 04ec 1278     		ldrb	r2, [r2]
 1197 04ee 4032     		adds	r2, r2, #64
 1198 04f0 1A70     		strb	r2, [r3]
 1199              	.L70:
 257:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	}
 258:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_write_cmd(0x80 | address);
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
 253:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	unsigned char address = x - 1;
 1212              		.loc 1 253 0
 1213 0508 C046     		nop
 1214              	.L67:
 259:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }
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
 260:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 
 261:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** void ascii_write_char(unsigned char c)
 262:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** {
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
 263:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	while((ascii_read_status() & 0x80) == 0x80)
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
 264:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	{} // vänta tills display är klar att ta emot komando.
 265:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(8);
 1258              		.loc 1 265 0 is_stmt 1
 1259 052e 0820     		movs	r0, #8
 1260 0530 FFF7FEFF 		bl	delay_mikro
 266:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	ascii_write_data(c);
 1261              		.loc 1 266 0
 1262 0534 FB1D     		adds	r3, r7, #7
 1263 0536 1B78     		ldrb	r3, [r3]
 1264 0538 1800     		movs	r0, r3
 1265 053a FFF7FEFF 		bl	ascii_write_data
 267:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	delay_mikro(43);
 1266              		.loc 1 267 0
 1267 053e 2B20     		movs	r0, #43
 1268 0540 FFF7FEFF 		bl	delay_mikro
 268:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** 	//delay_mikro(100000);
 269:E:/DAT017/CodeLite files/Moplaborationer/asciidisplay\gpio.c **** }...
 1269              		.loc 1 269 0
 1270 0544 C046     		nop
 1271 0546 BD46     		mov	sp, r7
 1272 0548 02B0     		add	sp, sp, #8
 1273              		@ sp needed
 1274 054a 80BD     		pop	{r7, pc}
 1275              		.cfi_endproc
 1276              	.LFE18:
 1278              	.Letext0:
 1279              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1280              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 1281              		.file 4 "E:/DAT017/CodeLite files/Moplaborationer/asciidisplay/gpio.h"
