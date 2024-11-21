@echo off
echo Initializing Git repository...
git init

echo Creating .gitignore file...
copy ".gitignore_template" ".gitignore"

echo Adding all files...
git add .

echo Creating initial commit...
git commit -m "Initial commit: Project setup"

echo Git repository has been initialized successfully!
echo Remember to:
echo 1. Set up your remote repository
echo 2. Push your changes using: git push -u origin main
pause
