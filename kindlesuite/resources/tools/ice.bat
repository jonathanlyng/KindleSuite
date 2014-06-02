@echo off
if not exist resources\rom\ice\MD5 mkdir resources\rom\ice
echo Downloading ice...
if not exist resources\rom\ice\ice.zip wget -P resources/rom/ice http://dl.kfsowi.com/roms/ice/latest/ice.zip
del resources\rom\ice\MD5
wget -P resources/rom/ice http://dl.kfsowi.com/roms/ice/latest/MD5
if not exist resources\rom\ice\MD5local md5sums -u resources\rom\ice\ice.zip > resources\rom\ice\MD5local
set /p md5=<resources\rom\ice\MD5
set /p md5local=<resources\rom\ice\MD5local
if not "%md5%" == "%md5local%" (
echo. There was a problem with the download. Please close program and try again.
rmdir resources\rom\ice /s /q
pause
exit )
echo.
echo.
echo Unzipping ice...
if not exist resources\rom\ice\*.img FBZip -e resources\rom\ice\ice.zip resources\rom\ice\
rename resources\rom\ice\ice*.img resources\rom\ice\ice.img
cd resources\rom\ice
rename *.img ice.img
cd ..\..\..\
echo.
echo.
echo Moving ice to Kindle (Be patient, takes ~5 mins)
echo Make sure kindle is plugged into 
echo regular cable with ADB enabled!
adb wait-for-device 
echo moving...
adb wait-for-device push resources\rom\ice\ice.img /sdcard/
echo.
echo.
echo Installing ice (takes ~5 mins)...
adb shell su -c "dd if=/sdcard/ice.img of=/dev/block/mmcblk0p9"
echo.
echo.
echo Ice Installed, Rebooting Now!
adb reboot recovery
echo select wipe and reboot
pause
exit