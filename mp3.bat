@echo off
setlocal

REM Check if FFmpeg is installed
where ffmpeg >nul 2>&1
if %errorlevel% neq 0 (
    echo FFmpeg is not installed or not in the system PATH.
    echo Please install FFmpeg and try again.
    exit /b
)

REM Check if a file is dragged onto the batch file
if "%~1"=="" (
    echo Please drag an MP4 file onto this batch file.
    pause
    exit /b
)

REM Get the input file path
set "inputFile=%~1"

REM Set the output file path
set "outputFile=%~dpn1.mp3"

REM Convert MP4 to MP3 using FFmpeg
ffmpeg -i "%inputFile%" -vn -acodec libmp3lame -q:a 2 "%outputFile%"

echo Conversion completed successfully.
pause