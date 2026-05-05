#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Validate: must be inside skills-agents-mcps
if ! git -C "$REPO_ROOT" remote -v 2>/dev/null | grep -qi "skills-agents-mcps"; then
  echo "✗ Execute a partir do repositório skills-agents-mcps." >&2
  exit 1
fi

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  [ -e "$dst" ] || [ -L "$dst" ] && rm -rf "$dst"
  ln -s "$src" "$dst"
  echo "  ✓ $dst → $src"
}

echo "Criando symlinks..."
link "$REPO_ROOT/skills"         "$HOME/.claude/skills"
link "$REPO_ROOT/skills"         "$HOME/.codex/skills"
link "$REPO_ROOT/agents"         "$HOME/.claude/agents"
link "$REPO_ROOT/config/GLOBAL.md" "$HOME/.claude/CLAUDE.md"
link "$REPO_ROOT/config/GLOBAL.md" "$HOME/.codex/AGENTS.md"

echo ""
echo "✓ Instalação concluída. Próximo passo: /start-project em qualquer projeto."
