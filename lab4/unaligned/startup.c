/*
 * 	startup.c
 *
 */
#include "sys_delay.h"
#include "gpio.h"
 
 #ifdef SIMULATOR
 #define DELAY_COUNT 100
 #else
 #define DELAY_COUNT 1000000
 #endif
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

void init_app( void )
{
	/* Initiera port D */
	/* Initiera undantagsvektor */
	*((void (**)(void) ) 0x2001C03C ) = systick_irq_handler;
}

void main(void)
{
	init_app();
	GPIO_D -> odrLow = 0;
	delay( DELAY_COUNT );
	GPIO_D -> odrLow = 0xFF;
	while(1)
	{
		if( systick_flag )
			break;
			/* Här placeras kod som kan utföras under väntetiden */
	}
	/* Här finns den kod som "väntar" på timeout */
	GPIO_D -> odrLow = 0;
}

