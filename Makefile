all: main.cpp
	mpic++ -g -O3 -std=c++17 main.cpp -o a3
run1: all
	mpirun -np 6 ./a3 --taskid=1 --inputpath=../testcases/A3/test1/test-input-1.gra --headerpath=../testcases/A3/test1/test-header-1.dat --outputpath=outputfile.txt --verbose=1 --startk=3 --endk=10 --p=2
run0: all
	mpirun -np 6 ./a3 --taskid=2 --inputpath=../testcases/A3/test1/test-input-1.gra --headerpath=../testcases/A3/test1/test-header-1.dat --outputpath=outputfile.txt --verbose=1 --startk=3 --endk=10 --p=2
clean:
	rm a3
debug: all
	mpirun -np 4 xterm -hold -e gdb -ex run --args ./a3 --taskid=2 --inputpath=../testcases/A3/test1/test-input-1.gra --headerpath=../testcases/A3/test1/test-header-1.dat --outputpath=outputfile.txt --verbose=1 --startk=3 --endk=10 --p=2