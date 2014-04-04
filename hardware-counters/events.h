static int _G_EVENTS[] = { PAPI_TOT_INS,
                          PAPI_TOT_CYC,  
                          PAPI_L2_TCM,
                          PAPI_BR_MSP };

#define _G_EVENT_COUNT sizeof(_G_EVENTS) / sizeof( int )

static long long _G_COUNTERS[_G_EVENT_COUNT];
