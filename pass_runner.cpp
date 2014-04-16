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
#include "omp.h"
#include <vector>

#include <boost/algorithm/string.hpp>
#include <boost/algorithm/string/classification.hpp>
#include "boost/lexical_cast.hpp"

using namespace boost::algorithm;

#include "pass_runner.h"

#define NUM_THREADS 8 // default number of threads
#define MAX_NUM_PER_THREAD 16

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
  //
  //    lli = string("lli ") + temp_name + to_string(threadId) + " " + binaryArgs + to_string(threadId);
  lli = string("/Users/ankit/DevelopmentKits/build/bin/lli ") + temp_name + to_string(threadId) + " " + binaryArgs + to_string(threadId);
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
  //map<string, double> optExecMap;


  map<long double, BoundMap> boundMaps;
  BoundMap bmap;
  clock_t t1,t2;
  float diff;
  long double tid;

#pragma omp parallel for private(t1, t2, diff, tid, bmap)
  for( int i = 0; i < passOrder.size() ; ++i ) {
    tid = omp_get_thread_num();
    clock_t t1,t2;


    // Run the passes with order from file.
    COMMAND Cmd(passOrder[i], tid);

#ifdef DEBUG
    cout << "Running Command: " << Cmd.opt << "\n" << Cmd.lli  << " in thread number " << tid << endl;
#endif

    //        _SYSTEM_CALL( Cmd.opt );

    double start = omp_get_wtime( );

    t1 = clock();
    _SYSTEM_CALL( (Cmd.opt + " && " +Cmd.lli) );

    t2 = clock();
    double diff = (double)t2 - (double)t1;

    double end = omp_get_wtime( );

    bmap.insert( passOrder[i], (end-start) );
    boundMaps[tid] = bmap;
    //optExecMap.insert( pair<string, double>(passOrder[i], (32.4) ) );
  }

  // Merge data from all threads
  BoundMap finalBmap;

  for (map<long double, BoundMap>::iterator it = boundMaps.begin(); it != boundMaps.end(); ++it) {
    BoundMap BM = it->second;
    PQUEUE pq = BM.pq;
    while(!pq.empty()){
      RECORD rec = pq.top();
      pq.pop();
      finalBmap.insert(rec);
    }
  }

  std::cout << finalBmap.pq.size() << std::endl;

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
