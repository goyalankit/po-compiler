#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <stdlib.h> 
#include <map>
#include "omp.h"
#include <time.h>

#define NUM_THREADS 8

using namespace std;

// vector with permutations of passorder
vector<string> passOrder;

void runOptimizationPasses(){

    map<string, float> optExecMap;
    clock_t t1,t2;
    float diff;

#pragma omp parallel for private(t1, t2, diff)
    for( int i = 0; i < passOrder.size() ; ++i ) {

        string command = string("opt ") + passOrder[i] + string(" ./matrix.o >> /dev/null");

#ifdef DEBUG
        cout << "Running Command: " << command  << endl;
#endif

        t1 = clock();
        system(command.c_str());
        t2 = clock();

        diff = (float)t2 - (float)t1;
        optExecMap.insert( pair<string,float>(passOrder[i], diff) );
    }
}

// print operator for vector<string>
void operator<<(ostream& os, vector<string> V){
    for( vector<string>::iterator it = V.begin(); it != V.end() ; ++it ) {
        os << *it << endl;
    }
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
