@echo off
echo Make sure ADB Debugging is ENABLED!
echo Plug kindle into REGULAR cable
echo.
echo.
echo.
adb wait-for-device
echo Device connected. Pushing files...
adb push resources/root/su /data/local/tmp/
adb push resources/root/exploit /data/local/tmp/
adb push resources/root/rootme.sh /data/local/tmp/
echo Changing permissions...
adb shell chmod 755 /data/local/tmp/*
echo Executing Exploit (could take some time, be patient!)
pause
adb shell /data/local/tmp/exploit -c "/data/local/tmp/rootme.sh"
echo.
adb reboot