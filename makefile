MSBUILD = C:\\Program\ Files\ \(x86\)\\MSBuild\\14.0\\Bin\\MSBuild.exe 
VSPROJ = host/proj/fvm.vcxproj 
QUARTUSSH = C:\\altera\\15.1\\quartus\\bin64\\quartus_sh.exe
QPROJ = device/Project/Project.qpf


.PHONY: all host device device_build device_program clean clean_host clean_device run sim


all: host device


host:
	$(MSBUILD) $(VSPROJ) -t:build -p:configuration=release -p:platform=x64
	mkdir -p build/
	cd build/ && \
	    cp ../host/proj/x64/Release/fvm.exe . && \
	    cp -r ../driver/bin/*.ini . && \
	    cp -r ../driver/bin/*.dll .


device: device_build device_program

device_build:
	$(QUARTUSSH) --flow compile $(QPROJ)

device_program:
	powershell "& ""device/genRpd.ps1 -inputSof device/Project/output_files/Project.sof -outputRpd build/fvm.rpd"""
	powershell "& ""driver/bin/RSU.exe"""


clean: clean_host clean_device
	rm -rf build/

clean_host:
	rm -rf host/proj/x64

clean_device:
	rm -rf device/Project/output_files

sim:
	cd device/Sim && \
	    powershell "& ""./runSim.ps1"""
