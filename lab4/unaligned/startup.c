/*
 * 	startup.c
 *
 */
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

void usage_fault_handler( int num )
{
	while(1);
}

void main(void)
{
	int *ip, i;
	*((void (**)(void) ) 0x2001C018 ) = usage_fault_handler;
	while( 1 )
	{
		ip = (int *) 0x20001001;
		i = *ip;
	}
}

