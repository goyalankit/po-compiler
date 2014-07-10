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
#include<sys/time.h>
#include "omp.h"
#include <vector>

#include <boost/algorithm/string.hpp>
#include <boost/algorithm/string/classification.hpp>
#include "boost/lexical_cast.hpp"

using namespace boost::algorithm;

#include "pass_runner.h"

#define NUM_THREADS 8 // default number of threads
#define MAX_NUM_PER_THREAD 1
#define RERUN_COUNT 10
#define MAX_PASS_LENGTH 10


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

struct timeval start, end_time;

#define _SYSTEM_CALL( CMD ) ( {            \
    int err = ( system( CMD.c_str() ) );   \
    if ( err < 0  ) {                      \ 
        fprintf(stderr, #CMD, " failed."); \
        abort();                           \
    }                                      \
    err;                                   \
})                                         \


inline COMMAND::COMMAND(string pass_order, long double threadId) {
  // opt -pass1 -pass2 ./bcfile -o temp.out.threadId >> /dev/null

  // combination_file_name/temp.out.input_combination_filename
  string temp_name = dir_name + string("./temp.out") + to_string(threadId); //+ input_combination_file;
  
  opt = string("opt ") + pass_order + " ./"  + binaryName + " -o "+ temp_name  + "" + " >> /dev/null";
  // Command to execute the file.
  lli = string("lli ") + temp_name + " " + binaryArgs;
}


struct passTime
{
  string pass_name;
  double time;
};

class PassTimeComparator
{
  public:
    bool operator()(passTime& n1, passTime& n2)
    {
      if (n1.time > n2.time)
        return true;
      else
        return false;
    }
};


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

  vector<string> &optimizationPasses = getOptimizationPasses();

  clock_t t1,t2;
  std::chrono::time_point<std::chrono::system_clock> start, end;
  float diff;
  long double tid;
  string pass_name;
  int pass_length = 0;
  string curr_pass_order = string("");
  while(pass_length < MAX_PASS_LENGTH) {
    priority_queue< passTime, vector< passTime >, PassTimeComparator> curr_pq;
#pragma omp parallel for private(pass_name, tid)
    for( int i = 0; i < optimizationPasses.size() ; ++i ) {
      pass_name = optimizationPasses[i];
      string temp_pass_order = curr_pass_order + string(" ") + pass_name;
      std::cout << pass_name << std::endl;
      tid = omp_get_thread_num();
      // apply pass here
      COMMAND Cmd(temp_pass_order, tid);
      _SYSTEM_CALL(Cmd.opt);

      // run RERUN_COUNT number of times to get the time
        // START TIMER HERE
       start = std::chrono::system_clock::now();
      for(int j=0; j < RERUN_COUNT; j++) {
      	_SYSTEM_CALL(Cmd.lli);
      }
      end = std::chrono::system_clock::now();
      std::chrono::duration<double> elapsed_seconds = end-start;
      double time_taken_by_current_pass = elapsed_seconds.count();
      // STOP TIMER HERE
#ifdef DEBUG
      cout << "Running Command: " << Cmd.opt  << "time taken " << time_taken_by_current_pass << endl;
#endif
      // store the time taken by current pass
      passTime curr = {pass_name, time_taken_by_current_pass};
      curr_pq.push(curr);
    }
    
    passTime pt = curr_pq.top();

    curr_pass_order = curr_pass_order + string(" ") + pt.pass_name;

    cout << "Appending " << pt.pass_name << " | Current Pass Order " << curr_pass_order  << " PassTime " << pt.time << endl;
    pass_length++;
  }
 
  cleanUpTheMess();
}

int main(int argc, char** argv) {

  int numThreads = NUM_THREADS;


  if(argc > 1) {
    binaryName = argv[1];
    binaryArgs = argv[2];
    numThreads = atoi(argv[3]);

    std::cout << binaryName << " " << binaryArgs << " " << numThreads << " " << endl;//<< input_combination_file << endl;
  } else {
    std::cout << "Usage: pass_runner <Binary Name> <NumThreads(optional)>" << std::endl;
    abort();
  }

  // set openmp number of threads
  omp_set_num_threads(numThreads);

//dir_name = string(input_combination_file) + "dir"; 
  //string create_dir_cmd = string("mkdir ") + dir_name;
  //_SYSTEM_CALL(create_dir_cmd );

  runOptimizationPasses();

  return EXIT_SUCCESS;
}
