@echo off

REM Deploy the Docker container using docker-compose
echo Deploying the React app...

REM Run docker-compose up in detached mode
docker-compose up -d

REM Check for error
if %errorlevel% neq 0 (
    echo Docker Compose failed to start the container.
    exit /b %errorlevel%
)

echo Deployment completed.
pause
