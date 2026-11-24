@echo off
setlocal EnableExtensions
title Object Renamer build and test install
cd /d "%~dp0"

echo Object Renamer Autodesk Marketplace build and test install
echo.
echo IMPORTANT: Close AutoCAD 2026 and AutoCAD 2027 before continuing.
echo No source-file backups will be created.
echo.

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0Build-Install-Object-Renamer-2026-2027.ps1"
set "RENAMER_EXIT=%ERRORLEVEL%"

echo.
if not "%RENAMER_EXIT%"=="0" (
    echo Object Renamer build or installation FAILED.
    echo Review the complete message above. This window will remain open.
) else (
    echo Object Renamer build and installation completed successfully.
)
echo.
pause
exit /b %RENAMER_EXIT%
