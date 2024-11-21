@echo off
setlocal enabledelayedexpansion

:: Check if git is installed
git --version > nul 2>&1
if errorlevel 1 (
    echo Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/downloads
    pause
    exit /b 1
)

:menu
cls
echo Git Utility Script
echo =================
echo.
echo 1. Stage and commit all changes
echo 2. Stage and commit specific files
echo 3. Stage and commit by type (docs, feat, fix, etc.)
echo 4. Push changes to remote
echo 5. Create and checkout new branch
echo 6. Show status
echo 7. Show commit history
echo 8. Discard unstaged changes
echo 9. Exit
echo.
set /p choice="Enter your choice (1-9): "

if "%choice%"=="1" goto commit_all
if "%choice%"=="2" goto commit_specific
if "%choice%"=="3" goto commit_by_type
if "%choice%"=="4" goto push_changes
if "%choice%"=="5" goto new_branch
if "%choice%"=="6" goto show_status
if "%choice%"=="7" goto show_history
if "%choice%"=="8" goto discard_changes
if "%choice%"=="9" goto end
goto menu

:commit_all
echo.
set /p msg="Enter commit message: "
git add .
git commit -m "%msg%"
echo.
pause
goto menu

:commit_specific
echo.
echo Current Status:
git status
echo.
set /p files="Enter files to commit (space-separated): "
set /p msg="Enter commit message: "
git add %files%
git commit -m "%msg%"
echo.
pause
goto menu

:commit_by_type
echo.
echo Commit Types:
echo - feat: A new feature
echo - fix: A bug fix
echo - docs: Documentation only changes
echo - style: Changes that do not affect the meaning of the code
echo - refactor: A code change that neither fixes a bug nor adds a feature
echo - perf: A code change that improves performance
echo - test: Adding missing tests or correcting existing tests
echo - chore: Changes to the build process or auxiliary tools
echo.
set /p type="Enter commit type: "
set /p scope="Enter scope (optional, press enter to skip): "
set /p msg="Enter commit message: "

if "%scope%"=="" (
    git add .
    git commit -m "%type%: %msg%"
) else (
    git add .
    git commit -m "%type%(%scope%): %msg%"
)
echo.
pause
goto menu

:push_changes
echo.
git push
echo.
pause
goto menu

:new_branch
echo.
set /p branch="Enter new branch name: "
git checkout -b %branch%
echo.
pause
goto menu

:show_status
echo.
git status
echo.
pause
goto menu

:show_history
echo.
git log --oneline --graph --decorate -n 10
echo.
pause
goto menu

:discard_changes
echo.
echo WARNING: This will discard all unstaged changes!
set /p confirm="Are you sure? (y/n): "
if /i "%confirm%"=="y" (
    git checkout -- .
    echo Changes discarded.
) else (
    echo Operation cancelled.
)
echo.
pause
goto menu

:end
endlocal
exit /b 0
