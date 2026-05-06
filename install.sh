#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Validate: must be inside skills-agents-mcps
if ! git -C "$REPO_ROOT" remote -v 2>/dev/null | grep -qi "skills-agents-mcps"; then
  echo "✗ Execute a partir do repositório skills-agents-mcps." >&2
  exit 1
fi

# Detect tools
HAS_CLAUDE=0; command -v claude >/dev/null 2>&1 && HAS_CLAUDE=1
HAS_CODEX=0; [ -d "$HOME/.codex" ] && HAS_CODEX=1
HAS_GEMINI=0; [ -d "$HOME/.gemini" ] && HAS_GEMINI=1

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  [ -e "$dst" ] || [ -L "$dst" ] && rm -rf "$dst"
  ln -s "$src" "$dst"
  echo "  ✓ $dst → $src"
}

echo "=== Detectando Ferramentas ==="
[ $HAS_CLAUDE -eq 1 ] && echo "  [OK] Claude Code detectado" || echo "  [--] Claude Code não encontrado"
[ $HAS_CODEX -eq 1 ] && echo "  [OK] Codex detectado" || echo "  [--] Codex não encontrado"
[ $HAS_GEMINI -eq 1 ] && echo "  [OK] Gemini detectado" || echo "  [--] Gemini não encontrado"
echo ""

echo "=== Criando Symlinks ==="

if [ $HAS_CLAUDE -eq 1 ]; then
  echo "Configurando Claude..."
  link "$REPO_ROOT/skills"                   "$HOME/.claude/skills"
  link "$REPO_ROOT/agents"                   "$HOME/.claude/agents"
  link "$REPO_ROOT/config/GLOBAL.md"           "$HOME/.claude/CLAUDE.md"
  link "$REPO_ROOT/config/claude-settings.json" "$HOME/.claude/settings.json"
  link "$REPO_ROOT/config/caveman-config.json" "$HOME/.config/caveman/config.json"
  link "$REPO_ROOT/plugins/caveman/hooks"      "$HOME/.claude/hooks"
fi

if [ $HAS_CODEX -eq 1 ]; then
  echo "Configurando Codex..."
  link "$REPO_ROOT/skills"                   "$HOME/.codex/skills"
  link "$REPO_ROOT/config/GLOBAL.md"           "$HOME/.codex/AGENTS.md"
  link "$REPO_ROOT/config/codex-marketplace.json" "$HOME/.codex/marketplace.json"
fi

if [ $HAS_GEMINI -eq 1 ]; then
  echo "Configurando Gemini..."
  link "$REPO_ROOT/skills"                   "$HOME/.gemini/skills"
  link "$REPO_ROOT/agents"                   "$HOME/.gemini/agents"
  link "$REPO_ROOT/config/GLOBAL.md"           "$HOME/.gemini/GEMINI.md"
  link "$REPO_ROOT/config/gemini-settings.json" "$HOME/.gemini/settings.json"
fi
echo ""

if [ $HAS_CLAUDE -eq 1 ]; then
  echo "=== Instalando Plugins (Claude Code) ==="
  PLUGINS_DIR="$REPO_ROOT/plugins"
  for plugin_dir in "$PLUGINS_DIR"/*/; do
    [ -d "$plugin_dir" ] || continue
    name="$(basename "$plugin_dir")"
    marketplace_json="$plugin_dir/.claude-plugin/marketplace.json"

    if [ ! -f "$marketplace_json" ]; then
      continue
    fi

    echo "  → $name"
    claude plugin marketplace add "$plugin_dir" 2>/dev/null || true
    claude plugin install "$name" 2>/dev/null || \
      claude plugin enable "$name" 2>/dev/null || \
      echo "    aviso: verifique com 'claude plugin list'"

    if [ -f "$plugin_dir/install.sh" ] && [ "$name" != "install.sh" ]; then
      echo "    Executando instalador interno de $name..."
      bash "$plugin_dir/install.sh" || echo "    aviso: falha no instalador de $name"
    fi
  done

  echo ""
  echo "=== Wiring Plugin Hooks ==="
  node "$REPO_ROOT/plugins/auto-wire-hooks.js"
fi

echo ""
echo "✓ Instalação concluída. Próximo passo: /start-project em qualquer projeto."
