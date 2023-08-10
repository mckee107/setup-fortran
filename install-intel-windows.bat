@echo off

:: download and unpack installer - BASEKIT
curl.exe --output %TEMP%\webimage.exe --url %1 --retry 5 --retry-delay 5
start /b /wait %TEMP%\webimage.exe  -x -f %TEMP%\webimage_extracted 
del %TEMP%\webimage.exe

:: run installer
%TEMP%\webimage_extracted\bootstrapper.exe  --action install --components=default --eula=accept -p=NEED_VS2017_INTEGRATION=0 -p=NEED_VS2019_INTEGRATION=0 -p=NEED_VS2022_INTEGRATION=1 

:: download and unpack installer - HPC KIT
curl.exe --output %TEMP%\webimage.exe --url %2 --retry 5 --retry-delay 5
start /b /wait %TEMP%\webimage.exe  -x -f %TEMP%\webimage_extracted 
del %TEMP%\webimage.exe

:: run installer 
%TEMP%\webimage_extracted\bootstrapper.exe  --action install --components=default --eula=accept -p=NEED_VS2017_INTEGRATION=0 -p=NEED_VS2019_INTEGRATION=0 -p=NEED_VS2022_INTEGRATION=1 
