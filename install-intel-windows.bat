@echo on

:: download and unpack installer - BASEKIT
echo Download oneAPI Basekit
curl.exe --output %TEMP%\webimage.exe --url %1 --retry 5 --retry-delay 5  --log %TEMP%\extract.log
echo Extract oneAPI Basekit Installer
start /b /wait %TEMP%\webimage.exe -s -x -f %TEMP%\webimage_extracted 
del %TEMP%\webimage.exe

:: run installer
echo Run oneAPI Basekit Installer
%TEMP%\webimage_extracted\bootstrapper.exe -s --action install --components=intel.oneapi.win.dpcpp-compiler:intel.oneapi.win.mkl.devel --eula=accept -p=NEED_VS2017_INTEGRATION=0 -p=NEED_VS2019_INTEGRATION=0 -p=NEED_VS2022_INTEGRATION=0   --log-dir=%TEMP%

:: download and unpack installer - HPC KIT
echo Download oneAPI HPC
curl.exe --output %TEMP%\webimage.exe --url %2 --retry 5 --retry-delay 5  --log %TEMP%\extract.log
echo Extract oneAPI Basekit Installer
start /b /wait %TEMP%\webimage.exe -s -x -f %TEMP%\webimage_extracted 
del %TEMP%\webimage.exe

:: run installer 
echo Run oneAPI HPC Installer
%TEMP%\webimage_extracted\bootstrapper.exe -s --action install --intel.oneapi.win.ifort-compiler:intel.oneapi.win.mpi.devel:intel.oneapi.win.cpp-compiler --eula=accept -p=NEED_VS2017_INTEGRATION=0 -p=NEED_VS2019_INTEGRATION=0 -p=NEED_VS2022_INTEGRATION=0  --log-dir=%TEMP%
