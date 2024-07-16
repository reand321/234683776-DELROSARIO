@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ==========================================
echo          Open in admin pls T_T
echo ==========================================
echo Select a Windows utility to execute:
echo 1. ipconfig
echo 2. tasklist/taskkill
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
echo ==========================================
set /p choice=Enter the number of your choice (1-8): 

if %choice%==1 goto ipconfig
if %choice%==2 goto tasklist
if %choice%==3 goto taskkill
if %choice%==4 goto chkdsk
if %choice%==5 goto format
if %choice%==6 goto defrag
if %choice%==7 goto find
if %choice%==8 goto attrib
echo Invalid choice. Please enter a number between 1 and 8.
pause
goto menu

:ipconfig
cls
ipconfig
pause
goto end

:tasklist
cls
tasklist
pause
goto end

:taskkill
cls
set /p pid=Enter the PID or name of the process to kill: 
if "%pid%"=="" (
    echo No PID or process name provided.
) else (
    taskkill /PID %pid% /F 2>nul || taskkill /IM %pid% /F
    if errorlevel 1 (
        echo Failed to kill process. Ensure you have provided a valid PID or process name.
    ) else (
        echo Process %pid% terminated.
    )
)
pause
goto end

:chkdsk
cls
set /p drive=Enter the drive letter to check (e.g., C:): 
if "%drive%"=="" (
    echo No drive letter provided.
) else (
    chkdsk %drive%
)
pause
goto end

:format
cls
set /p drive=Enter the drive letter to format (e.g., E:): 
if "%drive%"=="" (
    echo No drive letter provided.
) else (
    echo WARNING: Formatting will erase all data on the drive %drive%.
    set /p confirm=Are you sure you want to format %drive%? (y/n): 
    if /i "%confirm%"=="y" (
        format %drive%
    ) else (
        echo Format cancelled.
    )
)
pause
goto end

:defrag
cls
set /p drive=Enter the drive letter to defragment (e.g., C:): 
if "%drive%"=="" (
    echo No drive letter provided.
) else (
    defrag %drive%
)
pause
goto end

:find
cls
set /p text=Enter the text to search for: 
set /p file=Enter the file to search within: 
if "%text%"=="" (
    echo No text provided.
) else if "%file%"=="" (
    echo No file provided.
) else (
    find "%text%" "%file%"
    if errorlevel 1 (
        echo Text not found.
    ) else (
        echo Text found in %file%.
    )
)
pause
goto end

:attrib
cls
set /p file=Enter the file or directory to change attributes for: 
if "%file%"=="" (
    echo No file or directory provided.
) else (
    attrib %file%
    echo Enter the attributes you want to add/remove (e.g., +r, -h, etc.)
    set /p attributes=Attributes: 
    if "%attributes%"=="" (
        echo No attributes provided.
    ) else (
        attrib %attributes% %file%
        echo Attributes updated for %file%.
    )
)
pause
goto end

:end
echo Thank you for using the Windows utility script!
pause
