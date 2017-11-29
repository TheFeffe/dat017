/*
 * 	startup.c
 *
 */
 
#include "sys_delay.h"
#include "gpio.h"
 
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
	asm volatile(
		" LDR R0,=0x2001C000\n"		/* set stack */
		" MOV SP,R0\n"
		" BL main\n"				/* call main */
		".L1: B .L1\n"				/* never return */
	);
}

#define TARGET_FPS 30

void init_app(void){
	
}

int main(int argc, char **argv)
{
	unsigned i;
	init_app();
	graphic_initialize();
#ifndef SIMULATOR
	graphic_clear_screen();
#endif
	while(1)
	{
		clear_backBuffer();
		
		// DO STUFF.
		
		graphic_draw_screen();
		delay_milli(40);
	}
}

