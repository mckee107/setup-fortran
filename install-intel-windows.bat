@echo off

:: download and unpack installer - BASEKIT
curl.exe --output %TEMP%\webimage.exe --url %1 --retry 5 --retry-delay 5  --log %TEMP%\extract.log
start /b /wait %TEMP%\webimage.exe -s -x -f %TEMP%\webimage_extracted 
del %TEMP%\webimage.exe

:: run installer
%TEMP%\webimage_extracted\bootstrapper.exe -s --action install --components=intel.oneapi.win.dpcpp-compiler:intel.oneapi.win.mkl.devel --eula=accept -p=NEED_VS2017_INTEGRATION=0 -p=NEED_VS2019_INTEGRATION=0 -p=NEED_VS2022_INTEGRATION=1   --log-dir=%TEMP%

:: download and unpack installer - HPC KIT
curl.exe --output %TEMP%\webimage.exe --url %2 --retry 5 --retry-delay 5  --log %TEMP%\extract.log
start /b /wait %TEMP%\webimage.exe -s -x -f %TEMP%\webimage_extracted 
del %TEMP%\webimage.exe

:: run installer 
%TEMP%\webimage_extracted\bootstrapper.exe -s --action install --intel.oneapi.win.ifort-compiler:intel.oneapi.win.mpi.devel:intel.oneapi.win.cpp-compiler --eula=accept -p=NEED_VS2017_INTEGRATION=0 -p=NEED_VS2019_INTEGRATION=0 -p=NEED_VS2022_INTEGRATION=1  --log-dir=%TEMP%
