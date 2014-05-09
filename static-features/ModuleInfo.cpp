#include "llvm/Pass.h"
#include "llvm/Support/CFG.h"
#include "llvm/Support/InstIterator.h"
#include "llvm/PassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/Analysis/Dominators.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Assembly/AssemblyAnnotationWriter.h"
#include "llvm/DebugInfo.h"
#include "llvm/IR/Module.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/ADT/ValueMap.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Analysis/ConstantFolding.h"
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/ADT/Statistic.h"
#include <map>
#include <set>
#include <vector>
#include <ostream>
#include <fstream>
#include <iostream>

 using namespace llvm;
 using namespace std;

 STATISTIC(LoopInstNum, "Counts number of instructions in a loop");
 STATISTIC(LoopNum, "Counts number of loops");
 STATISTIC(LoopBasicBlocksNum, "Counts number of basic blocks in a loop");
 STATISTIC(LoopDepth, "sum of all depths of loop. divide by loop num to get average depth");
 STATISTIC(LoopBranchInstNum, "Counts number of branch instructions in a loop");
 STATISTIC(LoopLoadInst, "Counts number of load instructions in a loop");
 STATISTIC(LoopStoreInst, "Counts number of store instructions in a loop");



 namespace 
 {
   struct LICM : public LoopPass {
     static char ID; // Pass identification, replacement for typeid
     LICM() : LoopPass(ID) {}

     struct Features {
        int numberOfBasicBlocks;
        int numberOfInstructions;
        int loopDepth;
     };


     private:
     bool mayThrow;
     bool changed;
     LoopInfo* LI;
     DominatorTree* DT; 
     Loop* CurrentLoop;
     BasicBlock *Preheader;
     Instruction *InsertPt;
     std::vector<Features*> loopsFeature;

     virtual bool runOnLoop(Loop *L, LPPassManager &LPM) 
     {
          LI = &getAnalysis<LoopInfo>();
          DT = &getAnalysis<DominatorTree>();
          CurrentLoop = L;
          ++LoopNum;
          Features* F = new Features;

          Preheader = L->getLoopPreheader();

          mayThrow = false;
          int numOfInstr = 0; // number of instructions
          int numOfBB = 0; // number of basic blocks
          int numOfBranchInstruction = 0;

          for (Loop::block_iterator b = L->block_begin(), be = L->block_end();b !=be; ++b)
         {

             ++LoopBasicBlocksNum;
             
             for (BasicBlock::iterator i = (*b)->begin(), ie = (*b)->end(); i != ie; ++i)
             {
                 if (isa<BranchInst>(*i))
                     ++LoopBranchInstNum;
                 else if(isa<LoadInst>(*i))
                     ++LoopLoadInst;
                 else if(isa<StoreInst>(*i))
                     ++LoopStoreInst;

                 ++LoopInstNum;
             }

             LoopDepth += L->getLoopDepth();
         }
            
         F->loopDepth = L->getLoopDepth();

         errs() << "Num of instructions " << numOfInstr << " num of blocks " << numOfBB << " loop depth" << F->loopDepth <<" \n";

       return false;
     }

     // We don't modify the program, so we preserve all analyses
     virtual void getAnalysisUsage(AnalysisUsage &AU) const {
       AU.setPreservesAll();
       AU.addRequired<LoopInfo>();
       AU.addRequired<DominatorTree>();
     }

     bool inSubLoop(BasicBlock *bb)
     {
     
      assert(CurrentLoop->contains(bb) && "Valid if BB is IN the loop");
      return LI->getLoopFor(bb) != CurrentLoop;
    
     }



   };
 

 char LICM::ID = 0;
 RegisterPass<LICM> X("module-info", "LICM");

}

