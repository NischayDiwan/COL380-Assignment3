all: main.cpp
	mpic++ -g -O3 -fopenmp -std=c++17 main.cpp -o a3
run1: all
	mpirun -np 6 ./a3 --taskid=1 --inputpath=/home/nischay/Documents/testcases/A3/test1/test-input-1.gra --headerpath=/home/nischay/Documents/testcases/A3/test1/test-header-1.dat --outputpath=outputfile.txt --verbose=1 --startk=3 --endk=10 --p=2
run0: all
	mpirun -np 6 ./a3 --taskid=2 --inputpath=/home/nischay/Documents/testcases/A3/test1/test-input-1.gra --headerpath=/home/nischay/Documents/testcases/A3/test1/test-header-1.dat --outputpath=outputfile.txt --verbose=1 --startk=3 --endk=10 --p=2
t3: all
	mpirun -np 4 xterm -hold -e gdb -ex run --args ./a3 --taskid=1 --inputpath=/home/nischay/Documents/testcases/test3/test-input-3.gra --headerpath=/home/nischay/Documents/testcases/test3/test-header-3.dat --outputpath=outputfile.txt --verbose=0 --startk=1 --endk=5 --p=2
clean:
	rm a3
debug: all
	mpirun -np 4 xterm -hold -e gdb -ex run --args ./a3 --taskid=2 --inputpath=/home/nischay/Documents/testcases/A3/test1/test-input-1.gra --headerpath=/home/nischay/Documents/testcases/A3/test1/test-header-1.dat --outputpath=outputfile.txt --verbose=1 --startk=3 --endk=10 --p=2
t4: all
	mpirun -np 4 xterm -hold -e gdb -ex run --args ./a3 --taskid=1 --inputpath=/home/nischay/Documents/testcases/test4/test-input-4.gra --headerpath=/home/nischay/Documents/testcases/test4/test-header-4.dat --outputpath=outputfile.txt --verbose=1 --startk=1 --endk=6 --p=2

