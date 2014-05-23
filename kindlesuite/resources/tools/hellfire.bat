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
rename resources\rom\hellfire\hellfire*.img resources\rom\hellfire\hellfire.img
cd resources\rom\hellfire
rename *.img hellfire.img
cd ..\..\..\
echo.
echo.
echo Moving HellFire to Kindle (Be patient, takes ~5 mins)
echo Make sure kindle is plugged into 
echo regular cable with ADB enabled!
adb wait-for-device 
echo moving...
adb wait-for-device push resources\rom\hellfire\hellfire.img /sdcard/
echo.
echo.
echo Installing HellFire (takes ~5 mins)...
adb shell su -c "dd if=/sdcard/hellfire.img of=/dev/block/mmcblk0p9"
echo.
echo.
echo Hellfire Installed, Rebooting Now!
adb reboot recovery
echo select wipe and reboot
pause
exit