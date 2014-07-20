#ifndef PASS_RUNNER_H_
#define PASS_RUNNER_H_

#include <map>
#include <string>

using namespace std;


struct A{
	static std::map<int,std::string> create_map()
	{

		std::map<int, std::string> _mPASSMAP;

		_mPASSMAP[0] = "-datalayout";
		_mPASSMAP[1] = "-notti";
		_mPASSMAP[2] = "-basictti";
		_mPASSMAP[3] = "-x86tti";
		_mPASSMAP[4] = "-targetlibinfo";
		_mPASSMAP[5] = "-no-aa";
		_mPASSMAP[6] = "-tbaa";
		_mPASSMAP[7] = "-basicaa";
		_mPASSMAP[8] = "-preverify";
		_mPASSMAP[9] = "-domtree";
		_mPASSMAP[10] = "-verify";
		_mPASSMAP[11] = "-simplifycfg";
		_mPASSMAP[12] = "-sroa";
		_mPASSMAP[13] = "-early-cse";
		_mPASSMAP[14] = "-lower-expect";
		_mPASSMAP[15] = "-globalopt";
		_mPASSMAP[16] = "-ipsccp";
		_mPASSMAP[17] = "-deadargelim";
		_mPASSMAP[18] = "-instcombine";
		_mPASSMAP[19] = "-basiccg";
		_mPASSMAP[20] = "-prune-eh";
		_mPASSMAP[21] = "-inline-cost";
		_mPASSMAP[22] = "-inline";
		_mPASSMAP[23] = "-functionattrs";
		_mPASSMAP[24] = "-argpromotion";
		_mPASSMAP[25] = "-lazy-value-info";
		_mPASSMAP[26] = "-jump-threading";
		_mPASSMAP[27] = "-correlated-propagation";
		_mPASSMAP[28] = "-tailcallelim";
		_mPASSMAP[29] = "-reassociate";
		_mPASSMAP[30] = "-loops";
		_mPASSMAP[31] = "-loop-simplify";
		_mPASSMAP[32] = "-lcssa";
		_mPASSMAP[33] = "-loop-rotate";
		_mPASSMAP[34] = "-licm";
		_mPASSMAP[35] = "-loop-unswitch";
		_mPASSMAP[36] = "-scalar-evolution";
		_mPASSMAP[37] = "-indvars";
		_mPASSMAP[38] = "-loop-idiom";
		_mPASSMAP[39] = "-loop-deletion";
		_mPASSMAP[40] = "-loop-unroll";
		_mPASSMAP[41] = "-memdep";
		_mPASSMAP[42] = "-gvn";
		_mPASSMAP[43] = "-memcpyopt";
		_mPASSMAP[44] = "-sccp";
		_mPASSMAP[45] = "-dse";
		_mPASSMAP[46] = "-slp-vectorizer";
		_mPASSMAP[47] = "-adce";
		_mPASSMAP[48] = "-barrier";
		_mPASSMAP[49] = "-loop-vectorize";
		_mPASSMAP[50] = "-strip-dead-prototypes";
		_mPASSMAP[51] = "-globaldce";
		_mPASSMAP[52] = "-constmerge";

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

typedef priority_queue< RECORD, vector< RECORD >, Comparator> PQUEUE;

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
