all: main.cpp
	mpic++ -g -O3 -std=c++17 main.cpp -o a2
run1: all
	mpirun -np 4 ./a2 --taskid=1 --inputpath=./testcases/test3/test-input-3.gra --headerpath=./testcases/test3/test-header-3.dat --outputpath=outputfile.txt --verbose=1 --startk=1 --endk=5 --p=2
run0: all
	mpirun -np 4 ./a2 --taskid=1 --inputpath=./testcases/test3/test-input-3.gra --headerpath=./testcases/test3/test-header-3.dat --outputpath=outputfile.txt --verbose=0 --startk=1 --endk=5 --p=2
clean:
	rm a2
debug:
	mpirun -np 4 xterm -hold -e gdb -ex run --args ./a2 --taskid=1 --inputpath=./testcases/test4/test-input-4.gra --headerpath=./testcases/test4/test-header-4.dat --outputpath=outputfile.txt --verbose=0 --startk=1 --endk=6 --p=2