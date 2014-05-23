@echo off
mkdir resources\gapps
echo Downloading ROM...
if not exist resources\gapps\gapps.zip wget -P resources/gapps http://dl.kfsowi.com/tools/kindlesuite/gapps.zip
echo.
echo.
echo Unzipping ROM...
if not exist resources\gapps\gapps\Lucky-Patcher-v4.1.9.apk FBZip -e -p resources/gapps/gapps.zip resources/gapps/
echo Plug kindle into regular cable with ADB Debugging enabled...
adb wait-for-device
echo.
echo Installing Lucky Patcher...
adb install resources\gapps\gapps\Lucky-Patcher-v4.1.9.apk
echo.
echo Making temporary directories...
adb shell mkdir /sdcard/gapps
adb shell mkdir /sdcard/lib
adb shell mkdir /sdcard/framework
adb shell mkdir /sdcard/etc
adb shell mkdir /sdcard/etc/permissions 
echo.
echo Pushing files to SD...
adb push resources\gapps\gapps\gapps /sdcard/gapps
adb push resources\gapps\gapps\lib /sdcard/lib
adb push resources\gapps\gapps\framework /sdcard/framework
adb push resources\gapps\gapps\etc\permissions /sdcard/etc/permissions
echo.
echo.
echo Copying files to System...
adb shell su -c "mount -o remount rw, /system"
adb shell su -c "rm /system/app/DownloadProvider*.*"
adb shell su -c "cp /sdcard/gapps/* /system/app/"
adb shell su -c "cp /sdcard/lib/* /system/lib/"
adb shell su -c "cp /sdcard/framework/* /system/framework/"
adb shell su -c "cp /sdcard/etc/permissions/* /system/etc/permissions/"
echo.
echo.
echo removing temp files...
adb shell rm -rf /sdcard/gapps
adb shell rm -rf /sdcard/lib
adb shell rm -rf /sdcard/framework
adb shell rm -rf /sdcard/etc
adb shell rm -rf /sdcard/etc/permissions

echo.
echo.
echo File copy complete, open Lucky Patcher on kindle and select toolbox at bottom.
echo Select patch to android. 
echo Select disable signature verification in pkg manager.
echo Congratulations, You now have Google Play Store!
pause