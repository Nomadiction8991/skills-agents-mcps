@echo off
setlocal EnableDelayedExpansion

set "REPO_ROOT=%~dp0"
if "%REPO_ROOT:~-1%"=="\" set "REPO_ROOT=%REPO_ROOT:~0,-1%"

:: Validate: must be inside skills-agents-mcps
git -C "%REPO_ROOT%" remote -v 2>nul | findstr /i "skills-agents-mcps" >nul
if errorlevel 1 (
    echo [ERRO] Execute a partir do repositorio skills-agents-mcps.
    exit /b 1
)

:: Detect tools
set "HAS_CLAUDE=0"
where claude >nul 2>nul && set "HAS_CLAUDE=1"
set "HAS_CODEX=0"
if exist "%USERPROFILE%\.codex" set "HAS_CODEX=1"
set "HAS_GEMINI=0"
if exist "%USERPROFILE%\.gemini" set "HAS_GEMINI=1"

echo === Detectando Ferramentas ===
if "%HAS_CLAUDE%"=="1" (echo   [OK] Claude Code detectado) else (echo   [--] Claude Code nao encontrado)
if "%HAS_CODEX%"=="1" (echo   [OK] Codex detectado) else (echo   [--] Codex nao encontrado)
if "%HAS_GEMINI%"=="1" (echo   [OK] Gemini detectado) else (echo   [--] Gemini nao encontrado)
echo.

echo === Instalando Dependencias ===
:: 1. code-review-graph
where python >nul 2>nul
if %errorlevel% equ 0 (
    echo   -^> Configurando Python ^(code-review-graph^)...
    python -m pip install -e "%REPO_ROOT%\plugins\code-review-graph" --quiet 2>nul
) else (
    echo   [!] Python nao encontrado.
)

:: 2. context-mode
where npm >nul 2>nul
if %errorlevel% equ 0 (
    echo   -^> Configurando Node ^(context-mode^)...
    pushd "%REPO_ROOT%\plugins\context-mode"
    call npm install --quiet 2>nul
    popd
)
echo.

echo === Criando Symlinks ===

if "%HAS_CLAUDE%"=="1" (
    echo Configurando Claude...
    call :link "%REPO_ROOT%\skills"                   "%USERPROFILE%\.claude\skills"
    call :link "%REPO_ROOT%\agents"                   "%USERPROFILE%\.claude\agents"
    call :link "%REPO_ROOT%\config\GLOBAL.md"           "%USERPROFILE%\.claude\CLAUDE.md"
    call :link "%REPO_ROOT%\config\claude-settings.json" "%USERPROFILE%\.claude\settings.json"
    call :link "%REPO_ROOT%\config\caveman-config.json" "%APPDATA%\caveman\config.json"
    call :link "%REPO_ROOT%\plugins\caveman\hooks"      "%USERPROFILE%\.claude\hooks"
)

if "%HAS_CODEX%"=="1" (
    echo Configurando Codex...
    call :link "%REPO_ROOT%\skills"                   "%USERPROFILE%\.codex\skills"
    call :link "%REPO_ROOT%\config\GLOBAL.md"           "%USERPROFILE%\.codex\AGENTS.md"
    call :link "%REPO_ROOT%\config\codex-marketplace.json" "%USERPROFILE%\.codex\marketplace.json"
)

if "%HAS_GEMINI%"=="1" (
    echo Configurando Gemini...
    call :link "%REPO_ROOT%\skills"                   "%USERPROFILE%\.gemini\skills"
    call :link "%REPO_ROOT%\agents"                   "%USERPROFILE%\.gemini\agents"
    call :link "%REPO_ROOT%\config\GLOBAL.md"           "%USERPROFILE%\.gemini\GEMINI.md"
    call :link "%REPO_ROOT%\config\gemini-settings.json" "%USERPROFILE%\.gemini\settings.json"
)
echo.

if "%HAS_CLAUDE%"=="1" (
    echo === Instalando Plugins (Claude Code) ===
    for /D %%P in ("%REPO_ROOT%\plugins\*") do (
        set "name=%%~nxP"
        if exist "%%P\.claude-plugin\marketplace.json" (
            echo   ^> !name!
            claude plugin marketplace add "%%P" 2>nul
            claude plugin install "!name!" 2>nul || claude plugin enable "!name!" 2>nul

            if exist "%%P\install.bat" (
                if "!name!" neq "install.bat" (
                    echo     Executando instalador interno de !name!...
                    call "%%P\install.bat"
                )
            )
        )
    )
    echo.
    echo === Wiring Plugin Hooks ===
    node "%REPO_ROOT%\plugins\auto-wire-hooks.js"
)

echo.
echo OK Instalacao concluida. Proximo passo: /start-project em qualquer projeto.
exit /b 0

:link
set "SRC=%~1"
set "DST=%~2"
for %%D in ("%DST%") do if not exist "%%~dpD" mkdir "%%~dpD"
if exist "%DST%" (
    del /f /q "%DST%" 2>nul || rmdir /s /q "%DST%" 2>nul
)
if exist "%SRC%\" (
    mklink /D "%DST%" "%SRC%" >nul
) else (
    mklink "%DST%" "%SRC%" >nul
)
echo   OK %DST% -^> %SRC%
exit /b 0
