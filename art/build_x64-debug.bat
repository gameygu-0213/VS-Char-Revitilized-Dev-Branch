@echo off
color 0a
cd ..
echo WELCOME TO DEBUG ZONE (BUILDING)
haxelib run lime build windows -debug
echo.
echo done.
pause
pwd
explorer.exe export\debug\windows\bin