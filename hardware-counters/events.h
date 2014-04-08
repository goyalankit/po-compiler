#ifndef HARDWARE_COUNTERS_EVENTS
#define HARDWARE_COUNTERS_EVENTS

#define CURRENT_NUM 0

static int NUM_EVENTS[] = {9, 9, 8};

static int _G_EVENTS[NUM_EVENTS[CURRENT_NUM]];

static int _G_EVENTS_AVAIL[] = {                           
    PAPI_TOT_CYC,
    PAPI_STL_ICY,
    PAPI_TOT_INS,
    PAPI_FP_INS,
    PAPI_FP_OPS,
    PAPI_BR_INS,
    PAPI_BR_MSP,
    PAPI_BR_TKN,
    PAPI_L1_DCM,
    PAPI_L1_LDM,
    PAPI_L1_STM,
    PAPI_TLB_DM,
    PAPI_TLB_IM,
    PAPI_L2_DCA,
    PAPI_L2_DCH,
    PAPI_L2_DCM,
    PAPI_L2_DCR,
    PAPI_L2_DCW,
    PAPI_L2_ICA,
    PAPI_L2_ICH,
    PAPI_L1_ICM,
    PAPI_L2_ICM,
    PAPI_L2_TCA,
    PAPI_L1_TCM,
    PAPI_L2_TCM
};

#define _G_EVENT_COUNT sizeof(_G_EVENTS) / sizeof( int )

static long long _G_COUNTERS[_G_EVENT_COUNT];

#endif /* HARDWARE_COUNTERS_EVENTS */
