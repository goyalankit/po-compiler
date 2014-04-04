//===- papi_helper.cpp - Contains helper function to call PAPI lib" --------===//
//
// This file implements function in papi.h. These are helper functions to 
// to start and stop counter using PAPI library. 
// Events that are measured are defined in events.h file.
//
// Note: 
// Global variables: _G_EVENTS, _G_EVENT_COUNT, _G_COUNTERS defined in events.h
//
//===-----------------------------------------------------------------------===//

#include <papi.h>
#include "events.h"
#include "papi_helper.h"

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

//
// This method should be placed at the start of instrumented code
//
void startPapiCounters(){

    // initialize papi library and assert that it's successful
    assert( PAPI_library_init( PAPI_VER_CURRENT ) == PAPI_VER_CURRENT );    
    
    // check that all the events can be counted at once.
    int numCounters = PAPI_num_counters() ;
    assert( _G_EVENT_COUNT <= numCounters );

    //*******  Start Counters ******
    assert( PAPI_start_counters(_G_EVENTS, _G_EVENT_COUNT) >= PAPI_OK);
}

//
// This method should be placed at the end of instrumented code
//
void stopPapiCounters(){
    int i;

    //*******  Stop Counters ******
    assert(PAPI_stop_counters(_G_COUNTERS, _G_EVENT_COUNT) >= PAPI_OK);
    
    // get the counter information for each event.
    // currently printing on stdout.
    for( i = 0; i < _G_EVENT_COUNT; ++i ) {
        PAPI_event_info_t info;
        PAPI_get_event_info(_G_EVENTS[i], &info);
        printf("%20lld %-15s %s\n", _G_COUNTERS[i], info.symbol, info.long_descr);
    }
}

