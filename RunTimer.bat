@echo off
title Minimal Timer Launcher
echo Starting local server on port 8000...

:: Kill any existing python HTTP servers on port 8000 to prevent conflicts
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8000 ^| findstr LISTENING') do (
    taskkill /F /PID %%a >nul 2>&1
)

:: Start Python server in the background
start /min "Timer Server" python -m http.server 8000

:: Wait a brief moment for the server to spin up
timeout /t 1 /nobreak > nul

echo Opening Chrome Beta...
start "" "C:\Program Files\Google\Chrome Beta\Application\chrome.exe" "http://localhost:8000"

exit
