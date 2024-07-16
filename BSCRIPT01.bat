@echo off
start chrome "https://papertoilet.com"
start chrome "https://theuselessweb.com"
start chrome "https://www.facebook.com"
start chrome "https://corndogoncorndog.com"
start chrome "https://www.zombo.com"

pause

start notepad
start calc

REM /t [seconds] [/nobreak]
echo The system will shutdown after 60 secs
timeout /t 60 

shutdown
