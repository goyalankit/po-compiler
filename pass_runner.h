#ifndef PASS_RUNNER_H_
#define PASS_RUNNER_H_

#include <map>
#include <string>

using namespace std;

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


#endif
