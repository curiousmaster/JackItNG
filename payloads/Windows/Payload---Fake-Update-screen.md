REM This will bring up the windows 10 page of fakeupdate.net and make it fullscreen. Great for going around best buy or Walmart.
REM 
REM Change `http://fakeupdate.net/win10u/index.html` to another page on fakeupdate.net if you target a different OS.

```
REM fake update LUL
REM author: Judge2020 https://judge2020.com
REM edited by: DanielL99 on github (thanks!)
REM  
REM let the ducky HID enumerate
DELAY 3000
GUI r
DELAY 500
STRING iexplore -k http://fakeupdate.net/win10u/index.html
ENTER
```
