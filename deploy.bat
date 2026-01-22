@echo off
echo Starting deployment...

git add .
if %errorlevel% neq 0 (
    echo Error: Failed to stage changes
    exit /b %errorlevel%
)

set "MSG=%~1"
if "%MSG%"=="" set "MSG=Auto-deployment"

git commit -m "%MSG%"
if %errorlevel% neq 0 (
    echo Error: Failed to commit changes
    exit /b %errorlevel%
)

git push -u origin main
if %errorlevel% neq 0 (
    echo Error: Failed to push changes
    exit /b %errorlevel%
)

echo Deployment completed successfully!
