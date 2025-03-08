In the following directory, you can practice using `pararllel`. 

You can install via 
`sudo apt install parallel`   # For Debian/Ubuntu
`sudo yum install parallel`   # For RHEL/CentOS
`brew install parallel`   # For macOS

You can execute the `compilation.sh` before the tasks 

In this tasks, you are just required to use the parallel command to 
run the executable `sum` under `./Code/` directory. Save all the 
result in the following form in file `output.csv` with the following 
input parameters specified, 

| Starting Integer | Ending Integer |  Sum (Calculated by the `sum`)   |
|------------------|----------------|----------------------------------|
| 1                | 100            |   ...                            |
| 101              | 200            |   ...                            |
| 201              | 300            |   ...                            |

You should choose suitable process to split and use `flock` to ensure 
only 1 process can access the `output.csv` at a time. 
               
