@echo off
mkdir resources\update
echo Downloading Bin from Amazon...
wget --no-check-certificate -P resources/update https://gmf.dabbleam.com/KFSOWI/minisystem.img
wget --no-check-certificate -P resources/update update https://s3.amazonaws.com/kindle-fire-updates/update-kindle-11.3.2.2_user_322095420.bin
echo.
cd resources/update
rename upd* update.zip
cd ..\..\
start resources\tools\restore.bat
exit