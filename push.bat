@echo off
set /p a=������:
git add .
git commit -m "%a%"
git push origin master