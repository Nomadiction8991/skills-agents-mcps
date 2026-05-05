@echo off
setlocal EnableDelayedExpansion

set "REPO_ROOT=%~dp0"
:: Remove trailing backslash
if "%REPO_ROOT:~-1%"=="\" set "REPO_ROOT=%REPO_ROOT:~0,-1%"

:: Validate: must be inside skills-agents-mcps
git -C "%REPO_ROOT%" remote -v 2>nul | findstr /i "skills-agents-mcps" >nul
if errorlevel 1 (
    echo [ERRO] Execute a partir do repositorio skills-agents-mcps.
    exit /b 1
)

echo Criando symlinks...

call :link "%REPO_ROOT%\skills"           "%USERPROFILE%\.claude\skills"
call :link "%REPO_ROOT%\skills"           "%USERPROFILE%\.codex\skills"
call :link "%REPO_ROOT%\agents"           "%USERPROFILE%\.claude\agents"
call :link "%REPO_ROOT%\config\GLOBAL.md" "%USERPROFILE%\.claude\CLAUDE.md"
call :link "%REPO_ROOT%\config\GLOBAL.md" "%USERPROFILE%\.codex\AGENTS.md"

echo.
echo OK Instalacao concluida. Proximo passo: /start-project em qualquer projeto.
exit /b 0

:link
set "SRC=%~1"
set "DST=%~2"
:: Create parent directory if needed
for %%D in ("%DST%") do if not exist "%%~dpD" mkdir "%%~dpD"
:: Remove existing link or file
if exist "%DST%" (
    del /f /q "%DST%" 2>nul || rmdir /s /q "%DST%" 2>nul
)
:: Detect if source is a directory or file
if exist "%SRC%\" (
    mklink /D "%DST%" "%SRC%" >nul
) else (
    mklink "%DST%" "%SRC%" >nul
)
echo   OK %DST% -^> %SRC%
exit /b 0
