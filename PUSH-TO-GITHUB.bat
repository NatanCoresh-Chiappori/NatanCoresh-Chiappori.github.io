@echo off
title Push Changes to GitHub Pages
color 0A
echo.
echo ========================================
echo   PUSH CHANGES TO GITHUB PAGES
echo ========================================
echo.
echo Your site: https://natancoresh-chiappori.github.io/
echo.

REM Check if git is available
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

REM Check if we're in a git repository
git rev-parse --git-dir >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Not a git repository
    pause
    exit /b 1
)

REM Show current status
echo Checking for changes...
git status --short
echo.

REM Stage all changes
echo [1/4] Staging all changes...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to stage changes
    pause
    exit /b 1
)

REM Check if there are any changes to commit
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo.
    echo No changes to commit. Everything is up to date!
    echo.
    pause
    exit /b 0
)

REM Auto-generate commit message with timestamp
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set timestamp=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2% %datetime:~8,2%:%datetime:~10,2%
set commitMessage=Update: %timestamp%

REM Commit changes
echo.
echo [2/4] Committing changes with auto-generated message...
git commit -m "%commitMessage%"
if %errorlevel% neq 0 (
    echo ERROR: Failed to commit changes
    pause
    exit /b 1
)

REM Push to GitHub
echo.
echo [3/4] Pushing to GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo.
    echo WARNING: Push failed. Trying alternative branch name...
    git push origin master
    if %errorlevel% neq 0 (
        echo ERROR: Failed to push to GitHub
        pause
        exit /b 1
    )
)

REM Success message
echo.
echo ========================================
echo   SUCCESS!
echo ========================================
echo.
echo Your changes have been pushed to GitHub!
echo.
echo GitHub Pages will automatically deploy in 1-2 minutes.
echo.
echo Your live site: https://natancoresh-chiappori.github.io/
echo.
echo You can check deployment status at:
echo https://github.com/NatanCoresh-Chiappori/personal-website/actions
echo.
pause

