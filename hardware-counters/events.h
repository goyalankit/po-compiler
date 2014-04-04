#ifndef HARDWARE_COUNTERS_EVENTS
#define HARDWARE_COUNTERS_EVENTS

static int _G_EVENTS[] = {                           
                            PAPI_HW_INT,    /* Hardware interrupts */
//                            PAPI_RES_STL,   /* Cycles processor is stalled on resource */
//                            PAPI_STL_ICY,   /* Cycles with No Instruction Issue */
                            PAPI_TOT_CYC,   /* Total Cycles */
                            PAPI_TOT_INS,   /* Total instructions executed */
//                            PAPI_VEC_INS   /* Vector/SIMD instructions executed */
                        };

#define _G_EVENT_COUNT sizeof(_G_EVENTS) / sizeof( int )

static long long _G_COUNTERS[_G_EVENT_COUNT];

#endif /* HARDWARE_COUNTERS_EVENTS */
