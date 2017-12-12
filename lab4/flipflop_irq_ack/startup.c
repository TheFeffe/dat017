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

void app_init(void)
{
  // Sätt upp PD0-7 som utport för visningsenhet
    GPIO_D->moder = 0x55555555;

  // Koppla PE3 tillavbrottslina EXTI3
    #define SYSCFG_EXTICR1  0x40013808
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
  // Sätt upp avbrottsvektor
  *((void (**)(void) ) 0x2001C064 ) = interrupt_handler;

  // Konfigurera de bitar i NVIC som kontrollerar den avbrottslina som EXTI3 kopplas till
    *((unsigned int *) 0xE000E100) |= (1<<9);
}

void main(void)
{
  app_init();

}
