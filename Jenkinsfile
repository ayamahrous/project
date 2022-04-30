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
        git 'https://github.com/ayamahrous/project.git'
        
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

  }
}
