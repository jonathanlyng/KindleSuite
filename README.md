KindleSuite
===========

KFSOWI Tools


KindleSuite is a collection of tools to modify the Amazon 2013 Kindle Fire HD 7" (KFSOWI/SOHO)

the file heirarchy is as follows

KindleSuite
  | RUNME.bat   -The user-end file to open the program
  | update.bat  -script to allow users to update KS to the latest version
  | kindlesuite
     | adb
     | adb.exe
     | AdbWinApi.dll
     | AdbWinUsbApi.dll
     | fastboot.exe
     | FBZip.bin
     | FBZip.exe   - Tool to unzip downloaded files
     | license
     | license.txt
     | main.hta    - KS GUI
     | md5sums.exe - Tools to verify file integrity
     | README
     | wget.exe    - Tool to download files from internet
     | resources
        | LICESNSE
        | AdbDriverInstaller.exe  - Tool to install ADB drivers
        | boot     - bot images for ROOT
        |  | 11310-boot.img
        |  | 11321-boot.img
        |  | 11322-boot.img
        | icons
        |  | bg.jpg
        |  | button.bmp
        |  | license.png
        | root
        |  | exploit
        |  | rootme.sh   - Script to execute exploit device-side
        |  | su          - SuperUser Binary
        | tools
        |  | 11310.bat   - Root tool for 11.3.1.0
        |  | 11321.bat   - Root tool for 11.3.2.1
        |  | 11322.bat   - Root tool for 11.3.2.2
        |  | restore.bat - Tool to restore bricked/return kindles
        |  | stockmod.bat - Tool to install Google Play Services
        | checks
        |  | restorecheck.bat  - Tools to check for latest KS version
        |  | versioncurrent
        
