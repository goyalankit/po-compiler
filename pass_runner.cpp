#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <stdlib.h> 
#include <map>
#include "omp.h"
#include <time.h>
#include <chrono>
#include <ctime>
#include <ratio>

#define NUM_THREADS 8 //default number of threads
#if(0)
#ifdef DEBUG
#ifndef TIME
#define TIME
#endif
#endif
#endif

using namespace std;
using namespace std::chrono;

/*------- GLOBAL VARIABES --------*/
// vector with permutations of passorder
vector<string> passOrder;
char *binaryName;
char *binaryArgs;


#define _SYSTEM_CALL( CMD ) ({             \
    int err = ( system( CMD.c_str() ) );   \
    if ( err < 0  ) {                      \ 
        fprintf(stderr, #CMD, " failed."); \
        abort();                           \
    }                                      \
    err;                                   \
})                                         \


struct COMMAND { 
    string opt; 
    string lli;

    // constructor
    COMMAND(string, long double);
};

inline COMMAND::COMMAND(string pass_order, long double threadId){
    // opt -pass1 -pass2 ./bcfile -o temp.out.threadId >> /dev/null
    opt = string("opt ") + pass_order + " ./"  + binaryName + " -o temp.out." + to_string(threadId) + " >> /dev/null";
    // Command to execute the file.
    lli = string("lli temp.out.") + to_string(threadId) + " " + binaryArgs;
}



/*--------- General Purpose Methods --------*/

// print operator for vector<string>
void operator<<(ostream& os, vector<string> V){
    for( vector<string>::iterator it = V.begin(); it != V.end() ; ++it ) {
        os << *it << endl;
    }
}


void cleanUpTheMess(){
    string rm_command = string("rm -rf temp.out.*");
#ifdef DEBUG
    cout << "Cleaning temporary files.." << endl;
    cout << "Running Command: " << rm_command << endl;
#endif
    _SYSTEM_CALL ( rm_command) ;
}

void runOptimizationPasses(){
    map<string, float> optExecMap;
    clock_t t1,t2;
    float diff;
    long double tid;
#pragma omp parallel for private(t1, t2, diff, tid)
    for( int i = 0; i < passOrder.size() ; ++i ) {
        tid = omp_get_thread_num();

        // Run the passes with order from file.
        COMMAND Cmd(passOrder[i], tid);

#ifdef DEBUG
        cout << "Running Command: " << Cmd.opt << "\n" << Cmd.lli  << " in thread number " << tid << endl;
#endif

        _SYSTEM_CALL( Cmd.opt );

//        t1 = clock();
         high_resolution_clock::time_point t1 = high_resolution_clock::now();
        _SYSTEM_CALL( Cmd.lli );
         high_resolution_clock::time_point t2 = high_resolution_clock::now();
//        t2 = clock();
         duration<double> time_span = duration_cast<duration<double>>(t2 - t1);

//        diff = (float)t2 - (float)t1;
            std::cout << passOrder[i] << " : " << time_span.count() << std::endl;
//        optExecMap.insert( pair<string,floaat>(passOrder[i], time_span.count() ) );
    }


#ifdef TIME
    for (map<string, float>::iterator it = optExecMap.begin() ; it != optExecMap.end() ; ++it){
        std::cout << it->first << " : " << it->second << std::endl;
    }
#endif

    cleanUpTheMess();
}

int main(int argc, char** argv){

    int numThreads = NUM_THREADS;

    if(argc > 1){
        binaryName = argv[1];
        if (argc > 2) binaryArgs = argv[2];
        if(argc > 3) numThreads = atoi(argv[3]);
    }else{
        std::cout << "Usage: pass_runner <Binary Name> <NumThreads(optional)>" << std::endl;
        abort();
    }

    // open a file in read mode.
    ifstream infile; 
    infile.open("events.2");

    string opt_order;
    while(getline(infile,opt_order)) {
        passOrder.push_back(opt_order);
    }

    // this will potentially print the contents of events.1 file
#ifdef VERBOSE
    cout << passOrder;
#endif

    // set openmp number of threads
    omp_set_num_threads(NUM_THREADS);

    runOptimizationPasses();

    return EXIT_SUCCESS;
}
