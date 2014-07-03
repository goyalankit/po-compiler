#include <chrono>
#include <ctime>
#include <fstream>
#include <iostream>
#include <map>
#include <queue>
#include <ratio>
#include <string>
#include <stdlib.h>
#include <time.h>
//#include "omp.h"
#include <vector>

#include <boost/algorithm/string.hpp>
#include <boost/algorithm/string/classification.hpp>
#include "boost/lexical_cast.hpp"

using namespace boost::algorithm;

#include "pass_runner.h"

#define NUM_THREADS 8 // default number of threads
#define MAX_NUM_PER_THREAD 100
#define RERUN_COUNT 10
#define MAX_PASS_LENGTH 30


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


class BoundMap {
  public:
    BoundMap() { };

    bool in_range(){
      if(pq.size() < MAX_NUM_PER_THREAD) return true;
      return false;
    }

    void insert(string s, double d){
      if(in_range()){
        pq.push(RECORD(s,d));

      } else if(pq.top().exec_time > d) {
        pq.pop();
        pq.push(RECORD(s,d));
      }

#ifdef BMAP_DEBUG
      std::cout << "Inserting new element with time "<< d << ". Size " << pq.size() << " Worst time " << pq.top().exec_time << " Sequence: " << pq.top().pass_order << std::endl;
#endif

    } /* end of function insert */

    void insert(RECORD r){
      if(in_range()){
        pq.push(r);

      } else if(pq.top().exec_time > r.exec_time) {
        pq.pop();
        pq.push(r);
      }
    }

    PQUEUE pq;
};


inline COMMAND::COMMAND(string pass_order, long double threadId) {
  // opt -pass1 -pass2 ./bcfile -o temp.out.threadId >> /dev/null

  // combination_file_name/temp.out.input_combination_filename
  //string temp_name = dir_name + string("/temp.out.") + input_combination_file;
  std::cout << "Running command " << pass_order << std::endl;
  //opt = string("opt ") + pass_order + " ./"  + binaryName + " -o "+ temp_name  + "" + to_string(threadId) + " >> /dev/null";
  // Command to execute the file.
  //
  //    lli = string("lli ") + temp_name + to_string(threadId) + " " + binaryArgs + to_string(threadId);
  // lli = string("lli ") + temp_name + to_string(threadId) + " " + binaryArgs + to_string(threadId);
}



void cleanUpTheMess() {
  string rm_command = string("rm -rf ") + dir_name;

#ifdef DEBUG
  cout << "Cleaning temporary files.." << endl;
  cout << "Running Command: " << rm_command << endl;
#endif
  _SYSTEM_CALL ( rm_command) ;
}


vector<string>& getOptimizationPasses() {
  vector<string> *optimizationPasses = new vector<string>();
  for(std::map<int, std::string>::iterator it = A::PASS_MAP.begin(), ie = A::PASS_MAP.end(); ie != it; ++it) {
    optimizationPasses->push_back(it->second);
  }
  return *optimizationPasses;
}

void runOptimizationPasses() {
  //map<string, double> optExecMap;


  std::map<string, long> after_pass_time;


  map<long double, BoundMap> boundMaps;
  vector<string> &optimizationPasses = getOptimizationPasses();

  clock_t t1,t2;
  float diff;
  long double tid;
  string pass_name;
  int pass_length = 0;
  while(pass_length < MAX_PASS_LENGTH) {
#pragma omp parallel for private(pass_name)
    for( int i = 0; i < optimizationPasses.size() ; ++i ) {
      pass_name = optimizationPasses[i];
      std::cout << pass_name << std::endl;
      for(int j=0; j < RERUN_COUNT; j++) {
        // START TIMER HERE
        COMMAND Cmd(pass_name, tid);
        // STOP TIMER HERE
      }
#ifdef DEBUG
      cout << "Running Command: " << Cmd.opt << "\n" << Cmd.lli  << " in thread number " << tid << endl;
#endif

    }
    pass_length++;
  }

  cleanUpTheMess();
}

int main(int argc, char** argv) {

  int numThreads = NUM_THREADS;

  /*
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
  */

  // this will potentially print the contents of events.1 file
#ifdef VERBOSE
  cout << passOrder;
#endif

  // set openmp number of threads
  //omp_set_num_threads(numThreads);

  //dir_name = string(input_combination_file) + "dir"; 
  //string create_dir_cmd = string("mkdir ") + dir_name;
  //_SYSTEM_CALL(create_dir_cmd );

  runOptimizationPasses();

  return EXIT_SUCCESS;
}
