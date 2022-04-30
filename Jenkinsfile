pipeline {
  agent any
  
environment {

    PATH = "C:\\WINDOWS\\SYSTEM32"
}


  stages {

    stage('Create project') {
      steps {
        deleteDir() // clean up workspace
        bat "set PATH=%PATH%;C:/Xilinx/Vivado/2019.1/bin/unwrapped/win64.o/vvgl.exe"
        bat "cd C:/Users/Yoyo/AppData/Local/Jenkins/.jenkins/jobs"
        git 'https://github.com/ayamahrous/jenkins_job.git'
        
        bat "cd vivado && C:/Xilinx/Vivado/2019.1/settings64.bat && vivado -mode batch -source create_vivado_proj.tcl"
        
      }
    }
stage('Run simulation') {
      steps {
        bat "cd vivado && C:/Xilinx/Vivado/2019.1/settings64.bat && vivado -mode batch -source run_simulation.tcl"
      }
    }
    stage('Run synthesis') {
      steps {
        bat "cd vivado && C:/Xilinx/Vivado/2019.1/settings64.bat && vivado -mode batch -source run_synthesis.tcl"
      }
    }
    stage('Run implementation') {
      steps {
        bat "cd vivado && C:/Xilinx/Vivado/2019.1/settings64.bat && vivado -mode batch -source run_implementation.tcl"
      }
    }
    stage('Generate bitstream') {
      steps {
        bat "cd vivado && C:/Xilinx/Vivado/2019.1/settings64.bat && vivado -mode batch -source generate_bitstream.tcl"
      }
    }
    stage('Release bitfile') {
      steps {
        bat '''
        PROJ_NAME=vend
        RELEASE_DIR=/usr/share/nginx/html/releases/
 
        BASE_NAME=$PROJ_NAME-`date +"%Y-%m-%d-%H-%H:%M"`
        BITFILE=$BASE_NAME.bit
        INFOFILE=$BASE_NAME.txt
 
        git log -n 1 --pretty=format:"%H" >> $INFOFILE
        echo -n " $PROJ_NAME " >> $INFOFILE
        git describe --all >> $INFOFILE

        cp $INFOFILE $RELEASE_DIR
        cp vivado/vend.runs/impl_1/top.bit $RELEASE_DIR/$BITFILE
        '''
      }
    }
  }
}
