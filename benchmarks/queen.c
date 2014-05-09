/******************************************************************************
 * Copyright (C) International Computer Science Institute, 1995.  COPYRIGHT   *
 * NOTICE: This code is provided "AS IS" WITHOUT ANY WARRANTY and is subject  *
 * to the terms of the SATHER LIBRARY GENERAL PUBLIC LICENSE contained in     *
 * the file "Doc/License" of the Sather distribution.  The license is also    *
 * available from ICSI, 1947 Center St., Suite 600, Berkeley CA 94704, USA.   *
 * -----> Please email comments to "sather-bugs@icsi.berkeley.edu". <-------- *
 *                                                                            *
 * queen.c                                                                    *
 * calculates how many different positions exist to put n queen on        *
 * an nxn chess board                                 *
 * Version 1.0, June 1996, by Claudio Fleiner                             *
 ******************************************************************************/
#include <stdio.h>
#include "times.h"

#define MAX_QUEEN 100  /* not more than 100 queens on board */

struct BOARD {
    char size;
    char field[1];
};

int print_result;

struct BOARD *new_board(int n) {
    struct BOARD *r;
    r=(struct BOARD *)calloc(sizeof(struct BOARD)+n*n,1);
    r->size=n;
    return r;
}

void print_board(struct BOARD *board)
{
    int x,y;
    printf("QUEENS: ");
    for(x=0;x<board->size;x++) {
        printf("%d ",board->field[x]);
    }
    printf("\n");
}

int position_queen(int x,struct BOARD *board)
{
    int i,j,ok,count=0;
    if(x==board->size) { /* found solution */
        if(print_result) print_board(board);
        return 1;
    } else {
        for(i=0;i<board->size;i++) {
            if(!board->field[i]) {
                for(j=0;j<board->size && (ok=board->field[j]==0
                      || (x+1-board->field[j]!=i-j && x+1-board->field[j]!=j-i));j++);
                if(ok) {
                    board->field[i]=x+1;
                    count+=position_queen(x+1,board);
                    board->field[i]=0;
                }
            }
        }
    }
    return count;
}

int main(int argc,char *argv[])
{
    int i,found;
    struct BOARD *b;
    TIMES t;
    int queens=0;
    if(argc==2 && strcmp(argv[1],"TEST")==0) {
        queens=8;
        print_result=1;
    } else for(i=1;i<argc;i++) {
        if(strcmp(argv[i],"-p")==0) print_result=1;
        else queens=atoi(argv[i]);
    }
    if(!queens) {
        fprintf(stderr,"USAGE: queens [-p] queens | queens TEST\n");
        exit(1);
    }
    if(queens>99 || queens<1) {
        fprintf(stderr,"you need at least 1 and may have at most 99 queens (not %d)\n",queens);
        exit(1);
    }
    b=new_board(queens);
    t=times_now();
    found=position_queen(0,b);
    t=times_elapsed(t);
    printf("found %d solutions for the %d - queen problem\n%s",found,queens,times_str(t));
    return(0);
}
