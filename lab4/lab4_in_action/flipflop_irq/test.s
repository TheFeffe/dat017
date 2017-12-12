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
  25              		.file 1 "C:/Users/levholm/Documents/basics_io/flipflop_irq/startup.c"
   1:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #include "gpio.h"
   2:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #include "sys_delay.h"
   3:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
   4:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   5:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
   6:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** void startup ( void )
   7:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** {
  26              		.loc 1 7 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   8:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** __asm volatile(
  31              		.loc 1 8 0
  32              		.syntax divided
  33              	@ 8 "C:/Users/levholm/Documents/basics_io/flipflop_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
   9:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  10:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	" MOV SP,R0\n"
  11:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	" BL main\n"				/* call main */
  12:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	".L1: B .L1\n"				/* never return */
  13:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	) ;
  14:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** }
  40              		.loc 1 14 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.bss
  48              		.align	2
  49              	count:
  50 0000 00000000 		.space	4
  52              		.text
  53              		.align	1
  54              		.global	irq0_handler
  55              		.syntax unified
  56              		.code	16
  57              		.thumb_func
  58              		.fpu softvfp
  60              	irq0_handler:
  61              	.LFB1:
  15:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
  16:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI_PR 0x40013C14
  17:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define IRQ 0x40021000
  18:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define IRQ_READ ((unsigned long *) (IRQ+0x10) )
  19:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define IRQ_WRITE ((unsigned long *) (IRQ+0x14) )
  20:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
  21:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define SYSCFG_BASE ((volatile unsigned int *) 0x40013800)
  22:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define SYSCFG_EXTICR1 ((volatile unsigned int *) 0x40013808)
  23:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI_IMR ((volatile unsigned int *) 0x40013C00)
  24:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI_FTSR ((volatile unsigned int *) 0x40013C0C)
  25:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI_RTSR ((volatile unsigned int *) 0x40013C08)
  26:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI_PR ((volatile unsigned int *) 0x40013C14)
  27:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI_3_IRQVEC ((void (**)(void))0x2001C064)
  28:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI_2_IRQVEC ((void (**)(void))0x2001C060)
  29:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI_1_IRQVEC ((void (**)(void))0x2001C05C)
  30:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI_0_IRQVEC ((void (**)(void))0x2001C058)
  31:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define NVIC_ISER0 ((volatile unsigned int *) 0xE000E100)
  32:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define NVIC_EXTI3_IRQ (1<<9)
  33:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define NVIC_EXTI2_IRQ (1<<8)
  34:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define NVIC_EXTI1_IRQ (1<<7)
  35:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define NVIC_EXTI0_IRQ (1<<6)
  36:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI3_IRQ 0x8;
  37:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI2_IRQ 0x4;
  38:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI1_IRQ 0x2;
  39:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** #define EXTI0_IRQ 0x1;
  40:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
  41:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
  42:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** /*void interrupt_handler(void)
  43:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** {
  44:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	// Kolla om avbrottet kommer från EXTI3
  45:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****   if(EXTI_PR & 4)
  46:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****   {
  47:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     //count++; // Öka count
  48:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     //om avbrott IRQ0
  49:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     if (*IRQ_READ & 1) {
  50:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       *IRQ_WRITE |= 0x10;
  51:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       *IRQ_WRITE &= ~0x10;
  52:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       count++;
  53:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     }
  54:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     //om avbrott IRQ_READ1
  55:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     if (*IRQ_READ & 2) {
  56:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       *IRQ_WRITE |= 0x20;
  57:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       *IRQ_WRITE &= ~0x20;
  58:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       count=0;
  59:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     }
  60:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     if (*IRQ_READ & 4) {
  61:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       *IRQ_WRITE |= 0x40;
  62:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       *IRQ_WRITE &= ~0x40;
  63:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       // om diodrampen är tänd
  64:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       if (GPIO_D->odrHigh == 0xFF) {
  65:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****         GPIO_D->odrHigh = 0;
  66:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       }
  67:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       else{
  68:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****         GPIO_D->odrHigh = 0xFF;
  69:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****       }
  70:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
  71:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
  72:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     }
  73:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     *((unsigned int *) 0x40013C14) |= 8; // Kvittera avbrott
  74:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****   }
  75:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** }*/
  76:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
  77:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** static volatile int count = 0;
  78:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** void irq0_handler(void){
  62              		.loc 1 78 0
  63              		.cfi_startproc
  64              		@ args = 0, pretend = 0, frame = 0
  65              		@ frame_needed = 1, uses_anonymous_args = 0
  66 0000 80B5     		push	{r7, lr}
  67              		.cfi_def_cfa_offset 8
  68              		.cfi_offset 7, -8
  69              		.cfi_offset 14, -4
  70 0002 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  79:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	count++;
  72              		.loc 1 79 0
  73 0004 0E4B     		ldr	r3, .L3
  74 0006 1B68     		ldr	r3, [r3]
  75 0008 5A1C     		adds	r2, r3, #1
  76 000a 0D4B     		ldr	r3, .L3
  77 000c 1A60     		str	r2, [r3]
  80:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	*EXTI_PR |= EXTI0_IRQ //reset-signal till EXTI, om denna rad tas bort kallas irq_handler 2 gånger
  78              		.loc 1 80 0
  79 000e 0D4B     		ldr	r3, .L3+4
  80 0010 0C4A     		ldr	r2, .L3+4
  81 0012 1268     		ldr	r2, [r2]
  82 0014 0121     		movs	r1, #1
  83 0016 0A43     		orrs	r2, r1
  84 0018 1A60     		str	r2, [r3]
  81:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	GPIO_E->odrLow |= 0x10; //reset-signal till interruptenheten
  85              		.loc 1 81 0
  86 001a 0B4A     		ldr	r2, .L3+8
  87 001c 0A4B     		ldr	r3, .L3+8
  88 001e 1B7D     		ldrb	r3, [r3, #20]
  89 0020 DBB2     		uxtb	r3, r3
  90 0022 1021     		movs	r1, #16
  91 0024 0B43     		orrs	r3, r1
  92 0026 DBB2     		uxtb	r3, r3
  93 0028 1375     		strb	r3, [r2, #20]
  82:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	GPIO_E->odrLow &= ~0x10;
  94              		.loc 1 82 0
  95 002a 074A     		ldr	r2, .L3+8
  96 002c 064B     		ldr	r3, .L3+8
  97 002e 1B7D     		ldrb	r3, [r3, #20]
  98 0030 DBB2     		uxtb	r3, r3
  99 0032 1021     		movs	r1, #16
 100 0034 8B43     		bics	r3, r1
 101 0036 DBB2     		uxtb	r3, r3
 102 0038 1375     		strb	r3, [r2, #20]
  83:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** }
 103              		.loc 1 83 0
 104 003a C046     		nop
 105 003c BD46     		mov	sp, r7
 106              		@ sp needed
 107 003e 80BD     		pop	{r7, pc}
 108              	.L4:
 109              		.align	2
 110              	.L3:
 111 0040 00000000 		.word	count
 112 0044 143C0140 		.word	1073822740
 113 0048 00100240 		.word	1073876992
 114              		.cfi_endproc
 115              	.LFE1:
 117              		.align	1
 118              		.global	irq1_handler
 119              		.syntax unified
 120              		.code	16
 121              		.thumb_func
 122              		.fpu softvfp
 124              	irq1_handler:
 125              	.LFB2:
  84:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** void irq1_handler(void){
 126              		.loc 1 84 0
 127              		.cfi_startproc
 128              		@ args = 0, pretend = 0, frame = 0
 129              		@ frame_needed = 1, uses_anonymous_args = 0
 130 004c 80B5     		push	{r7, lr}
 131              		.cfi_def_cfa_offset 8
 132              		.cfi_offset 7, -8
 133              		.cfi_offset 14, -4
 134 004e 00AF     		add	r7, sp, #0
 135              		.cfi_def_cfa_register 7
  85:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	count = 0;
 136              		.loc 1 85 0
 137 0050 0D4B     		ldr	r3, .L6
 138 0052 0022     		movs	r2, #0
 139 0054 1A60     		str	r2, [r3]
  86:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	*EXTI_PR |= EXTI1_IRQ; //reset-signal till EXTI, om denna rad tas bort kallas irq_handler 2 gånge
 140              		.loc 1 86 0
 141 0056 0D4B     		ldr	r3, .L6+4
 142 0058 0C4A     		ldr	r2, .L6+4
 143 005a 1268     		ldr	r2, [r2]
 144 005c 0221     		movs	r1, #2
 145 005e 0A43     		orrs	r2, r1
 146 0060 1A60     		str	r2, [r3]
  87:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	GPIO_E->odrLow |= 0x20; //reset-signal till interruptenheten
 147              		.loc 1 87 0
 148 0062 0B4A     		ldr	r2, .L6+8
 149 0064 0A4B     		ldr	r3, .L6+8
 150 0066 1B7D     		ldrb	r3, [r3, #20]
 151 0068 DBB2     		uxtb	r3, r3
 152 006a 2021     		movs	r1, #32
 153 006c 0B43     		orrs	r3, r1
 154 006e DBB2     		uxtb	r3, r3
 155 0070 1375     		strb	r3, [r2, #20]
  88:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	GPIO_E->odrLow &= ~0x20;
 156              		.loc 1 88 0
 157 0072 074A     		ldr	r2, .L6+8
 158 0074 064B     		ldr	r3, .L6+8
 159 0076 1B7D     		ldrb	r3, [r3, #20]
 160 0078 DBB2     		uxtb	r3, r3
 161 007a 2021     		movs	r1, #32
 162 007c 8B43     		bics	r3, r1
 163 007e DBB2     		uxtb	r3, r3
 164 0080 1375     		strb	r3, [r2, #20]
  89:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** }
 165              		.loc 1 89 0
 166 0082 C046     		nop
 167 0084 BD46     		mov	sp, r7
 168              		@ sp needed
 169 0086 80BD     		pop	{r7, pc}
 170              	.L7:
 171              		.align	2
 172              	.L6:
 173 0088 00000000 		.word	count
 174 008c 143C0140 		.word	1073822740
 175 0090 00100240 		.word	1073876992
 176              		.cfi_endproc
 177              	.LFE2:
 179              		.align	1
 180              		.global	irq2_handler
 181              		.syntax unified
 182              		.code	16
 183              		.thumb_func
 184              		.fpu softvfp
 186              	irq2_handler:
 187              	.LFB3:
  90:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** void irq2_handler(void){
 188              		.loc 1 90 0
 189              		.cfi_startproc
 190              		@ args = 0, pretend = 0, frame = 0
 191              		@ frame_needed = 1, uses_anonymous_args = 0
 192 0094 80B5     		push	{r7, lr}
 193              		.cfi_def_cfa_offset 8
 194              		.cfi_offset 7, -8
 195              		.cfi_offset 14, -4
 196 0096 00AF     		add	r7, sp, #0
 197              		.cfi_def_cfa_register 7
  91:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	*EXTI_PR |= EXTI2_IRQ;
 198              		.loc 1 91 0
 199 0098 124B     		ldr	r3, .L12
 200 009a 124A     		ldr	r2, .L12
 201 009c 1268     		ldr	r2, [r2]
 202 009e 0421     		movs	r1, #4
 203 00a0 0A43     		orrs	r2, r1
 204 00a2 1A60     		str	r2, [r3]
  92:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	GPIO_E->odrLow |= 0x40;
 205              		.loc 1 92 0
 206 00a4 104A     		ldr	r2, .L12+4
 207 00a6 104B     		ldr	r3, .L12+4
 208 00a8 1B7D     		ldrb	r3, [r3, #20]
 209 00aa DBB2     		uxtb	r3, r3
 210 00ac 4021     		movs	r1, #64
 211 00ae 0B43     		orrs	r3, r1
 212 00b0 DBB2     		uxtb	r3, r3
 213 00b2 1375     		strb	r3, [r2, #20]
  93:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	GPIO_E->odrLow &= ~0x40;
 214              		.loc 1 93 0
 215 00b4 0C4A     		ldr	r2, .L12+4
 216 00b6 0C4B     		ldr	r3, .L12+4
 217 00b8 1B7D     		ldrb	r3, [r3, #20]
 218 00ba DBB2     		uxtb	r3, r3
 219 00bc 4021     		movs	r1, #64
 220 00be 8B43     		bics	r3, r1
 221 00c0 DBB2     		uxtb	r3, r3
 222 00c2 1375     		strb	r3, [r2, #20]
  94:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	if (GPIO_D->odrHigh == 0xFF){
 223              		.loc 1 94 0
 224 00c4 094B     		ldr	r3, .L12+8
 225 00c6 5B7D     		ldrb	r3, [r3, #21]
 226 00c8 DBB2     		uxtb	r3, r3
 227 00ca FF2B     		cmp	r3, #255
 228 00cc 03D1     		bne	.L9
  95:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		GPIO_D->odrHigh = 0;
 229              		.loc 1 95 0
 230 00ce 074B     		ldr	r3, .L12+8
 231 00d0 0022     		movs	r2, #0
 232 00d2 5A75     		strb	r2, [r3, #21]
  96:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	}
  97:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	else{
  98:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		GPIO_D->odrHigh = 0xFF;
  99:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	}
 100:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** }
 233              		.loc 1 100 0
 234 00d4 02E0     		b	.L11
 235              	.L9:
  98:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	}
 236              		.loc 1 98 0
 237 00d6 054B     		ldr	r3, .L12+8
 238 00d8 FF22     		movs	r2, #255
 239 00da 5A75     		strb	r2, [r3, #21]
 240              	.L11:
 241              		.loc 1 100 0
 242 00dc C046     		nop
 243 00de BD46     		mov	sp, r7
 244              		@ sp needed
 245 00e0 80BD     		pop	{r7, pc}
 246              	.L13:
 247 00e2 C046     		.align	2
 248              	.L12:
 249 00e4 143C0140 		.word	1073822740
 250 00e8 00100240 		.word	1073876992
 251 00ec 000C0240 		.word	1073875968
 252              		.cfi_endproc
 253              	.LFE3:
 255              		.align	1
 256              		.global	app_init
 257              		.syntax unified
 258              		.code	16
 259              		.thumb_func
 260              		.fpu softvfp
 262              	app_init:
 263              	.LFB4:
 101:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 102:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** void app_init(void)
 103:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** {
 264              		.loc 1 103 0
 265              		.cfi_startproc
 266              		@ args = 0, pretend = 0, frame = 0
 267              		@ frame_needed = 1, uses_anonymous_args = 0
 268 00f0 80B5     		push	{r7, lr}
 269              		.cfi_def_cfa_offset 8
 270              		.cfi_offset 7, -8
 271              		.cfi_offset 14, -4
 272 00f2 00AF     		add	r7, sp, #0
 273              		.cfi_def_cfa_register 7
 104:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	*((unsigned long *) 0x40023830) =0x18;
 274              		.loc 1 104 0
 275 00f4 384B     		ldr	r3, .L15
 276 00f6 1822     		movs	r2, #24
 277 00f8 1A60     		str	r2, [r3]
 105:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	*((unsigned long *) 0x40023844) |=0x4000;
 278              		.loc 1 105 0
 279 00fa 384B     		ldr	r3, .L15+4
 280 00fc 374A     		ldr	r2, .L15+4
 281 00fe 1268     		ldr	r2, [r2]
 282 0100 8021     		movs	r1, #128
 283 0102 C901     		lsls	r1, r1, #7
 284 0104 0A43     		orrs	r2, r1
 285 0106 1A60     		str	r2, [r3]
 106:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	*((unsigned long *) 0xE000ED08 ) = 0x2001C000;
 286              		.loc 1 106 0
 287 0108 354B     		ldr	r3, .L15+8
 288 010a 364A     		ldr	r2, .L15+12
 289 010c 1A60     		str	r2, [r3]
 107:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****   // Sätt upp PD0-7 som utport för visningsenhet
 108:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     GPIO_D->moder = 0x55555555;
 290              		.loc 1 108 0
 291 010e 364B     		ldr	r3, .L15+16
 292 0110 364A     		ldr	r2, .L15+20
 293 0112 1A60     		str	r2, [r3]
 109:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	GPIO_E -> moder = 0x1500;
 294              		.loc 1 109 0
 295 0114 364B     		ldr	r3, .L15+24
 296 0116 A822     		movs	r2, #168
 297 0118 5201     		lsls	r2, r2, #5
 298 011a 1A60     		str	r2, [r3]
 110:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 111:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****   // Koppla PE3 tillavbrottslina EXTI3
 112:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     // Nollställ fält
 113:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     *((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
 299              		.loc 1 113 0
 300 011c 354B     		ldr	r3, .L15+28
 301 011e 354A     		ldr	r2, .L15+28
 302 0120 1268     		ldr	r2, [r2]
 303 0122 3549     		ldr	r1, .L15+32
 304 0124 0A40     		ands	r2, r1
 305 0126 1A60     		str	r2, [r3]
 114:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     // PE3->EXTI3
 115:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     *((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
 306              		.loc 1 115 0
 307 0128 324B     		ldr	r3, .L15+28
 308 012a 324A     		ldr	r2, .L15+28
 309 012c 1268     		ldr	r2, [r2]
 310 012e 8021     		movs	r1, #128
 311 0130 C901     		lsls	r1, r1, #7
 312 0132 0A43     		orrs	r2, r1
 313 0134 1A60     		str	r2, [r3]
 116:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 117:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****   // Konfigurera EXTI3 för att generera avbrott
 118:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     // Aktivera genom att ettställa motsvarande bit i EXTI_IMR
 119:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     /**((unsigned int *) 0x40013C00) |= 8;
 120:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     // Aktivera triggvillkor "negativ flank"
 121:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     *((unsigned int *) 0x40013C0C) |= 8;
 122:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     // Maskera triggvillkor "positiv flank"
 123:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     *((unsigned int *) 0x40013C08) &= ~8;*/
 124:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 125:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	  // Sätt upp avbrottsvektor
 126:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	  *SYSCFG_EXTICR1 &= 0xF000;
 314              		.loc 1 126 0
 315 0136 2F4B     		ldr	r3, .L15+28
 316 0138 2E4A     		ldr	r2, .L15+28
 317 013a 1168     		ldr	r1, [r2]
 318 013c F022     		movs	r2, #240
 319 013e 1202     		lsls	r2, r2, #8
 320 0140 0A40     		ands	r2, r1
 321 0142 1A60     		str	r2, [r3]
 127:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*SYSCFG_EXTICR1 |= 0x0444;
 322              		.loc 1 127 0
 323 0144 2B4B     		ldr	r3, .L15+28
 324 0146 2B4A     		ldr	r2, .L15+28
 325 0148 1268     		ldr	r2, [r2]
 326 014a 2C49     		ldr	r1, .L15+36
 327 014c 0A43     		orrs	r2, r1
 328 014e 1A60     		str	r2, [r3]
 128:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 129:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*EXTI_IMR |= 7;
 329              		.loc 1 129 0
 330 0150 2B4B     		ldr	r3, .L15+40
 331 0152 2B4A     		ldr	r2, .L15+40
 332 0154 1268     		ldr	r2, [r2]
 333 0156 0721     		movs	r1, #7
 334 0158 0A43     		orrs	r2, r1
 335 015a 1A60     		str	r2, [r3]
 130:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*EXTI_RTSR |= 7;
 336              		.loc 1 130 0
 337 015c 294B     		ldr	r3, .L15+44
 338 015e 294A     		ldr	r2, .L15+44
 339 0160 1268     		ldr	r2, [r2]
 340 0162 0721     		movs	r1, #7
 341 0164 0A43     		orrs	r2, r1
 342 0166 1A60     		str	r2, [r3]
 131:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*EXTI_FTSR &= ~7;
 343              		.loc 1 131 0
 344 0168 274B     		ldr	r3, .L15+48
 345 016a 274A     		ldr	r2, .L15+48
 346 016c 1268     		ldr	r2, [r2]
 347 016e 0721     		movs	r1, #7
 348 0170 8A43     		bics	r2, r1
 349 0172 1A60     		str	r2, [r3]
 132:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 133:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*EXTI_0_IRQVEC = irq0_handler;
 350              		.loc 1 133 0
 351 0174 254B     		ldr	r3, .L15+52
 352 0176 264A     		ldr	r2, .L15+56
 353 0178 1A60     		str	r2, [r3]
 134:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*EXTI_1_IRQVEC = irq1_handler;
 354              		.loc 1 134 0
 355 017a 264B     		ldr	r3, .L15+60
 356 017c 264A     		ldr	r2, .L15+64
 357 017e 1A60     		str	r2, [r3]
 135:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*EXTI_2_IRQVEC = irq2_handler;
 358              		.loc 1 135 0
 359 0180 264B     		ldr	r3, .L15+68
 360 0182 274A     		ldr	r2, .L15+72
 361 0184 1A60     		str	r2, [r3]
 136:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 137:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*NVIC_ISER0 |= NVIC_EXTI0_IRQ;
 362              		.loc 1 137 0
 363 0186 274B     		ldr	r3, .L15+76
 364 0188 264A     		ldr	r2, .L15+76
 365 018a 1268     		ldr	r2, [r2]
 366 018c 4021     		movs	r1, #64
 367 018e 0A43     		orrs	r2, r1
 368 0190 1A60     		str	r2, [r3]
 138:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*NVIC_ISER0 |= NVIC_EXTI1_IRQ;
 369              		.loc 1 138 0
 370 0192 244B     		ldr	r3, .L15+76
 371 0194 234A     		ldr	r2, .L15+76
 372 0196 1268     		ldr	r2, [r2]
 373 0198 8021     		movs	r1, #128
 374 019a 0A43     		orrs	r2, r1
 375 019c 1A60     		str	r2, [r3]
 139:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		*NVIC_ISER0 |= NVIC_EXTI2_IRQ;
 376              		.loc 1 139 0
 377 019e 214B     		ldr	r3, .L15+76
 378 01a0 204A     		ldr	r2, .L15+76
 379 01a2 1268     		ldr	r2, [r2]
 380 01a4 8021     		movs	r1, #128
 381 01a6 4900     		lsls	r1, r1, #1
 382 01a8 0A43     		orrs	r2, r1
 383 01aa 1A60     		str	r2, [r3]
 140:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		//*NVIC_ISER0 |= NVIC_EXTI3_IRQ;
 141:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 142:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****   // Konfigurera de bitar i NVIC som kontrollerar den avbrottslina som EXTI3 kopplas till
 143:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****     //*((unsigned int *) 0xE000E100) |= (1<<9);
 144:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<8);
 384              		.loc 1 144 0
 385 01ac 1D4B     		ldr	r3, .L15+76
 386 01ae 1D4A     		ldr	r2, .L15+76
 387 01b0 1268     		ldr	r2, [r2]
 388 01b2 8021     		movs	r1, #128
 389 01b4 4900     		lsls	r1, r1, #1
 390 01b6 0A43     		orrs	r2, r1
 391 01b8 1A60     		str	r2, [r3]
 145:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<7);
 392              		.loc 1 145 0
 393 01ba 1A4B     		ldr	r3, .L15+76
 394 01bc 194A     		ldr	r2, .L15+76
 395 01be 1268     		ldr	r2, [r2]
 396 01c0 8021     		movs	r1, #128
 397 01c2 0A43     		orrs	r2, r1
 398 01c4 1A60     		str	r2, [r3]
 146:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<6);
 399              		.loc 1 146 0
 400 01c6 174B     		ldr	r3, .L15+76
 401 01c8 164A     		ldr	r2, .L15+76
 402 01ca 1268     		ldr	r2, [r2]
 403 01cc 4021     		movs	r1, #64
 404 01ce 0A43     		orrs	r2, r1
 405 01d0 1A60     		str	r2, [r3]
 147:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** }
 406              		.loc 1 147 0
 407 01d2 C046     		nop
 408 01d4 BD46     		mov	sp, r7
 409              		@ sp needed
 410 01d6 80BD     		pop	{r7, pc}
 411              	.L16:
 412              		.align	2
 413              	.L15:
 414 01d8 30380240 		.word	1073887280
 415 01dc 44380240 		.word	1073887300
 416 01e0 08ED00E0 		.word	-536810232
 417 01e4 00C00120 		.word	536985600
 418 01e8 000C0240 		.word	1073875968
 419 01ec 55555555 		.word	1431655765
 420 01f0 00100240 		.word	1073876992
 421 01f4 08380140 		.word	1073821704
 422 01f8 FF0FFFFF 		.word	-61441
 423 01fc 44040000 		.word	1092
 424 0200 003C0140 		.word	1073822720
 425 0204 083C0140 		.word	1073822728
 426 0208 0C3C0140 		.word	1073822732
 427 020c 58C00120 		.word	536985688
 428 0210 00000000 		.word	irq0_handler
 429 0214 5CC00120 		.word	536985692
 430 0218 00000000 		.word	irq1_handler
 431 021c 60C00120 		.word	536985696
 432 0220 00000000 		.word	irq2_handler
 433 0224 00E100E0 		.word	-536813312
 434              		.cfi_endproc
 435              	.LFE4:
 437              		.align	1
 438              		.global	main
 439              		.syntax unified
 440              		.code	16
 441              		.thumb_func
 442              		.fpu softvfp
 444              	main:
 445              	.LFB5:
 148:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 149:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 150:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 
 151:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** void main(void)
 152:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** {
 446              		.loc 1 152 0
 447              		.cfi_startproc
 448              		@ args = 0, pretend = 0, frame = 0
 449              		@ frame_needed = 1, uses_anonymous_args = 0
 450 0228 80B5     		push	{r7, lr}
 451              		.cfi_def_cfa_offset 8
 452              		.cfi_offset 7, -8
 453              		.cfi_offset 14, -4
 454 022a 00AF     		add	r7, sp, #0
 455              		.cfi_def_cfa_register 7
 153:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c ****   app_init();
 456              		.loc 1 153 0
 457 022c FFF7FEFF 		bl	app_init
 458              	.L18:
 154:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 	while(1){
 155:C:/Users/levholm/Documents/basics_io/flipflop_irq\startup.c **** 		GPIO_D->odrLow = count;
 459              		.loc 1 155 0 discriminator 1
 460 0230 024A     		ldr	r2, .L19
 461 0232 034B     		ldr	r3, .L19+4
 462 0234 1B68     		ldr	r3, [r3]
 463 0236 DBB2     		uxtb	r3, r3
 464 0238 1375     		strb	r3, [r2, #20]
 465 023a F9E7     		b	.L18
 466              	.L20:
 467              		.align	2
 468              	.L19:
 469 023c 000C0240 		.word	1073875968
 470 0240 00000000 		.word	count
 471              		.cfi_endproc
 472              	.LFE5:
 474              	.Letext0:
 475              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 476              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 477              		.file 4 "C:/Users/levholm/Documents/basics_io/flipflop_irq/gpio.h"
