//===- papi_helper.cpp - Contains helper function to call PAPI lib" -------===//
//
// This file implements function in papi.h. These are helper functions to 
// to start and stop counter using PAPI library. 
// Events that are measured are defined in events.h file.
//
//===----------------------------------------------------------------------===//

#include "papi_helper.h"
#include <papi.h>
#include "events.h"

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

void startPapiCounters(){

    // initialize papi library
    
    assert( PAPI_library_init( PAPI_VER_CURRENT ) == PAPI_VER_CURRENT );    
    
    // check that all the events can be counted at once.
    int numCounters = PAPI_num_counters() ;
    assert( _G_EVENT_COUNT <= numCounters );

    // Start Counters
    assert( PAPI_start_counters(_G_EVENTS, _G_EVENT_COUNT) >= PAPI_OK);
}

void stopPapiCounters(){
    int i;
    assert(PAPI_stop_counters(_G_COUNTERS, _G_EVENT_COUNT) >= PAPI_OK);

    for( i = 0; i < _G_EVENT_COUNT; ++i ) {
        PAPI_event_info_t info;
        PAPI_get_event_info(_G_EVENTS[i], &info);
        printf("%20lld %-15s %s\n", _G_COUNTERS[i], info.symbol, info.long_descr);
    }

}

