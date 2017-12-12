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
	//#ifdef USBDM
		*((unsigned long *) 0x40023830) =0x18;
		__asm volatile( " LDR R0,=0x08000209\n BLX R0\n");
	//#endif
	
	GPIO_D -> moder = 0x55005555;
	GPIO_D -> otyper = 0x70;
	GPIO_D -> pupdr = 0x00AA0000;
	setup_for_seg_disp(GPIO_D);
	//setup_for_ascii_display();
}
int running = 1;

int main(int argc, char **argv)
{
	char c;
	unsigned i;
 	init_app();
	graphic_initialize();
	graphic_clear_screen();
	

	/*while(1)
	{
		clear_backBuffer();
		
		// DO STUFF.
		
		graphic_draw_screen();
		delay_milli(40);
	}*/
	for( i = 0; i < 128; i++ )
		pixel(i, 10, 1);
	for( i = 0; i < 64; i++ )
		pixel(10, i, 1);
//	graphic_draw_screen();
	delay_milli( 500 );
	for( i = 0; i < 128; i++ )
		pixel(i, 10, 0);
	for( i = 0; i < 64; i++ )
		pixel(10, i, 0);
	//	graphic_draw_screen();
		delay_milli(500);
		graphic_clear_screen();
		
		
		int ballx = 20;
		int bally = 20;
		int velocix = 1;
		int velociy = 1;
		int speedx = 2;
		int speedy = 2;
		
		while(running){
			
			graphic_clear_screen();
				
			pixel(ballx, bally, 1);
			delay_milli(40);
			
			//ballx+=speedx*velocix;
			//bally+=speedy*velociy;
			c=keyb();
			switch(c)
			{
				case 6: velocix=1; break;
				case 4: velocix=-1; break;
				case 2: velociy=-1; break;
				case 8: velociy=1; break;
			}
			ballx+=speedx*velocix;
			bally+=speedy*velociy;
			if(ballx+speedx>=128||ballx-speedx<=0){
				velocix*=-1;
			}
			if(bally+speedy>=64||bally-speedy<=0){
				velociy*=-1;
			}
			
		}
		
				
}


