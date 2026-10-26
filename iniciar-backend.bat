@echo off
title TechLearn Backend (Spring Boot)
echo ========================================================
echo  Iniciando TechLearn API (Spring Boot na porta 8080)...
echo ========================================================
cd /d "%~dp0backend\techlearn-api"
call gradlew.bat bootRun
pause
