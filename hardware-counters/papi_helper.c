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
#include <string.h>

#define _CALL_PAPI( CALL ) ({                                            \
    int err = (CALL);                                                    \
    if ( err < PAPI_OK ) {                                               \
        fprintf( stderr, #CALL " failed: %s\n", PAPI_strerror( err ) );  \
        abort();                                                         \
    }                                                                    \
    err;                                                                 \
})

void initializeCounters(int num){
    int i=0,j=0;
    for( i = num * 9, j=0; i < NUM_EVENTS * (num+1); i++){
#ifdef DBG
        printf("i=%d, j=%d", i, j);
#endif
        _G_EVENTS[j++] = _G_EVENTS_AVAIL[i];
    }
}

void printGEvents(){
    int i;
    for(i=0; i<NUM_EVENTS; i++){
        char name[PAPI_MAX_STR_LEN];
        (void) PAPI_event_code_to_name( _G_EVENTS[i], name );
        printf("Event %d: %s\n",i ,name);
    }
}

//
// This method should be placed at the start of instrumented code
//
void startPapiCounters(){
    initializeCounters(0);
#ifdef DBG
    printGEvents();
    printf("********* STARTING COUNTERS *************\n");
#endif
    assert(NUM_EVENTS == _G_EVENT_COUNT);
    // initialize papi library and assert that it's successful
    _CALL_PAPI(PAPI_library_init( PAPI_VER_CURRENT ));    
    
    // check that all the events can be counted at once.
    int numCounters = PAPI_num_counters() ;
    assert( _G_EVENT_COUNT <= numCounters );

    
#ifdef DBG
    printf("Number of hardware counters available on this machine: %d", numCounters);
#endif

    for ( int i = 0; i < _G_EVENT_COUNT; i++ ) {
        char name[PAPI_MAX_STR_LEN];
        (void) _CALL_PAPI(PAPI_event_code_to_name( _G_EVENTS[i], name ));
        if(PAPI_query_event( _G_EVENTS[i] ) < PAPI_OK) {
            fprintf(stderr, "Event %s could not be counted on this machine.\n", name);
            abort();
        }
    }

    //*******  Start Counters ******
    (void) _CALL_PAPI(PAPI_start_counters(_G_EVENTS, _G_EVENT_COUNT));
}

//
// This method should be placed at the end of instrumented code
//
void stopPapiCounters(){
#ifdef DBG
    printf("********* STOPING COUNTERS *************\n");
#endif

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

void printAllAvailableCounters(){
    // initialize papi library and assert that it's successful
    assert( PAPI_library_init( PAPI_VER_CURRENT ) == PAPI_VER_CURRENT );    

    // print header
    printf( "--- Available events ---\n" );
    printf( "%-15s %s\n", "Name", "Description" );
    // loop through all PAPI events supported on this plattform
    int event = 0 | PAPI_PRESET_MASK; // the first event
    do {
        // ignore unsupported events
        if ( PAPI_query_event( event ) != PAPI_OK ) continue; 

        // get event info
        PAPI_event_info_t info;
        (void) PAPI_get_event_info( event, &info);

        // print
        printf( "%-15s %s\n", info.symbol, info.long_descr );
    } while ( PAPI_enum_event( &event, PAPI_ENUM_ALL ) == PAPI_OK );


}

