@echo off
if not exist resources\kfl\kfsowilinux.i686-0.9.2.vmx.tar.gz mkdir resources\kfl
echo Downloading KF Linux...
if not exist resources\kfl\kfsowilinux.i686-0.9.2.vmx.tar.gz wget -P resources/kfl/ http://dl.kfsowi.com/kflinux/kfsowilinux.i686-0.9.2.vmx.tar.gz
echo Download complete. To use, open KindleSuite\kindlesuite\resources\kfl and extract the VM file, then open with VirtualMachine
pause
exit