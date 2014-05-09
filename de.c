/***************************************************************
**                                                            **
**        D I F F E R E N T I A L     E V O L U T I O N       **
**                                                            **
** Program: de.c                                              **
**                                                            **
** Authors: Dr. Rainer Storn                                  **
**          c/o ICSI, 1947 Center Street, Suite 600           **
**          Berkeley, CA 94707                                **
**          Tel.:   510-642-4274 (extension 192)              **
**          Fax.:   510-643-7684                              **
**          E-mail: storn@icsi.berkeley.edu                   **
**          WWW: http://http.icsi.berkeley.edu/~storn/        **
**          on leave from                                     **
**          Siemens AG, ZFE T SN 2, Otto-Hahn Ring 6          **
**          D-81739 Muenchen, Germany                         **
**          Tel:    636-40502                                 **
**          Fax:    636-44577                                 **
**          E-mail: rainer.storn@zfe.siemens.de               **
**                                                            **
**          Kenneth Price                                     **
**          836 Owl Circle                                    **
**          Vacaville, CA 95687                               **
**          E-mail: kprice@solano.community.net               ** 
**                                                            **
** This program implements some variants of Differential      **
** Evolution (DE) as described in part in the techreport      **
** tr-95-012.ps of ICSI. You can get this report either via   **
** ftp.icsi.berkeley.edu/pub/techreports/1995/tr-95-012.ps.Z  **
** or via WWW: http://http.icsi.berkeley.edu/~storn/litera.html*
** A more extended version of tr-95-012.ps is submitted for   **
** publication in the Journal Evolutionary Computation.       ** 
**                                                            **
** You may use this program for any purpose, give it to any   **
** person or change it according to your needs as long as you **
** are referring to Rainer Storn and Ken Price as the origi-  **
** nators of the the DE idea.                                 **
** If you have questions concerning DE feel free to contact   **
** us. We also will be happy to know about your experiences   **
** with DE and your suggestions of improvement.               **
**                                                            **
***************************************************************/
#include "stdio.h"
#include "stdlib.h"
#include "math.h"

#define MAXPOP  500
#define MAXDIM  35

/*------Constants for rnd_uni()--------------------------------------------*/

#define IM1 2147483563
#define IM2 2147483399
#define AM (1.0/IM1)
#define IMM1 (IM1-1)
#define IA1 40014
#define IA2 40692
#define IQ1 53668
#define IQ2 52774
#define IR1 12211
#define IR2 3791
#define NTAB 32
#define NDIV (1+IMM1/NTAB)
#define EPS 1.2e-7
#define RNMX (1.0-EPS)
/* # include "conio.h" */  /* conio.h is not available on all platforms */

/*------------------------Globals---------------------------------------*/

long  rnd_uni_init;                 /* serves as a seed for rnd_uni()   */


/*---------Function devlarations----------------------------------------*/

float rnd_uni(long *idum);    /* uniform pseudo random number generator */
float extern evaluate(int D, float tmp[], long *nfeval); /* obj. funct. */

/*---------Function definitions-----------------------------------------*/ 
float rnd_uni(long *idum) 
{
  long j;
  long k;
  static long idum2=123456789;
  static long iy=0;
  static long iv[NTAB];
  float temp;

  if (*idum <= 0)
  {
    if (-(*idum) < 1) *idum=1;
    else *idum = -(*idum);
    idum2=(*idum);
    for (j=NTAB+7;j>=0;j--)
    {
      k=(*idum)/IQ1;
      *idum=IA1*(*idum-k*IQ1)-k*IR1;
      if (*idum < 0) *idum += IM1;
      if (j < NTAB) iv[j] = *idum;
    }
    iy=iv[0];
  }
  k=(*idum)/IQ1;
  *idum=IA1*(*idum-k*IQ1)-k*IR1;
  if (*idum < 0) *idum += IM1;
  k=idum2/IQ2;
  idum2=IA2*(idum2-k*IQ2)-k*IR2;
  if (idum2 < 0) idum2 += IM2;
  j=iy/NDIV;
  iy=iv[j]-idum2;
  iv[j] = *idum;
  if (iy < 1) iy += IMM1;
  if ((temp=AM*iy) > RNMX) return RNMX;
  else return temp;

}/*------End of rnd_uni()--------------------------*/



main(int argc, char *argv[])
{
   char  chr;             /* y/n choice variable                */

   int   i, j, k;         /* counting variables                 */
   int   r1, r2, r3;      /* placeholders for random indexes    */
   int   D;               /* Dimension of parameter vector      */
   int   NP;              /* number of population members       */
   int   imin;            /* index to member with lowest energy */
   int   refresh;         /* refresh rate of screen output      */
   int   strategy;        /* choice parameter for screen output */
   int   gen, genmax, seed;   

   long  nfeval;          /* number of function evaluations     */

   float trial_energy;    /* buffer variable                    */
   float initfac;         /* initializier of population         */
   float c[MAXPOP][MAXDIM], d[MAXPOP][MAXDIM]; /* populations   */
   float tmp[MAXDIM], best[MAXDIM], bestit[MAXDIM]; /* members  */
   float energy[MAXPOP];  /* obj. funct. values                 */
   float F,CR;            /* control variables of DE            */
   float emin;            /* help variables                     */
   float (*pold)[MAXPOP][MAXDIM], (*pnew)[MAXPOP][MAXDIM], (*pswap)[MAXPOP][MAXDIM];
   /* pointers to enable switching population arrays */

   FILE  *fpin_ptr;
   FILE  *fpout_ptr;

/*------Initializations----------------------------*/

 if (argc != 3)                                 /* number of arguments */
 {
    printf("\nUsage : de <input-file> <output-file>\n");
    exit(1);
 }


/*-----Read input data------------------------------------------------*/

 fpin_ptr   = fopen(argv[1],"r");

 if (fpin_ptr == NULL)
 {
    printf("\nCannot open input file\n");
    exit(1);                                 /* input file is necessary */
 }

 fscanf(fpin_ptr,"%d",&strategy);       /*---choice of strategy-----------------*/
 fscanf(fpin_ptr,"%d",&genmax);         /*---maximum number of generations------*/
 fscanf(fpin_ptr,"%d",&refresh);        /*---output refresh cycle---------------*/
 fscanf(fpin_ptr,"%d",&D);              /*---number of parameters---------------*/
 fscanf(fpin_ptr,"%d",&NP);             /*---population size.-------------------*/
 fscanf(fpin_ptr,"%f",&initfac);        /*---factor for initialization----------*/
 fscanf(fpin_ptr,"%f",&F);              /*---weight factor----------------------*/
 fscanf(fpin_ptr,"%f",&CR);             /*---crossing over factor---------------*/
 fscanf(fpin_ptr,"%d",&seed);           /*---random seed------------------------*/


 fclose(fpin_ptr);

/*-----Open output file-----------------------------------------------*/

   fpout_ptr   = fopen(argv[2],"w");

   if (fpout_ptr == NULL)
   {
      printf("\nCannot open output file\n");
      exit(1);
   }


/*-----Initialize random number generator-----------------------------*/

 rnd_uni_init = -(long)seed;  /* initialization of rnd_uni() */
 nfeval       =  0;  /* reset number of function evaluations */



/*------Initialization-----------------------------*/

   for (i=0; i<NP; i++)
   {
      //printf("|");
      for (j=0; j<D; j++) /* spread initial population members */
      {
     c[i][j] = 2.*(rnd_uni(&rnd_uni_init) - 0.5)*initfac;
     //printf("%f",c[i][j]);
     //if(j==D-1) printf("|\n");
     //else printf(",");
     tmp[j]  = c[i][j];
      }
      energy[i] = evaluate(D,tmp,&nfeval); /* obj. funct. value */
   }
   emin = energy[0];
   imin = 0;
   for (i=1; i<NP; i++)
   {
      if (energy[i]<emin)
      {
     emin = energy[i];
     imin = i;
      }
   }

   for (j=0;j<D;j++) 
   {
     best[j]   = c[imin][j]; /* save best member ever          */
     bestit[j] = c[imin][j]; /* save best member of generation */
   }

   pold = &c; /* old population (generation G)   */
   pnew = &d; /* new population (generation G+1) */


/*------Iteration loop--------------------------------------------*/

   gen = 0;                          /* generation counter reset */
   while ((gen < genmax) /*&& (kbhit() == 0)*/)
   {
      gen++;
      imin = 0;

      for (i=0; i<NP; i++)         /* Start of loop through ensemble  */
      {
     do                        /* Pick a random population member */
     {
       r1 = (int)(rnd_uni(&rnd_uni_init)*NP);
     }while(r1==i);

     do                        /* Pick a random population member */
     {
       r2 = (int)(rnd_uni(&rnd_uni_init)*NP);
     }while((r2==i) || (r2==r1));

     do                        /* Pick a random population member */
     {
       r3 = (int)(rnd_uni(&rnd_uni_init)*NP);
     }while((r3==i) || (r3==r1) || (r3==r2));


     /*-------Choice of strategy----------------------------------------*/
     if (strategy == 1) /* DE0 */
     {
       for (j=0; j<D; j++)          
       {                            
         tmp[j] = bestit[j] + F*((*pold)[i][j]-(*pold)[r1][j]);
       }
     }
     else if (strategy == 2) /* DE2 */
     {
       for (j=0; j<D; j++)          
       {
         tmp[j] = (*pold)[i][j];
       }
       j = (int)(rnd_uni(&rnd_uni_init)*D); /* random parameter "n" in tr-95-012.ps  */
       k = 0;
       do
       {    /* actually F should be called lambda according to the techreport */
         tmp[j] = tmp[j] + F*(bestit[j] - tmp[j]) + ((*pold)[r1][j]-(*pold)[r2][j]);
         j = (j+1)%D;
         k++;
       }while((rnd_uni(&rnd_uni_init) < CR) && (k < D)); /* k = "L" in tr-95-012.ps */
     }
     else if (strategy == 3) /* DE1 */
     {
       for (j=0; j<D; j++)        
       {                            
         tmp[j] = (*pold)[i][j];
       }
       j = (int)(rnd_uni(&rnd_uni_init)*D);
       /* printf("r1=%d  r2=%d  r3=%d  j=%d\n",r1,r2,r3,j); */
       k = 0;
       do
       {                            /* add fluctuation to random target */
         tmp[j] = (*pold)[r1][j] + F*((*pold)[r2][j]-(*pold)[r3][j]);
         j = (j+1)%D;
         k++;
       }while((rnd_uni(&rnd_uni_init) < CR) && k<D);
         }
     else if (strategy == 4)
     {
       for (j=0; j<D; j++)          /* c[i][j] is the target            */
       {
         tmp[j] = (*pold)[i][j];
       }
       j = (int)(rnd_uni(&rnd_uni_init)*D); /* random parameter         */
       k = 0;
       do
       {                            /* add fluctuation to random target */
         tmp[j] = tmp[j] + F*(bestit[j] - tmp[j]) + F*((*pold)[r1][j]-(*pold)[r2][j]);
         j = (j+1)%D;
         k++;
       }while((rnd_uni(&rnd_uni_init) < CR) && (k < D));
     }
         else /* DE01 (doesn't work as well as the others */
         {
       for (j=0; j<D; j++)          
       {                            
         tmp[j] = (*pold)[i][j];
       }
       j = (int)(rnd_uni(&rnd_uni_init)*D); /* random parameter  */
       k = 0;
       do
       {                           
         tmp[j] = bestit[j] + F*((*pold)[r1][j]-(*pold)[r2][j]);
         j = (j+1)%D;
         k++;
       }while((rnd_uni(&rnd_uni_init) < CR) && (k < D));
         }

      /*------Trial mutation now in tmp[]-----------------*/

     trial_energy = evaluate(D,tmp,&nfeval);  /* Evaluate new vector in tmp[] */

     if (trial_energy <= energy[i])   /* improved objective function value ? */
     {                                  
        energy[i]=trial_energy;         

        for (j=0;j<D;j++)
        {
           (*pnew)[i][j]=tmp[j];        /* replace target with new vector */
        }

        if (trial_energy<emin)          /* Was this a new minimum? */
        {                               /* if so...*/
           emin=trial_energy;           /* reset emin to new low...*/
           imin=i;
         //  printf("%d. %6f: |",gen,emin);
               for (j=0;j<D;j++)
               {                           /* store best member so far     */
             best[j]=tmp[j];           /* but don't change best member */
        // printf("%6f",best[j]);
        // if(j==D-1) printf("|\n");
        // else printf(",");
               }                           /* of current iteration yet     */             
        }                              /* If mutant fails the test...  */
     }                                 /* go to next the configuration */
         else
         {
        for (j=0;j<D;j++)
        {
           (*pnew)[i][j]=(*pold)[i][j];              /* replace target with old value */
        }
         }
      }
                        /* End mutation loop through pop. */
      for (j=0; j<D; j++)
      {
        bestit[j] = best[j];
      }
      /* swap population arrays. New generation becomes old one */
      pswap = pold;
      pold  = pnew;
      pnew  = pswap;



/*----Output part----------------------------------------------------------*/

      if (gen%refresh==1)   /* display after every refresh generations */
      {
    //printf("\n\n                         PRESS ANY KEY TO ABORT");
    //printf("\n\n\n Best-so-far obj. funct. value=%e\n",emin);

    for (j=0;j<D;j++)
    {
      //printf("\n best[%d]=%f",j,best[j]);
    }
    //printf("\n\n Generation=%d  NFEs=%ld",gen,nfeval);
   // printf("\n Strategy: %d    NP=%d    F=%f    CR=%f\n",strategy,NP,F,CR);
      }

      fprintf(fpout_ptr,"%ld   %-12.7g\n",nfeval,emin);
   }

/*-------Final output in file-------------------------------------------*/


   fprintf(fpout_ptr,"\n\n\n Best-so-far obj. funct. value = %e\n",emin);

   for (j=0;j<D;j++)
   {
     fprintf(fpout_ptr,"\n best[%d]=%f",j,best[j]);
   }
   fprintf(fpout_ptr,"\n\n Generation=%d  NFEs=%ld",gen,nfeval);
   fprintf(fpout_ptr,"\n Strategy: %d    NP=%d    F=%f    CR=%f\n",strategy,NP,F,CR); 

   fclose(fpout_ptr);
   return(0);
}

/*-----------End of main()------------------------------------------*/


float evaluate(int D, float tmp[], long *nfeval)
{
/* polynomial fitting problem */
   int   i, j;
   int const M=600;
   float px, x=-1, dx=M, result=0;

   (*nfeval)++;
   dx = 2/dx;
   for (i=0;i<=M;i++)
   {
      px = tmp[0];
      for (j=1;j<D;j++)
      {
     px = x*px + tmp[j];
      }
      if (px<-1 || px>1) result+=(1-px)*(1-px);
      x+=dx;
   }
   px = tmp[0];
   for (j=1;j<D;j++) px=1.2*px+tmp[j];
   px = px-72.661;
   if (px<0) result+=px*px;
   px = tmp[0];
   for (j=1;j<D;j++) px=-1.2*px+tmp[j];
   px =px-72.661;
   if (px<0) result+=px*px;
   return result;
}

float xxx(float a,float b,float c,float d,float e,float f,float g,float h,float i)
{
    float x[20];
    long cc;
    x[0]=a;
    x[1]=b;
    x[2]=c;
    x[3]=d;
    x[4]=e;
    x[5]=f;
    x[6]=g;
    x[7]=h;
    x[8]=i;
    return evaluate(9,x,&cc);
}



