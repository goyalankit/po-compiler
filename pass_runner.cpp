#include <iostream>
#include <fstream>
#include <vector>
#include <string>

using namespace std;

// vector with permutations of passorder
vector<string> passOrder;

void runOptimizationPasses(){

    for( int i = 0; i < passOrder.size() ; ++i ) {
        system(NULL);
    }
}

// print operator for vector<string>
void operator<<(ostream& os, vector<string> V){
    for( vector<string>::iterator it = V.begin(); it != V.end() ; ++it ) {
        os << *it << endl;
    }
}

int main(){
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

    runOptimizationPasses();

}
