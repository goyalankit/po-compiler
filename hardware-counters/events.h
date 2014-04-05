#ifndef HARDWARE_COUNTERS_EVENTS
#define HARDWARE_COUNTERS_EVENTS
#define NUM_EVENTS 8

static int _G_EVENTS[NUM_EVENTS];
static int _G_EVENTS_AVAIL[] = {                           
    PAPI_BR_PRC,
    PAPI_TOT_INS,
    PAPI_FP_INS,
    PAPI_LD_INS,
    PAPI_SR_INS,
    PAPI_BR_INS,
    PAPI_TOT_CYC,
    PAPI_L2_ICH,
    PAPI_L3_ICA,

    PAPI_L2_ICR,
    PAPI_L3_ICR,
    PAPI_L2_TCA,
    PAPI_L3_TCA,
    PAPI_L2_TCR,
    PAPI_L3_TCR,
    PAPI_L2_TCW,
    PAPI_L3_TCW,
    PAPI_FDV_INS,
    PAPI_FP_OPS,
    PAPI_SP_OPS,
    PAPI_DP_OPS,
    PAPI_VEC_SP,
    PAPI_VEC_DP,
    PAPI_REF_CYC 
};


#define _G_EVENT_COUNT sizeof(_G_EVENTS) / sizeof( int )

static long long _G_COUNTERS[_G_EVENT_COUNT];

#endif /* HARDWARE_COUNTERS_EVENTS */
