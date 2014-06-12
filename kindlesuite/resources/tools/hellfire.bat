@echo off
if not exist resources\rom\hellfire\MD5 mkdir resources\rom\hellfire
echo Downloading HellFire...
if not exist resources\rom\hellfire\hellfire.zip wget -P resources/rom/hellfire http://dl.kfsowi.com/roms/hellfire/latest/hellfire.zip
del resources\rom\hellfire\MD5
wget -P resources/rom/hellfire http://dl.kfsowi.com/roms/hellfire/latest/MD5
if not exist resources\rom\hellfire\MD5local md5sums -u resources\rom\hellfire\hellfire.zip > resources\rom\hellfire\MD5local
set /p md5=<resources\rom\hellfire\MD5
set /p md5local=<resources\rom\hellfire\MD5local
if not "%md5%" == "%md5local%" (
echo. There was a problem with the download. Please close program and try again.
rmdir resources\rom\hellfire /s /q
pause
exit )
echo.
echo.
echo Unzipping HellFire...
if not exist resources\rom\hellfire\*.img FBZip -e resources\rom\hellfire\hellfire.zip resources\rom\hellfire\
cd resources\rom\hellfire
rename *.img hellfire.img
cd ..\..\..\
echo.
echo.
echo Please Power Kindle OFF and plug into fastboot cable
fastboot wait-for-device devices
fastboot -i 0x1949 flash system resources\rom\hellfire\hellfire.img
echo.
echo.
echo Hellfire installed
echo Please plug Kindle into REGULAR cable now.
pause
fastboot -i 0x1949 continue
adb wait-for-device reboot recovery
echo.
echo When Kindle enters Recovery Mode, please wipe device and reboot
pause
exit