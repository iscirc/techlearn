@echo off
title TechLearn - Conectar Backend ao GitHub Pages (Cloudflare Tunnel)
echo ======================================================================
echo  Iniciando o tunel HTTPS gratuito para conectar o backend ao GitHub Pages
echo ======================================================================
echo.
echo DICA: Se o backend nao estiver rodando, inicie pelo Eclipse ou iniciar-backend.bat
echo Copie a URL gerada (https://xxx.trycloudflare.com) caso queira reconfigurar.
echo.
"%~dp0tools\cloudflared.exe" tunnel --url http://localhost:8080
pause
