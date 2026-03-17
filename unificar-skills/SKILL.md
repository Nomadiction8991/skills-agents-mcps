---
name: unificar-skills
description: "WORKFLOW SKILL — Unifica as skills do VS Code Copilot Chat e das CLIs do Codex, Claude e Copilot em uma pasta central em Documentos."
---

# Unificar skills em pasta central

Use esta skill para apontar o VS Code Copilot Chat e as CLIs do Codex, Claude e Copilot para uma pasta central de skills em `Documentos/Skills`.

Escopo prático:

- O comando abaixo é para shell POSIX em Linux, macOS, WSL ou Git Bash.
- Em Windows puro, use um shell compatível ou adapte para PowerShell.

## O que fazer

1. Defina `Documentos/Skills` como pasta central.
2. Crie ou atualize links simbólicos das CLIs `codex`, `claude` e `copilot` para essa pasta.
3. Se o Copilot Chat estiver instalado no VS Code, atualize também a pasta de skills dentro da extensão mais recente.

## Regra do Copilot

Se o Copilot Chat estiver instalado no VS Code, atualize estes destinos:

- `~/.copilot/skills`
- `~/.vscode/extensions/github.copilot-chat-<versao>/assets/prompts/skills`

Use a versão mais recente da extensão.

Observação:

- Após atualizar/reinstalar a extensão do Copilot Chat, reaplique a skill porque o caminho versionado muda.

## Como usar

Execute este comando:

```bash
set -eu

SO_NAME=$(uname -s 2>/dev/null || printf '')
case "$SO_NAME" in
  Linux|Darwin|MINGW*|MSYS*|CYGWIN*)
    BASE_DOCS="${HOME}/Documentos"
    ;;
  *)
    BASE_DOCS="${USERPROFILE:-$HOME}/Documents"
    ;;
esac
if [ -n "${WSL_DISTRO_NAME:-}" ]; then
  BASE_DOCS="${HOME}/Documentos"
fi

TARGET="$BASE_DOCS/Skills"
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

versao_maior() {
  awk -v a="$1" -v b="$2" '
    BEGIN {
      na = split(a, aa, /\./)
      nb = split(b, bb, /\./)
      n = na > nb ? na : nb
      for (i = 1; i <= n; i++) {
        va = (i in aa) ? aa[i] + 0 : 0
        vb = (i in bb) ? bb[i] + 0 : 0
        if (va > vb) exit 0
        if (va < vb) exit 1
      }
      exit 1
    }
  '
}

linkar "$HOME/.codex/skills"
linkar "$HOME/.claude/skills"
linkar "$HOME/.copilot/skills"

COPILOT_EXT_ROOT=''
COPILOT_EXT_VERSION=''
for ext_base in "$HOME/.vscode/extensions" "$HOME/.vscode-server/extensions"; do
  [ -d "$ext_base" ] || continue
  for ext_dir in "$ext_base"/github.copilot-chat-*; do
    [ -d "$ext_dir" ] || continue
    ext_version=${ext_dir##*/github.copilot-chat-}
    if [ -z "$COPILOT_EXT_VERSION" ] || versao_maior "$ext_version" "$COPILOT_EXT_VERSION"; then
      COPILOT_EXT_ROOT="$ext_dir"
      COPILOT_EXT_VERSION="$ext_version"
    fi
  done
done
if [ -n "$COPILOT_EXT_ROOT" ]; then
  linkar "$COPILOT_EXT_ROOT/assets/prompts/skills"
fi

printf '\nVerificacao:\n'
ls -ld "$HOME/.claude/skills" "$HOME/.codex/skills" "$HOME/.copilot/skills" 2>/dev/null || true
ls -ld "$HOME/.vscode/extensions/github.copilot-chat-"*/assets/prompts/skills 2>/dev/null || true
ls -ld "$HOME/.vscode-server/extensions/github.copilot-chat-"*/assets/prompts/skills 2>/dev/null || true
ls -ld "$TARGET"
```
