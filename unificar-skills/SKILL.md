---
name: unificar-skills
description: "WORKFLOW SKILL — Unifica as skills das CLIs Codex, Claude e Copilot em uma pasta central em Documentos."
---

# Unificar skills em pasta central

Use esta skill para apontar as **CLIs** de **Codex**, **Claude** e **Copilot** para uma pasta central de skills em `Documentos/Skills`. O Copilot (CLI) já lê `~/.copilot/skills`, então não é necessário tocar na pasta da extensão do VS Code.

Escopo prático:

- O comando abaixo é para shell Linux (bash).
- Em Windows, há um comando PowerShell equivalente mais abaixo.

## O que fazer

1. Defina `Documentos/Skills` como pasta central.
2. Crie ou atualize links simbólicos das CLIs `codex`, `claude` e `copilot` para essa pasta.

## Como usar (Linux / bash)

Execute este comando:

```bash
set -eu

TARGET="$HOME/Documentos/Skills"
mkdir -p "$TARGET"

linkar() {
  dest="$1"
  backup=''
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    backup="${dest}.backup.$(date +%Y%m%d-%H%M%S)"
    mv -v "$dest" "$backup"
  fi
  ln -sfnv "$TARGET" "$dest"
}

linkar "$HOME/.codex/skills"
linkar "$HOME/.claude/skills"
linkar "$HOME/.copilot/skills"

printf '\nVerificacao:\n'
ls -ld "$HOME/.claude/skills" "$HOME/.codex/skills" "$HOME/.copilot/skills" 2>/dev/null || true
ls -ld "$TARGET"
```

## Como usar (Windows PowerShell)

Abra um prompt do PowerShell **como administrador** (requerido para criar links simbólicos por padrão) e execute:

```powershell
$baseDocs = "$env:USERPROFILE\Documents"
$target = Join-Path $baseDocs "Skills"
New-Item -ItemType Directory -Path $target -Force | Out-Null

function Link-Skills($dest) {
  $destDir = Split-Path $dest -Parent
  New-Item -ItemType Directory -Path $destDir -Force | Out-Null
  if (Test-Path $dest -PathType Any -and -not (Test-Path $dest -PathType SymbolicLink)) {
    $backup = "$dest.backup.$((Get-Date).ToString('yyyyMMdd-HHmmss'))"
    Rename-Item -Path $dest -NewName $backup
  }
  if (Test-Path $dest -PathType SymbolicLink) {
    Remove-Item $dest -Force
  }
  New-Item -ItemType SymbolicLink -Path $dest -Target $target | Out-Null
}

Link-Skills "$env:USERPROFILE\.codex\skills"
Link-Skills "$env:USERPROFILE\.claude\skills"
Link-Skills "$env:USERPROFILE\.copilot\skills"

"Verificacao:"
Get-Item "$env:USERPROFILE\.codex\skills","$env:USERPROFILE\.claude\skills","$env:USERPROFILE\.copilot\skills" -ErrorAction SilentlyContinue
Get-Item $target
