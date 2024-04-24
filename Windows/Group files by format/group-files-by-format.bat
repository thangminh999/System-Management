setlocal enabledelayedexpansion
for %%a in (*.*) do (
	if not "%%~xa"=="" (
		set "ext=%%~xa" & set "ext=!ext:~1!"
		if not exist "!ext!" mkdir "!ext!" 2>nul
		if not "%%~fa"=="%~f0" (
			move "%%a" "!ext!\%%a" >nul
		)
	)
)
endlocal