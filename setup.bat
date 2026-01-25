@echo off
REM MoneyQuest Quick Start Script for Windows

echo ======================================
echo MoneyQuest - Flutter App Setup
echo ======================================
echo.

REM Check if flutter is installed
where flutter >nul 2>nul
if errorlevel 1 (
    echo X Flutter not found!
    echo Please install Flutter from: https://flutter.dev/docs/get-started/install
    exit /b 1
)

echo. Flutter found!
for /f "tokens=*" %%i in ('flutter --version') do set FLUTTER_VERSION=%%i
echo %FLUTTER_VERSION%
echo.

REM Get dependencies
echo Installing dependencies...
call flutter pub get

if errorlevel 1 (
    echo X Failed to install dependencies
    exit /b 1
)

echo Dependencies installed successfully!
echo.

echo ======================================
echo Setup Complete!
echo ======================================
echo.
echo To run the app:
echo   flutter run
echo.
echo To run on a specific device:
echo   flutter devices           (list available devices)
echo   flutter run -d [device]   (run on specific device)
echo.
echo To build for release:
echo   flutter build apk         (Android)
echo   flutter build ios         (iOS)
echo.
pause
