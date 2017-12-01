
# Set environment

# Set this variable to point to your software testbench
$CATSoftwarePath = "..\..\host\src\fvm.cpp"

# These should point to your Visual Studio C++ and ModelSim installations
$VSPath = 'C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\'
$MSIncludePath = "C:\altera\15.1\modelsim_ae\include"
$MSLibPath = "C:\altera\15.1\modelsim_ae\win32aloem"

# Relative path to Software Common directory
$CATCommonPath = $PSScriptRoot+"\..\..\host\lib"


$ErrorActionPreference = "Stop"

# If cl.exe (Microsoft Visual Studio C++ compiler) is not already in $PATH, add it
if(-Not (Get-Command cl -errorAction SilentlyContinue)) {
	& $PSScriptRoot\Import-CmdEnvironment.ps1 ${Env:VS140COMNTOOLS}\..\..\VC\vcvarsall.bat x86
	
	# Altera-ModelSim only works in 32-bit mode, must use SE or QuestaSim for 64-bit mode
	# This causes a memory allocation issue when trying to simulate 2x4GB DRAM (we only simulate 2x1GB)
	# http://www.alteraforum.com/forum/archive/index.php/t-49945.html
	#.\Import-CmdEnvironment.ps1 ${Env:VS140COMNTOOLS}\..\..\VC\vcvarsall.bat amd64
}

# Generate Source object file
echo "cl.exe /Fo:Source.obj -c -Ox -Oy /MD /DCOSIM -I $MSIncludePath $CATSoftwarePath"
cl.exe /Fo:Source.obj -c -Ox -Oy /MD /DCOSIM -I $MSIncludePath $CATSoftwarePath
if($LASTEXITCODE -ne 0) {
	echo "Error: Exit code $LASTEXITCODE"
	exit
}

# Generate FGPA_PCIeJobDispatcher object file
echo "cl.exe -c -Ox -Oy /MD /DCOSIM -I $MSIncludePath $CATCommonPath\FPGA_PCIeJobDispatcher.cpp"
cl.exe -c -Ox -Oy /MD /DCOSIM -I $MSIncludePath $CATCommonPath\FPGA_PCIeJobDispatcher.cpp
if($LASTEXITCODE -ne 0) {
	echo "Error: Exit code $LASTEXITCODE"
	exit
}

# Generate FPGACoreLib object file
echo "cl.exe -c -Ox -Oy /MD /DCOSIM -I $MSIncludePath $CATCommonPath\FPGACoreLib_CoSim.cpp"
cl.exe -c -Ox -Oy /MD /DCOSIM -I $MSIncludePath $CATCommonPath\FPGACoreLib_CoSim.cpp
if($LASTEXITCODE -ne 0) {
	echo "Error: Exit code $LASTEXITCODE"
	exit
}

# Generate Harness object file
echo "cl.exe -c -Ox -Oy /MD /DCOSIM -I $MSIncludePath $CATCommonPath\harness.cpp"
cl.exe -c -Ox -Oy /MD /DCOSIM -I $MSIncludePath $CATCommonPath\harness.cpp
if($LASTEXITCODE -ne 0) {
	echo "Error: Exit code $LASTEXITCODE"
	exit
}

# Link
echo "link /OUT:Source.dll /DLL Source.obj FPGA_PCIeJobDispatcher.obj harness.obj FPGACoreLib_CoSim.obj $MSLibPath\mtipli.lib"
link /OUT:Source.dll /DLL Source.obj FPGA_PCIeJobDispatcher.obj harness.obj FPGACoreLib_CoSim.obj $MSLibPath\mtipli.lib
if($LASTEXITCODE -ne 0) {
		echo "Error: Exit code $LASTEXITCODE"
	exit
}

# Run simulation
$curLoc = Get-Location;
vsim -pli Source -c -do $curLoc\build.do
