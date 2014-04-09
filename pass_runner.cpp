#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <stdlib.h> 
#include <map>
#include "omp.h"
#include <time.h>

#define NUM_THREADS 8 //default number of threads

#ifdef DEBUG
#define TIME
#endif

#define _SYSTEM_CALL( CMD ) ({             \
    int err = ( system( CMD.c_str() ) );   \
    if ( err < 0  ) {                      \ 
        fprintf(stderr, #CMD, " failed."); \
        abort();                           \
    }                                      \
    err;                                   \
})                                         \

using namespace std;

/*------- GLOBAL VARIABES --------*/

// vector with permutations of passorder
vector<string> passOrder;

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
        // opt -pass1 -pass2 ./bcfile -o temp.out.threadId >> /dev/null
        string opt_command = string("opt ") + passOrder[i] + " ./matrix.o -o temp.out." + to_string(tid) + " >> /dev/null";

        // Command to execute the file.
        string lli_command = string("lli temp.out.") + to_string(tid) + " 12";
#ifdef DEBUG
        cout << "Running Command: " << opt_command  << " in thread number " << tid << endl;
#endif

        _SYSTEM_CALL( opt_command );

        t1 = clock();
        _SYSTEM_CALL( lli_command );
        t2 = clock();

        diff = (float)t2 - (float)t1;
        optExecMap.insert( pair<string,float>(passOrder[i], diff) );
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
        numThreads = atoi(argv[1]);
    }

    // open a file in read mode.
    ifstream infile; 
    infile.open("events.1");

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
