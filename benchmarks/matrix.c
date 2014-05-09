/******************************************************************************
 * Copyright (C) International Computer Science Institute, 1995.  COPYRIGHT   *
 * NOTICE: This code is provided "AS IS" WITHOUT ANY WARRANTY and is subject  *
 * to the terms of the SATHER LIBRARY GENERAL PUBLIC LICENSE contained in     *
 * the file "Doc/License" of the Sather distribution.  The license is also    *
 * available from ICSI, 1947 Center St., Suite 600, Berkeley CA 94704, USA.   *
 * -----> Please email comments to "sather-bugs@icsi.berkeley.edu". <-------- *
 *                                                                            *
 * matrix.c                                                                   *
 * implements naive matrix multiplication used to compare Sather and C        *
 * Version 1.0, June 1996, by Claudio Fleiner                             *
 ******************************************************************************/

long next() 
{
    static long seed=997;
    seed=seed*123457+97;
    if(seed<0) seed= -seed;
    return seed;
}

float rnd_floating() { return (float)(next()%1000000)/1000000.0; }

struct MATRIX {
    int rows;
    int cols;
    float *t;
};
#define M(m,x,y) m.t[x+y*m.cols]

struct MATRIX new_matrix(int cols,int rows)
{
    struct MATRIX t;
    t.rows=rows;
    t.cols=cols;
    t.t=(float *)malloc(sizeof(float)*cols*rows);
    return t;
}

void print_matrix(struct MATRIX t) {
    int i,j;
    for(i=0;i<t.rows;i++) {
        printf("| ");
        for(j=0;j<t.cols;j++) 
            printf("%f ",M(t,j,i));
        printf("|\n");
    }
    printf("\n");
}

struct MATRIX matrix_mult(struct MATRIX a,struct MATRIX b) {
    int x,y,z;
    struct MATRIX r;
    r=new_matrix(a.rows,a.rows);

    for(x=0;x<a.rows;x++)
        for(y=0;y<b.cols;y++) {
            M(r,y,x)=0.0;
            for(z=0;z<a.cols;z++) {
                M(r,y,x)+=M(a,z,x)*M(b,y,z);
            }
        }
    return r;
}


int main(int argc,char *argv[]) {
    int i,j;
    int size=atoi(argv[1]);
    struct MATRIX a,b,c;

    a=new_matrix(size,size);
    b=new_matrix(size,size);
    for(i=0;i<size;i++)
        for(j=0;j<size;j++) {
            M(a,i,j)=rnd_floating();
            M(b,i,j)=rnd_floating();
        }

    c=matrix_mult(a,b);
}


