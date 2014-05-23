@echo off
echo Make sure you power Kindle OFF and plug into FASTBOOT cable
echo.
echo.
echo.
echo Downgrading Boot Image...
fastboot -i 0x1949 flash boot resources/boot/11310-boot.img
fastboot -i 0x1949 continue
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
echo.
echo rebooting fastboot...
adb reboot
fastboot -i 0x1949 wait-for-device devices
fastboot -i 0x1949 flash boot resources/boot/11321-boot.img
fastboot -i 0x1949 continue