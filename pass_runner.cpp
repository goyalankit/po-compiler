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

#include <boost/algorithm/string.hpp>
#include <boost/algorithm/string/classification.hpp>
#include "boost/lexical_cast.hpp"

using namespace boost::algorithm;

#include "pass_runner.h"

#define NUM_THREADS 8 // default number of threads
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
char *input_combination_file;
string dir_name;


#define _SYSTEM_CALL( CMD ) ( {            \
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

inline COMMAND::COMMAND(string pass_order, long double threadId) {
    // opt -pass1 -pass2 ./bcfile -o temp.out.threadId >> /dev/null

    string pname = " ";// = A::PASS_MAP[0];
    vector<string> strs;
    boost::split(strs,pass_order,boost::is_any_of(" "));

    for(vector<string>::iterator pit = strs.begin(); pit != strs.end(); ++pit){
        string pass_num_string = *pit;
        int pnumber = atoi(pass_num_string.c_str());
        pname = pname + " " + A::PASS_MAP[pnumber];
    }
#ifdef DEBUG
    cout << pname << endl;
#endif
    // combination_file_name/temp.out.input_combination_filename
    string temp_name = dir_name + string("/temp.out.") + input_combination_file;

    opt = string("opt ") + pname + " ./"  + binaryName + " -o "+ temp_name  + "" + to_string(threadId) + " >> /dev/null";
    // Command to execute the file.
    lli = string("lli ") + temp_name + to_string(threadId) + " " + binaryArgs + to_string(threadId);
}



/*--------- General Purpose Methods --------*/

// print operator for vector<string>
void operator<<(ostream& os, vector<string> V) {
    for( vector<string>::iterator it = V.begin(); it != V.end(); ++it ) {
        os << *it << endl;
    }
}


void cleanUpTheMess() {
    string rm_command = string("rm -rf ") + dir_name;

#ifdef DEBUG
    cout << "Cleaning temporary files.." << endl;
    cout << "Running Command: " << rm_command << endl;
#endif
    _SYSTEM_CALL ( rm_command) ;
}

void runOptimizationPasses() {
    map<string, double> optExecMap;
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

        double start = omp_get_wtime( );
        _SYSTEM_CALL( Cmd.lli );
        double end = omp_get_wtime( );

//        optExecMap.insert( pair<string, double>(passOrder[i], (end-start) ) );
    }


#ifdef TIME
    for (map<string, double>::iterator it = optExecMap.begin(); it != optExecMap.end() ; ++it) {
        std::cout << it->first << " : " << it->second << std::endl;
    }
#endif

    cleanUpTheMess();
}

int main(int argc, char** argv) {

    int numThreads = NUM_THREADS;

    if(argc > 1) {
        binaryName = argv[1];
        input_combination_file = argv[2];
        binaryArgs = argv[3];
        numThreads = atoi(argv[4]);
//        std::cout << binaryName << " " << binaryArgs << " " << numThreads << " " <<input_combination_file << endl;
    } else {
        std::cout << "Usage: pass_runner <Binary Name> <NumThreads(optional)>" << std::endl;
        abort();
    }

    // open a file in read mode.
    ifstream infile; 
    infile.open(input_combination_file);

    string opt_order;
    while(getline(infile, opt_order)) {
        passOrder.push_back(opt_order);
    }

    // this will potentially print the contents of events.1 file
#ifdef VERBOSE
    cout << passOrder;
#endif

    // set openmp number of threads
    omp_set_num_threads(numThreads);
    
    dir_name = string(input_combination_file) + "dir"; 
     string create_dir_cmd = string("mkdir ") + dir_name;
    _SYSTEM_CALL(create_dir_cmd );

    runOptimizationPasses();

    return EXIT_SUCCESS;
}
