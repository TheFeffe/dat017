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
	__asm volatile(
		" LDR R0,=0x2001C000\n"		/* set stack */
		" MOV SP,R0\n"
		" LDR R0,=0x08000209\n BLX R0\n"
		" BL main\n"				/* call main */
		".L1: B .L1\n"				/* never return */
	);
}
typedef char *String;

#define TARGET_FPS 30

int running = 1;
int winner = 0;

void init_app(void){
	//#ifdef USBDM
		*((unsigned long *) 0x40023830) =0x18;
		//__asm volatile( " LDR R0,=0x08000209\n BLX R0\n");
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
    //void (*setDirection)(PBALL, int, int);
} BALL, *PBALL;

typedef struct {
    PGEOMETRY geo;
    int xpos, ypos;
    int diry;
    int score;
    void (*draw)(PPLAYER);
    void (*clear)(PPLAYER);
    void (*move)(PPLAYER);
    //void (*setDirection)(PPLAYER, int, int);
} PLAYER, *PPLAYER;

void drawPlayer(PPLAYER player) {
    for (int i = 0; i < player->geo->length; i++) {
        int x = player->xpos + player->geo->points[i].x;
        int y = player->ypos + player->geo->points[i].y;
        pixel(x, y, 1);
    }
}

void clearPlayer(PPLAYER player) {
    for (int i = 0; i < player->geo->length; i++) {
        int x = player->xpos + player->geo->points[i].x;
        int y = player->ypos + player->geo->points[i].y;
        pixel(x, y, 0);
    }
}

void movePlayer(PPLAYER player) {
    int ytmp = player->ypos + player->diry;
    if(ytmp + player->geo->height <= 64||ytmp >= 0) {
        player->ypos = ytmp;
    }
}

void drawBall(PBALL ball) {
    for (int i = 0; i < ball->geo->length; i++) {
        int x = ball->xpos + ball->geo->points[i].x;
        int y = ball->ypos + ball->geo->points[i].y;
        pixel(x, y, 1);
    }
}

void clearBall(PBALL ball) {
    for (int i = 0; i < ball->geo->length; i++) {
        int x = ball->xpos + ball->geo->points[i].x;
        int y = ball->ypos + ball->geo->points[i].y;
        pixel(x, y, 0);
    }
}

void moveBall(PBALL ball, PPLAYER p1, PPLAYER p2) {
    int xtmp = ball->xpos+ball->dirx;
    int ytmp = ball->ypos+ball->diry;
    // P1 längst till höger och P2 längst till vänster
    if(collidesWithPlayer1(ball, p1)||collidesWithPlayer2(ball, p2)){
        ball->dirx *= -1;
    }
    if (xtmp < 0-1) {
        winner = 1;
    }
    if (xtmp > 127+1) {
        winner = 2;
    }
    if(ytmp + ball->geo->height >= 64|| ytmp <= 0) {
        ball->diry *=-1;
    }
	ball->xpos = ball->xpos+ball->dirx;
	ball->ypos = ball->ypos+ball->diry;
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
};

static GEOMETRY playerGeometry = {
    22,
    2, 11,
    {
        {1, 1}, {2, 1},
        {1, 2}, {2, 2},
        {1, 3}, {2, 3},
        {1, 4}, {2, 4},
        {1, 5}, {2, 5},
        {1, 6}, {2, 6},
        {1, 7}, {2, 7},
        {1, 8}, {2, 8},
		{1, 9}, {2, 9},
        {1, 10}, {2, 10},
        {1, 11}, {2, 11}
		
    }
};

static BALL leBall = {
    &ballGeometry,
    128/2, 64/2,
    4, 2,
    drawBall,
    clearBall,
    moveBall//,
    //setDirectionBall
};

static PLAYER p1 = {
    &playerGeometry,
    126, 28,
    0,
    0,
    drawPlayer,
    clearPlayer,
    movePlayer//,
    //setDirectionPlayer
};

static PLAYER p2 = {
    &playerGeometry,
    0, 28,
    0,
    0,
    drawPlayer,
    clearPlayer,
    movePlayer//,
    //setDirectionPlayer
};



int collidesWithPlayer1(PBALL ball, PPLAYER p) {
    int xtmp = ball->xpos+ball->dirx;
    int ytmp = ball->ypos+ball->diry;
	return xtmp >= p->xpos && (ytmp >= p->ypos - ball->geo->height && ytmp <= p->ypos + p->geo->height);
}

int collidesWithPlayer2(PBALL ball, PPLAYER p) {
    int xtmp = ball->xpos+ball->dirx;
    int ytmp = ball->ypos+ball->diry;
	return xtmp <= p->xpos+p->geo->width && (ytmp >= p->ypos - ball->geo->height && ytmp <= p->ypos + p->geo->height);
}

void setDirection(PBALL ball, int x, int y) {
    /* code */
}


int main(int argc, char **argv)
{
	char c;
	unsigned i;
 	init_app();
	graphic_initialize();
	
	graphic_clear_screen();

	while(running){
		p1.diry = 0;
		p2.diry = 0;

        for(int i = 0; i < 40; i++){
            c=keyb();
            delay_milli(1);
        }

		switch(c)
		{
			case 1: p2.diry = -4; break;
			case 4: p2.diry = 4; break;
			case 9: p1.diry = -4; break;
			case 15: p1.diry = 4; break;
		}

        p1.clear(&p1);
        p1.move(&p1);
        p1.draw(&p1);

        p2.clear(&p2);
        p2.move(&p2);
        p2.draw(&p2);

        leBall.clear(&leBall);
        leBall.move(&leBall, &p1, &p2);
        leBall.draw(&leBall);

        if(winner) break;
	}
	
	String winner_text;
	char line1[] = "Player 1 Wins!";
	char line2[] = "Player 2 Wins!";
	
	char * s = &winner_text;
    if(winner == 1)
    {
        //winner_text = "Player 1 Wins!";
		s = line1;
    }
    else
    {
        //winner_text = "Player 2 Wins!";
		s = &line2;
    }

    ascii_gotoxy(1,1);
    while(*s)
    {
        ascii_write_char(*s++);
    }

    //char winner_text[18]; // 18 is length of ascii row
    //char *s = winner_text;


}
