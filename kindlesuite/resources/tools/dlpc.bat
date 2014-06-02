@echo off
COLOR 0A
echo ======================================================================
echo ======================================================================
echo Welcome to dlpc - DownloadProviderChanger.
echo. 
echo This script will change the DownloadProvider
echo It is only for stock FireOS
echo with help from KyleBerry.Graphics
echo.
echo Script written by mint-an using KyleBerry.Graphics aappsscript as base
echo ======================================================================
echo WARNING THIS WORKS ONLY WITH ROOTED KFSOWI!
echo ======================================================================
echo ======================================================================
echo.  
echo.  
echo.  
echo Please connect your kindle with debugging enabled
echo.
echo.
if not exist resources\tools\dlpc\dlpc mkdir resources\tools\dlpc
echo Downloading DLPC...
if not exist resources\tools\appstore_switcher.zip wget -P resources/tools http://dl.kfsowi.com/tools/legacy/appstore_switcher.zip
wget -P resources/rom/hellfire http://dl.kfsowi.com/roms/hellfire/latest/MD5
echo.
echo.
echo Unzipping HellFire...
if not exist resources\tools\dlpc\dlpc FBZip -e resources\tools\appstore_switcher.zip resources\tools\dlpc\
echo.
adb wait-for-device
echo installing dlpc....
adb shell mkdir /sdcard/dlpc
echo installing dlpc....
adb push resources/tools/dlpc/DownloadProvider.apk /sdcard/dlpc/
adb push resources/tools/dlpc/DownloadProvider.odex /sdcard/dlpc/
adb push resources/tools/dlpc/DownloadProviderUi.apk /sdcard/dlpc/
adb push resources/tools/dlpc/DownloadProviderUi.odex /sdcard/dlpc/
adb push resources/tools/dlpc/DownloadProvider.apkgg /sdcard/dlpc/
adb push resources/tools/dlpc/DownloadProviderUi.apkgg /sdcard/dlpc/
adb push resources/tools/dlpc/dlpc.x /sdcard/dlpc/
adb push resources/tools/dlpc/dlp.x /sdcard/dlpc/
adb push resources/tools/dlpc/hotreboot.x /sdcard/dlpc/
echo installing dlpc....
adb shell su -c "mount -o remount rw, /cache"
adb shell su -c "chmod 777 /cache"
adb shell su -c "rm -rf /cache/dlpc"
adb shell su -c "mkdir /cache/dlpc"
echo installing dlpc....
adb shell su -c "cp /sdcard/dlpc/* /cache/dlpc"
adb shell rm -rf /sdcard/dlpc
echo installing dlpc....
adb shell su -c "mv /cache/dlpc/dlpc.x /cache/dlpc/dlpc"
adb shell su -c "mv /cache/dlpc/dlp.x /cache/dlpc/dlp"
adb shell su -c "mv /cache/dlpc/hotreboot.x /cache/dlpc/hotreboot"
adb shell su -c "chown 0.2000 /cache/dlpc/dlpc"
adb shell su -c "chown 0.2000 /cache/dlpc/dlp"
adb shell su -c "chown 0.2000 /cache/dlpc/hotreboot"
adb shell su -c "chown 0.0 /cache/dlpc/*.apk"
adb shell su -c "chown 0.0 /cache/dlpc/*.odex"
adb shell su -c "chmod 644 /cache/dlpc/*.apk"
adb shell su -c "chmod 644 /cache/dlpc/*.odex"
adb shell su -c "chmod 755 /cache/dlpc/dlpc"
adb shell su -c "chmod 755 /cache/dlpc/dlp"
adb shell su -c "chmod 755 /cache/dlpc/hotreboot"
echo installing dlpc....
adb shell su -c "mount -o remount rw, /system"
echo installing dlpc....
adb shell su -c "rm /system/bin/dlpc"
adb shell su -c "cp /cache/dlpc/dlpc /system/bin"
adb shell su -c "rm /system/bin/dlp"
adb shell su -c "cp /cache/dlpc/dlp /system/bin"
adb shell su -c "rm /system/bin/hotreboot"
adb shell su -c "cp /cache/dlpc/hotreboot /system/bin"
adb shell su -c "rm /system/app/DownloadProvider*"
echo
adb shell su -c "chmod 770 /cache"
adb shell su -c "mount -o remount ro, /cache"
adb shell su -c "mount -o remount ro, /system"
echo dlpc installed
echo.
echo to check current run: dlp
echo to change dw run: dlpc
echo via terminal emulator on android itself

pause
exit
