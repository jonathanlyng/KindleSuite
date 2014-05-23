@echo off
mkdir ..\tmp
mkdir ..\tmp\update
del resources\tools\checks\version
wget -P resources\tools\checks http://dl.kfsowi.com/tools/kindlesuite/version
set /p cver=<resources\tools\checks\versioncurrent
set /p ver=<resources\tools\checks\version
if not "%ver%" == "%cver%" (
cd ..\
kindlesuite\wget -P tmp\ http://dl.kfsowi.com/tools/kindlesuite/KindleSuite.zip
echo.
echo.
echo.
echo KindleSuite is updating, please wait...
echo.
echo.
echo.
move /Y .\kindlesuite\resources\tools\checks\version .\tmp\
kindlesuite\FBZip -e -p ..\tmp\KindleSuite.zip ..\tmp\update\
rmdir kindlesuite /s /q
mkdir kindlesuite
xcopy /E /Y .\tmp\update\kindlesuite .\kindlesuite
rmdir .\tmp /s /q
echo update complete!)
echo KindleSuite is up to date!
pause
exit