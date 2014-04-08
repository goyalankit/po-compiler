po-compiler
===========

Phase order optimization in compilers

**Instructions to run on stampede**

``` 
module load papi
clang -I/opt/apps/papi/5.3.0/include -L/opt/apps/papi/5.3.0/lib -lpapi papi_helper.c  test.c
export NUM_EVENTS=9
export ITER_COUNT=1

```
