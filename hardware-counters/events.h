#ifndef HARDWARE_COUNTERS_EVENTS
#define HARDWARE_COUNTERS_EVENTS

#define IT1 9
#define IT2 6
#define IT3 10

#ifdef I1
#define NUM_EVENTS IT1
static int numIteration = 1;
#elif I2
#define NUM_EVENTS IT2
static int numIteration = 2;
#else
#define NUM_EVENTS IT3
static int numIteration = 3;
#endif

static int _G_EVENTS[NUM_EVENTS];

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
