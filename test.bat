@echo off
echo Dang don rac va toi uu he thong...
echo.

:: 1
echo Xoa tep tin tam thoi trong thu muc %Temp%...
echo Cho 2 Giay
timeout /t 2 >nul
del /f /q "%Temp%\*.*" >nul 2>&1

:: 2
echo Xoa tep tin tam thoi trong thu muc %SystemRoot%\Temp...
echo Cho 2 Giay
timeout /t 2 >nul
del /f /q "%SystemRoot%\Temp\*.*" >nul 2>&1

:: 3
echo Xoa tep tin tam thoi trong Prefetch
echo Cho 2 Giay
timeout /t 2 >nul
del /s /f /q C:\Windows\Prefetch\*.*

:: 4
echo Xoa tep tin tam thoi trong Downloads
echo Cho 2 Giay
timeout /t 2 >nul
del /s /q "C:\Windows\SoftwareDistribution\Download\*"

:: 5
echo Lam rong thung rac
echo Cho 2 Giay
timeout /t 2 >nul
PowerShell.exe -NoProfile -Command Clear-RecycleBin -Confirm:$false

echo Cho 2 Giay truoc khi xoa lich su trinh duyet !!!
timeout /t 2 >nul
:: 6
echo Xoa lich su duyet web trong trinh duyet Internet Explorer...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 >nul 2>&1
echo Xoa lich su duyet web trong trinh duyet Microsoft Edge...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1023 >nul 2>&1
echo Xoa lich su duyet web trong trinh duyet Firefox...
del /f /q "%LocalAppData%\Mozilla\Firefox\Profiles\*.default\places.sqlite" >nul 2>&1
echo Xoa lich su duyet web trong trinh duyet Google Chrome...
del /f /q "%LocalAppData%\Google\Chrome\User Data\Default\History" >nul 2>&1

echo Cho 2 Giay de toi uu hoa Registry !!!
timeout /t 2 >nul

:: 7
echo Toi uu Registry...
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v StateFlags0061 /t REG_DWORD /d 2 /f >nul 2>&1
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v StateFlags0111 /t REG_DWORD /d 2 /f >nul 2>&1
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0111 /t REG_DWORD /d 2 /f >nul 2>&1

echo ====================================================================
echo Hoan thanh! He thong da duoc don dep va toi uu.
pause
