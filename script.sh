    #!/bin/bash
    # Ask the user for their name
    echo Which Test you want to run?
    # read test_name
    echo Running $1 ...

    

    SocNow_path=$PWD
    export NUCLEUSRV=$SocNow_path/SoCNow/nucleusrv
    FILE=$NUCLEUSRV/test_run_dir/Top_Test/VTop
    if [ -f $FILE ]; then
        echo "$FILE exists."
        export NUCLEUSRV=$SocNow_path/SoCNow/nucleusrv
        cd $SocNow_path/riscv-arch-test
        make clean TARGETDIR=$NUCLEUSRV/riscv-target RISCV_TARGET=nucleusrv RISCV_DEVICE=rv32i RISCV_ISA=rv32i RISCV_TEST=$1 TARGET_SIM=$NUCLEUSRV/test_run_dir/Top_Test/VTop
        make TARGETDIR=$NUCLEUSRV/riscv-target RISCV_TARGET=nucleusrv RISCV_DEVICE=rv32i RISCV_ISA=rv32i RISCV_TEST=$1 TARGET_SIM=$NUCLEUSRV/test_run_dir/Top_Test/VTop | tee Test_result.txt
        cd ..
        # exec bash

    else 
        echo "$FILE does not exist."
        echo "First run sbt testOnly TopTest"
        export NUCLEUSRV=$SocNow_path/SoCNow/nucleusrv
        cd $NUCLEUSRV
        sbt "testOnly nucleusrv.components.TopTest"
        # cd ../../
        cd $SocNow_path/riscv-arch-test
        make clean TARGETDIR=$NUCLEUSRV/riscv-target RISCV_TARGET=nucleusrv RISCV_DEVICE=rv32i RISCV_ISA=rv32i RISCV_TEST=$1 TARGET_SIM=$NUCLEUSRV/test_run_dir/Top_Test/VTop
        make TARGETDIR=$NUCLEUSRV/riscv-target RISCV_TARGET=nucleusrv RISCV_DEVICE=rv32i RISCV_ISA=rv32i RISCV_TEST=$1 TARGET_SIM=$NUCLEUSRV/test_run_dir/Top_Test/VTop | tee Test_result.txt
        cd ..
        # exec bash
    fi
    exec bash
