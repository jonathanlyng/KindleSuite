@echo off
if exist resources\update\update.zip start resources\tools\restore.bat
if not exist resources\update\update.zip start resources\tools\restoredl.bat
exit