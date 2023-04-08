#!/bin/bash
make clean
make
g++ compare_outputA2.cpp -o task1
g++ check_output.cpp -o task2
addr="../testing/A3"
i="1"
for numproc in 2 4
do
    for tnum in 1 2
    do
        echo "testcase : $i"
        echo "num procs : $numproc"
        echo "num threads : $tnum"
        echo "-----------------------"
        time mpirun -np $numproc ./a3 --taskid=1 --inputpath=$addr/test$i/test-input-$i.gra --headerpath=$addr/test$i/test-header-$i.dat --outputpath=outputfile_task1_verbose1.txt --verbose=1 --startk=3 --endk=10 --p=2 $tnum
        ./task1 $addr/test$i/task1_output${i}_verbose.txt outputfile_task1_verbose1.txt
        echo "-----------------------"
        time mpirun -np $numproc ./a3 --taskid=2 --inputpath=$addr/test$i/test-input-$i.gra --headerpath=$addr/test$i/test-header-$i.dat --outputpath=outputfile_task2_verbose1.txt --verbose=1 --startk=3 --endk=3 --p=10 $tnum
        ./task2 $addr/test$i/task2_output${i}_verbose.txt outputfile_task2_verbose1.txt
        echo "-----------------------" 
    #   numproc = $((numproc * 2))
    done
done
i="2"
for numproc in 2 4
do
    for tnum in 1 2
    do
        echo "testcase : $i"
        echo "num procs : $numproc"
        echo "num threads : $tnum"
        echo "-----------------------"
        time mpirun -np $numproc ./a3 --taskid=1 --inputpath=$addr/test$i/test-input-$i.gra --headerpath=$addr/test$i/test-header-$i.dat --outputpath=outputfile_task1_verbose1.txt --verbose=1 --startk=3 --endk=12 --p=2 $tnum
        ./task1 $addr/test$i/task1_output${i}_verbose.txt outputfile_task1_verbose1.txt
        echo "-----------------------"
        time mpirun -np $numproc ./a3 --taskid=2 --inputpath=$addr/test$i/test-input-$i.gra --headerpath=$addr/test$i/test-header-$i.dat --outputpath=outputfile_task2_verbose1.txt --verbose=1 --startk=3 --endk=3 --p=10 $tnum
        ./task2 $addr/test$i/task2_output${i}_verbose.txt outputfile_task2_verbose1.txt
        echo "-----------------------" 
    #   numproc = $((numproc * 2))
    done
done
i="3"
for numproc in 2 4
do 
    for tnum in 1 2
    do
        echo "testcase : $i"
        echo "num procs : $numproc"
        echo "num threads : $tnum"
        echo "-----------------------"
        time mpirun -np $numproc ./a3 --taskid=1 --inputpath=$addr/test$i/test-input-$i.gra --headerpath=$addr/test$i/test-header-$i.dat --outputpath=outputfile_task1_verbose1.txt --verbose=1 --startk=4 --endk=8 --p=2 $tnum
        ./task1 $addr/test$i/task1_output${i}_verbose.txt outputfile_task1_verbose1.txt
        echo "-----------------------"
        time mpirun -np $numproc ./a3 --taskid=2 --inputpath=$addr/test$i/test-input-$i.gra --headerpath=$addr/test$i/test-header-$i.dat --outputpath=outputfile_task2_verbose1.txt --verbose=1 --startk=3 --endk=3 --p=4 $tnum
        ./task2 $addr/test$i/task2_output${i}_verbose.txt outputfile_task2_verbose1.txt
        echo "-----------------------" 
    #   numproc = $((numproc * 2))
    done
done
i="4"
for numproc in 2 4
do
    for tnum in 1 2
    do
        echo "testcase : $i"
        echo "num procs : $numproc"
        echo "num threads : $tnum"
        echo "-----------------------"
        time mpirun -np $numproc ./a3 --taskid=1 --inputpath=$addr/test$i/test-input-$i.gra --headerpath=$addr/test$i/test-header-$i.dat --outputpath=outputfile_task1_verbose1.txt --verbose=1 --startk=2 --endk=3 --p=2 $tnum
        ./task1 $addr/test$i/task1_output${i}_verbose.txt outputfile_task1_verbose1.txt
        echo "-----------------------"
        time mpirun -np $numproc ./a3 --taskid=2 --inputpath=$addr/test$i/test-input-$i.gra --headerpath=$addr/test$i/test-header-$i.dat --outputpath=outputfile_task2_verbose1.txt --verbose=1 --startk=3 --endk=2 --p=20 $tnum
        ./task2 $addr/test$i/task2_output${i}_verbose.txt outputfile_task2_verbose1.txt
        echo "-----------------------" 
    #   numproc = $((numproc * 2))
    done
done

