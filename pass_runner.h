#ifndef PASS_RUNNER_H_
#define PASS_RUNNER_H_

#include <map>
#include <string>

using namespace std;

typedef priority_queue< RECORD, vector< RECORD >, Comparator> PQUEUE;

struct A{
    static std::map<int,std::string> create_map()
    {

        std::map<int, std::string> _mPASSMAP;

        _mPASSMAP[0] =  "-loop-unroll";
        _mPASSMAP[1] =  "-loop-unswitch";
        _mPASSMAP[2] =  "-memcpyopt" ;
        _mPASSMAP[3] =  "-reassociate" ;
        _mPASSMAP[4] =  "-sccp" ;
        _mPASSMAP[5] =  "-bb-vectorize";
        _mPASSMAP[6] =  "-die";
        _mPASSMAP[7] =  "-dse";
        _mPASSMAP[8] =  "-inline";
        _mPASSMAP[9] =  "-licm";
        _mPASSMAP[10] = "-loop-rotate";
        _mPASSMAP[11] = " ";

        return _mPASSMAP;
    }
    static map<int, std::string> PASS_MAP;

};

std::map<int, std::string> A::PASS_MAP =  A::create_map(); ;

struct RECORD {
    string pass_order;
    double exec_time;

    RECORD(string s, double d) :  pass_order(s), exec_time(d){}
};

class Comparator
{
  public:
    bool operator()(RECORD& n1, RECORD& n2)
    {
      if (n1.exec_time < n2.exec_time)
        return true;
      else
        return false;
    }
};


struct COMMAND { 
  string opt; 
  string lli;

  // constructor
  COMMAND(string, long double);
};

// print operator for vector<string>
void operator<<(ostream& os, vector<string> V) {
  for( vector<string>::iterator it = V.begin(); it != V.end(); ++it ) {
    os << *it << endl;
  }
}




#endif
