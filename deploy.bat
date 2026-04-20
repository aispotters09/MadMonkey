@echo off
REM Deployment script for Mad Monkey Restaurant (Windows)
REM Switches between local development and production paths

echo Mad Monkey Restaurant Deployment Script
echo ========================================

if "%1"=="production" (
    echo Switching to production paths for Vercel deployment...
    
    REM Update paths to absolute for production
    powershell -Command "(Get-Content index.html) -replace 'href=\"styles.css\"', 'href=\"/styles.css\"' | Set-Content index.html"
    powershell -Command "(Get-Content index.html) -replace 'src=\"script.js\"', 'src=\"/script.js\"' | Set-Content index.html"
    
    echo Production paths applied!
    echo Ready for Vercel deployment
    echo.
    echo To revert to local development, run: deploy.bat local
    
) else if "%1"=="local" (
    echo Switching to local development paths...
    
    REM Update paths to relative for local development
    powershell -Command "(Get-Content index.html) -replace 'href=\"/styles.css\"', 'href=\"styles.css\"' | Set-Content index.html"
    powershell -Command "(Get-Content index.html) -replace 'src=\"/script.js\"', 'src=\"script.js\"' | Set-Content index.html"
    
    echo Local development paths applied!
    echo Ready for local development
    echo.
    echo To deploy to production, run: deploy.bat production
    
) else (
    echo Usage:
    echo   deploy.bat production  - Switch to production paths for Vercel
    echo   deploy.bat local       - Switch to local development paths
    echo.
    echo Current status:
    findstr /C:"href=\"/styles.css\"" index.html >nul
    if %errorlevel%==0 (
        echo   Mode: Production (absolute paths)
    ) else (
        echo   Mode: Local Development (relative paths)
    )
)

echo.
echo Files updated:
echo   - index.html (CSS and JS paths)
echo.
echo Note: Use this script before deploying to Vercel or when switching back to local development
