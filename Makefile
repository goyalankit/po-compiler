all: ev2

ev2:
	icpc pass_runner.cpp -openmp -I/opt/apps/intel13/boost/1.51.0/include/ -o ev2 -DTIME -std=c++0x

clean:
	rm -rf ev2
