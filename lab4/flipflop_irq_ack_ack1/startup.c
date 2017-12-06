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

int count = 0;

void interrupt_handler(void)
{
	// Kolla om avbrottet kommer från EXTI3
  if(*EXTI_PR & 4)
  {
    count++; // Öka count
    *((unsigned int *) 0x40013C14) |= 8; // Kvittera avbrott
  }
}

void app_init(void)
{
  // Sätt upp PD0-7 som utport för visningsenhet
    GPIO_D->moder = 0x00005555;

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

  // Sätt upp avbrottsvektor
  *((void (**)(void) ) 0x2001C064 ) = interrupt_handler;

  // Konfigurera de bitar i NVIC som kontrollerar den avbrottslina som EXTI3 kopplas till
    *((unsigned int *) 0xE000E100) |= (1<<9);
}

void main(void)
{
  app_init();

}
