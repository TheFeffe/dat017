void startup(void) __attribute__((naked)) __attribute__((section(".start_section")));
void startup ( void )
{
__asm volatile(
  " LDR R0,=0x2001C000\n"
  " MOV SP,R0\n"
  " BL main\n"
  " B . \n"
  );
}

void app_init ( void )
{
  * ( (unsigned long *) 0x40020C00) = 0x00005555;
}

int main(int argc, char **argv)
{
  unsigned char c;
  app_init();
  while(1) {
    c = (unsigned char) *(( unsigned short *) 0x40021010);
    * ( (unsigned char *) 0x40020C14) = c;
  }
}
