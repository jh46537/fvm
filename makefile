MSBUILD = C:\\Program\ Files\ \(x86\)\\MSBuild\\14.0\\Bin\\MSBuild.exe 
VSPROJ = host/proj/fvm.vcxproj 


.PHONY: all host clean clean_host run


all: host


host:
	$(MSBUILD) $(VSPROJ) -t:build -p:configuration=release -p:platform=x64
	mkdir -p build/
	cd build/ && \
	    cp ../host/proj/x64/Release/fvm.exe . && \
	    cp -r ../driver/bin/*.ini . && \
	    cp -r ../driver/bin/*.dll .


clean: clean_host
	rm -rf build/

clean_host:
	rm -rf host/proj/x64
