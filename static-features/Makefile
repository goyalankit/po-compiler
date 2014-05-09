all: ModuleInfo.so 

nice: all loop-out.bc

CXXFLAGS = -rdynamic $(shell llvm-config --cxxflags) -g -O0

%.so: %.o
	$(CXX) -dylib -flat_namespace -shared $^ -o $@


loop.bc: loop.c
	clang -O0 -I ~/csmith-2.0.0/runtime/ -emit-llvm -c loop.c

loop-out.bc: loop.bc
	opt -stats -load ./ModuleInfo.so -module-info loop.bc -o loop-out.bc

clean:
	rm -f *.o *~ *.so *.bc
