@echo on

:: download and unpack installer - HPC KIT
echo Download oneAPI HPC
curl.exe --output %TEMP%\webimage.exe --url %1 --retry 5 --retry-delay 5  --log %TEMP%\extract.log
echo Extract oneAPI HOC Installer
start /b /wait %TEMP%\webimage.exe -s -x -f %TEMP%\webimage_extracted_hpc
del %TEMP%\webimage.exe

:: run installer 
echo Run oneAPI HPC Installer
%TEMP%\webimage_extracted_hpc\bootstrapper.exe -s --action install --components=intel.oneapi.win.ifort-compiler:intel.oneapi.win.mpi.devel:intel.oneapi.win.cpp-compiler --eula=accept -p=NEED_VS2017_INTEGRATION=0 -p=NEED_VS2019_INTEGRATION=0 -p=NEED_VS2022_INTEGRATION=0  --log-dir=%TEMP%
