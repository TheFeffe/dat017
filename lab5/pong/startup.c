/*
 * 	startup.c
 *
 */

 #define POINT_MAXSIZE 32

#include "sys_delay.h"
#include "gpio.h"

typedef enum {
    true = 1, // kommatecken eller semikolon???
    false = 0
} bool;

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

int running = 1;
int winner = 0;

void init_app(void){
	//#ifdef USBDM
		*((unsigned long *) 0x40023830) =0x18;
		__asm volatile( " LDR R0,=0x08000209\n BLX R0\n");
	//#endif

	GPIO_D -> moder = 0x55005555;
	GPIO_D -> otyper = 0x70;
	GPIO_D -> pupdr = 0x00AA0000;
	setup_for_seg_disp(GPIO_D);
	setup_for_ascii_display();
}

typedef struct {
    int x,y;
} POINT;

typedef struct {
    int length;
    int width, height;
    POINT points[POINT_MAXSIZE];
} GEOMETRY, *PGEOMETRY;

typedef struct {
    PGEOMETRY geo;
    int xpos,ypos;
    int dirx, diry;
    void (*draw)(PBALL);
    void (*clear)(PBALL);
    void (*move)(PBALL);
    void (*setDirection)(PBALL, int, int);
} BALL, *PBALL;

typedef struct {
    PGEOMETRY geo;
    int xpos, ypos;
    int diry;
    int score;
    void (*draw)(PPLAYER);
    void (*clear)(PPLAYER);
    void (*move)(PPLAYER);
    void (*setDirection)(PPLAYER, int, int);
} PLAYER, *PPLAYER;

void drawPlayer(PPLAYER player) {
    for (size_t i = 0; i < player->geo->length; i++) {
        int x = player->xpos;
        int y = player->ypos;
        pixel(x, y, 1);
    }
}

void clearPlayer(PPLAYER player) {
    for (size_t i = 0; i < player->geo->length; i++) {
        int x = player->xpos;
        int y = player->ypos;
        pixel(x, y, 0);
    }
}

void movePlayer(PPLAYER player) {
    int ytmp = player->ypos + player->diry;
    if(ytmp + player->geo->height >= 64||ytmp <= 0) {
        player->ypos = ytmp;
    }
}

void drawBall(PBALL ball) {
    for (size_t i = 0; i < ball->geo->length; i++) {
        int x = ball->xpos;
        int y = ball->ypos;
        pixel(x, y, 1);
    }
}

void clearBall(PBALL ball) {
    for (size_t i = 0; i < ball->geo->length; i++) {
        int x = ball->xpos;
        int y = ball->ypos;
        pixel(x, y, 0);
    }
}

void moveBall(PBALL ball) {
    int xtmp = ball->xpos+ball->dirx;
    int ytmp = ball->ypos+ball->diry;
    // P1 längst till höger och P2 längst till vänster
    if(collidesWithPlayer1(ball)||collidesWithPlayer2(ball)){
        ball->dirx *= -1;
    }
    if (xtmp < 0) {
        winner = 1;
    }
    if (xtmp > 127) {
        winner = 2;
    }
    if(ytmp + ball->geo->height >= 64|| ytmp <= 0) {
        ball->diry *=-1;
    }
}

bool collidesWithPlayer1(PBALL ball) {
    int xtmp = ball->xpos+ball->dirx;
    int ytmp = ball->xpos+ball->diry;
    return (xtmp + ball->geo->width >= p1.xpos && (ytmp >= p1->ypos && ytmp <= p1->ypos + p1->geo->height);
}

bool collidesWithPlayer2(PBALL ball) {
    int xtmp = ball->xpos+ball->dirx;
    int ytmp = ball->xpos+ball->diry;
    return (xtmp <= p2.xpos+p2.geo->width && (ytmp >= p2->ypos && ytmp <= p2->ypos + p2->geo->height);
}

void setDirection(PBALL ball, int x, int y) {
    /* code */
}

static GEOMETRY ballGeometry = {
    12,
    4, 4,
    {
                {2, 1}, {3, 1},
        {1, 2}, {2, 2}, {3, 2}, {4, 2},
        {1, 3}, {2, 3}, {3, 3}, {4, 3},
                {2, 4}, {3, 4}
    }
}

static GEOMETRY playerGeometry = {
    16,
    2, 8,
    {
        {1, 1}, {2, 1},
        {1, 2}, {2, 2},
        {1, 3}, {2, 3},
        {1, 4}, {2, 4},
        {1, 5}, {2, 5},
        {1, 6}, {2, 6},
        {1, 7}, {2, 7},
        {1, 8}, {2, 8},
    }
}

static BALL leBall = {
    &ballGeometry,
    128/2, 64/2,
    4, 2,
    drawBall,
    clearBall,
    moveBall,
    setDirectionBall
}

static PLAYER p1 = {
    &playerGeometry,
    126, 28,
    0,
    0,
    drawPlayer,
    clearPlayer,
    movePlayer,
    setDirectionPlayer
}

static PLAYER p2 = {
    &playerGeometry,
    0, 28,
    0,
    0,
    drawPlayer,
    clearPlayer,
    movePlayer,
    setDirectionPlayer
}

int main(int argc, char **argv)
{
	char c;
	unsigned i;
 	init_app();
	graphic_initialize();
    ascii_init();
	graphic_clear_screen();

	while(running){

        for(int i = 0; i < 40; i++){
            c=keyb();
            delay_milli(1);
        }

		switch(c)
		{
			case 1: p2.diry = -4;
			case 4: p2.diry = 4;
			case 9: p1.diry = -4;
			case 15: p1.diry = 4;
		}

        p1.clearPlayer(&p1);
        p1.movePlayer(&p1);
        p1.drawPlayer(&p1);

        p2.clearPlayer(&p2);
        p2.movePlayer(&p2);
        p2.drawPlayer(&p2);

        leBall.clearBall(&leBall);
        leBall.moveBall(&leBall);
        leBall.drawBall(&leBall);

        if(winner) break;
	}

    char winner_text[18]; // 18 is length of ascii row
    char *s = winner_text;

    if(winner == 1)
    {
        winner_text = "Player 1 Wins!";
    }
    else if(winner == 2)
    {
        winner_text = "Player 2 Wins!";
    }

    ascii_gotoxy(1,1);
    while(*s)
    {
        ascii_write_char(*s++);
    }

}
