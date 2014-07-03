// 15-745 S13 Assignment 1: FunctionInfo.cpp
//
// Based on code from Todd C. Mowry
// Modified by Arthur Peters
// Modified by Ankit Goyal
////////////////////////////////////////////////////////////////////////////////

#include "llvm/Pass.h"
#include "llvm/PassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/DebugInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/InstIterator.h"
#include "llvm/IR/Instruction.h"
#include "llvm/DebugInfo.h"
#include "llvm/Assembly/AssemblyAnnotationWriter.h"
#include "llvm/ADT/Statistic.h"


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

#include <ostream>
#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <string>

using namespace llvm;

STATISTIC(NumLeafMethods, "STAT: Leaf methods");
STATISTIC(NumMethodCalls, "STAT: Number of method calls");
STATISTIC(NumCastInst, "STAT: Number of cast instructions");
STATISTIC(NumICmpInst, "STAT: Number of integer compare instructions");
STATISTIC(NumFCastInst, "STAT: Number of float compare instructions");
STATISTIC(NumSwitchInst, "STAT: Number of switch instructions");
STATISTIC(NumIndirectBranchs, "STAT: Number of indirect branch instructions");
STATISTIC(NumArrayAccessInst, "STAT: Number of array index access");
STATISTIC(NumStackVariables, "STAT: Number of variables on stack");
STATISTIC(NumCondBranches, "STAT: Number of conditional branch instructions");
STATISTIC(NumUncondBranches, "STAT: Number of unconditional instructions");
STATISTIC(NumBranchInstruction, "STAT: Number of branch instructions"); // can be removed. sum of cond + uncond
STATISTIC(NumArrayAllocations, "STAT: Number of array allocations");
STATISTIC(NumStaticArrayAllocations, "STAT: Number of static array allocations");
STATISTIC(NumArAdd, "STAT: Arithmetic Add");
STATISTIC(NumArSub, "STAT: Arithmetic Sub");
STATISTIC(NumArMul, "STAT: Arithmetic Mul");
STATISTIC(NumArDiv, "STAT: Arithmetic Div");
STATISTIC(NumArRem, "STAT: Arithmetic Rem");
STATISTIC(NumLogOp, "STAT: Logical Operations");
STATISTIC(NumBitOp, "STAT: Bit Operations");

namespace {

	class FunctionInfo : public ModulePass{

		public:
			static char ID;
			FunctionInfo() : ModulePass(ID) { errs() << "\n"; 

				// initialize so that all the variables are printed in the stats
				NumLeafMethods = 0;
				NumMethodCalls = 0;
				NumArAdd = 0;
				NumArSub = 0;
				NumArMul = 0;
				NumArDiv = 0;
				NumArRem = 0;
				NumLogOp = 0;
				NumBitOp = 0;
				NumCastInst = 0;
				NumICmpInst = 0;
				NumFCastInst = 0;
				NumIndirectBranchs = 0;
				NumArrayAccessInst = 0;
				NumSwitchInst = 0;
				NumStackVariables = 0;
				NumCondBranches = 0;
				NumUncondBranches = 0;
				NumBranchInstruction = 0;
				NumArrayAllocations = 0;
				NumStaticArrayAllocations = 0;	
			} //default constructor
			~FunctionInfo() { errs() << "\n";  }


			bool OptypeInst(unsigned int op) {
				switch(op){

					case Instruction::Add:
					case Instruction::FAdd:{
								       NumArAdd++;
								       break;
							       }
					case Instruction::Sub:
					case Instruction::FSub:{
								       NumArSub++;
								       break;
							       }
					case Instruction::Mul:
					case Instruction::FMul:{
								       NumArMul++;
								       break;
							       }
					case Instruction::UDiv:
					case Instruction::FDiv:
					case Instruction::SDiv:{
								       NumArDiv++;
								       break;
							       }
					case Instruction::URem:
					case Instruction::SRem:
					case Instruction::FRem:{
								       NumArRem++;
								       break;
							       }
					case Instruction::Shl:
					case Instruction::LShr:
					case Instruction::AShr:{
								       NumLogOp++;
								       break;
							       }
					case Instruction::And:
					case Instruction::Or:
					case Instruction::Xor:{
								      NumBitOp++;
								      break;
							      }
					default:
							      break;

				}
			}

			void printFunctionDetails(Function &F) {
				int arg_size = F.arg_size();
				int num_call_sites = F.getNumUses();
				int num_basic_blocks = F.size(); //defined in value class.
				//count the number of instructions.
				int number_of_instructions = 0;
				for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I)
					number_of_instructions += 1;

				errs() << F.getName() <<": arguments=" << arg_size << " call sites=" <<  num_call_sites << " basic blocks=" << num_basic_blocks << " instructions=" << number_of_instructions << "\n\n";
			}

			void analyzeFunction(Function &F) {
				bool has_call_inst = false;
				for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
					Instruction *inst = &*I;
					if(isa<CallInst>(*inst)) {
						has_call_inst = true;
						++NumMethodCalls;
					} else if(isa<CastInst>(*inst)) {
						++NumCastInst;
					} else if(isa<ICmpInst>(*inst)) {
						++NumICmpInst;
					} else if(isa<FCmpInst>(*inst)) {
						++NumFCastInst;
					} else if(isa<SwitchInst>(*inst)) {
						++NumSwitchInst;
					} else if(isa<IndirectBrInst>(*inst)) {
						++NumIndirectBranchs;
					} else if(isa<GetElementPtrInst>(*inst)) {
						++NumArrayAccessInst;
					} else if(isa<AllocaInst>(*inst)) {
						if(AllocaInst *AI = dyn_cast<AllocaInst>(inst)) {
							if(AI->isArrayAllocation()) {
								++NumArrayAllocations;
							}
							if(AI->isStaticAlloca()) {
								++NumStaticArrayAllocations;
							}
							++NumStackVariables;
						}
					} else if(isa<BranchInst>(*inst)) {
						if(BranchInst *BI = dyn_cast<BranchInst>(inst)){
							if(BI->isConditional()) {
								++NumCondBranches;
							} else if(BI->isUnconditional()) {
								++NumUncondBranches;
							}
							++NumBranchInstruction;
						}					
					}

					OptypeInst(inst->getOpcode());
				}

				if(!has_call_inst) {
					++NumLeafMethods;
				}
			}





			virtual bool runOnModule(Module &M){
				for (Module::iterator MI = M.begin(), ME = M.end(); MI != ME; ++MI)
				{
					analyzeFunction(*MI);
					printFunctionDetails(*MI);
				}
				return false;
			}


			// We don't modify the program, so we preserve all analyses
			virtual void getAnalysisUsage(AnalysisUsage &AU) const {
				AU.setPreservesAll();
			}
	};

	// LLVM uses the address of this static member to identify the pass, so the
	// initialization value is unimportant.
	char FunctionInfo::ID = 0;

	// Register this pass to be used by language front ends.
	// This allows this pass to be called using the command:
	//    clang -c -Xclang -load -Xclang ./FunctionInfo.so loop.c
	static void registerMyPass(const PassManagerBuilder &,
			PassManagerBase &PM) {
		PM.add(new FunctionInfo());
	}
	RegisterStandardPasses
		RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
				registerMyPass);

	// Register the pass name to allow it to be called with opt:
	//    clang -c -emit-llvm loop.c
	//    opt -load ./FunctionInfo.so -function-info loop.bc > /dev/null
	// See http://llvm.org/releases/3.4/docs/WritingAnLLVMPass.html#running-a-pass-with-opt for more info.
	RegisterPass<FunctionInfo> X("function-info", "Function Information");

}

