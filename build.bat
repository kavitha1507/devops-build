@echo off

REM Build the Docker image
echo Building Docker image...

REM Run docker-compose build
docker-compose build

REM Check for error
if %errorlevel% neq 0 (
    echo Docker Compose build failed.
    exit /b %errorlevel%
)

echo Build completed.
pause
