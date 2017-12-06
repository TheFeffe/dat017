#include "gpio.h"

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

#define EXTI_PR 0x40013C14
#define IRQ GPIO_E+0x14
#define SYSCFG_BASE ((volatile unsigned int *) 0x40013800)
#define SYSCFG_EXTICR1 ((volatile unsigned int *) 0x40013808)
#define EXIT_IMR ((volatile unsigned int *) 0x40013C00)
#define EXTI_FTSR ((volatile unsigned int *) 0x40013C0C)
#define EXTI_RTSR ((volatile unsigned int *) 0x40013C08)
#define EXTI_PR ((volatile unsigned int *) 0x40013C14)
#define EXTI_3_IRQVEC ((void (**)(void))0x2001C064)
#define EXTI_2_IRQVEC ((void (**)(void))0x2001C060)
#define EXTI_1_IRQVEC ((void (**)(void))0x2001C05C)
#define EXTI_0_IRQVEC ((void (**)(void))0x2001C058)
#define NVIC_ISERO ((volatile unsigned int *) 0xE000E100)
#define NVIC_EXTI3_IRQ (1<<9)
#define NVIC_EXTI2_IRQ (1<<8)
#define NVIC_EXTI1_IRQ (1<<7)
#define NVIC_EXTI0_IRQ (1<<6)
#define EXTI3_IRQ 0x8;
#define EXTI2_IRQ 0x4;
#define EXTI1_IRQ 0x2;
#define EXTI0_IRQ 0x1;


int count = 0;

void interrupt_handler(void)
{
	// Kolla om avbrottet kommer från EXTI3
  if(*EXTI_PR & 4)
  {
    //count++; // Öka count
    //om avbrott IRQ0
    if (*IRQ & 1) {
      IRQ |= 0x10;
      IRQ &= ~0x10;
      count++;
    }
    //om avbrott IRQ1
    if (*IRQ & 2) {

      IRQ |= 0x20;
      IRQ &= ~0x20;
      count=0;
    }
    if (*IRQ & 4) {

      IRQ |= 0x40;
      IRQ &= ~0x40;
      // om diodrampen är tänd
      if (GPIO_D->odrHigh == 0xFF) {
        GPIO_D->odrHigh = 0;
      }
      else{
        GPIO_D->odrHight = 0xFF;
      }


    }
    *((unsigned int *) 0x40013C14) |= 8; // Kvittera avbrott
  }
}

static volatile int count = 0;
void irq0_handler(void){
	count++;
	*EXTI_PR |= EXTI0_IRQ //reset-signal till EXTI, om denna rad tas bort kallas irq_handler 2 gånger per interrupt
	GPIO_E->odrLow |= 0x10; //reset-signal till interruptenheten
	GPIO_E->odrLow &= ~0x10;
}
void irq1_handler(void){
	count = 0;
	*EXTI_PR |= EXTI1_IRQ; //reset-signal till EXTI, om denna rad tas bort kallas irq_handler 2 gånger per interrupt
	GPIO_E->odrLow |= 0x20; //reset-signal till interruptenheten
	GPIO_E->odrLow &= ~0x20;
}
void irq2_handler(void){

	*EXTI_PR |= EXTI2_IRQ;
	GPIO_E->odrLow |= 0x40;
	GPIO_E->odrLow &= ~0x40;
	if (GPIO_D->odrHigh == 0xFF){
		GPIO_D->odrHigh = 0;
	}
	else{
		GPIO_D->odrHigh = 0xFF;
	}
}



void app_init(void)
{
  // Sätt upp PD0-7 som utport för visningsenhet
    GPIO_D->moder = 0x55555555;

  // Koppla PE3 tillavbrottslina EXTI3

    // Nollställ fält
    *((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
    // PE3->EXTI3
    *((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;

  // Konfigurera EXTI3 för att generera avbrott
    // Aktivera genom att ettställa motsvarande bit i EXTI_IMR
    *((unsigned int *) 0x40013C00) |= 8;
    // Aktivera triggvillkor "negativ flank"
    *((unsigned int *) 0x40013C0C) |= 8;
    // Maskera triggvillkor "positiv flank"
    *((unsigned int *) 0x40013C08) &= ~8;
    // Open the gates
    GPIO_E -> moder = 0x1500;
		//konfigurera avbrottshantering
			*SYSCFG_EXTICR1 &= 0xF000;
			*SYSCFG_EXTICR1 |= 0x0444;

			*EXTI_IMR |= 7;
			*EXTI_RTSR |= 7;
			*EXTI_FTSR &= ~7;

			*EXTI_0_IRQVEC = irq0_handler;
			*EXTI_1_IRQVEC = irq1_handler;
			*EXTI_2_IRQVEC = irq2_handler;

			*NVIC_ISER0 |= NVIC_EXTI0_IRQ;
			*NVIC_ISER0 |= NVIC_EXTI1_IRQ;
			*NVIC_ISER0 |= NVIC_EXTI2_IRQ;
			*NVIC_ISER0 |= NVIC_EXTI3_IRQ;

  // Sätt upp avbrottsvektor
  *((void (**)(void) ) 0x2001C064 ) = interrupt_handler;

  // Konfigurera de bitar i NVIC som kontrollerar den avbrottslina som EXTI3 kopplas till

}

void main(void)
{
  app_init();
	while(1){
		GPIO_D -> odrLow = count;
	}
}
