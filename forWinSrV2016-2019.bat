@echo off
echo Cleaning up and optimizing the system...
echo.

:: 1
echo Deleting temporary files in the %Temp% folder...
echo Wait for 2 seconds
timeout /t 2 >nul
del /f /q "%Temp%\*.*" >nul 2>&1

:: 2
echo Deleting temporary files in the %SystemRoot%\Temp folder...
echo Wait for 2 seconds
timeout /t 2 >nul
del /f /q "%SystemRoot%\Temp\*.*" >nul 2>&1

:: 3
echo Deleting temporary files in the Prefetch folder...
echo Wait for 2 seconds
timeout /t 2 >nul
del /s /f /q C:\Windows\Prefetch\*.*

:: 4
echo Deleting temporary files in the Downloads folder...
echo Wait for 2 seconds
timeout /t 2 >nul
del /s /q "C:\Windows\SoftwareDistribution\Download\*"

:: 5
echo Emptying the recycle bin...
echo Wait for 2 seconds
timeout /t 2 >nul
PowerShell.exe -NoProfile -Command Clear-RecycleBin -Confirm:$false

echo Wait for 2 seconds before clearing browsing history!!!
timeout /t 2 >nul
:: 6
echo Clearing browsing history in Internet Explorer...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1
echo Clearing browsing history in Microsoft Edge...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1023 >nul 2>&1
echo Clearing browsing history in Firefox...
del /f /q "%LocalAppData%\Mozilla\Firefox\Profiles\*.default\places.sqlite" >nul 2>&1
echo Clearing browsing history in Google Chrome...
del /f /q "%LocalAppData%\Google\Chrome\User Data\Default\History" >nul 2>&1

echo Wait for 2 seconds for registry optimization!!!
timeout /t 2 >nul

:: 7
echo Optimizing the registry...
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v StateFlags0061 /t REG_DWORD /d 2 /f >nul 2>&1
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v StateFlags0111 /t REG_DWORD /d 2 /f >nul 2>&1
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0111 /t REG_DWORD /d 2 /f >nul 2>&1

echo ====================================================================
echo Completed! The system has been cleaned up and optimized.
pause
