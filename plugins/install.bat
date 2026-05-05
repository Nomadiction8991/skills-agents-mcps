@echo off
setlocal EnableDelayedExpansion

set "PLUGINS_DIR=%~dp0"
if "%PLUGINS_DIR:~-1%"=="\" set "PLUGINS_DIR=%PLUGINS_DIR:~0,-1%"

echo === Instalando plugins: Claude Code ===
for /D %%P in ("%PLUGINS_DIR%\*") do (
  set "name=%%~nxP"
  set "marketplace_json=%%P\.claude-plugin\marketplace.json"

  if not exist "!marketplace_json!" (
    echo   [skip] !name! -- sem .claude-plugin\marketplace.json
  ) else (
    echo   ^> !name!
    claude plugin marketplace add "%%P" 2>nul
    claude plugin install "!name!" 2>nul || claude plugin enable "!name!" 2>nul || echo     aviso: verifique com "claude plugin list"
  )
)

echo.
echo === Instalando plugins: Codex ===
echo   Codex nao possui CLI para instalacao direta.
echo   Configurando marketplace local em %%USERPROFILE%%\.codex\marketplace.json...

if not exist "%USERPROFILE%\.codex" mkdir "%USERPROFILE%\.codex"
set "marketplace_file=%USERPROFILE%\.codex\marketplace.json"
set "entries="
set "found=0"

for /D %%P in ("%PLUGINS_DIR%\*") do (
  set "name=%%~nxP"
  if exist "%%P\.agents\plugins\marketplace.json" (
    set "found=1"
    if "!entries!"=="" (
      set "entries=    {\"name\": \"!name!\", \"source\": {\"source\": \"local\", \"path\": \"%%P\"}}"
    ) else (
      set "entries=!entries!,^
    {\"name\": \"!name!\", \"source\": {\"source\": \"local\", \"path\": \"%%P\"}}"
    )
    echo   ^> !name! registrado
  )
)

if "!found!"=="1" (
  (
    echo {
    echo   "plugins": [!entries!
    echo   ]
    echo }
  ) > "%marketplace_file%"
  echo   Marketplace salvo em %marketplace_file%
  echo   Abra o Codex neste repo ^> /plugins ^> busque o plugin ^> Install
) else (
  echo   Nenhum plugin com .agents\plugins\marketplace.json encontrado.
)

echo.
echo OK Concluido.
endlocal
