@echo off
setlocal enabledelayedexpansion



:goBack
REM Prompt the user for the source directory
echo Dont use "cd" directly, instead type "C:\Users\Juan Doe\Desired Folder"
echo =======================================================
set /p dir="Enter the source directory: "
if not exist "%dir%" (
    echo Folder does not exist. Please try again.
    goto :goBack
)

:goBackDest
REM Prompt the user for the destination directory
set /p dest="Enter the destination directory: "
if not exist "%dest%" (
    echo Folder does not exist. Please try again.
    goto :goBackDest
)

REM Create the archive directory if it doesn't exist
set "archive=%dest%\archive"
if not exist "%archive%" (
    mkdir "%archive%"
)

REM Change the directory to the one entered by the user
cd /d "%dir%"

REM Move older files automatically that is older than a year to the destination directory
forfiles /m *.txt /d -365 /c "cmd /c move @file \"%archive%\""

REM List the files sorted by date/time

echo.
echo =======================================================
echo.

echo Here are the text files sorted by date/time:
for /f "delims=" %%i in ('dir /b /o:d *.txt') do (
    echo %%i
)

echo.
echo =======================================================
echo.

:fileLoop
REM Prompt the user for the specific file to move
dir

echo.
echo =======================================================
echo.

echo Enter the file from "%dir%"
echo to move to "%dest%",
set /p file="(or 'done' to finish): "

echo.
echo =======================================================
echo.

if /I "%file%"=="done" (
    echo Done.
    goto :end
)
if not exist "%file%" (
    cls
    echo File does not exist. Please try again.
    goto :fileLoop
)

REM Move the specified file to the archive subdirectory of the destination directory
move "%file%" "%dest%/archive"
goto :fileLoop

:end
REM Sort the files in the archive directory by size
echo Here are the files in the archive directory sorted by size:
for /f "tokens=*" %%A in ('dir /b /s /o:s "%archive%"') do (
    echo %%~nA %%~pA
)

echo.
echo =======================================================
echo.

:deleteLoop
REM Prompt the user for permission to delete the old, large files
echo.
echo -----------------------------------------------------------------------------
echo ("finish" if actually done or "repeat" to go prompt source destination again.):
echo -----------------------------------------------------------------------------
echo.
set /p delete="Do you want to delete the old, large files? (atleast 1mb of size will be deleted) (yes/no): "
if /I "%delete%"=="yes" (
    for /R "%dest%/archive" %%F in (*.txt) do (
        if %%~zF GTR 1000000 (
            del /P "%%F"
        )
    )
    goto :deleteLoop
) else if /I "%delete%"=="no" (
    echo Files will not be deleted.
    goto :deleteLoop
) else if /I "%delete%"=="finish" (
    echo selected "finish"!.
    goto :finally
) 
else if /I "%delete%"=="repeat" (
    echo Going back.
    goto :goBack
)
else (
    echo Invalid input. Please try again.
    goto :deleteLoop
)
:finally
echo Done! 
pause