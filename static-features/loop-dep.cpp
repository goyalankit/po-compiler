#define DEBUG_TYPE "loop-dep" 
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/IR/Type.h"
#include "llvm/ADT/hash_map.h"
#include "llvm/ADT/hash_set.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/AliasSetTracker.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/CFG.h"
#include "llvm/Target/TargetData.h"

#include <vector>
#include <deque>
#include <set>
#include <algorithm>
#include <ostream>
#include <fstream>
#include <iostream>

using namespace llvm;

STATISTIC(NumLoopNests, "Number of loop nests");
STATISTIC(NumPerfectLoopNests, "Number of perfect loop nests");
STATISTIC(NumIndependentMemOps, "Number of independent memory operations");
STATISTIC(NumAmbiguousDependentMemOps, "Number of ambiguous dependent memory operations");
STATISTIC(NumDirectionalDependentMemOps, "Number of directional dependent memory operations");
STATISTIC(NumInterestingLoops, "Number of loops with a nontrivial direction matrix");

namespace CS1745
{

/* A single dependence */
struct DependenceDirection
{
    char direction; // <,=,>, or *
    int distance; //if exists, nonzero
    
    DependenceDirection(): direction('*'), distance(0) {}
};

/*
 A class that represents a dependence matrix for a loop.  This is the union
 of all valid direction vectors of all dependences.
 */
class DependenceMatrix
{
    //implement, feel free to change any data structures
public:
    DependenceMatrix();
    DependenceMatrix(int n);
    void add(const std::vector<DependenceDirection>& vec);
    //more ?
    void clear();   
    void print( std::ostream& out);
    bool isTrivial(); //return true if empty (no dependence) or full (all dependencies)
};

class LoopDependence : public LoopPass
{
    friend struct MemOp;
    std::ofstream file;
public:
    static char ID;

    LoopDependence() : 
        LoopPass((intptr_t)&ID)
    {
        std::string name = "DEPINFO";
        file.open(name.c_str());
    }

    ~LoopDependence()
    {
    }

    virtual bool runOnLoop(Loop *L, LPPassManager &LPM);

    virtual void getAnalysisUsage(AnalysisUsage &AU) const
    {
        AU.setPreservesAll();   // We don't modify the program, so we preserve all analyses
        AU.addRequiredID(LoopSimplifyID);
        AU.addRequired<LoopInfo>();
        AU.addRequiredTransitive<AliasAnalysis>();
        AU.addPreserved<AliasAnalysis>();
        AU.addRequiredTransitive<TargetData>();
    }

private:
    // Various analyses that we use...
    AliasAnalysis *AA; // Current AliasAnalysis information
    LoopInfo *LI; // Current LoopInfo
    TargetData *TD;
    std::vector<PHINode*> iVars;
    hash_map<PHINode*, int> iVarsIndex;
    std::vector<Loop *> nestedLoops;
    DependenceMatrix depMatrix;

    //return true if L is a perfect nest of loops with nice iteration variables
    //fills in the induction variables in order and the body of the loop nest
    bool isPerfectNest(Loop *L, BasicBlock*& body);

    //return true if b has no memory operations
    bool hasNoMemoryOps(BasicBlock *b);

    //compute the dependency matrix for the inner block
    //implement this
    void computeDependencies(BasicBlock*& body);

};

bool LoopDependence::hasNoMemoryOps(BasicBlock *b)
{
    for (BasicBlock::iterator I = b->begin(), E = b->end(); I != E; I++)
    {
        switch (I->getOpcode())
        {
        case Instruction::Free:
        case Instruction::Store:
        case Instruction::Invoke:
        case Instruction::VAArg:
        case Instruction::Call:
        case Instruction::Load:
            std::cerr << *I << "\n";
            return false;
        }
    }
    return true;
}

bool LoopDependence::isPerfectNest(Loop *L, BasicBlock*& body)
{
    //get induction variable
    PHINode *ivar = L->getCanonicalInductionVariable();
    if (!ivar)
        return false;
    //record ivar
    iVarsIndex[ivar] = iVars.size();
    iVars.push_back(ivar);
    nestedLoops.push_back(L);
    //check to see if we're the innermost nest
    if (L->getBlocks().size() == 1)
    {
        body = *L->block_begin();
        return true;
    }
    else
    {
        //do we have a single subloop?
        if (L->getSubLoops().size() != 1)
            return false;
        //make sure all our non-nested loop blocks are innocuous
        for (Loop::block_iterator b = L->block_begin(), e = L->block_end(); b
                != e; b++)
        {
            BasicBlock *block = *b;
            if (LI->getLoopFor(block) == L)
            {
                if (!hasNoMemoryOps(block))
                    return false;               
            }
        }

        //recursively check subloops
        return isPerfectNest(*L->begin(), body);
    }
}

// Compute the dependence matrix of a loop.  Only consider perfectly
// nested, single block loops with easily analyzed array accesses.
bool LoopDependence::runOnLoop(Loop *L, LPPassManager &LPM)
{

    // Get our Loop and Alias Analysis information...
    LI = &getAnalysis<LoopInfo>();
    AA = &getAnalysis<AliasAnalysis>();
    TD = &getAnalysis<TargetData>();
    iVars.clear();
    iVarsIndex.clear();
    nestedLoops.clear();
    depMatrix.clear();
    
    //only process outermost loop
    if (L->getParentLoop())
        return false;
    NumLoopNests++;

    //now check that these loops are perfectly nested inside one another
    BasicBlock *body;

    if (!isPerfectNest(L, body))
        return false;
    
    //go through the basic block and make sure only loads and stores
    //access memory
    for (BasicBlock::iterator I = body->begin(), E = body->end(); I != E; I++)
    {
        switch (I->getOpcode())
        {
            case Instruction::Free:
            case Instruction::Invoke:
            case Instruction::VAArg:
            case Instruction::Call:
                return false; //can't handle these      
        }
    }
    
    NumPerfectLoopNests++;
    file << "Loop Nest " << NumPerfectLoopNests << "\n";
    depMatrix = DependenceMatrix(iVars.size());
    
    computeDependencies(body);
    
    file << "Matrix " << NumPerfectLoopNests << "\n";
    depMatrix.print(file);
    if(!depMatrix.isTrivial())
        NumInterestingLoops++;
    return false;
}


char LoopDependence::ID = 0;
RegisterPass<LoopDependence> X("loop-dep", "Loop Dependence");
}

