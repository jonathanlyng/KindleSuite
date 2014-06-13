@echo off
echo.
echo Power kindle OFF and plug into FASTBOOT cable
echo.
fastboot -i 0x1949 flash boot resources\boot\11322-boot.img
fastboot -i 0x1949 flash system resources\update\minisystem.img
fastboot -i 0x1949 continue 
adb wait-for-device
echo.
echo Moving update to Kindle (be patient, can take ~5 mins)...
echo.
adb shell su -c "chmod 777 /cache"
adb push resources\update\update.zip /cache/
echo.
echo.
echo Setting up restore (be patient)...
echo.
adb shell su -c "echo --update_package=/cache/update.zip > /cache/recovery/command"
echo.
echo.
echo Unplug Kindle and plug into REGULAR cable
echo.
pause
adb wait-for-device reboot recovery
echo Device upgrading to 11.3.2.3.2 now.
pause
exit